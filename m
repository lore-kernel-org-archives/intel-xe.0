Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E6AE7C4C1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35D410E386;
	Wed,  4 Oct 2023 14:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A241510E136
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696429562; x=1727965562;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OaxovlaV2Neal/i0aaqc5At1e1dKlYi1BrVa5XSOjhM=;
 b=A4ZtuwaVk2aj3Y9gPqfdAQE4qW88jFsHKkfV5H2ICs1omCRMzGsxDzZ8
 ymDuF1Z0A8/t640SXuHLZtr4mD+dSWC6IX9Ffnj6090SUSDemXDHszP+N
 LNHVgsLaDJzZe37+AmVgjcdbWdAHluzwgapitDelUZ0dAPWoAdWoU8Gn6
 LUtZ6JF9IJkjoj/P3IDfI4BdfennE51Pl+CZ25faWS7gJehGb9lRQoqcM
 S2Ejg7tHmM/ffZuLb7QSsndNjKeGDcDVBEh4UnnXJQ+MKM/MPUtiQSRd0
 QKJVKSlhT3Tn81vakEymbsAwnF+7lKRGlqh+2PZuHGoEKL9ccXJ6XTc+Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386004892"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="386004892"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867404502"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="867404502"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:25:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZR1wY+2IKMC6r75M@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696343521.git.jani.nikula@intel.com>
 <70a0652ffedbfa33e36b0b2eea4a0aad5bc378da.1696343521.git.jani.nikula@intel.com>
 <ZR1wY+2IKMC6r75M@intel.com>
Date: Wed, 04 Oct 2023 17:25:57 +0300
Message-ID: <87r0maea6i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 01/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 04 Oct 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Oct 03, 2023 at 05:34:48PM +0300, Jani Nikula wrote:
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
>> 
>> v2: define local has_display() to make this a bit cleaner
>> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_display.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 07898e0e175e..68729997e1fe 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -15,6 +15,7 @@
>>  #include <drm/xe_drm.h>
>>  
>>  #include "soc/intel_dram.h"
>> +#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
>
> should we then add a FIXME tag to the commit subject as well?
> just to ensure we don't miss this here?

Oh, forgot to reply to this part:

It's a fixup to "drm/xe/display: Implement display support" so that
would be massive. ;)

In any case, I think this should go away with upstream commit
5e72e75d30fc ("drm/i915: move display info related macros to display").

BR,
Jani.


>
>>  #include "intel_acpi.h"
>>  #include "intel_audio.h"
>>  #include "intel_bw.h"
>> @@ -32,6 +33,11 @@
>>  
>>  /* Xe device functions */
>>  
>> +static bool has_display(struct xe_device *xe)
>> +{
>> +	return HAS_DISPLAY(xe);
>> +}
>> +
>>  /**
>>   * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
>>   *				   early on
>> @@ -316,7 +322,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
>>  	struct drm_device *dev = &xe->drm;
>>  	struct intel_encoder *encoder;
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (has_display(xe))
>>  		return;
>>  
>>  	drm_modeset_lock_all(dev);
>> @@ -346,7 +352,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>  	 * properly.
>>  	 */
>>  	intel_power_domains_disable(xe);
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (has_display(xe))
>>  		drm_kms_helper_poll_disable(&xe->drm);
>>  
>>  	intel_display_driver_suspend(xe);
>> @@ -392,7 +398,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  
>>  	intel_dmc_resume(xe);
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (has_display(xe))
>>  		drm_mode_config_reset(&xe->drm);
>>  
>>  	intel_display_driver_init_hw(xe);
>> @@ -403,7 +409,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  	intel_display_driver_resume(xe);
>>  
>>  	intel_hpd_poll_disable(xe);
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (has_display(xe))
>>  		drm_kms_helper_poll_enable(&xe->drm);
>>  
>>  	intel_opregion_resume(xe);
>> @@ -424,7 +430,7 @@ void xe_display_probe(struct xe_device *xe)
>>  
>>  	intel_display_device_probe(xe);
>>  
>> -	if (xe->info.display_runtime.pipe_mask)
>> +	if (has_display(xe))
>
> my first reaction to this probe function when I bump into it during
> rebase is that it should be simply refactor to something like
>
>
> xe_display_probe()
> {
> 	if(!xe->info.enable_display)
> 		return;
>
> 	intel_display_device_probe(xe);
> }
>
> but then I put the pipe_mask check and the goto back to avoid
> disruption, but without clearly understanding on why we have
> that to start with.
>
> My thoughts was on maybe it was a redundant check to see if
> display init setup went well, but now I see it was more about
> has_display...
>
> But now I wonder if we cannot simply use the HAS_DISPLAY()
> directly in the first line of this function and avoid everything
> else?
>
>>  		return;
>>  
>>  no_display:
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
