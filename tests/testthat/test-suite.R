test_that("the suite contains exactly the requested four members", {
  expect_identical(
    hyperloom_packages(),
    c("hyperspectR", "hyperspectaculR", "cuvis.r", "tivis.r")
  )
  expect_false(anyDuplicated(hyperloom_packages()) > 0L)
  dependencies <- utils::packageDescription("hyperloom")$Depends
  dependencies <- trimws(strsplit(dependencies, ",")[[1]])
  dependencies <- sub(" *\\(.*\\)$", "", dependencies)
  expect_setequal(setdiff(dependencies, "R"), hyperloom_packages())
})

test_that("installed versions match the active library search order", {
  status <- hyperloom_status()
  expect_s3_class(status, "data.frame")
  expect_identical(names(status), c("package", "installed", "version"))
  expect_identical(status$package, hyperloom_packages())
  expect_identical(status$installed, rep(TRUE, 4L))
  expected <- vapply(
    hyperloom_packages(),
    function(package) as.character(utils::packageVersion(package)),
    character(1),
    USE.NAMES = FALSE
  )
  expect_identical(status$version, expected)
})

test_that("inventory functions preserve the search path and library settings", {
  search_before <- search()
  libraries_before <- .libPaths()
  namespaces_before <- loadedNamespaces()
  hyperloom_packages()
  hyperloom_status()
  expect_identical(search(), search_before)
  expect_identical(.libPaths(), libraries_before)
  expect_setequal(loadedNamespaces(), namespaces_before)
})

test_that("absent installations have an explicit missing version", {
  testthat::local_mocked_bindings(
    installed.packages = function() {
      matrix(character(), nrow = 0L, ncol = 2L,
             dimnames = list(NULL, c("Package", "Version")))
    },
    .package = "utils"
  )
  status <- hyperloom_status()
  expect_identical(status$package, hyperloom_packages())
  expect_identical(status$installed, rep(FALSE, 4L))
  expect_identical(status$version, rep(NA_character_, 4L))
})

test_that("the first installed version takes precedence across libraries", {
  testthat::local_mocked_bindings(
    installed.packages = function() {
      cbind(
        Package = c("hyperspectR", "tivis.r", "hyperspectR"),
        Version = c("9.0.0", "1.0.0", "8.0.0")
      )
    },
    .package = "utils"
  )
  status <- hyperloom_status()
  expect_identical(status$installed, c(TRUE, FALSE, FALSE, TRUE))
  expect_identical(
    status$version,
    c("9.0.0", NA_character_, NA_character_, "1.0.0")
  )
})
