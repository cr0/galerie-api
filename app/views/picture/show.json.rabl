object :@picture
extends 'picture/base'

child :location, partial: 'common/location'
child :tags, partial: 'common/tag'
child :author, partial: 'user/base'
