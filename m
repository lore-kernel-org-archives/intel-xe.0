Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC3FCD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 12:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0907010E7A4;
	Wed,  4 Sep 2024 12:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeZ0wJ99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEC410E7A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725454191; x=1756990191;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sw9lSCEBAURvk86tbniI7XCCrxIqLChbHf+KlbJfN1g=;
 b=OeZ0wJ996X/J4OM8kZGJ8A918Oq9S05dEGWAEdF5lI59w7jwu3DCaF+4
 rtJR823DCawUygniHnxGrV3WKImFuLRr0IFvZxdWw1JkndOQ+aH6ossl9
 47XYfHZjDRbrbImdPbr23o92++ci2s12OGz76P3lNPl97xuZc8PRvXOz0
 4j60AhLogtvwWx/GqeyWz0ljgIr043hdqU7hm2ATuwpvgsE79EETq/o0m
 oY2K9Oyn4EqJBJu0KixKnKfwNcpoJ1c2ABEj+nv8ELVb9Op+s3x5F0cSE
 PinBDvRv03RcWnn//sOL32rHSQoroBromsyS7zyw46B3qBrhisEYkJPVe g==;
X-CSE-ConnectionGUID: qH3Gjqk3TcW7onyULFwk4w==
X-CSE-MsgGUID: WE5tgfZbTQCV46dDbY+buw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23674591"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23674591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:49:51 -0700
X-CSE-ConnectionGUID: TwMCH6dGT72+lS/WOAu87g==
X-CSE-MsgGUID: tjmotWGKQIKa8vFxjGsHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65783099"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:49:50 -0700
Message-ID: <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
Date: Wed, 4 Sep 2024 13:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240903223822.380841-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/09/2024 23:38, Rodrigo Vivi wrote:
> This message was very useful to ensure that Xe was taking all
> the needed outer runtime pm references. However, at this point
> it is only a false positive. So, remove it.
> 
> False positive cases:
> 
> 1:
> [184.983389] xe ...: [drm] Missing outer runtime PM protection
> [snip]
> [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
> [snip]
> [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
> 
> In this case the underflow is the problem since we are sure that
> the ioctl is protected. But something else is abusing the 'put'
> calls.
> 
> 2:
> rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
> console:              xe_bo_evict_all (called from suspend)
> xe_sched_job_create:  dev=0000:03:00.0, ...
> xe_sched_job_exec:    dev=0000:03:00.0, ...
> xe_pm_runtime_put:    dev=0000:03:00.0, ...
> xe_sched_job_run:     dev=0000:03:00.0, ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> console:              xe 0000:03:00.0: [drm] Missing outer runtime
> 		      	 	       	     	     PM protection
> console:               xe_guc_ct_send+0x15/0x50 [xe]
> console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> [snip]
> console:               drm_sched_run_job_work+0x649/0xc20
> 
> At this point, BOs are getting evicted from VRAM with rpm
> usage-counter = 2, but rpm status = SUSPENDING.
> The xe->pm_callback_task won't be equal 'current' because this call is
> coming from a work queue.
> 
> So, pm_runtime_get_if_active() will be called and return 0 because rpm
> status != ACTIVE (but equal SUSPENDING).
> 
> The only way out is to just grab the reference and move on.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index da68cd689a96..e1a5e43b0f34 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>    * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
>    * @xe: xe device instance
>    *
> - * This function should be used in inner places where it is surely already
> + * This function should *only* be used in inner places where it is surely already
>    * protected by outer-bound callers of `xe_pm_runtime_get`.
> - * It will warn if not protected.
>    * The reference should be put back after this function regardless, since it
>    * will always bump the usage counter, regardless.
>    */
>   void xe_pm_runtime_get_noresume(struct xe_device *xe)
>   {
> -	bool ref;
> -
> -	ref = xe_pm_runtime_get_if_in_use(xe);
> -
> -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> -		pm_runtime_get_noresume(xe->drm.dev);

This has proven to find real bugs in the past, right? If so, it seems 
unfortunate to drop this completely? What about making it slightly more 
fuzzy with something like:

drm_WARN(!pm_read_callback_task() && !pm_runtime_active(), ...

That should avoid the false positive, at the cost of not finding some 
real bugs, but at least gives us something?

> +	pm_runtime_get_noresume(xe->drm.dev);
>   }
>   
>   /**
