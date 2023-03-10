Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E7EC6FD19
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 10:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936DB10E9C7;
	Fri, 10 Mar 2023 10:11:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F76D10E9C7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678443093; x=1709979093;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0QcB/NoAbfVhud7dbf36ZlvWtR9fvsl9X+B1Rrm+AJA=;
 b=FBJWcTGROLk4LcClQqJzFmo4xtxsCaUZUhH+UjVUtR9et0tHKB8WhEVz
 QGfmqMDeNom5RKvm7s8XatbpQIDi7lXH3xcKIqvawmI5Ak062wt16MJXT
 AwUh09T0McNDV05bT1mY7WTqrAYJ6e5RZaQ0LcQisKAthVQcxYWfW1yDd
 k4PaVP9puISuj5Y97qJHVbCcuDsfaRppyEtl4ZVcfBEcLExOJFl047Si0
 g3zJvWId8dqe2kdPzyl/Tx+AFGFcvb4VzeCB1SmrzcVGP9TP7RSoqGQXG
 QtRyP9r5CBMdAW0uf4GJN0FDXVTVkEn++H6QGlz0NLcpgfEBgraFdH54G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364350699"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="364350699"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 02:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851856286"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="851856286"
Received: from klausuhl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 02:11:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <eec81b09-8add-a080-710b-8226bba6c470@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <eec81b09-8add-a080-710b-8226bba6c470@linux.intel.com>
Date: Fri, 10 Mar 2023 12:11:26 +0200
Message-ID: <87ttys9ar5.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 09/03/2023 19:19, Jani Nikula wrote:
>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>> support. This is primarily for the benefit of the drm/xe driver, and
>> legacy is defined in terms of the platforms drm/xe does not support,
>> i.e. anything before Tigerlake.
>>=20
>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D1 in
>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makefile
>> does no such thing, regardless of the kconfig value.
>>=20
>> Initially, the knob does the bare minimum: drops the legacy platforms
>> from module PCI ID table (and the compiler in turn automagically drops
>> all the unreferenced device infos).
>>=20
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> *** NOTE ***
>>=20
>> For now, I'm only sending this to the intel-xe mailing list with a bunch
>> of Cc's for first impressions.
>>=20
>> The xe driver reuses i915 display code, but there's a lot of unnecessary
>> and/or incompatible code for platforms xe does not support. Currently
>> this is handled with a bunch of #ifdef I915 added to i915 in the xe
>> branch that isn't really upstreamble, and I'm thinking this patch might
>> be a better option.
>>=20
>> This patch alone does what the commit message says, and drops the legacy
>> platform support, although all the code is left in place. Everything
>> beyond this is basically an optimization of what more to drop out of the
>> build. It doesn't really need to be perfect for starters but we could
>> start converting the legacy platform related #ifdefs from I915 to
>> I915_LEGACY, and that could be upstreamable to i915.
>>=20
>> Not all of the #ifdef I915 in the xe branch are related to legacy
>> platforms, and they need to be handled differently. But this kconfig
>> knob would hopefully be a future compatible start to clean up one aspect
>> of them.
>>=20
>> Thoughts?
>
> Two questions for now:
>
> 1)
> This does not still end up a sprinkling of #ifdefs in i915, just=20
> I915_LEGACY instead of I915? I mean I don't immediately follow how this=20
> leads to a more upstreamable solution?

In general, I find it difficult to accept any solutions upstream that
cater only for out-of-tree code. Xe *alone* is not a good justification
for making changes upstream. Everything that I've done in terms of
refactoring stand on their own merits, but they *also* help Xe.

The current #ifdef I915 in the Xe branch are conflated between dropping
some legacy platform support as well as for using different interfaces
for gem, etc. Some of it might be okay when Xe is merged upstream, and
the justification is upstream. But not now.

I'm arguing a way to build a trimmed down version of i915 with legacy
platform support dropped is somewhat useful in itself. Something that
I'm hoping we could take in upstream i915 much before Xe is
upstream. And it would also help Xe by letting us remove a lot of
out-of-tree #ifdef I915. Not everything, but a lot.

> 2)
> Why is the user visible kconfig option needed?

To me, it's part of the justification, a feature we could have
upstream. I don't think I'm willing to accept #ifdefs for something that
can only be enabled in Makefiles. And we'll get build testing from bots
even if we don't actively do it ourselves.

