Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E546CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 15:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA3C10E4B1;
	Tue, 26 May 2026 15:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFJ9R3Et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30AA10E4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779809267; x=1811345267;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7phcW4FNdZQTU01VTUjPEkkd5SpU6jvSaBP2ZlygCzI=;
 b=bFJ9R3Et3bPZrWd0ZT6Kt2dVKb12fK8gqBUTl5kJbBDSYt9GChUwKBOz
 4Vrj4AAQCM3rhqoncRuwSMGyIXuwP8G6mAcZdV11HWW4CNVz7NJiTZG/D
 OSko7lAYgSHltxjFlDX9Tg2w5lvh50EZcl7pGsXy4QhhrMKdrrZDE/vcI
 0uoXTCIK7HoEG8G5y+HKYvhmCPoXfJp6zJc4Nunii7lVVLhHLlGl4de0R
 pOuw+lUKbJKC0RmiUexAVDG0/FDrXz9SnNjqT+pXR5lmnsjMWPskOyRdr
 4QTt9zkTIBoKYoD/i3HOPqV3yQZzkYtOOVbaQQ9DFh2PRq3ISK81/IMX3 Q==;
X-CSE-ConnectionGUID: WIwfVBQZTjClozQpz6ZRMQ==
X-CSE-MsgGUID: 5t2PM33QT0+QRyNTTEtKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80608160"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80608160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:27:46 -0700
X-CSE-ConnectionGUID: Gj3xYAFyRcW8PWN62nYUQA==
X-CSE-MsgGUID: D+3beDmfQZaK4VPSQqSxzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="247031652"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.128])
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:27:44 -0700
Message-ID: <d9c796f7-1dc5-4d0c-b121-69c042a3ae32@intel.com>
Date: Tue, 26 May 2026 16:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/guc: Defer user exec queue scheduler start
 until after page table restore
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260525133051.91636-2-thomas.hellstrom@linux.intel.com>
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

