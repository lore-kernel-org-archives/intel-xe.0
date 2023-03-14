Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB0C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 16:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827ED10E182;
	Tue, 14 Mar 2023 16:43:05 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059510E182
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678812183; x=1710348183;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y63p+W/23hDEFuMvcIEELot9UxKFy9htYI4AnIrk7TM=;
 b=RSGtpB3fV6TW36oujFDadqCshkAyKGolg9illaeHNMapU5FpEkIi5O0y
 3gpbwnpPDkbhfVHT7hQh4Ycjin/44TVyVoL7Z+1ErOJogZkz1w0oKASQR
 P4GzobRClIqxdb4TsfnaM9L49kG7ohoiUMLJ7/0NuCT9ZfIzawYLsKOju
 x8ecn+KkiZeS6rj0bE+2ARqjnwbAibttdj4oRasvyTz1WqoPmbsLy6deR
 pdpC4NPSpjorlFzvQLRFuIPt+vLZxEdNnr9YcNSryXqXIU/Y+LOUqfzgp
 KhxFPYAYdAHiS3fOUG4ag505w/HhAWTNQ1qxNjXB+B1n5XR8rdYIWR2yS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336171985"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="336171985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709348897"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="709348897"
Received: from vperevez-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.84])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:42:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
 <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
Date: Tue, 14 Mar 2023 18:42:56 +0200
Message-ID: <874jqn708f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 14/03/2023 11:43, Jani Nikula wrote:
>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>>> support. This is primarily for the benefit of the drm/xe driver, and
>>> legacy is defined in terms of the platforms drm/xe does not support,
>>> i.e. anything before Tigerlake.
>>>
>>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D1 in
>>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makefile
>>> does no such thing, regardless of the kconfig value.
>>>
>>> Initially, the knob does the bare minimum: drops the legacy platforms
>>> from module PCI ID table (and the compiler in turn automagically drops
>>> all the unreferenced device infos).
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> The discussion stalled a bit.
>>=20
>> Do we have consensus to start adding this to upstream i915?
>
> I always liked the idea of compiling out platform support so I could be=20
> convinced. I view that as a "power user" use case - compiles their own=20
> kernel for a targeted machine. It also translates to building smaller=20
> images in production settings although that is kind of not interesting=20
> with the storage amounts these days. So overall feels could be=20
> justified. There is some benefit and could be done with minimal=20
> maintenance cost.
>
> But to add a Kconfig calling something "legacy", by the definition of=20
> what Xe will support feels maybe a bit premature. Sure it will become=20
> super useful once Xe is in the tree, to allow exactly the same class=20
> use-case as above, but until then it feels questionable under your own=20
> criteria too.

I don't disagree. Partially the idea with "legacy" was to be a bit
vague, so we could tweak what it really means later.

> If you could add a set of more generic options, which Xe could later tie=
=20
> into that would work for me. For instance we have some more natural=20
> cross-over points than Tigerlake. So if not per individual platform,=20
> maybe for like ring buffer -> execlists -> GuC transitions. And naming=20
> them without saying legacy for now, but use some descriptive names, and=20
> listing platform code names in help text. "Select this to support=20
> Broadwell, Skylake, etc..", "Select this to support Sandybridge..". Out=20
> of the tree Xe build can then just not use the corresponding defines in=20
> its own build and it would achieve what you need?

I kind of wanted to avoid adding a lot of config options, because I
think they'll be difficult to maintain and get all the combos right. I
don't particularly want all the build bot reports about various kconfig
combos failing.

One other problem is that I can't think of a way to do this by using the
kconfig CONFIG_FOO macros directly; you have to add separate variables
because the same files are built for two drivers. You can't force the
CONFIG_FOO macros to different settings for different drivers. So we'd
get a lot of proxy macros too.

I wonder if there's a name we could use instead of legacy to reasonably
match what Xe needs to avoid adding tons of configs at once?

BR,
Jani.


>
> Once in tree we can have a "legacy" kconfig which toggles a whole group=20
> of those. Like "CONFIG_DRM_I915_SUPPORT_XE_PLATFORMS" or something.




--=20
Jani Nikula, Intel Open Source Graphics Center
