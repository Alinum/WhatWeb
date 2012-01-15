##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name and :certainty=>100

Plugin.define "DotCMS" do
author "Andrew Horton"
version "0.2"
description "DotCMS is an opensource CMS written in Java. Has enterprise support. Homepage: http://www.dotcms.org/"

examples %w|
education.asu.edu
www.astate.edu/
www.bvu.edu/
www.columbustech.edu/
www.edinboro.edu/
www.gettysburg.edu/
www.greenville.edu/
www.keystone.edu/
www.msoe.edu/
www.mtaloy.edu/
www.northwestcollege.edu/
www.oberlin.edu/
oxford.emory.edu/
www.pittstate.edu/
www.sjfc.edu/
www.taylor.edu/
www.uakron.edu/
www.uthouston.edu/
|

# <img src="/resize_image?path=/dotAsset/
# <img src="/dotAsset/
# <link href="/dotAsset/

trigger ["dotAsset", "index.dot"]

matches [
{:regexp=>/<img[^>]+src="[^"]*\/dotAsset\//}, #"
{:regexp=>/<link[^>]+href="[^"]*\/dotAsset\//}, #"
{:regexp=>/<a[^>]+href="[^h][^"]*index\.dot/} #"
]

end


