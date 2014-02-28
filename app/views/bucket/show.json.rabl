object :@bucket
extends 'bucket/base'

child :location, partial: 'common/location'
child :tags, partial: 'common/tag'
child :users, partial: 'user/base'
child :pictures, partial: 'picture/base'

