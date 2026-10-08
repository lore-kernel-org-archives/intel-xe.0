Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245AECA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 14:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948810E896;
	Thu,  8 Oct 2026 14:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIMpWw7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BAE10E88F;
 Thu,  8 Oct 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791468009; x=1823004009;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dpcvLgDH2bZiOLi49qSlaYpVgU6/bBH7+vUEjWoi5sI=;
 b=jIMpWw7u4SnAVHGKXAvL+hue3lYGG2xQxY6wpVh64wfBwBvRM2FnFHUM
 Z+Oc5wWar1kbN1MrgSj1NdVMi93MFL1Mph4Lr3PPFJxX4LHIcRhgAav4U
 j3oTywfO2mswXrb9YO1bhnLNl2VcDMl8do/3r20x3+w8SdADYsq10I39P
 ud7FsG2tW/4P6k5lr72WAdLAt0yaMhZwoX2VkDA00AFZdSjjnjwk80N/w
 3oDaB2hX5bZIly1kAPT0r2rzeiH6ONeoEsvx9BP/3y8XxwxWXdaOelTrh
 cMwVArh6ztI8YLkQROu57UP0TPZmD9QoAOiweQaDK3FnBkamSvMBp8/aM A==;
X-CSE-ConnectionGUID: g3q/l36VTm66k7ccnpafbQ==
X-CSE-MsgGUID: ZRWU1qOsR1Kr8KWAzYvUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="139535"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="139535"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:00:09 -0700
X-CSE-ConnectionGUID: d001h0beRreqhF5vPK4thw==
X-CSE-MsgGUID: xgBWMz9uQhGCmBuAAx83JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1873819"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:00:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Imre
 Deak <imre.deak@intel.com>
Subject: Re: [CI] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
In-Reply-To: <aseIwWEv58T-wioc@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261008114735.2662427-1-jani.nikula@intel.com>
 <aseIwWEv58T-wioc@intel.com>
Date: Thu, 08 Oct 2026 17:00:04 +0300
Message-ID: <3cd8f3e26fb5e9d195d19dcafbd288fa6ca72f74@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 08 Oct 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Oct 08, 2026 at 02:47:35PM +0300, Jani Nikula wrote:
>> Try to unify the suspend paths and behaviour by moving the
>> intel_opregion_suspend() calls to
>> intel_display_driver_pm_suspend_late().
>>=20
>> This is a change in the suspend sequences. The idea behind adding this
>> to intel_display_driver_pm_suspend_late() is primarily based on not
>> having to pass the s2idle parameter to more functions than that.
>>=20
>> This also changes behaviour for i915 hibernation, going for PCI_D3cold
>> instead of PCI_D1 on hibernate.
>
> Pretty sure I pointed out before that this isn't true. PCI_D3cold is
> what the current code also does.

Right, you did, but I failed to address it. Sorry.

I have tried to track down what acpi_target_system_state() actually
returns during .freeze_late and .poweroff_late struct dev_pm_ops calls,
and it's far from obvious.

I don't think you can reliably say acpi_target_system_state() =3D=3D
ACPI_STATE_S4 on the paths that pass hibernation=3Dtrue.

Are we good to go with the patch or do you want some changes?


BR,
Jani.


>
> I suppose it *might* be the case if one does something like=20
> 'echo reboot > /sys/power/disk', but I've not actually checked
> what that sort of thing does to acpi_target_system_state()...
>
>> It's probably the correct thing to do
>> anyway, I don't think it should matter all that much, but fingers
>> crossed.
>>=20
>> Reviewed-by: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>>  drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
>>  3 files changed, 2 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drive=
rs/gpu/drm/i915/display/intel_display_driver.c
>> index 77009dca7d0d..abab457bce3a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct int=
el_display *display, bool s2
>>  	if (!HAS_DISPLAY(display))
>>  		return;
>>=20=20
>> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>> +
>>  	intel_display_power_suspend_late(display, s2idle);
>>  }
>>=20=20
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i=
915_driver.c
>> index 9e047c27a153..293099fe6639 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>>  {
>>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>>  	struct intel_display *display =3D dev_priv->display;
>> -	pci_power_t opregion_target_state;
>>=20=20
>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>=20=20
>> @@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>>=20=20
>>  	i9xx_display_sr_save(display);
>>=20=20
>> -	opregion_target_state =3D suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3c=
old;
>> -	intel_opregion_suspend(display, opregion_target_state);
>> -
>>  	dev_priv->suspend_count++;
>>=20=20
>>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/x=
e/display/xe_display.c
>> index aab416485e3e..7d19f3c42e0e 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -238,14 +238,11 @@ static bool suspend_to_idle(void)
>>  void xe_display_pm_suspend(struct xe_device *xe)
>>  {
>>  	struct intel_display *display =3D xe->display;
>> -	bool s2idle =3D suspend_to_idle();
>>=20=20
>>  	if (!xe->info.probe_display)
>>  		return;
>>=20=20
>>  	intel_display_driver_pm_suspend(display);
>> -
>> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>>  }
>>=20=20
>>  void xe_display_pm_suspend_late(struct xe_device *xe)
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
