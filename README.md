# News App

Flutter news application that fetches and displays news articles using the NewsAPI.

## Important Highlights

The app includes:
- Home screen with news list and search functionality
- Detailed article view with author information
- Theme toggle button in the app bar (switch between light and dark mode)
- Placeholder images used for articles without url images

## Prerequisites

Before running this application, make sure you have:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.7.2 or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- A device or emulator to run the app

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd news_app
```

### 2. Install Dependencies

Run the following command to install all required dependencies:

```bash
flutter pub get
```

### 3. NewsAPI Setup

This app uses the [NewsAPI](https://newsapi.org/) to fetch news articles. 

**Important**: The current API key in the code (`2b1b78720b524e53a56f1fc5465b9370`) is exposed in the source code and should be replaced for production use.

To get your own API key:
1. Visit [NewsAPI.org](https://newsapi.org/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Replace the API key in `lib/features/news/service/news_api_service.dart`

```dart
// Replace this line with your API key
final url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY_HERE';
```

### 4. Add Assets

Make sure you have a placeholder image in your assets folder:
- Create an `assets/images/` directory in your project root
- Add a `placeholder.png` file for articles without images

### 5. Run the Application

#### Using Command Line:
```bash
flutter run
```

#### Using IDE:
- Open the project in your preferred IDE
- Select a device or emulator
- Press F5 (VS Code) or click the Run button

## Dependencies

The project uses the following key dependencies:

- **flutter**: Flutter SDK
- **provider**: State management (^6.1.5)
- **http**: HTTP requests for API calls (^1.5.0)
- **google_fonts**: Custom fonts (^6.3.0)
- **dartz**: Functional programming utilities (^0.10.1)
- **cupertino_icons**: iOS-style icons (^1.0.8)

## API Endpoints Used

- **Top Headlines**: `https://newsapi.org/v2/top-headlines?country=us&apiKey={API_KEY}`
- **Search**: `https://newsapi.org/v2/everything?q={query}&apiKey={API_KEY}`

## Features Breakdown

### Home Screen
- Displays top headlines from the US
- Search feature for getting specific news (uses different endpoint)
- Theme toggle button

### Article Detail Screen
- Full article view with image
- Author information
- Article content
- Responsive layout

### State Management
- Uses Provider for state management
- Theme switching functionality

### Common Issues:

1. **API Key Issues**:
   - Make sure you have a valid NewsAPI key
   - Check if you've exceeded your API limits (free tier has limitations)

2. **Network Issues**:
   - Ensure your device/emulator has internet connectivity
   - Check if NewsAPI is accessible from your region

3. **Image Loading Issues**:
   - Make sure the placeholder image exists in `assets/images/placeholder.png`
   - Update `pubspec.yaml` if you change the asset path

4. **Build Issues**:
   - Run `flutter clean` and then `flutter pub get`
   - Make sure your Flutter SDK is up to date


