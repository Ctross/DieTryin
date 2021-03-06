% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grab_points.R
\name{grab_points}
\alias{grab_points}
\title{A helper function}
\usage{
grab_points(path_imgs, pre_processed = FALSE)
}
\arguments{
\item{path_imgs}{Path to the image files}

\item{pre_processed}{Are photographs pre-processed such that image correction steps can be skipped? If FALSE, then user must pre-process images using DieTryings tools. If TRUE game board photographs must be cropped and unskewed. 
Some Android and IOS apps, like Tiny Scanner, provide a means of producing such photographs of the game boards at the time of data collection.}
}
\value{
A list containing an array of corner locations.
}
\description{
This is a helper function to grab points, called from within pre_process. This function will return the locations of the image corners. If pre_processed is FALSE
then the user much click on the corners using the automated workflow. If set to TRUE, then it will return the coners of the image file itself.
}
