Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF3BE7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7B10E2A9;
	Tue,  3 Oct 2023 14:40:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F910E2AD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696344027; x=1727880027;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ljx7Il/N5q9DqpiyiPflO4DNPd7MTYwHPHR84zysKTE=;
 b=X1BTOyHe85QdaSjWD4zbVIXBSicRBRaN9PKDOw0po7YAZOqercQUme8H
 gAdQunZaYe8T7eq4a1jUGhpIJ1D0w4Z2bj8yRJD1g540jdTurwHyl6lHO
 4fqICkmpUemWHfp2gJ3nvhxYGkfxPzqwCvdUKvArd1oylPF20YwCi7um/
 68oPMpgRjkmZqwUZ01LkTYqaMIeab+CEBEj36bmW+AVpAZVRNo83GTCrK
 DvyOANCplaA06gsxeUFXExQe4gTDKHejYTzpOZqGF4v3fG937m9kD7Y6Z
 X/uogfzI1AsVePUXZn4Utdp4N+jOcha5in3Un+uerq1x4omyHA3jYmHAD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449376635"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449376635"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754464351"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754464351"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:40:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <87ttr7g83k.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231003085839.2008415-1-jani.nikula@intel.com>
 <87ttr7g83k.fsf@intel.com>
Date: Tue, 03 Oct 2023 17:40:22 +0300
Message-ID: <87pm1vg46h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] fixup! drm/xe/display: Implement display
 support
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 03 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 03 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> We have an abstraction for "has display", and it's
>> HAS_DISPLAY(). Unfortunately, it requires access to
>> DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
>> although it's a bit meh.
>>
>> Looking at this makes me think there's a bunch of confusion in:
>>
>> - the pipe_mask or now HAS_DISPLAY() checks
>> - the global enable_display checks
>> - the xe->info.enable_display checks
>> - redefinition of INTEL_DISPLAY_ENABLED()
>>
>> I really don't understand this, but it all looks very suspicious. This
>> change leaves all that in place, unmodified.
>
> To elaborate, this statement in xe_pci.c conflates three different
> concepts into one, and it just does not work like this:
>
> 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> 				  enable_display &&
> 				  desc->has_display;
>
> CONFIG_DRM_XE_DISPLAY describes whether display support has been built
> into the driver. CONFIG_DRM_XE_DISPLAY=n is fine if there is no display
> hardware. Otherwise, the display hardware will be left in whatever state
> the BIOS/GOP left it, e.g. consuming a bunch of power which is not
> desirable. (Even with CONFIG_DRM_XE_DISPLAY=n we might want to include
> enough display code to probe and warn about this scenario.)
>
> enable_display is a module parameter apparently intended to disable
> display dynamically. Similar to the above, if CONFIG_DRM_XE_DISPLAY=y
> but enable_display==false, the display hardware will be left in whatever
> state the BIOS/GOP left it. In i915, the module parameter is
> i915.disable_display, and it does run a bunch of display code to take
> over the hardware, put it to sleep, and keep all connectors
> disconnected. If you have display hardware, this is the sensible thing
> to do.
>
> desc->has_display means that we've probed the hardware and found it's
> not there, and we shouldn't touch it.

I've sent a series superseeding this one, and addressing some of the
issues listed above [1].

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/124561/


>
>
> BR,
> Jani.
>
>
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_display.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 07898e0e175e..c783573585d7 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -15,6 +15,7 @@
>>  #include <drm/xe_drm.h>
>>  
>>  #include "soc/intel_dram.h"
>> +#include "i915_drv.h"
>>  #include "intel_acpi.h"
>>  #include "intel_audio.h"
>>  #include "intel_bw.h"
>> @@ -316,7 +317,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
>>  	struct drm_device *dev = &xe->drm;
>>  	struct intel_encoder *encoder;
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (HAS_DISPLAY(xe))
>>  		return;
>>  
>>  	drm_modeset_lock_all(dev);
>> @@ -346,7 +347,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>  	 * properly.
>>  	 */
>>  	intel_power_domains_disable(xe);
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (HAS_DISPLAY(xe))
>>  		drm_kms_helper_poll_disable(&xe->drm);
>>  
>>  	intel_display_driver_suspend(xe);
>> @@ -392,7 +393,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  
>>  	intel_dmc_resume(xe);
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (HAS_DISPLAY(xe))
>>  		drm_mode_config_reset(&xe->drm);
>>  
>>  	intel_display_driver_init_hw(xe);
>> @@ -403,7 +404,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  	intel_display_driver_resume(xe);
>>  
>>  	intel_hpd_poll_disable(xe);
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (HAS_DISPLAY(xe))
>>  		drm_kms_helper_poll_enable(&xe->drm);
>>  
>>  	intel_opregion_resume(xe);
>> @@ -424,7 +425,7 @@ void xe_display_probe(struct xe_device *xe)
>>  
>>  	intel_display_device_probe(xe);
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (HAS_DISPLAY(xe))
>>  		return;
>>  
>>  no_display:

-- 
Jani Nikula, Intel
