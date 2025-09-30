# SwiftUI Posts App


## Overview
A SwiftUI app that fetches posts from https://jsonplaceholder.typicode.com/posts, allows searching, viewing details, marking favorites, and viewing favorite posts in a separate tab. Architecture follows MVVM and networking is handled in a dedicated service.


## Requirements Fulfilled
- Fetch posts from the endpoint (NetworkService)
- List with title and userId (PostsListView / PostRowView)
- Search by title (SearchBarView)
- Detail screen with large title and body (PostDetailView)
- Favorite toggle in list & detail and Favorites tab (FavoritesManager, FavoritesListView)
- MVVM architecture (Models, ViewModels, Views)
- Loading indicator, error handling, pull-to-refresh

## Tech
- Swift 5.9+
- SwiftUI 4
- iOS 16+

## Project Setup
1. Open Xcode 15+
2. Create a new SwiftUI app project (iOS) named `PostsApp` OR Drag and Drop
3. Add the files from this repo to the project preserving folder structure (Models, ViewModels, Views, Services)
4. Set deployment target to iOS 16.0 or higher
5. Build & run on simulator or device


## Architecture
- `Model` — `Post` (Codable)
- `ViewModel` — `PostsViewModel` (fetching, filtering)
- `Service` — `NetworkService` (networking, decoupled from views)
- `FavoritesManager` — handles favorite ids and persists using `UserDefaults`
- `Views` — `PostsListView`, `FavoritesListView`, `PostDetailView`, smaller components


## Improvements / Assumptions
- Pagination not required; fetches all posts at once.
- Favorites stored locally (UserDefaults). For production, consider CoreData or syncing to a backend.
- Added pull-to-refresh and simple error UI.
- If needed, caching and image support (if posts had images) would be added.
