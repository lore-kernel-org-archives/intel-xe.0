Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE2DC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 12:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0EE10E7CF;
	Tue, 14 Mar 2023 12:53:03 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E110E7CF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678798381; x=1710334381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=23UhdpQWVeXDw1KwL/PKgaQ6BcenGq+9xgQ1+eQYyIU=;
 b=Hr9GHkJClGGnPOpEjU9NosJEuUF8/80RsSEG9d5ejVpmjS5B9zecsrWd
 kAwXtc6N+LP972Nh0LW0EKAM3aMFiTmb3H8PUxtUda71l4WI2bb+iWGcI
 YN222DbK7sD3bmf0sGJ2gQzWKO0F6wO2EW5IHibeH6OEAHFZLA79RKA45
 oLiukj63ObfGgfFd0ObgMQQPeffTLlIVSKmMzwefXfr7tul2/8g5IOSZU
 t/qUIDySR45EL9gj2lyfmo2Vc1jxGj98OlwBJJH6KyPjNqTvujr0y+EmF
 R3KYmy8b5KGghTwCgsKnVBhg1zWRTpQoctbQVaACrFmCQU0INy6uJrJ7H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399999407"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="399999407"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 05:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711500788"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="711500788"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO [10.213.236.227])
 ([10.213.236.227])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 05:52:24 -0700
Message-ID: <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
Date: Tue, 14 Mar 2023 12:52:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <877cvj7e39.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 14/03/2023 11:43, Jani Nikula wrote:
> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>> support. This is primarily for the benefit of the drm/xe driver, and
>> legacy is defined in terms of the platforms drm/xe does not support,
>> i.e. anything before Tigerlake.
>>
>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=1 in
>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
>> does no such thing, regardless of the kconfig value.
>>
>> Initially, the knob does the bare minimum: drops the legacy platforms
>> from module PCI ID table (and the compiler in turn automagically drops
>> all the unreferenced device infos).
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The discussion stalled a bit.
> 
> Do we have consensus to start adding this to upstream i915?

I always liked the idea of compiling out platform support so I could be 
convinced. I view that as a "power user" use case - compiles their own 
kernel for a targeted machine. It also translates to building smaller 
images in production settings although that is kind of not interesting 
with the storage amounts these days. So overall feels could be 
justified. There is some benefit and could be done with minimal 
maintenance cost.

But to add a Kconfig calling something "legacy", by the definition of 
what Xe will support feels maybe a bit premature. Sure it will become 
super useful once Xe is in the tree, to allow exactly the same class 
use-case as above, but until then it feels questionable under your own 
criteria too.

If you could add a set of more generic options, which Xe could later tie 
into that would work for me. For instance we have some more natural 
cross-over points than Tigerlake. So if not per individual platform, 
maybe for like ring buffer -> execlists -> GuC transitions. And naming 
them without saying legacy for now, but use some descriptive names, and 
listing platform code names in help text. "Select this to support 
Broadwell, Skylake, etc..", "Select this to support Sandybridge..". Out 
of the tree Xe build can then just not use the corresponding defines in 
its own build and it would achieve what you need?

Once in tree we can have a "legacy" kconfig which toggles a whole group 
of those. Like "CONFIG_DRM_I915_SUPPORT_XE_PLATFORMS" or something.

Regards,

Tvrtko
