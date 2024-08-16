Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C647C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308610E5D7;
	Fri, 16 Aug 2024 08:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEMjyMKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE8110E5D7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723796948; x=1755332948;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rRMSUUz2nezAY18qOcYUKEVbmzqvcr5OtgQlLibowZA=;
 b=EEMjyMKidhF7x7D+viSdIAAdxHe0oQy2cE722WcPGss2D6G2Upe6be3R
 Mf7MZ8TkXhQRR+f40Z9ZLWPq+MSKJmUTHlyaKK/F+MM/MO7+SuVWDrbHz
 9y0QB/KzJHny4gFJ3meSe/G56DdfX2el2sGLKQBVvDTQTWEH8UnyUL4X+
 5E9hAGo4o2TAGpyvCMHPH0pbe7zb/FzNDIMWNzKTxSyFN0M8GjweNMU9c
 cLQYmQU7FC33VZUmB80Mx54xIUmMPDpYU2lBX74IvEATf9Zmlh9GgMSb/
 KJc9Uwxh4L7aQSWb08FzgM7BPMw7/o82PwxJB7cJUsPNwHpXnmyn7urT1 A==;
X-CSE-ConnectionGUID: +231RUYnQ4qAOlmcZv+DTw==
X-CSE-MsgGUID: QZsE1qufRpKjVPAvMHw21w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33474057"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="33474057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:29:07 -0700
X-CSE-ConnectionGUID: ASQ9WnObSCSHHdNL1Y3f1g==
X-CSE-MsgGUID: KmABByEJRd6z892DFt95OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64018042"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:29:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, imre.deak@intel.com,
 arun.r.murthy@intel.com
Subject: Re: [PATCH] drm/xe/display: handle HPD polling in display runtime
 suspend/resume
In-Reply-To: <Zr5IiefJuIR9tpzo@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240815172500.78479-1-vinod.govindapillai@intel.com>
 <Zr5IiefJuIR9tpzo@intel.com>
Date: Fri, 16 Aug 2024 11:28:59 +0300
Message-ID: <87o75s7tx0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 15 Aug 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Aug 15, 2024 at 08:25:00PM +0300, Vinod Govindapillai wrote:
>> In XE, display runtime suspend / resume routines are called only
>> if d3cold is allowed. This makes the driver unable to detect any
>> HPDs once the device goes into runtime suspend state in platforms
>> like LNL. Update the display runtime suspend / resume routines
>> to include HPD polling regardless of d3cold status.
>> 
>> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pm.c              |  5 +++--
>>  2 files changed, 23 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 982b9c5b440f..0cddf55351c8 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -294,6 +294,9 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>  	if (!xe->info.probe_display)
>>  		return;
>>  
>> +	if (!xe->d3cold.allowed)
>> +		goto enable_hpd_poll;
>> +
>>  	/*
>>  	 * We do a lot of poking in a lot of registers, make sure they work
>>  	 * properly.
>> @@ -308,6 +311,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>  	intel_dp_mst_suspend(xe);
>>  
>>  	intel_hpd_cancel_work(xe);
>> +	if (runtime)
>> +		intel_hpd_poll_enable(xe);
>
> If we need to do this, please do not use this function.
>
> Let's first spin out the runtime function to a separate function and then
> add the hpd poll only there. But also I don't believe we need anything
> of this call in d3hot case anyway. So we need a better refactor with
> minimal change.

Well, I'll keep preaching: We need to move all of this to the shared
display code, and axe it out of xe and i915 cores.

Maybe it doesn't belong in the bugfix at hand, but we need to do it
sooner rather than later.

BR,
Jani.



>
>>  
>>  	intel_encoder_suspend_all(&xe->display);
>>  
>> @@ -316,6 +321,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>>  
>>  	intel_dmc_suspend(xe);
>> +
>> +	return;
>
> with return here your code below is not executed.
>
>> +
>> +enable_hpd_poll:
>> +	if (runtime)
>> +		intel_hpd_poll_enable(xe);
>>  }
>>  
>>  void xe_display_pm_suspend_late(struct xe_device *xe)
>> @@ -346,6 +357,9 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>>  	if (!xe->info.probe_display)
>>  		return;
>>  
>> +	if (!xe->d3cold.allowed)
>> +		goto disable_hpd_poll;
>> +
>>  	intel_dmc_resume(xe);
>>  
>>  	if (has_display(xe))
>> @@ -368,6 +382,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>>  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>>  
>>  	intel_power_domains_enable(xe);
>> +
>> +	return;
>
> another bogus place:
>
>> +
>> +disable_hpd_poll:
>> +	intel_hpd_init(xe);
>> +	intel_hpd_poll_disable(xe);
>>  }
>>  
>>  static void display_device_remove(struct drm_device *dev, void *arg)
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9f3c14fd9f33..2abfe70d2697 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -370,8 +370,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>  		err = xe_bo_evict_all(xe);
>>  		if (err)
>>  			goto out;
>> -		xe_display_pm_suspend(xe, true);
>>  	}
>> +	xe_display_pm_suspend(xe, true);
>
> ... please, let's not add extra unecessary calls to the d3hot path.
> If hpd_poll is the only missing thing we need to create a function
> only for that.
>
>>  
>>  	for_each_gt(gt, xe, id) {
>>  		err = xe_gt_suspend(gt);
>> @@ -431,11 +431,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>  		xe_gt_resume(gt);
>>  
>>  	if (xe->d3cold.allowed) {
>> -		xe_display_pm_resume(xe, true);
>>  		err = xe_bo_restore_user(xe);
>>  		if (err)
>>  			goto out;
>>  	}
>> +	xe_display_pm_resume(xe, true);
>> +
>>  out:
>>  	lock_map_release(&xe_pm_runtime_lockdep_map);
>>  	xe_pm_write_callback_task(xe, NULL);
>> -- 
>> 2.34.1
>> 

-- 
Jani Nikula, Intel
