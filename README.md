#  Find Falcone - SwiftUI

This is a SwiftUI-based application for the **"Finding Falcone"** coding challenge by [GeekTrust](https://www.geektrust.in/). The goal is to find Al Falcone by selecting 4 planets and assigning vehicles strategically.

## 🎥 Demo Video

https://github.com/user-attachments/assets/9cba421c-6b15-4ca6-b41f-acc19dede583

##  Features

- ✅ Fetches planets and vehicles from public APIs
- ✅ Dynamic UI to select 4 planet-vehicle pairs
- ✅ Vehicle constraints based on range and count
- ✅ Calculates total search time
- ✅ Uses token to submit `/find` request
- ✅ Displays result: whether Falcone was found or not
- ✅ Built with SwiftUI and MVVM architecture

---

##  Project Structure

```plaintext
├── FindFalconeApp.swift         # App entry point
├── ContentView.swift            # Main view with logic
├── PlanetVehiclePicker.swift    # View to choose planet + vehicle
├── RadioButton.swift            # Custom radio button
├── FindFalconeViewModel.swift   # ViewModel with game logic
├── FalconeService.swift         # Networking and models
├── Assets.xcassets              # App assets
├── Info.plist                   # App configuration


License
This project is for the GeekTrust coding challenge. All API and content rights belong to GeekTrust.

Acknowledgements
Thanks to GeekTrust for the opportunity to work on this exciting problem!
