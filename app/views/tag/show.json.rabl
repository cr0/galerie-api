object :@tag
extends 'tag/base'

node :count do |tag|
  tag.buckets.length + tag.pictures.length
end

child :buckets, partial: 'bucket/base'
child :pictures, partial: 'picture/base'
