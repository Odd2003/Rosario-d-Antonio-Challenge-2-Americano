# 📺 TV Time Recreation (SwiftUI)
A SwiftUI recreation inspired by the TV Time app — built to sharpen SwiftUI skills and implement a functional home-screen widget using WidgetKit.

# Overview
This repo contains a learning project that re-creates core UI patterns of the TV Time app using SwiftUI and explores WidgetKit by shipping a home-screen widget. The app is intentionally modular to make it easy to learn from and iterate on.

# ✨ Features
Recreated TV Time–style UI components using SwiftUI
Functional WidgetKit home-screen widget
Modular component architecture for easy reuse and experimentation
Clean folder structure and lightweight data models

# 🎯 Project Goals
Improve practical SwiftUI knowledge (layout, state management, view composition)
Understand and implement WidgetKit timelines, entries, and snapshot behavior
Build a clean, reusable SwiftUI codebase suitable for iteration

# Project Structure
TV Time Recreation/

 ├── TV_Time_RecreationApp.swift       
 ├── Views/                            
 ├── Components/                  
 ├── Models/  
 ├── Resources/                     
 └── TV_Time_Recreation_Widget/     

# Getting Started
Requirements
Xcode (latest recommended)
iOS SDK supporting SwiftUI & WidgetKit
Swift 5.x

# Widget Notes
Implemented using WidgetKit + SwiftUI
Demonstrates TimelineProvider and timeline entries
Widget follows WidgetKit constraints (small/snapshot-friendly UI)
Designed for quick snapshots and minimal work in the widget extension

# Usage / UX
Browse the recreated UI screens to view components and layout decisions.
The widget shows a compact snapshot of a show (or placeholder data) to demonstrate timeline rendering.
This is a learning project; network integration and persistent watchlist state are planned (see Future Goals).

# Future Goals
🌐 Pull shows and their info from the web (API integration)

➕ Add feature to add shows to watchlist

✅ Add features to add episodes watched

🧭 Add “Movies”, “Discover” and “Profile” tabs

These goals are prioritized to move the app from a static UI recreation to a full-featured, data-driven experience.
