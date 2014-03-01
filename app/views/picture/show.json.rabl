object :@picture
extends 'picture/base'

child :location, partial: 'common/location'
child :tags, partial: 'tag/base'
child :author, partial: 'user/base'
