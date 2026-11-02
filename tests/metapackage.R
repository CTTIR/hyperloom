# Exercise the installed metapackage in a fresh R process, without loading its
# members to inspect them: installation must make them available, not activate
# their analysis code or optional instrument backends.
members <- c("hyperspectR", "hyperspectaculR", "cuvis.r", "tivis.r")
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
