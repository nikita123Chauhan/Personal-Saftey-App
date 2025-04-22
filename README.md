# HerSafety  – Your Personal Safety Companion

**HerSafety** is an all-in-one personal safety app tailored especially for women, providing rapid emergency support, real-time location sharing, and access to nearby emergency services. Built with  using **Flutter** and **Firebase**, it ensures users can stay safe, aware, and connected — anytime, anywhere.

---

##  Core Features

###  Emergency SOS
- Instantly send emergency messages with live location to your trusted contacts.

###  Real-Time Location Tracking
- Share your live location continuously during an emergency.

###  One-Tap Emergency Calling
- Call pre-saved emergency contacts in a single tap.
- Auto-dial options for:
  - 📞 **Police**
  - 📞 **Women Helpline**
  - 📞 **Custom Emergency Contacts**

###  Volunteer Support
- Register as a volunteer or get assistance from nearby users during distress.

###  Nearby Safety Services
- Locate and navigate to:
  - 🧭 Police Stations
  - 💊 Pharmacies
  - 🏥 Hospitals

###  Offline Safety
- SMS-based alert system that works even without internet.

---

##  Tech Stack

| Layer       | Tools Used                                |
|-------------|--------------------------------------------|
| Frontend    | Flutter, Dart                              |
| Backend     | Firebase Auth, Firebase Firestore, Realtime DB |
| Location    | Google Maps API, Geolocator, Geocoding     |
| SMS & Alerts| background_sms, flutter_local_notifications |

---



##  Getting Started

### Prerequisites

- Flutter SDK
- Firebase project (Android/iOS)
- Google Maps API Key
- Physical Android device for SMS testing

### Installation

```bash
git clone https://github.com/your-username/hersafety.git
cd hersafety
flutter pub get
flutter run
