Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A46C64EC4
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 13:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443F10E21D;
	Fri, 10 Mar 2023 13:36:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6E910E2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678455371; x=1709991371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=W81N9wL3tx2l6Prm1U19IG9s7cVIdKi/pZJg2oMXRsQ=;
 b=JMkEMVPZUlOsXgrRWvZfFNhEavTVMLGLtlOMHInvIiTBnSd/V3qKMqLm
 TxyMUCwCmkyBPxQKsYnAsdtg31k8zow2+5OdJvgHS+pD606+xycpfMytl
 mk0ZTGU1Ay/YbJ+Hwkt273MTzGsvbJsj8UC2/1ymsNMiBY2tPWtmqB38q
 zX+OhVtYTtU7TMv+CB8QsUVgcu7uNtghSiFlDDWN4LhUzBvEiDfIcrgaU
 GzG+YXsMRixGkOgK42LimXiSBMgQ2ygWYU7RojXJOAy6kESK8nTuBQno+
 hevFAVlsxNRahs3ghpwDjOX8chRwuLZDh4vt1uzfAn7Bi7DLNO1/9v+Ea A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="325077949"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="325077949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677812200"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="677812200"
Received: from klausuhl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.190])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:36:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
In-Reply-To: <ZAstS5b+9ea3y0RY@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <eec81b09-8add-a080-710b-8226bba6c470@linux.intel.com>
 <87ttys9ar5.fsf@intel.com> <ZAstS5b+9ea3y0RY@intel.com>
Date: Fri, 10 Mar 2023 15:36:05 +0200
Message-ID: <87edpw91a2.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Mar 10, 2023 at 12:11:26PM +0200, Jani Nikula wrote:
>> On Fri, 10 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wro=
te:
>> > On 09/03/2023 19:19, Jani Nikula wrote:
>> >> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>> >> support. This is primarily for the benefit of the drm/xe driver, and
>> >> legacy is defined in terms of the platforms drm/xe does not support,
>> >> i.e. anything before Tigerlake.
>> >>=20
>> >> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>> >> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D1 =
in
>> >> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makefi=
le
>> >> does no such thing, regardless of the kconfig value.
>> >>=20
>> >> Initially, the knob does the bare minimum: drops the legacy platforms
>> >> from module PCI ID table (and the compiler in turn automagically drops
>> >> all the unreferenced device infos).
>> >>=20
>> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >>=20
>> >> ---
>> >>=20
>> >> *** NOTE ***
>> >>=20
>> >> For now, I'm only sending this to the intel-xe mailing list with a bu=
nch
>> >> of Cc's for first impressions.
>> >>=20
>> >> The xe driver reuses i915 display code, but there's a lot of unnecess=
ary
>> >> and/or incompatible code for platforms xe does not support. Currently
>> >> this is handled with a bunch of #ifdef I915 added to i915 in the xe
>> >> branch that isn't really upstreamble, and I'm thinking this patch mig=
ht
>> >> be a better option.
>> >>=20
>> >> This patch alone does what the commit message says, and drops the leg=
acy
>> >> platform support, although all the code is left in place. Everything
>> >> beyond this is basically an optimization of what more to drop out of =
the
>> >> build. It doesn't really need to be perfect for starters but we could
>> >> start converting the legacy platform related #ifdefs from I915 to
>> >> I915_LEGACY, and that could be upstreamable to i915.
>> >>=20
>> >> Not all of the #ifdef I915 in the xe branch are related to legacy
>> >> platforms, and they need to be handled differently. But this kconfig
>> >> knob would hopefully be a future compatible start to clean up one asp=
ect
>> >> of them.
>> >>=20
>> >> Thoughts?
>> >
>> > Two questions for now:
>> >
>> > 1)
>> > This does not still end up a sprinkling of #ifdefs in i915, just=20
>> > I915_LEGACY instead of I915? I mean I don't immediately follow how thi=
s=20
>> > leads to a more upstreamable solution?
>>=20
>> In general, I find it difficult to accept any solutions upstream that
>> cater only for out-of-tree code. Xe *alone* is not a good justification
>> for making changes upstream. Everything that I've done in terms of
>> refactoring stand on their own merits, but they *also* help Xe.
>>=20
>> The current #ifdef I915 in the Xe branch are conflated between dropping
>> some legacy platform support as well as for using different interfaces
>> for gem, etc. Some of it might be okay when Xe is merged upstream, and
>> the justification is upstream. But not now.
>>=20
>> I'm arguing a way to build a trimmed down version of i915 with legacy
>> platform support dropped is somewhat useful in itself. Something that
>> I'm hoping we could take in upstream i915 much before Xe is
>> upstream. And it would also help Xe by letting us remove a lot of
>> out-of-tree #ifdef I915. Not everything, but a lot.
>
> I was worried about exposing this and some crazy distros turning
> it off thinking those "legacy" platforms aren't actually relevant
> at all. But I guess the EXPERT dependency should deter that
> somewhat.
>
> What is the plan for building i915+xe at the same time btw? Would
> we always have to disable the new platforms in i915 or can we build
> support for the same platform into both drivers? I think having
> both drivers available without rebuilding could be helpful in
> debugging. But I don't know how the modprobe et al would deal
> with that.

In general, we build the same display source files to two sets of object
files, in i915 and xe, with different build flags. IOW, in the same
kernel build, the display files get built twice, once for i915, once for
xe, provided both are enabled in kconfig. They become two completely
independent binary .ko.

As to the legacy, with this patch, i915 Makefile would pass
-DI915_LEGACY=3D1 for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makefile
would do no such thing.

As to probing, both have the module device tables for the PCI IDs they
support, and you need to play with the force_probe parameter in both to
force/block probing. Maybe modprobe blacklisting could also be used to
choose the driver for the devices supported by both drivers.

I know it's a bit of a Makefile hack to build the files for two
different drivers, but it avoids a lot of up front infrastructure that
would be difficult to coordinate as long as xe is out-of-tree.


BR,
Jani.



--=20
Jani Nikula, Intel Open Source Graphics Center
