# ARCHITECTURE

## Goal
This doc has the main goal to organize the process of app development.

This project follows the Clean Architecture approach. Clean Architecture organizes the code to be independent of frameworks, UI, databases, or any external agents, and is divided into several layers. Below is a detailed explanation of the structure and components of the project.

## Project Structure
Core:
- DataState: Abstract class representing the state of the data (success or failure);
- UseCase: Abstract class for use cases.

Features Domain:
- Entities: Defines the domain entities.
- Repository: Defines interfaces for accessing data.
- UseCases: Implements the app-specific business logic, such as GetAstronomyPicturesUseCase.

Data:
- Models: Data representations exchanged with the API.
- DataSources: Defines data access services.
- RepositoryImpl: Implements the interfaces defined in the Domain layer, such as AstronomyPicturesRepository.

Presentation:
- State: State management.
- Controller: Controller using the use cases.
- Widgets: Contains specific widgets used on the pages.
- Pages: Presentation pages (UI).

Directory Estucture
```shell
  .
  └── lib/
      └── core/
          └── constants/
          └── resources/
          └── usecases/
      └── features/
          └── feature-example/
              └── data/
                  └── data_source/
                  └── models/
                  └── repository/
              └── domain/
                  └── entities/
                  └── repository/
                  └── usecases/
              └── presentation/
                  └── pages/
                  └── state_manager/
                  └── widgets/
  ├── ARCHITECTURE.md
  ├── README.md
```

## Packages
Packages from The official package repository for Dart and Flutter apps.


- [HTTP] - A composable, Future-based library for making HTTP requests;
- [Mocktail] - Mocktail focuses on providing a familiar, simple API for creating mocks in Dart (with null-safety) without the need for manual mocks or code generation;
- [Youtube_Player_Flutter] - Flutter plugin for playing or streaming YouTube videos inline using the official iFrame Player API.



    [HTTP]: <https://pub.dev/packages/http>
    [Mocktail]: <https://pub.dev/packages/mocktail>
    [Youtube_Player_Flutter]: <https://pub.dev/packages/youtube_player_flutter>
   
  