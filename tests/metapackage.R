# Exercise the installed metapackage in a fresh R process, without loading its
# members to inspect them: installation must make them available, not activate
# their analysis code or optional instrument backends.
members <- c("hyperspectR", "hyperspectaculR", "cuvis.r", "tivis.r")

# The member list used here must be the one the package declares: a member
# added to or dropped from Imports without updating this test would otherwise
# go unchecked.
declared <- utils::packageDescription("hyperloom", fields = "Imports")
declared <- trimws(strsplit(declared, ",", fixed = TRUE)[[1L]])
declared <- sub("[[:space:]]*\\(.*$", "", declared)
if (!setequal(declared, members)) {
  stop("Imports of hyperloom (", paste(declared, collapse = ", "),
       ") differ from the suite members checked here (",
       paste(members, collapse = ", "), ").")
}

available <- vapply(members, function(package) {
  length(find.package(package, quiet = TRUE)) == 1L
}, logical(1))
if (!all(available)) {
  stop("Required suite members are missing: ",
       paste(members[!available], collapse = ", "))
}

if (any(members %in% loadedNamespaces()) ||
      "hyperloom" %in% loadedNamespaces()) {
  stop("Run this test in a fresh R process before loading the suite.")
}

# The version-recording snippet from README.md must work without loading the
# members' namespaces.
versions <- lapply(members, function(package) {
  utils::packageDescription(package, fields = c("Version", "RemoteSha"))
})
names(versions) <- members
recorded <- vapply(versions, function(x) x[["Version"]], character(1))
if (anyNA(recorded) || !all(nzchar(recorded))) {
  stop("No installed version recorded for: ",
       paste(members[is.na(recorded) | !nzchar(recorded)], collapse = ", "))
}
if (any(members %in% loadedNamespaces())) {
  stop("Recording member versions loaded member namespaces: ",
       paste(intersect(members, loadedNamespaces()), collapse = ", "))
}

search_before <- search()
dlls_before <- names(getLoadedDLLs())

library(hyperloom)

attached <- setdiff(search(), search_before)
if (!identical(attached, "package:hyperloom")) {
  stop("Loading hyperloom attached unexpected packages: ",
       paste(attached, collapse = ", "))
}
loaded_members <- intersect(members, loadedNamespaces())
if (length(loaded_members)) {
  stop("Loading hyperloom activated suite member namespaces: ",
       paste(loaded_members, collapse = ", "))
}
loaded_dlls <- setdiff(names(getLoadedDLLs()), dlls_before)
if (length(loaded_dlls)) {
  stop("Loading hyperloom activated native libraries: ",
       paste(loaded_dlls, collapse = ", "))
}
if (length(getNamespaceExports("hyperloom"))) {
  stop("The installation-only metapackage must not export an analysis API.")
}
imports <- setdiff(names(getNamespaceImports("hyperloom")), "base")
if (length(imports)) {
  stop("The installation-only metapackage must not import from namespaces: ",
       paste(imports, collapse = ", "))
}
