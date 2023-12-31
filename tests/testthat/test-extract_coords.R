
# example
grid = create_qk_grid(
  xmin = -59,
  xmax = -57,
  ymin = -35,
  ymax = -34,
  level = 12)

# QuadKeys - extract_qk_coord()
test_that("Check existence of 'quadkey' column", {
  # Create a dataframe without 'quadkey' column
  df_missing_column <- data.frame(other_column = c(1, 2, 3))

  # Test case where 'quadkey' column is missing
  expect_error(extract_qk_coord(df_missing_column),
               regexp = paste("Please ensure that the dataset contains",
                              "a column named 'quadkey'."))

  # Create a dataframe with 'quadkey' column
  df_with_column <- data.frame(quadkey = c("abc", "def", "ghi"))

  # Test case where 'quadkey' column is present
  expect_silent(extract_qk_coord(grid$data))
})

# Tile XY coordinates - extract_tile_coord()
test_that("Check existence of 'tileX' and 'tileY' columns", {
  # Create a dataframe without 'tileX' and 'tileY' columns
  df_missing_columns <- data.frame(other_column = c(1, 2, 3))

  # Test case where 'tileX' and 'tileY' columns are missing
  expect_error(extract_tile_coord(df_missing_columns, level = 6),
               regexp = paste("Please ensure that the dataset contains",
                              "columns named 'tileX' and 'tileY'"))

  # Test case where 'tileX' and 'tileY' columns are present
  expect_silent(extract_tile_coord(grid$data, level = 12))
})

# Both
test_that("Check output dimensions", {

  # the number of points in the grid is equal to the product of the
  # number of columns and rows
  # calculated when the grid was generated

  # +1 is because I started counting by 0 the first element

  expect_equal(nrow(extract_qk_coord(grid$data)),
               ((grid$num_rows+1) * (grid$num_cols+1)))

  expect_equal(nrow(extract_tile_coord(grid$data, level = 12)),
               ((grid$num_rows+1) * (grid$num_cols+1)))
})





