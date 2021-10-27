I encourage you to read this read me file, please.
*(As asked, inside the main path, there is a recording of the app. File name is 'Little-fun-2.mov)*

# 2- Draw polygon app - (optional)  
Please develop another app that users can draw simple  polygon with it, the app works like  
follow:  
*********** *DONE* *********1.  When users open the app, an empty canvas should be  presented;  
*********** *DONE* *********2.  There should have 2 buttons, one button to  completea polygon, the other to  reset  
canvas content;  
*********** *DONE* *********3.  When users touch on the canvas, a vertex will be added  into the location where user  
touches, if there are any existing vertices, new vertex  should be connected to the last  
added existing vertex with a polyline, when user click  on the  completebutton, the last  
added vertex should be connect to the first vertex  to form a polygon;  
*********** *DONE* *********4.  When users click the  resetbutton, all vertices should  be cleared from the canvas

# General Comments
Just a view controller containing a canvas view. The canvas view implements a protocol with proper functions to draw lines, circles and clean the canvas

# Files Structure in XCode

```
+-- TechTest
|   +-- DrawPolygonApp
|   |  +-- AppDelegate.swift
|   |  +-- SceneDelegate.swift
|   |  +-- ViewController.swift
|   |  +-- Main.storyboard
|   |  +-- Assets.xcassets
|   |  +-- LaunchScreen.storyboard
|   |  +-- Info.plist

```


