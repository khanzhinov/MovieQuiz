 import Foundation
 import XCTest
 @testable import MovieQuiz

 class MovieQuizUITests: XCTestCase {
     var app: XCUIApplication!

     override func setUpWithError() throws {
         try super.setUpWithError()

         app = XCUIApplication()
         app.launch()
         continueAfterFailure = false
     }

     override func tearDownWithError() throws {
         try super.tearDownWithError()

         app.terminate()
         app = nil

     }

     func testYesButton() {
         sleep(3)

         let firstPoster = app.images["Poster"] // находим первоначальный постер
         let firstPosterData = firstPoster.screenshot().pngRepresentation

         app.buttons["Yes"].tap()
         sleep(3)

         let secondPoster = app.images["Poster"]
         let secondPosterData = secondPoster.screenshot().pngRepresentation

         let indexLabel = app.staticTexts["Index"]

         XCTAssertEqual(indexLabel.label, "2/10")
         XCTAssertNotEqual(firstPosterData, secondPosterData)
     }

     func testNoButton() {
         sleep(3)

         let firstPoster = app.images["Poster"]
         let firstPosterData = firstPoster.screenshot().pngRepresentation

         app.buttons["No"].tap()
         sleep(3)

         let secondPoster = app.images["Poster"]
         let secondPosterData = secondPoster.screenshot().pngRepresentation

         let indexLabel = app.staticTexts["Index"]

         XCTAssertEqual(indexLabel.label, "2/10")
         XCTAssertNotEqual(firstPosterData, secondPosterData)
     }

     func testAlertShowing() {
       sleep(4)
       for _ in 1...10 {
        sleep(3)
        app.buttons["Yes"].tap()
       }

       XCTAssertEqual(app.staticTexts["Index"].label, "10/10")

       sleep(3)
       let alert = app.alerts["Alert"]

       XCTAssertTrue(alert.exists)
       XCTAssertEqual(alert.label, "Этот раунд окончен!")
      }

     func testAlertDismiss() {
         sleep(5)
         for _ in 1...10 {
             sleep(3)
             app.buttons["No"].tap()
         }

         let alert = app.alerts["Final game"]
         //alert.buttons.firstMatch.tap()

         sleep(2)

         let indexLabel = app.staticTexts["Index"]

         XCTAssertFalse(alert.exists)
         //XCTAssertTrue(indexLabel.label == "1/10")
     }
     
 }
