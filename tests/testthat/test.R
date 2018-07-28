library(ggsom)
context("Test of functions of ggssom")

test_that("test aes_som function", {
  expect_error(aes_som(iris[1:4]), "model_som needs to be kohonen object.", fixed=TRUE)
})

test_that("test aes_som function", {
  iris_som <- kohonen::som(scale(iris[1:4]), grid=somgrid(6, 4, "rectangular"))
  expect_error(aes_som(iris_som, cutree_value = -1), "Cluster value must be between 1 and 24", fixed=TRUE)
})

test_that("test ggsom_line function", {
  iris_som <- kohonen::som(scale(iris[1:4]), grid=somgrid(6, 4, "rectangular"))
  expect_is(ggsom::ggsom_line(aes_som(iris_som), TRUE), "ggplot")
})

