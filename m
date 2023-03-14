Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D2C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 18:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5008110E1CD;
	Tue, 14 Mar 2023 18:48:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328D010E1CD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678819687; x=1710355687;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8KJWpnPBqVvTNSqc77yEavdXHyheRfLvnSIRcxBDVYE=;
 b=XZ/IcsS8xBOCLSPLvlDesoNgJJpaSXH1uaCQ8hkhm88NIQUxXOevzdJ4
 Grtp2FxASmLbb0WzRAWpLcfn5CaQl3lyL2sa7cZDKJL68OZvJYfw+fZzO
 uaiLdxGfrPE8rmBISVHbP1ga7YhwIrskB1LV1wbRZ7G1d/GOF3cbcLVs8
 fS7O6+6S4q6AeVC50Bk/do8QX+Dfb3HqICGWjEBd1ZgRQTwkN/4DSCPKj
 +KDiFK3hoMYE+z+YbZHizHrzfXp06OnUUA6zXNIU7YYJECaOTI2LMWQ4s
 4Qt6sHNk3veMn8UyUmBkwb3S/S00s/lK/4hUyXqlvxYJo9U5jvI48uW0S Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402380873"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="402380873"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679203286"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="679203286"
Received: from vperevez-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.84])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 11:48:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
In-Reply-To: <93bb2619-348d-4061-ac7c-a5f4804fc8a8@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
 <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
 <874jqn708f.fsf@intel.com>
 <20230314172237.424zwdox7mnod5s4@ldmartin-desk2.lan>
 <93bb2619-348d-4061-ac7c-a5f4804fc8a8@linux.intel.com>
Date: Tue, 14 Mar 2023 20:48:01 +0200
Message-ID: <871qlr6ufy.fsf@intel.com>
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
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-xe@lists.freedesktop.org, "Shankar, Uma" <uma.shankar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 14/03/2023 17:22, Lucas De Marchi wrote:
>> On Tue, Mar 14, 2023 at 06:42:56PM +0200, Jani Nikula wrote:
>>> On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>=20
>>> wrote:
>>>> On 14/03/2023 11:43, Jani Nikula wrote:
>>>>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>>>>>> support. This is primarily for the benefit of the drm/xe driver, and
>>>>>> legacy is defined in terms of the platforms drm/xe does not support,
>>>>>> i.e. anything before Tigerlake.
>>>>>>
>>>>>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intenti=
on
>>>>>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D1=
 in
>>>>>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makef=
ile
>>>>>> does no such thing, regardless of the kconfig value.
>>>>>>
>>>>>> Initially, the knob does the bare minimum: drops the legacy platforms
>>>>>> from module PCI ID table (and the compiler in turn automagically dro=
ps
>>>>>> all the unreferenced device infos).
>>>>>>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>>>
>>>>> The discussion stalled a bit.
>>>>>
>>>>> Do we have consensus to start adding this to upstream i915?
>>>>
>>>> I always liked the idea of compiling out platform support so I could be
>>>> convinced. I view that as a "power user" use case - compiles their own
>>>> kernel for a targeted machine. It also translates to building smaller
>>>> images in production settings although that is kind of not interesting
>>>> with the storage amounts these days. So overall feels could be
>>>> justified. There is some benefit and could be done with minimal
>>>> maintenance cost.
>>>>
>>>> But to add a Kconfig calling something "legacy", by the definition of
>>>> what Xe will support feels maybe a bit premature. Sure it will become
>>>> super useful once Xe is in the tree, to allow exactly the same class
>>>> use-case as above, but until then it feels questionable under your own
>>>> criteria too.
>>>
>>> I don't disagree. Partially the idea with "legacy" was to be a bit
>>> vague, so we could tweak what it really means later.
>>>
>>>> If you could add a set of more generic options, which Xe could later t=
ie
>>>> into that would work for me. For instance we have some more natural
>>>> cross-over points than Tigerlake. So if not per individual platform,
>>>> maybe for like ring buffer -> execlists -> GuC transitions. And naming
>>>> them without saying legacy for now, but use some descriptive names, and
>>>> listing platform code names in help text. "Select this to support
>>>> Broadwell, Skylake, etc..", "Select this to support Sandybridge..". Out
>>>> of the tree Xe build can then just not use the corresponding defines in
>>>> its own build and it would achieve what you need?
>>>
>>> I kind of wanted to avoid adding a lot of config options, because I
>>> think they'll be difficult to maintain and get all the combos right. I
>>> don't particularly want all the build bot reports about various kconfig
>>> combos failing.
>
> Hm these should not be tricky to that extent to cause any combinatorial=20
> issues. Famous last words? :)

Let's say you have some feature foobar that's required on platforms foo
and bar.

At the Makefile level a single option is simple:

i915-$(CONFIG_FOO) +=3D foo.o

But foobar.o that's needed by both CONFIG_FOO and CONFIG_BAR already
gets tedious:

ifneq ($(CONFIG_FOO)$(CONFIG_BAR),nn)
	i915-y +=3D foobar.o
endif

Similarly in code:

#if IS_ENABLED(CONFIG_FOO) || IS_ENABLED(CONFIG_BAR)

I think it's easy to mess up the combos when you add a lot of them. And
it'll look seriously ugly too, just with the two above! And kind of
defeats the purpose of "not having those ugly #ifdef I915" in the
driver. :/

>>> One other problem is that I can't think of a way to do this by using the
>>> kconfig CONFIG_FOO macros directly; you have to add separate variables
>>> because the same files are built for two drivers. You can't force the
>>> CONFIG_FOO macros to different settings for different drivers. So we'd
>>> get a lot of proxy macros too.
>>>
>>> I wonder if there's a name we could use instead of legacy to reasonably
>>> match what Xe needs to avoid adding tons of configs at once?
>>=20
>> considering TGL itself is also "xe" arch (not to be confused with xe,
>> the kernel module), maybe CONFIG_DRM_I915_PRE_XE?
>
> Makes sense as a name I think. But why is the tricky question? :) Why do=
=20
> Xe+ users deserve the privilege of being able to compile out the old=20
> cruft but users of old machines cannot compile out Xe+? In other words=20
> how to make the thing attractive for not just Xe (the driver).
>
> Mind you I am not really opposed, as long as it will be made in a=20
> flexible way. Just would like to explore the option of making it more=20
> widely useful.

Mmh, I just always thought there was no return on the investment. Too
few people need it to take on the burden?


BR,
Jani.

>
> Regards,
>
> Tvrtko

--=20
Jani Nikula, Intel Open Source Graphics Center
