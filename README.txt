Image Resolution and Menu's:
1. Create TextureRect as Child Element
2. Check off Expand in inspector
3. Go To Layout Tab and Click Full Rect option (will resize twice) 

Displaying Text and Applying Font:
1. Create Label Node
2. Check off Fonts
3. Click New Dynamic Font
4. Drag New Font in Font Data
5. Resize!

====================================

Player Input Notes:
- LineEdit = Allows a player to enter a single line of text.
- TextEdit = Allows a player to fill out a large amount of info.

========================================

Under Control/Container/BoxContainer is VBox and HBoxContainer:
- These options create rows and columns to organize interfaces.
- The order in which you order them in the scene tree is the order they will be organized.
 
When working with images in HBoxContainer (Use Size Flags option - In Inspector):
- Check off expand on an individual node, and that node will cover as much of the screen as it can.
- In Hbox inspector, spacing betwwen items can be set by using custom constants. 

==========================================

NodeTab - Signals:
-Signals allow the connection between two child nodes.
-Signals can be created by linking to the primary script. Signal will create a new private function.

=========================================

Buttons:
-TextureButtons allow for different looks (Animated Textures)
-Object size is determined by the size of the Rect
-Image size is controlled by the expand option (Think of Rect as the boarder)
    -If an object is too small, adjust it with Rect options.
 
