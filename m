Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AF8C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 08:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965F310E3A6;
	Mon, 24 Jun 2024 08:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkuUC+QW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7110E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719216659; x=1750752659;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W9vcVtWjCOuVqSvwgG6FYXstUi/1A4WeKPhOwbxYnvM=;
 b=bkuUC+QW6rAZSX9pNJ9oZfMs/Rxa1iu/iJx2eqbpH2Gb0qB4cmpUO9bs
 DBl2w1KEgr9dtp/SyYr1qR2f89e7fhio7lgFFLDWMM5kmO2tAGM9oa85q
 lWeRRg3++7jzEJJRx/rJ/hpUUa1XG9fP/CIMiqt6mIBtND5F3KOMza45O
 fXeeH8r6N/DEKyDSy0yax6pPq50hGFxhiJUPEHchJYzIpt1Sec7xDmjhB
 nLB2kA3zWsVNDwiwUnluf48o1CQfTBn7AW6OBclEEMbCcGScsWFLWOnfc
 tUK6FYwnPNQK5YTyARptCE2+AUJ0Ddwfan9ZGrL6Z/xMU5PIuO1Ra1ZT7 A==;
X-CSE-ConnectionGUID: rGNpxzWOTRyye/P28JKkOA==
X-CSE-MsgGUID: kx++sOyJQSSw2C9sdXeFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="12207954"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="12207954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 01:10:58 -0700
X-CSE-ConnectionGUID: m4OI0divTjS227brgajO5w==
X-CSE-MsgGUID: olD1iwBvTV+cBoILSHrYig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43117603"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 24 Jun 2024 01:10:52 -0700
Received: from [10.246.19.248] (unknown [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B98A4125A0;
 Mon, 24 Jun 2024 09:10:49 +0100 (IST)
Message-ID: <25eccae7-3bfe-40c7-b400-738ab77c47ca@intel.com>
Date: Mon, 24 Jun 2024 10:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: remove GuC reload in D3Hot path
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240624072754.2231533-1-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240624072754.2231533-1-riana.tauro@intel.com>
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

Hi Riana,


On 24.06.2024 09:27, Riana Tauro wrote:
> Currently GuC is reloaded for both runtime suspend
> and system suspend. For D3hot <-> D0 transitions
> no power is lost on suspend and GuC reload is not
> necessary.

quite aggressive line wrap at ~50, try wrap a ~72
(only commit titles should be around ~50)

> 
> remove GuC reload from D3Hot path and only enable/disable
> CTB communications

"Remove .... communication."

> 
> v2: rebase
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 19 ++++++++++---
>  drivers/gpu/drm/xe/xe_gt.h     |  4 +--
>  drivers/gpu/drm/xe/xe_guc.c    | 52 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 +-
>  drivers/gpu/drm/xe/xe_pm.c     |  8 +++---
>  drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 136 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 759634cff1d8..5b48e4db9776 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -776,8 +776,9 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
> -int xe_gt_suspend(struct xe_gt *gt)
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)

as you are changing function signature, please add full kernel-doc for
this public function

>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "suspending\n");
> @@ -787,7 +788,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = xe_uc_suspend(&gt->uc);
> +	if (runtime && !xe->d3cold.allowed)

nit: maybe instead of just looking at some internal flag, it would be
better to define helpers:

static inline bool xe_device_d3cold_allowed(xe) { .. }
static inline bool xe_device_d3hot_allowed(xe) { .. }

> +		err = xe_uc_runtime_suspend(&gt->uc);
> +	else
> +		err = xe_uc_suspend(&gt->uc);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> @@ -825,8 +830,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> -int xe_gt_resume(struct xe_gt *gt)
> +int xe_gt_resume(struct xe_gt *gt, bool runtime)

add kernel-doc

>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "resuming\n");
> @@ -834,7 +840,12 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = do_gt_restart(gt);
> +	/* Do not reload GuC at runtime resume from D3Hot to D0 */

maybe better to explain "why" than "what":

/* GuC is still alive at D3hot, no need to reload it */

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
> index 172b65a50e31..1ea1d00f93f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -870,7 +870,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	err = xe_guc_ct_register(&guc->ct);
>  	if (err)
>  		return err;
>  
> @@ -1101,6 +1101,56 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +/**
> + * xe_guc_runtime_suspend - GuC runtime suspend
> + * @guc: GuC object
> + *
> + * This function waits for any outstanding CTB
> + * and disables CTB communication before entering
> + * D3Hot
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	/*
> +	 * Wait for any outstanding CTB before tearing down communication
> +	 * with GuC.
> +	 */
> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
> +		return -ETIMEDOUT;
> +
> +	/* Disable CTB */
> +	xe_guc_ct_disable(&guc->ct);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_runtime_resume - GuC runtime resume
> + * @guc: GuC object
> + *
> + * This function enables CTB communication
> + * and interrupts.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Power is not lost when resuming from D3Hot,
> +	 * hence it is not necessary to reload GuC
> +	 * everytime. Only enable interrupts and
> +	 * CTB communication during resume
> +	 */
> +	guc_enable_irq(guc);

this will break VFs

can't you just use xe_guc_enable_communication() as it was ?
it did the same steps what you are trying in this function

> +
> +	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
> +		      ARAT_EXPIRED_INTRMSK, 0);

if power not lost we likely don't need this (as this is a default value
and we already set it once as part of __xe_guc_upload()

> +
> +	xe_guc_ct_enable(&guc->ct);
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index af59c9545753..a01999bb4a8e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b4137fe195a4..400680c429fd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -360,7 +360,16 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +/**
> + * xe_guc_ct_register - register GuC CTB
> + * @ct: GuC CT object
> + *
> + * register GuC CTB's and enable GuC CT
> + * communication channel.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_ct_register(struct xe_guc_ct *ct)

hmm, can we have common naming convention across all driver components?

for the initialization there was pattern like:

	- init_early
	- init
	- enable
	- disable
	- fini

and the "_register" suffix was mostly used by functions that registers
the sysfs/debugfs attributes

now CTB is splitting 'enable' step into 'register' and 'enable' where
the latter can't be used alone and be even more misleading

+ Rodrigo

>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -383,11 +392,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> -
> -	smp_mb();
> -	wake_up_all(&ct->wq);
> -	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
> +	xe_guc_ct_enable(ct);
>  
>  	if (ct_needs_safe_mode(ct))
>  		ct_enter_safe_mode(ct);
> @@ -396,10 +401,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  err_out:
>  	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> -
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_enable - Set GuC CT to enabled state
> + * @ct: GuC CT object
> + *
> + * Set GuC CT to enabled state
> + */
> +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	struct xe_gt *gt = ct_to_gt(ct);
> +
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	smp_mb();
> +	wake_up_all(&ct->wq);
> +	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");

this seems wrong, as CTB was enabled and fully functional once you
called guc_ct_control_toggle(true), decoupling reporting of what have
already happened in the previous steps is IMO just misleading

+ Matt

> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 105bb8e99a8d..f786b3ec2b68 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -11,7 +11,8 @@
>  struct drm_printer;
>  
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> -int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_register(struct xe_guc_ct *ct);
> +void xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
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
> index 0f240534fb72..997ab4e82931 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend - uC runtime suspend
> + * @uc: uC object
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */

nit: this comment doesn't bring too much new info and likely can be
dropped without losing any clarity of the code

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
> +	/* GuC submission not enabled, nothing to do */
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
