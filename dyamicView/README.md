# Dyamic UIView


Step 1 :
Add Scrollview to view in storyboard and add leading, trailing, top and bottom constraints (All values are zero).
Step 2 :
Don't add directly views which you need on directly scrollview, First add one view to scrollview (that will be our content view for all UI elements). Add below constraints to this view.
Leading, trailing, top and bottom constraints (All values are zero).
Step 3; 
Set equal four edge from new added view to conetnt view. And change all value to 0.
Set equal width to frame view.
Step 4:
Height of this content view will be according to the number of views added to the view. let say if you added last view is one label and his Y position is 420 and height is 20 then your content view will be 440.



For old version

Scroll view -> 0,0,0,0
Content View -> 0,0,0,0 -> give a height 
Control drag content view to Top View -> equal width
View Controller -> inspector-> change to free form = size of content view

While using scrollviews in storyboard it's better to calculate content size according to number of views present in scrollview rather than giving content size programatically with static value.

Here are the steps to get content size dynamically.

Step 1 :
Add Scrollview to view in storyboard and add leading, trailing, top and bottom constraints (All values are zero).
Step 2 :
Don't add directly views which you need on directly scrollview, First add one view to scrollview (that will be our content view for all UI elements). Add below constraints to this view.
Leading, trailing, top and bottom constraints (All values are zero).
Add equal height, equal width to Main view (i.e. which contains scrollview). For equal height set priority to low. (This is the important step for setting content size).
Height of this content view will be according to the number of views added to the view. let say if you added last view is one label and his Y position is 420 and height is 20 then your content view will be 440.
Step 3 : Add constraints to all of views which you added within content view as per your requirement.
Important: Work around with hugging priority and compression resistance 
