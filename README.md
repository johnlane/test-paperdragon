== README

This is a test application for Paperdragon issues.

Incorrect URL
-------------

The URL returned by Paperdragon is not the URL to the image in cases where the
original filename is not unique. 

Paperdragon appends characters to a non-unique filename to make it unique but
it does not reflect this in the `uid` stored in `image_meta_data`: all images
that have the same original filename have the same `uid`.

When an image is retrieved, its URL can be obtained as per the [documentation](https://github.com/apotonick/paperdragon#rendering-images):

    image[:thumb].url

Because the stored `uid` reflects the wrong file, the returned URL is wrong.

The test application demonstrates this. Go to `/images/new` and upload an image.
It will be displayed. Repeat with a second image **with the same filename** and
the first image will be rendered.

This can be checked by `/images/1` and `/images/2` displaying the same file.

There will be two records in the database and their metadata will reflect any
difference in `width` and `height`, but they will have the same `uid`.
