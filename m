Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6220C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 08:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751FD10E9FA;
	Wed, 17 Jul 2024 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTdHitM8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C2710E9FA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721205486; x=1752741486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TwarkgWmSwQFpC/OKPQyqiRcKeekQKeOM9FiV39Xe64=;
 b=iTdHitM8NxWavZTYowtwytSUGUm+nVoWibjJhO53jA3kItu+as8IkcX+
 vZy7aY+mnjgqcHA2GZPaIHm6tLMcf73wvR20SAnwttI5Ftg8p1O/wbQU4
 1x+s3w/oAAh7Z5q0zccF4THFVSib+oRWMxhMqUO75ugBSMaV5ZY3Df/Rm
 7eoIM1sIgGYHJtxjydlkjigoqBC2mWpWbKqxj6Jg5q8iaiwnk+Q9Dj61O
 GfM9xtOtWMcCdFRpYBXypEMtg3UEA7qHoa7qCNmSFTwJdGHGag2FHR4BL
 t6CrLbEjccs+JUZ03coEZeQDDCvbMlFDH9Vb72Uif86WkCtrFemJJgK/O Q==;
X-CSE-ConnectionGUID: uXaupq/1QAipaf23QxySHw==
X-CSE-MsgGUID: ZharUIlsS+eWTtABos+G4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18391713"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18391713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 01:38:06 -0700
X-CSE-ConnectionGUID: 0khLvwjiS9CAb825Okpi5w==
X-CSE-MsgGUID: 0F+Mi2x1TNaqi0DCTcMYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50223512"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2024 01:38:03 -0700
Received: from [10.246.36.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.36.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2382A12591;
 Wed, 17 Jul 2024 09:38:00 +0100 (IST)
Message-ID: <f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com>
Date: Wed, 17 Jul 2024 10:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: remove GuC reload in D3Hot path
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: anshuman.gupta@intel.com, daniele.ceraolospurio@intel.com,
 matthew.brost@intel.com, karthik.poosa@intel.com
References: <20240717055558.4169407-1-riana.tauro@intel.com>
 <20240717055558.4169407-3-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240717055558.4169407-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.07.2024 07:55, Riana Tauro wrote:
> Currently GuC is reloaded for both runtime resume and system resume.
> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> is not necessary.
> 
> Remove GuC reload from D3Hot path and only enable/disable CTB
> communication.
> 
> v2: rebase
> 
> v3: fix commit message
>     add kernel-doc for gt suspend and resume methods
>     fix comment
>     do not split register and enable calls of CT (Michal)
> 
> v4: fix commit message
>     fix comment (Karthik)
>     split patches
>     correct kernel-doc (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  | 33 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_gt.h  |  4 ++--
>  drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c  |  8 +++----
>  drivers/gpu/drm/xe/xe_uc.c  | 28 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h  |  2 ++
>  7 files changed, 111 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 85f974441d50..716d3b46e986 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
> -int xe_gt_suspend(struct xe_gt *gt)
> +/**
> + * xe_gt_suspend - GT suspend helper
> + * @gt: GT object
> + * @runtime: true if this is from runtime suspend
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "suspending\n");
> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = xe_uc_suspend(&gt->uc);
> +	if (runtime && !xe->d3cold.allowed)
> +		err = xe_uc_runtime_suspend(&gt->uc);
> +	else
> +		err = xe_uc_suspend(&gt->uc);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> -int xe_gt_resume(struct xe_gt *gt)
> +/**
> + * xe_gt_resume - GT resume helper
> + * @gt: GT object
> + * @runtime: true if called on runtime resume
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "resuming\n");
> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = do_gt_restart(gt);
> +	/* GuC is still alive at D3hot, no need to reload it */
> +	if (runtime && !xe->d3cold.allowed)
> +		xe_uc_runtime_resume(&gt->uc);
> +	else
> +		err = do_gt_restart(gt);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 1123fdfc4ebc..4c942e4716ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  void xe_gt_record_user_engines(struct xe_gt *gt);
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
> -int xe_gt_suspend(struct xe_gt *gt);
> -int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8131c290a4f4..f612507e15d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1114,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +/**
> + * xe_guc_runtime_suspend - GuC runtime suspend
> + * @guc: GuC object
> + *
> + * This function waits for any outstanding CTB to complete
> + * and disables CTB communication before entering
> + * D3Hot
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	/*
> +	 * Wait for any outstanding CTB to complete before tearing down
> +	 * communication with GuC.
> +	 */
> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
> +		return -ETIMEDOUT;

this seems to be using only 'ct' stuff, so maybe it should be part of
the 'ct' layer ?

> +
> +	/* Disable CTB */
> +	xe_guc_ct_disable(&guc->ct);

hmm, I guess today it only works since xe_guc_ct_disable() actually is
not disabling (unregistering) CTB within the GuC, since it was optimized
away knowing that GuC will be reset in the next step or already dead.

but for our runtime_suspend|resume maybe it would be beneficial to
un-register CTB and later re-register CTB, so we know we have semi-fresh
start

we only need to take care of resetting ctb.descriptor.status|head|tail
as during registration, GuC expects them to be zero

> +
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_runtime_resume - GuC runtime resume
> + * @guc: GuC object
> + *
> + * This function enables GuC CTB communication
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Power is not lost when in D3Hot state,
> +	 * hence it is not necessary to reload GuC
> +	 * everytime. Only enable interrupts and
> +	 * CTB communication during resume
> +	 */
> +	xe_guc_enable_communication(guc, false);
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index b49444297eb0..98d6d84a66c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>  int xe_guc_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);

as we are adding runtime_suspend|resume pair at the xe_guc layer, maybe
the same should be done for the xe_guc_ct layer, which would eliminate
this 'register_ctb' hack and/or need to expose internal ct state.

then we will have something like:

xe_guc_init
  xe_guc_ct_init	- alloc ct buffers

/xe_guc_enable
|  xe_guc_ct_enable	- register ctb in GuC
|
| /xe_guc_runtime_suspend
| |  xe_guc_ct_runtime_suspend	- wait, mark ct as disabled/unavailable
| |
| \xe_guc_runtime_resume
|    xe_guc_ct_runtime_resume	- mark ct as enabled/available
|
\xe_guc_disable
   xe_guc_ct_disable	- optionally un-register ctb from GuC

@Rodrigo, would that work ?

>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index de3b5df65e48..070d28d193c7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	xe_display_pm_suspend(xe, false);
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, false);
>  		if (err) {
>  			xe_display_pm_resume(xe, false);
>  			goto err;
> @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	xe_display_pm_resume(xe, false);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, false);
>  
>  	err = xe_bo_restore_user(xe);
>  	if (err)
> @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, true);
>  		if (err)
>  			goto out;
>  	}
> @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, true);
>  
>  	if (xe->d3cold.allowed) {
>  		xe_display_pm_resume(xe, true);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index eb9c1443c849..2f52e57bea12 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend - uC runtime suspend
> + * @uc: uC object
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume - uC runtime resume
> + * @uc: uC object
> + *
> + * Called while resuming from D3Hot
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_remove() - Clean up the UC structures before driver removal
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 11856f24e6f9..dd483ea43b9b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>  int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_runtime_suspend(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
