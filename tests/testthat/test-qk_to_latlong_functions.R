# test quadkey to tile XY coordinates

test_that("quadkey_to_tileXY is giving correct results", {
  expect_equal(quadkey_to_tileXY('213')$tileX, 3)
  expect_equal(quadkey_to_tileXY('213')$tileY, 5)
  expect_equal(quadkey_to_tileXY('213')$level, 3)
})


# test tile XY coordinates to pixel XY coordinates

test_that("tileXY_to_pixelXY is giving correct results", {
  expect_equal(tileXY_to_pixelXY(tileX = 3,
                             tileY = 5)$pixelX, 768)
  expect_equal(tileXY_to_pixelXY(tileX = 3,
                             tileY = 5)$pixelY, 1280)
})


# test pixels XY coordinates to map coordinates WG84 in degrees

test_that("pixelXY_to_latlong is giving correct results", {
  expect_equal(round(pixelXY_to_latlong(pixelX = 768,
                                pixelY = 1280,
                                level = 3)$lat, digits = 2), -40.98)
  expect_equal(round(pixelXY_to_latlong(pixelX = 768,
                                pixelY = 1280,
                                level = 3)$lon, digits = 2), -45)
})

# Check that errors appear in the correct cases - pixelXY_to_latlong

test_that("Check level detail - Negative level", {
  expect_error(pixelXY_to_latlong(pixelX = 768,
                                  pixelY = 1280,
                                  level = -3),
               regexp = paste("The level of detail should be",
                              "an integer between 1 and 23"))
})

test_that("Check level detail - Greater than 23", {
  expect_error(pixelXY_to_latlong(pixelX = 768,
                                  pixelY = 1280,
                                  level = 44),
               regexp = paste("The level of detail should be",
                              "an integer between 1 and 23"))
})

test_that("Check level detail - Use of decimals", {
  expect_error(pixelXY_to_latlong(pixelX = 768,
                                  pixelY = 1280,
                                  level = 4.7),
               regexp = paste("The level of detail should be",
                              "an integer between 1 and 23"))
})

# Test cases for quadkey_to_latlong function
test_that("quadkey_to_latlong function works as expected", {
  quadkeys <- c("213", "312", "213")  # Replace with your test quadkeys

  # Test 1: Check for duplicated quadkeys
  expect_error(quadkey_to_latlong(quadkeys),
               "Please, remove duplicated QuadKeys")

  # Test 2: Check for quadkeys with different digit lengths
  expect_error(quadkey_to_latlong(c("2333", "123", "3310021")),
               "All the QuadKeys should have the same number of digits")

  # Test 3: Check if the returned object is an sf object
  result_sf <- quadkey_to_latlong(c('212', '213'))
  expect_true("sf" %in% class(result_sf),
              info = "Output should be of class 'sf'")

  # Test 4: Check if sf object contains expected columns
  expect_equal(colnames(result_sf), c("quadkey", "geometry"),
               info = "SF object should have 'quadkey' and 'geometry' columns")

  # Additional tests for specific quadkeys or transformations can be added here
})

