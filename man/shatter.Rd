% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shatter.R
\name{shatter}
\alias{shatter}
\title{Image classifier workflow}
\usage{
shatter(
  image,
  locations,
  n_rows = 5,
  n_cols = 9,
  lower_hue_threshold = 120,
  upper_hue_threshold = 160,
  lower_saturation_threshold = 0.05,
  lower_luminance_threshold = 0.05,
  upper_luminance_threshold = 0.95,
  border_size = 0.25,
  iso_blur = 2,
  histogram_balancing = FALSE,
  direction = "backward",
  pre_processed = FALSE
)
}
\arguments{
\item{image}{A photograph of a single game board.}

\item{locations}{A list of corner locations of the game board in the image.}

\item{n_rows}{Number of rows per panel. With 7cm x 10cm photos, I use five rows of photos per panel.}

\item{n_cols}{Number of cols per panel. With 7cm x 10cm photos, I use six to eight cols of photos per panel.}

\item{lower_hue_threshold}{A vector of lower hue thresholds for each token color. To use three token colors, instead of the single token in the defaults, use: e.g., c(120, 210, 330).}

\item{upper_hue_threshold}{A vector of upper hue thresholds for each token color. To use three token colors, instead of the single token in the defaults, use: e.g., c(150, 250, 355).}

\item{lower_saturation_threshold}{Lower limit of greyness before the hue of such pixels is excluded from density calculations.}

\item{lower_luminance_threshold}{Lower limit of darkness before the hue of such pixels is excluded from density calculations.}

\item{upper_luminance_threshold}{Upper limit of lightness before the hue of such pixels is excluded from density calculations.}

\item{border_size}{Image border excluded from density calculations as a fraction of image size.}

\item{iso_blur}{Width of Gaussian filter applied to image. A value of 0 turns off blurring.}

\item{histogram_balancing}{Should histogram balancing be used to correct grey-out images? This sometimes helps, but sometimes hurts, classification accuracy. This will cause token hue to shift as well, so hue thresholds will need to be revised if this is used.}

\item{direction}{How image skew is corrected. The "forward" algorithm is fast but lower quality. The "backward" algorithm is slow but higher quality. See imwarp function in imager package for technical details.}

\item{pre_processed}{Are photographs pre-processed such that image correction steps can be skipped? If FALSE, then user must pre-process images using DieTryings tools. If TRUE game board photographs must be cropped and unskewed. 
Some Android and IOS apps, like Tiny Scanner, provide a means of producing such photographs of the game boards at the time of data collection.}
}
\value{
A list containing an array of hue expression results, and corrected images.
}
\description{
This function works by taking an input of lists of images and corner locations of the game board, and the applying
a workflow to identify ties, as indicated by token placement. Shatter first applies image straigtening and rotation correction steps.
Then, it splits the photo grid into individual respodent photos, and applies the hue detection algorithm on case and control images.
}
