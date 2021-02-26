# PhotoDir

Docker container that serves a dead-simple HTTP endpoint (using [Sinatra](https://sinatrarb.com/)) with images in a directory (my usecase is to serve them in descending modified_time order).

Useful for seamlessly integrating with the Adobe Lightroom's "publish to directory" feature.

# Usage

```
docker run --publish="4567:4567" --volume="~/Pictures/synced-photos/:/pictures" -e "PHOTO_DIR=/pictures" hkdsun/photo_dir
```
