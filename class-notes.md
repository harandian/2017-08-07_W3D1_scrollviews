# Scroll Views

## Panning

![Imgur](http://i.imgur.com/6HoxHTc.png)

Use this when content is too large to be seen in the view.

We add a subview to the scroll view

Explicitly tell the scrollview how big the content is `contentSize`

## Zooming

Pinching gesture.

* We have to tell the scroll view which view to zoom in and out.
* Use the `UIScrollViewDelegate` to have the scroll view ask us for the view it should zoom on.
* we have to tell the scroll view how far it can zoom in and out, by setting properties.
* You can only zoom on one view, so it's common to create a 'container' view and put everything inside of the container, then put the container in the scrollview.

## Paging

![Imgur](http://i.imgur.com/DgdVqB4.png)

* Add our views to the scroll view like we do for panning, but we want each view to be the size of the screen. 
* We update the content size, to be the entire size of all the content. 
* Enable paging.

## Page Control

* We have to manage everything with a page control.

## Auto Layout

* We no longer have to set the `contentSize`
* You just have to constrain all hte suviews of the scroll view

### Stack View

* Use a stack view to simplify stacking views together using auto layout.

