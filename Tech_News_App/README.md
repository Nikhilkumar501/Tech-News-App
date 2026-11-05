# Tech News App

A Flutter technology-news reader starter app built with Provider and SharedPreferences.

## Features
- Browse technology demo stories across AI, Gadgets, Software, and Startups.
- Search headlines and summaries.
- Filter by technology category.
- View full article details.
- Save and remove bookmarked articles.
- Add custom technology posts with form validation.
- Persist bookmarks and user-created posts locally on the device.
- Loading, error/retry, empty, and populated states.

## Screens
1. Tech Feed – search and category filters.
2. Article Details – full story, author, and demo publication label.
3. Create Tech Post – validated form for a user-created article.
4. Bookmarks – saved technology stories.

## Data source and limitations
The starter catalogue in `lib/services/tech_news_data_service.dart` contains fictional demonstration stories. It is not connected to a live news API, and demo stories must not be presented as current technology news. User-created posts and bookmarks are stored locally with SharedPreferences. No API key is required.

A future live-news version can integrate a permitted news API. Document the provider and its terms, and do not commit private API keys to a public GitHub repository.

## Run
1. Install Flutter stable (3.35 or later recommended), Android Studio, and Android SDK.
2. Extract this project folder.
3. Open the folder in Android Studio or VS Code.
4. Run `flutter pub get`.
5. Connect an Android phone with USB debugging enabled, or start an emulator.
6. Run `flutter run`.

## Test
Run `flutter test`.

## Team contribution ideas
- Member 1: Tech feed, search, and category filters.
- Member 2: Article details and create-post form.
- Member 3: Provider, local persistence, bookmarks, tests, and README.
Each member should make meaningful commits and understand their assigned feature.

## Important verification note
This is an initial source package. It has not been built or tested on a physical Android device in this environment. The team must run `flutter pub get`, `flutter analyze`, `flutter test`, and `flutter run`, then fix any issues before calling it submission-ready.
