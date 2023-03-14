Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFA2C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 19:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B3510E89A;
	Tue, 14 Mar 2023 19:17:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA84710E89A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678821449; x=1710357449;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=noFgMaD7qD2ItlvSwteFVvTRXwdODuixc7DxMTIhpIc=;
 b=LzjniMYSsDA6K56svFMBeHkkYfwSPRwLn8gjG0Sg1gkp0VT5VXZoeCu+
 Ul9CFXoQtJok0fNrUbEZasaN2NQ2M7/R2sPpOsKNcaTyhXiTDqMKsPoWp
 pIZRZL3jombJpeb3v0CLpZTeROBFtb0WlvJMze7Gb/Cq9un5x7MZ46Nk7
 4aUqk2jbWMoPGnBFVIyhJfZ7BpPCorCGH52Cdbxf75RUEi/BPuxMPfdAk
 7OwNc4a8tpXydHrb05igs+BfaBp8ImUefYFehY5M87HyN8vQ/tEBMylOJ
 4ilEyD8xrjbjWnr7/HDA0/FJfCmTBBvoNejeeWIm7EpZquPvJlizIdQ+2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339885430"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339885430"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 12:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709401974"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="709401974"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 12:17:23 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B312A580BF2;
 Tue, 14 Mar 2023 12:17:21 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:17:19 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20230314201648.6b823d17@maurocar-mobl2>
In-Reply-To: <93bb2619-348d-4061-ac7c-a5f4804fc8a8@linux.intel.com>
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
 <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
 <874jqn708f.fsf@intel.com>
 <20230314172237.424zwdox7mnod5s4@ldmartin-desk2.lan>
 <93bb2619-348d-4061-ac7c-a5f4804fc8a8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org,
 Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
Message-ID: <20230314191719.ABAvMBUs0x1TfOiF7SHX31qflyFChY3O7hIz-LZc-H0@z>

On Tue, 14 Mar 2023 18:27:33 +0000
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 14/03/2023 17:22, Lucas De Marchi wrote:
> > On Tue, Mar 14, 2023 at 06:42:56PM +0200, Jani Nikula wrote: =20
> >> On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>=20
> >> wrote: =20
> >>> On 14/03/2023 11:43, Jani Nikula wrote: =20
> >>>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote: =20
> >>>>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
> >>>>> support. This is primarily for the benefit of the drm/xe driver, and
> >>>>> legacy is defined in terms of the platforms drm/xe does not support,
> >>>>> i.e. anything before Tigerlake.
> >>>>>
> >>>>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intent=
ion
> >>>>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D=
1 in
> >>>>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Make=
file
> >>>>> does no such thing, regardless of the kconfig value.
> >>>>>
> >>>>> Initially, the knob does the bare minimum: drops the legacy platfor=
ms
> >>>>> from module PCI ID table (and the compiler in turn automagically dr=
ops
> >>>>> all the unreferenced device infos).
> >>>>>
> >>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> =20
> >>>>
> >>>> The discussion stalled a bit.
> >>>>
> >>>> Do we have consensus to start adding this to upstream i915? =20
> >>>
> >>> I always liked the idea of compiling out platform support so I could =
be
> >>> convinced. I view that as a "power user" use case - compiles their own
> >>> kernel for a targeted machine. It also translates to building smaller
> >>> images in production settings although that is kind of not interesting
> >>> with the storage amounts these days. So overall feels could be
> >>> justified. There is some benefit and could be done with minimal
> >>> maintenance cost.
> >>>
> >>> But to add a Kconfig calling something "legacy", by the definition of
> >>> what Xe will support feels maybe a bit premature. Sure it will become
> >>> super useful once Xe is in the tree, to allow exactly the same class
> >>> use-case as above, but until then it feels questionable under your own
> >>> criteria too. =20
> >>
> >> I don't disagree. Partially the idea with "legacy" was to be a bit
> >> vague, so we could tweak what it really means later.
> >> =20
> >>> If you could add a set of more generic options, which Xe could later =
tie
> >>> into that would work for me. For instance we have some more natural
> >>> cross-over points than Tigerlake. So if not per individual platform,
> >>> maybe for like ring buffer -> execlists -> GuC transitions. And naming
> >>> them without saying legacy for now, but use some descriptive names, a=
nd
> >>> listing platform code names in help text. "Select this to support
> >>> Broadwell, Skylake, etc..", "Select this to support Sandybridge..". O=
ut
> >>> of the tree Xe build can then just not use the corresponding defines =
in
> >>> its own build and it would achieve what you need? =20
> >>
> >> I kind of wanted to avoid adding a lot of config options, because I
> >> think they'll be difficult to maintain and get all the combos right. I
> >> don't particularly want all the build bot reports about various kconfig
> >> combos failing. =20
>=20
> Hm these should not be tricky to that extent to cause any combinatorial=20
> issues. Famous last words? :)
>=20
> >> One other problem is that I can't think of a way to do this by using t=
he
> >> kconfig CONFIG_FOO macros directly; you have to add separate variables
> >> because the same files are built for two drivers. You can't force the
> >> CONFIG_FOO macros to different settings for different drivers. So we'd
> >> get a lot of proxy macros too.
> >>
> >> I wonder if there's a name we could use instead of legacy to reasonably
> >> match what Xe needs to avoid adding tons of configs at once? =20
> >=20
> > considering TGL itself is also "xe" arch (not to be confused with xe,
> > the kernel module), maybe CONFIG_DRM_I915_PRE_XE? =20
>=20
> Makes sense as a name I think.

Agreed. This is a way better than LEGACY, but, this needs to be translated =
into
a Kconfig option like "enable support for pre-Tiger Lake integrated graphic=
s",
e. g. translating into something understandable for the customers.

> But why is the tricky question? :) Why do=20
> Xe+ users deserve the privilege of being able to compile out the old=20
> cruft but users of old machines cannot compile out Xe+? In other words=20
> how to make the thing attractive for not just Xe (the driver).

Yeah, for me, it makes a lot more sense to disable i915 support for
the platforms that Xe driver also support, e. g. we would need also
a CONFIG_DRM_I915_XE to allow disabling i915 support for GPUs=20
supported by Xe. When enabled, this can be used to let Xe-supported
PCI IDs to be probed by Xe driver, instead of i915.


Yet, it sounds a little bit premature to have this, at least while
not all GPU Xe models features supported by i915 driver for TGL+ are
implemented. So, maybe we need to describe this as experimental,
having a default to "N".

Regards,
Mauro
