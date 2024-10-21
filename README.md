## Table of contents

- [Objective](#Objective)
- [Design](#Design)
- [Task Requirements](#Task-Requirements)
- [Demo](#Demo)
- [Architecture and Tools Used](#Architecture-and-Tools-Used)
- [Running the application](#Running-the-application)
- [NOTICE BOARD](#NOTICE-BOARD)


## Objective
- Design the UI using the provided Figma link and implement an API to create a trip and view a trip. Submit the project as a GitHub repository.
- API Endpoint for CRUD Operations: https://beeceptor.com/crud-api/

## Design
![Group 229213-2](https://github.com/user-attachments/assets/90d698d3-3f40-4b9a-9254-1d11b7f81d78)

[Link to design](https://www.figma.com/design/QomXDEA1WE6pDJFhMcPqyt/Task-UI?node-id=1-5512)

## Task Requirements
#### UI Design:
Use the provided Figma design to create the UI.
Ensure the UI matches the design specifications closely.
Pay attention to details like spacing, fonts, colors, and alignment.
Make the UI responsive for different screen sizes.

#### Integration:
Integrate the UI with the API.
Implement the necessary logic to send trip details to the API and handle the response.
Provide feedback to the user on the success or failure of the trip creation.

#### Documentation:
Include a README file in the GitHub repository.
The README should contain instructions on how to set up and run the project.
Provide details on the API endpoints and their usage.
Include any additional information that may be helpful for understanding your implementation.

## Demo
#### Demo —— Successful trip creation
https://github.com/user-attachments/assets/e8b9d9e3-11c2-48e6-8240-246afde751a8

#### Demo —— Unsuccessful trip creation
https://github.com/user-attachments/assets/64fd21cd-9aa9-4342-aa3b-464fbbe364ba

## Architecture and Tools Used
- The application is built using Swift and SwiftUI.
- I made use of Async/Await for the GET request, URLSession for the POST request.
- I used the Model-View-ViewModel(MVVM) architecture.

## Running the application
You can run Hebron Plants on iOS 16.5 or later, iPadOS 15.5 and macOS 12.4 or later. You must have Xcode 15 or later installed.
1. Click on the green button labeled `Code` then select `Open with Xcode`
2. Click `allow` when the prompt shows.
3. Click `clone` when the prompt shows.
4. Click `Trust and Open` when the prompt shows.
5. Choose the device you'd like to run the app on.
6. Press the play button!

## NOTICE BOARD
#### Endpoints
- GET all trips endpoint:
  `https://saladel.free.beeceptor.com/my-trip`,
  `https://tripps.free.beeceptor.com/my-trip`

- POST create trip endpoint:
  `https://saladel.free.beeceptor.com/create-trip`,
  `https://tripps.free.beeceptor.com/create-trip`

---

- After Cloning the project, Go to `ViewModel -> CreateTripViewModel` comment the following line
```swift
let postEndpoint = "https://tripps.free.beeceptor.com/create-trip 
``` 
 by adding `//` in front of it. i.e: 
 
 ```swift
//let postEndpoint = "https://tripps.free.beeceptor.com/create-trip
``` 
 then uncomment 

 ```swift
// let postEndpoint = "https://saladel.free.beeceptor.com/create-trip"
``` 
 by removing the `//` in front of it.
 
- Also Go to `ViewModel -> TripDetailViewModel` comment
 ```swift
let endpoint = "https://tripps.free.beeceptor.com/my-trip"
```
by adding `//` in front of it. i.e: 
 ```swift
//let endpoint = "https://tripps.free.beeceptor.com/my-trip"
```
then uncomment 
```swift 
let endpoint = "https://saladel.free.beeceptor.com/my-trip"
```
by removing `//` in front of it.

#
Feel free to reach out to me on [Linkedin](https://bit.ly/AdewaleSanusi) or [Twitter](https://twitter.com/A_4_Ade) if you have any questions or feedback!

[🔝](#Table-of-contents)

<!-- You can read the [FAQ](https://#) if you have any questions. -->
