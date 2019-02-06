source('dummy_data.R')

context('Testen der Datenintegrität: Ausgangsdaten')
test_that('Dimension des Dataframes korrekt', {
  expect_equal(ncol(data), 3)
  expect_equal(nrow(data), 365)
})
test_that('Keine missing values vorhanden sind', {
  expect_identical(data, na.omit(data))
})
test_that('Datentypen korrekt sind', {
  expect_is(data,'data.frame')
  expect_is(data$day, 'Date')
  #expect_is(data$month, 'Date') #Fehler da month zu Faktor wird
  expect_is(data$month, 'factor')
  expect_is(data$y, 'numeric')
})

context('Testen der Datenintegrität: Aggregierte Daten')
test_that('Dimensionen korrekt sind', {
  expect_equal(ncol(agg.data), 2)
  expect_equal(nrow(agg.data), 12)
})
test_that('Alle Faktoren vorhanden sind', {
  expect_equivalent(levels(agg.data$month), levels(data$month))
})

context('Testen der eigenen Summencheck-Funktion')
test_that('die Summen der Dataframes gleich sind', {
  expect_that(sum_check(data, agg.data), prints_text('Summierung korrekt'))
  expect_that(sum_check(data, agg.data), prints_text('Summierung fehlerhaft'))
})


