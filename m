Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9BCCD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 15:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B07010E664;
	Tue, 26 May 2026 15:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bk/Tt+du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF6410E657
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 15:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779809885; x=1811345885;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iK0I8nuXf7OqXuOOfpzgWEFQbnlWuRxky/3JOn5vq2U=;
 b=Bk/Tt+duvBirgetzCkzhB7dYvGB6HxicqvHPtp76vnxoKFRYzacwt6/S
 lSOEiEnJMFndxV8dIo1QvuTzZTTgkdhXeKSZ02FH7PQnJU6r+F7GRtkHV
 f2cFPwY03sCOHWOl7pYuu7BGacCVNPYYqMN5j0Vnnf3HQ764ESXaatrPZ
 Lpwj8uDZ1y4JuL5Qb4+VpXVTxx/rlUxAcfa+h9LAnMvdDkVyOtZdhw+nC
 4p9AXfqISRI6efSC+3VmaGd+jmNKJ1zspTaISPkaLTla4gFzlfcxrwI9G
 gOivnfnDX1Pem26ONfIaI77EaTO6GQSnrKblJhjl2+ydPrAe8420aK5cE g==;
X-CSE-ConnectionGUID: RrJiwrLyR0a6RTMpPxo2Kw==
X-CSE-MsgGUID: JIRQdMA2T3y5gF00eMvnDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80609234"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80609234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:38:05 -0700
X-CSE-ConnectionGUID: bqsMeBGNQza7WHIKpoM/OA==
X-CSE-MsgGUID: pFsqrtYvR06cijmp3GzpeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="247033219"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.128])
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:38:03 -0700
Message-ID: <f0df867c-d4f4-4a9f-b2f0-58d05e5f8926@intel.com>
Date: Tue, 26 May 2026 16:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Don't ban LR VM exec queues on PM
 suspend
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260525133051.91636-3-thomas.hellstrom@linux.intel.com>
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
> When xe_guc_submit_stop() is called during an S3/S4 suspend or GT
> reset, guc_exec_queue_stop() bans any user exec queue that has a job
> which has started but not yet completed.  For normal (non-LR) exec
> queues this is the correct behaviour: a started-but-incomplete job at
> reset time may indicate a hung workload.

Is it not too harsh to ban the user job for that? Say you are a well 
behaved 3D workload, and forced suspend is triggered by the user, if you 
are very unlucky you can get banned, if you hit the queue_stop flow with 
a WIP job?

> 
> For exec queues attached to Long Running (LR) VMs the same condition
> is always true during normal operation: LR jobs are designed to run
> indefinitely and are never "completed" in the DRM scheduler sense —
> they are preempted and resumed via the preempt-fence mechanism.
> Banning such an exec queue on PM suspend permanently prevents the job
> from restarting after resume, causing the userspace compute workload to
> fail silently.
> 
> Fix this by not banning LR VM exec queues when a system suspend or
> hibernation is in progress, while preserving the ban for GT reset where
> a started-but-incomplete job is a legitimate indicator of a hang.
> 
> Fixes: f6375fb3aa94 ("drm/xe: Track LR jobs in DRM scheduler pending list")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.19+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 10 +++++++++-
>   drivers/gpu/drm/xe/xe_pm.c           |  5 ++++-
>   3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..9dbf7b3a0c49 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -433,6 +433,14 @@ struct xe_device {
>   	struct notifier_block pm_notifier;
>   	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
>   	struct completion pm_block;
> +	/**
> +	 * @pm_suspend_in_progress: True while the device is going through
> +	 * system suspend or hibernation (set at xe_pm_suspend() entry, cleared
> +	 * at xe_pm_resume() entry or on suspend error). Used to suppress exec
> +	 * queue bans that should only apply during GT reset, not PM suspend.
> +	 * Serialised by the PM suspend sequence; no lock required.
> +	 */
> +	bool pm_suspend_in_progress;
>   	/** @rebind_resume_list: List of wq items to kick on resume. */
>   	struct list_head rebind_resume_list;
>   	/** @rebind_resume_lock: Lock to protect the rebind_resume_list */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2b8b316c0ca3..f1a6f13011b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2268,8 +2268,16 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   	 * Ban any engine (aside from kernel and engines used for VM ops) with a
>   	 * started but not complete job or if a job has gone through a GT reset
>   	 * more than twice.
> +	 *
> +	 * LR VM exec queues are excluded from this ban during PM suspend: their
> +	 * jobs are intentionally long-running and are preempted and resumed via
> +	 * the preempt-fence mechanism. Banning them on PM suspend would
> +	 * permanently prevent the job from restarting after resume.
> +	 * On GT reset however we do want to ban them, as that may indicate a
> +	 * genuinely hung workload.
>   	 */
> -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> +	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM)) &&
> +	    !(q->vm && xe_vm_in_lr_mode(q->vm) && guc_to_xe(guc)->pm_suspend_in_progress)) {
>   		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>   		bool ban = false;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c203a59d7000..76d211986822 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -176,6 +176,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	int err;
>   
>   	drm_dbg(&xe->drm, "Suspending device\n");
> +	xe->pm_suspend_in_progress = true;
>   	xe_pm_block_begin_signalling();
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> @@ -217,6 +218,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> +	xe->pm_suspend_in_progress = false;
>   	xe_pm_block_end_signalling();
>   	return err;
>   }
> @@ -234,8 +236,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	xe_pm_block_begin_signalling();
> +	xe->pm_suspend_in_progress = false;
>   	drm_dbg(&xe->drm, "Resuming device\n");
> +	xe_pm_block_begin_signalling();
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
>   	for_each_gt(gt, xe, id)