On 25/05/2026 14:30, Thomas Hellström wrote:
> On S3/S4 and d3cold runtime PM resume, exec queue schedulers are
> restarted before xe_bo_restore_late() has restored userspace VM page
> table BOs and LRC BOs. If a pending job is submitted in this window,
> GuC will attempt to load the context using stale or invalid data in
> VRAM, leading to GuC exceptions.
> 
> Defer user exec queue scheduler start until after page tables and LRC
> BOs are restored, ensuring no job can be submitted before the backing
> storage is valid. Migrate and kernel VM exec queues are still started
> immediately as they are required by the restore process itself.
> 
> For GT reset, VRAM is not evicted and all BOs remain valid, so user
> exec queue schedulers are started without deferral.
> 
> This covers both LR and non-LR userspace exec queues.
> 
> v3:
> - Skip queues with a running scheduler in xe_guc_submit_start_user_queues()
>    to avoid a WARN_ON in drm_sched_for_each_pending_job() when a new user
>    exec queue is created in the window between xe_guc_submit_start() and
>    xe_guc_submit_start_user_queues(). (Intel CI)
> 
> Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c         | 16 +++++++++
>   drivers/gpu/drm/xe/xe_gt.h         |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++
>   drivers/gpu/drm/xe/xe_guc.h        |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c | 52 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>   drivers/gpu/drm/xe/xe_pm.c         |  6 ++++
>   drivers/gpu/drm/xe/xe_uc.c         | 16 +++++++++
>   drivers/gpu/drm/xe/xe_uc.h         |  1 +
>   9 files changed, 108 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..2c63e4d6a649 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -955,6 +955,8 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (err)
>   		goto err_out;
>   
> +	xe_uc_start_user_queues(&gt->uc);
> +
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
> @@ -967,6 +969,7 @@ static void gt_reset_worker(struct work_struct *w)
>   err_out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
> +	xe_uc_start_user_queues(&gt->uc);
>   
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> @@ -1050,6 +1053,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>   	return ret;
>   }
>   
> +/**
> + * xe_gt_start_user_queues() - Start user exec queues after page table restore
> + * @gt: the GT object
> + *
> + * Starts the DRM schedulers for all user exec queues on the GT. This must be
> + * called after xe_bo_restore_late() to ensure that userspace page table BOs
> + * are valid before any job submission triggers GuC context registration.
> + */
> +void xe_gt_start_user_queues(struct xe_gt *gt)
> +{
> +	xe_uc_start_user_queues(&gt->uc);
> +}
> +
>   int xe_gt_resume(struct xe_gt *gt)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..b6ba05a317f7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -170,4 +170,6 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
>   	return gt->info.multi_queue_engine_class_mask & BIT(class);
>   }
>   
> +void xe_gt_start_user_queues(struct xe_gt *gt);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..0359909b8b27 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1717,6 +1717,19 @@ int xe_guc_start(struct xe_guc *guc)
>   	return xe_guc_submit_start(guc);
>   }
>   
> +/**
> + * xe_guc_start_user_queues() - Start user exec queue schedulers on the GuC
> + * @guc: the GuC object
> + *
> + * Starts the DRM schedulers for all user exec queues managed by this GuC.
> + * Must be called after xe_bo_restore_late() to ensure page tables are valid
> + * before any job submission triggers GuC context registration.
> + */
> +void xe_guc_start_user_queues(struct xe_guc *guc)
> +{
> +	xe_guc_submit_start_user_queues(guc);
> +}
> +
>   /**
>    * xe_guc_runtime_suspend() - GuC runtime suspend
>    * @guc: The GuC object
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 02514914f404..ad2a6521852c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -60,6 +60,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> +void xe_guc_start_user_queues(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4d32b430bc15..2b8b316c0ca3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2535,6 +2535,16 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   	xe_sched_submission_resume_tdr(sched);
>   }
>   
> +/*
> + * Returns true for user exec queues whose page tables may not yet be
> + * restored when xe_guc_submit_start() is called during GT resume.
> + * These queues must be started later, after xe_bo_restore_late().
> + */
> +static bool exec_queue_needs_late_start(const struct xe_exec_queue *q)
> +{
> +	return !(q->flags & (EXEC_QUEUE_FLAG_MIGRATE | EXEC_QUEUE_FLAG_VM));

Just one question here. Do we want to include FLAG_VM in here? Those 
would be bind jobs, I think, but I'm not sure if we actually flush those 
on suspend? For migrate we do an idle wait on every migrate queue, so I 
would assume when we restart a migrate queue, it should be empty, but 
not sure if that is true for bind jobs on the bind queue(s)? Bind job 
will be touching paging structures also, which need to be restored 
first. Or is this somehow already handled?

> +}
> +
>   int xe_guc_submit_start(struct xe_guc *guc)
>   {
>   	struct xe_exec_queue *q;
> @@ -2549,6 +2559,10 @@ int xe_guc_submit_start(struct xe_guc *guc)
>   		if (q->guc->id != index)
>   			continue;
>   
> +		/* User queues are deferred until page tables are restored */
> +		if (exec_queue_needs_late_start(q))
> +			continue;
> +
>   		guc_exec_queue_start(q);
>   	}
>   	mutex_unlock(&guc->submission_state.lock);
> @@ -2558,6 +2572,44 @@ int xe_guc_submit_start(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +/**
> + * xe_guc_submit_start_user_queues() - Start user exec queues after late restore
> + * @guc: the GuC object
> + *
> + * Starts the DRM schedulers for all user exec queues (those not flagged as
> + * migrate or VM queues). Must be called after xe_bo_restore_late() to ensure
> + * page tables are valid before any job submission is attempted.
> + */
> +void xe_guc_submit_start_user_queues(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	if (!guc->submission_state.initialized)
> +		return;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Prevent redundant attempts to start parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
> +		if (!exec_queue_needs_late_start(q))
> +			continue;
> +
> +		/*
> +		 * Skip queues whose scheduler is already running: they were
> +		 * created after xe_guc_submit_start() decremented stopped to 0,
> +		 * so they need no restart.
> +		 */
> +		if (!drm_sched_is_stopped(&q->guc->sched.base))
> +			continue;
> +
> +		guc_exec_queue_start(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>   static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>   					   struct xe_exec_queue *q)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b3839a90c142..b210b2f6cd2d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,6 +20,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>   void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_start_user_queues(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_pause_abort(struct xe_guc *guc);
>   void xe_guc_submit_pause_vf(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4672eb07476..c203a59d7000 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -282,6 +282,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_start_user_queues(gt);
> +
>   	xe_pxp_pm_resume(xe->pxp);
>   
>   	if (IS_VF_CCS_READY(xe))
> @@ -696,6 +699,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   		err = xe_bo_restore_late(xe);
>   		if (err)
>   			goto out;
> +
> +		for_each_gt(gt, xe, id)
> +			xe_gt_start_user_queues(gt);
>   	}
>   
>   	xe_pxp_pm_resume(xe->pxp);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 75091bde0d50..12606133f5bc 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -263,6 +263,22 @@ int xe_uc_start(struct xe_uc *uc)
>   	return xe_guc_start(&uc->guc);
>   }
>   
> +/**
> + * xe_uc_start_user_queues() - Start user exec queues after late restore
> + * @uc: the UC object
> + *
> + * Starts the DRM schedulers for all user exec queues. Must be called after
> + * xe_bo_restore_late() to ensure page tables are valid before any job
> + * submission is attempted. Has no effect if GuC submission is not enabled.
> + */
> +void xe_uc_start_user_queues(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_start_user_queues(&uc->guc);
> +}
> +
>   static void uc_reset_wait(struct xe_uc *uc)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 255a54a8f876..2fd056cfa1d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -18,6 +18,7 @@ void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
>   void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);
> +void xe_uc_start_user_queues(struct xe_uc *uc);
>   void xe_uc_suspend_prepare(struct xe_uc *uc);
>   int xe_uc_suspend(struct xe_uc *uc);
>   int xe_uc_sanitize_reset(struct xe_uc *uc);

