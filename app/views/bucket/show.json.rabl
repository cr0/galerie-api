object :@bucket
extends 'bucket/base'

child :location, partial: 'common/location'
child :tags, partial: 'tag/base'
child :authors, partial: 'user/base'
child :persons, partial: 'user/base'
child :pictures, partial: 'picture/base'
