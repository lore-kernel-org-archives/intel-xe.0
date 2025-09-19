Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB29CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 11:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4A10E997;
	Fri, 19 Sep 2025 11:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuEFjDF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D00C10E98F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758279608; x=1789815608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j/nzV9DkTvbeD48d9mwto9tieOr+PAFgK8dCmD9NuxU=;
 b=CuEFjDF1qm+MAi4WF6ZZyKMlYzl0nuFsZBxDdGEuMkPEInOSFdQGaNmf
 RG4Jo/G6zYTvgE4V8XyXkmrUXprRroFRlDihQhAKTV8YDnMKR6S2OweZe
 94LU6Mv9/d2uytCx6h0r9wuE7UuXGa+lA8l2W44Ny2fJeVEMi2LGRVP3a
 AwjPuKtUm1PHctSJygE8rNaWGIwYhIP+PhQiN714wkE8RhJGIwd/cMVOh
 0A3ABk82O3XXRVJurf4wfWlkxmdFoFPVCjw/uPxtpTOQaaRUkQIAHdbWI
 aG0IBT4kXHGORR+Bo3vbT12gOTxVj/JogftZ3CScHxE03nLdA7JkRx/jd A==;
X-CSE-ConnectionGUID: Ijg7mqoYQnmronP+3POuYw==
X-CSE-MsgGUID: 0Dr3Ex8OTn+IVb+wG+dLwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59665652"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="59665652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:00:08 -0700
X-CSE-ConnectionGUID: /rz+yaCUQvCdRWA0aykx+Q==
X-CSE-MsgGUID: W2gr8njiQCeZPEGeVa1bZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="175421978"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:00:07 -0700
Message-ID: <55ad501d-f73c-4ce1-87d6-8f5d0bd59d41@intel.com>
Date: Fri, 19 Sep 2025 12:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pm: Add lockdep annotation for the pm_block
 completion
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
 <20250918142848.21807-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250918142848.21807-3-thomas.hellstrom@linux.intel.com>
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

On 18/09/2025 15:28, Thomas Hellström wrote:
> Similar to how we annotate dma-fences, add lockep annotation to
> the pm_block completion to ensure we don't wait for it while holding
> locks that are needed in the pm notifier or in the device
> suspend / resume callbacks.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c |  3 +-
>   drivers/gpu/drm/xe/xe_pm.c   | 59 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h   |  2 ++
>   drivers/gpu/drm/xe/xe_vm.c   |  2 ++
>   4 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 7715e74bb945..83897950f0da 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -16,6 +16,7 @@
>   #include "xe_exec_queue.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_sync.h"
> @@ -247,7 +248,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	 * on task freezing during suspend / hibernate, the call will
>   	 * return -ERESTARTSYS and the IOCTL will be rerun.
>   	 */
> -	err = wait_for_completion_interruptible(&xe->pm_block);
> +	err = xe_pm_block_on_suspend(xe);
>   	if (err)
>   		goto err_unlock_list;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b1c536b39034..5c561d3c3515 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -82,8 +82,58 @@ static struct lockdep_map xe_pm_runtime_d3cold_map = {
>   static struct lockdep_map xe_pm_runtime_nod3cold_map = {
>   	.name = "xe_rpm_nod3cold_map"
>   };
> +
> +static struct lockdep_map xe_pm_block_lockdep_map = {
> +	.name = "xe_pm_block_map",
> +};
>   #endif
>   
> +static void xe_pm_block_begin_signalling(void)
> +{
> +	lock_acquire_shared_recursive(&xe_pm_block_lockdep_map, 0, 1, NULL, _RET_IP_);
> +}
> +
> +static void xe_pm_block_end_signalling(void)
> +{
> +	lock_release(&xe_pm_block_lockdep_map, _RET_IP_);
> +}
> +
> +/**
> + * xe_pm_might_block_on_suspend() - Annotate that the code might block on suspend
> + *
> + * Annotation to use where the code might block or sieze to make
> + * progress pending resume completion.
> + */
> +void xe_pm_might_block_on_suspend(void)
> +{
> +	lock_map_acquire(&xe_pm_block_lockdep_map);
> +	lock_map_release(&xe_pm_block_lockdep_map);
> +}
> +
> +/**
> + * xe_pm_might_block_on_suspend() - Block pending suspend.
> + * @xe: The xe device about to be suspended.
> + *
> + * Block if the pm notifier has start evicting bos, to avoid
> + * racing and validating those bos back. The function is
> + * annotated to ensure no locks are held that are also grabbed
> + * in the pm notifier or the device suspend / resume.
> + * This is intended to be used by freezable tasks only.
> + * (Not freezable workqueues), with the intention that the function
> + * returns %-ERESTARTSYS when tasks are frozen during suspend,
> + * and allows the task to freeze. The caller must be able to
> + * handle the %-ERESTARTSYS.
> + *
> + * Return: %0 on success, %-ERESTARTSYS on signal pending or
> + * if freezing requested.
> + */
> +int xe_pm_block_on_suspend(struct xe_device *xe)
> +{
> +	xe_pm_might_block_on_suspend();
> +
> +	return wait_for_completion_interruptible(&xe->pm_block);
> +}
> +
>   /**
>    * xe_rpm_reclaim_safe() - Whether runtime resume can be done from reclaim context
>    * @xe: The xe device.
> @@ -123,6 +173,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	int err;
>   
>   	drm_dbg(&xe->drm, "Suspending device\n");
> +	xe_pm_block_begin_signalling();
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
>   	err = xe_pxp_pm_suspend(xe->pxp);
> @@ -152,6 +203,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   	xe_i2c_pm_suspend(xe);
>   
>   	drm_dbg(&xe->drm, "Device suspended\n");
> +	xe_pm_block_end_signalling();
> +
>   	return 0;
>   
>   err_display:
> @@ -159,6 +212,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> +	xe_pm_block_end_signalling();
>   	return err;
>   }
>   
> @@ -175,6 +229,7 @@ int xe_pm_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> +	xe_pm_block_begin_signalling();
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> @@ -217,9 +272,11 @@ int xe_pm_resume(struct xe_device *xe)
>   		xe_sriov_vf_ccs_register_context(xe);
>   
>   	drm_dbg(&xe->drm, "Device resumed\n");
> +	xe_pm_block_end_signalling();
>   	return 0;
>   err:
>   	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> +	xe_pm_block_end_signalling();
>   	return err;
>   }
>   
> @@ -324,6 +381,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   		struct xe_validation_ctx ctx;
>   
>   		reinit_completion(&xe->pm_block);
> +		xe_pm_block_begin_signalling();
>   		xe_pm_runtime_get(xe);
>   		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
>   					     (struct xe_val_flags) {.exclusive = true});
> @@ -340,6 +398,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   		 * avoid a runtime suspend interfering with evicted objects or backup
>   		 * allocations.
>   		 */
> +		xe_pm_block_end_signalling();

I guess ideally this would somehow be extended to the complete_all() 
below, but that would then pull in loads of unrelated stuff?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   		break;
>   	}
>   	case PM_POST_HIBERNATION:
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 59678b310e55..f7f89a18b6fc 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -33,6 +33,8 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>   bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> +int xe_pm_block_on_suspend(struct xe_device *xe);
> +void xe_pm_might_block_on_suspend(void);
>   int xe_pm_module_init(void);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0cacab20ff85..80b7f13ecd80 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -466,6 +466,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   retry:
>   	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worker(vm)) {
>   		up_write(&vm->lock);
> +		/* We don't actually block but don't make progress. */
> +		xe_pm_might_block_on_suspend();
>   		return;
>   	}
>   