>
> Regards,
>
> Tvrtko
>
> P.S. You could add compiling out code easily along the lines of=20
> https://patchwork.freedesktop.org/patch/428511/?series=3D89069&rev=3D1 an=
d=20
> the corresponding series. Maybe like=20
> s/IS_OPT_PLATFORM/IS_LEGACY_PLATTFORM. That does not work as well as=20
> when GEN checks could also be bitmasks, but I suppose it should have=20
> some effect still.

Yes, something like that would be the next steps. For now, I'm gauging
the approval for the approach, and depending on that we could take this
further.

Btw the compiler just throws out intel_i830_info etc. if it's not
referenced, so we don't have to add so much #ifdefs. And in any case I'm
looking at this more from an opportunistic angle: compile out anything
that's easy to rip out, and stuff that's needed to be removed for xe,
but don't even try to be 100% complete. For the most part, we don't even
need to add #ifdefs outside of display/ if we don't want.

BR,
Jani.


>
>>=20
>> BR,
>> Jani.
>> ---
>>   drivers/gpu/drm/i915/Kconfig    | 11 +++++++++++
>>   drivers/gpu/drm/i915/Makefile   |  7 +++++++
>>   drivers/gpu/drm/i915/i915_pci.c |  2 ++
>>   3 files changed, 20 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>> index 8eb3e60aeec9..a569c1606f51 100644
>> --- a/drivers/gpu/drm/i915/Kconfig
>> +++ b/drivers/gpu/drm/i915/Kconfig
>> @@ -53,6 +53,17 @@ config DRM_I915
>>=20=20=20
>>   	  If "M" is selected, the module will be called i915.
>>=20=20=20
>> +config DRM_I915_LEGACY
>> +	bool "Support legacy hardware in i915"
>> +	depends on DRM_I915
>> +	depends on EXPERT
>> +	default y
>> +	help
>> +	  Disable this option if you want the i915 driver to only support mode=
rn
>> +	  Intel Graphics, starting from Tigerlake.
>> +
>> +	  If in doubt, say "Y".
>> +
>>   config DRM_I915_FORCE_PROBE
>>   	string "Force probe i915 for selected Intel hardware IDs"
>>   	depends on DRM_I915
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefi=
le
>> index a6e7cd2185c2..653d43e5b534 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -23,6 +23,13 @@ subdir-ccflags-y +=3D $(call cc-disable-warning, unus=
ed-but-set-variable)
>>   subdir-ccflags-y +=3D $(call cc-disable-warning, frame-address)
>>   subdir-ccflags-$(CONFIG_DRM_I915_WERROR) +=3D -Werror
>>=20=20=20
>> +# Legacy platform support.
>> +#
>> +# Note: Source code needs to check for I915_LEGACY instead of
>> +# CONFIG_DRM_I915_LEGACY to allow Xe driver build without legacy support
>> +# independent of the Kconfig setting.
>> +subdir-ccflags-$(CONFIG_DRM_I915_LEGACY) +=3D -DI915_LEGACY=3D1
>> +
>>   # Fine grained warnings disable
>>   CFLAGS_i915_pci.o =3D $(call cc-disable-warning, override-init)
>>   CFLAGS_display/intel_fbdev.o =3D $(call cc-disable-warning, override-i=
nit)
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915=
_pci.c
>> index bc6fc268739d..9f421015d2bb 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -1162,6 +1162,7 @@ static const struct intel_device_info mtl_info =3D=
 {
>>    * PCI ID matches, otherwise we'll use the wrong info struct above.
>>    */
>>   static const struct pci_device_id pciidlist[] =3D {
>> +#if IS_ENABLED(I915_LEGACY)
>>   	INTEL_I830_IDS(&i830_info),
>>   	INTEL_I845G_IDS(&i845g_info),
>>   	INTEL_I85X_IDS(&i85x_info),
>> @@ -1225,6 +1226,7 @@ static const struct pci_device_id pciidlist[] =3D {
>>   	INTEL_ICL_11_IDS(&icl_info),
>>   	INTEL_EHL_IDS(&ehl_info),
>>   	INTEL_JSL_IDS(&jsl_info),
>> +#endif
>>   	INTEL_TGL_12_IDS(&tgl_info),
>>   	INTEL_RKL_IDS(&rkl_info),
>>   	INTEL_ADLS_IDS(&adl_s_info),

--=20
Jani Nikula, Intel Open Source Graphics Center
