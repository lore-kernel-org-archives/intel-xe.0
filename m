Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D3DC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384331129E0;
	Tue,  5 Mar 2024 10:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duJYLcUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1031129E1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709634008; x=1741170008;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4tW/kA4rMjlN5rAr9MvwzDFGcSYc4lwKdvCuJ1HfYOk=;
 b=duJYLcUCN4JrIWv38sU8BGaeGzXAoEgwENOOW+LxcIgXhG8tSXP+RXtr
 ax5CLzoNlnNtdBrV0dazFZADso41lHTSpHW63dpc9iGYgE9Q2M5+Y1OK2
 rvt4hJHIQ9gcupXZeMcQy3ZUKhmdQ2s8AW0aIOp/H29A6LDnP/9jr72Uy
 /uVzgSM/+jBcDdcmenE92Syqye9t8OHGIesZ+YdnznSRGT8vkYCbXpxBn
 voB9Q2V9HQmhhL9Tgj0MUhkUZ5U9iatbZdWx3jxvKrpSX9c5hhabWpDuS
 jNQMXNlxL56RpJwBFtoNMZ1XrDRgVJLvF2gr6yapmp3OwC6TCe5w47k4o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4101879"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4101879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13982911"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:20:07 -0800
Message-ID: <02eece21-f648-491f-9893-f3a43440afaf@intel.com>
Date: Tue, 5 Mar 2024 10:20:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-3-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> The mem_access itself is not holding any lock, but attempting
> to train lockdep with possible scarring locks happening during
> runtime pm. We are going soon to kill the mem_access get and put
> helpers in favor of direct xe_pm_runtime calls, so let's just
> move this lock around to where it now belongs.
> 
> v2: s/lockdep_training/lockdep_prime (Matt Auld)
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Probably this should be first or second patch in series, before we start 
converting users?

> ---
>   drivers/gpu/drm/xe/xe_device.c | 23 -----------------
>   drivers/gpu/drm/xe/xe_device.h |  4 ---
>   drivers/gpu/drm/xe/xe_pm.c     | 45 ++++++++++++++++++++++++++++------
>   3 files changed, 37 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495..49a413725c8f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -45,12 +45,6 @@
>   #include "xe_vm.h"
>   #include "xe_wait_user_fence.h"
>   
> -#ifdef CONFIG_LOCKDEP
> -struct lockdep_map xe_device_mem_access_lockdep_map = {
> -	.name = "xe_device_mem_access_lockdep_map"
> -};
> -#endif
> -
>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
> @@ -702,23 +696,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
>   	if (xe_pm_read_callback_task(xe) == current)
>   		return;
>   
> -	/*
> -	 * Since the resume here is synchronous it can be quite easy to deadlock
> -	 * if we are not careful. Also in practice it might be quite timing
> -	 * sensitive to ever see the 0 -> 1 transition with the callers locks
> -	 * held, so deadlocks might exist but are hard for lockdep to ever see.
> -	 * With this in mind, help lockdep learn about the potentially scary
> -	 * stuff that can happen inside the runtime_resume callback by acquiring
> -	 * a dummy lock (it doesn't protect anything and gets compiled out on
> -	 * non-debug builds).  Lockdep then only needs to see the
> -	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
> -	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
> -	 * For example if the (callers_locks) are ever grabbed in the
> -	 * runtime_resume callback, lockdep should give us a nice splat.
> -	 */
> -	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> -	lock_map_release(&xe_device_mem_access_lockdep_map);
> -
>   	xe_pm_runtime_get(xe);
>   	ref = atomic_inc_return(&xe->mem_access.ref);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..2653f53bee4e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -16,10 +16,6 @@ struct xe_file;
>   #include "xe_force_wake.h"
>   #include "xe_macros.h"
>   
> -#ifdef CONFIG_LOCKDEP
> -extern struct lockdep_map xe_device_mem_access_lockdep_map;
> -#endif
> -
>   static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>   {
>   	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9fbb6f6c598a..b534a194a9ef 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -68,6 +68,12 @@
>    * management (RPS).
>    */
>   
> +#ifdef CONFIG_LOCKDEP
> +struct lockdep_map xe_pm_runtime_lockdep_map = {
> +	.name = "xe_pm_runtime_lockdep_map"
> +};
> +#endif
> +
>   /**
>    * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
>    * @xe: xe device instance
> @@ -297,11 +303,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	xe_pm_write_callback_task(xe, current);
>   
>   	/*
> -	 * The actual xe_device_mem_access_put() is always async underneath, so
> +	 * The actual xe_pm_runtime_put() is always async underneath, so
>   	 * exactly where that is called should makes no difference to us. However
>   	 * we still need to be very careful with the locks that this callback
>   	 * acquires and the locks that are acquired and held by any callers of
> -	 * xe_device_mem_access_get(). We already have the matching annotation
> +	 * xe_runtime_pm_get(). We already have the matching annotation
>   	 * on that side, but we also need it here. For example lockdep should be
>   	 * able to tell us if the following scenario is in theory possible:
>   	 *
> @@ -309,15 +315,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 * lock(A)                       |
>   	 *                               | xe_pm_runtime_suspend()
>   	 *                               |      lock(A)
> -	 * xe_device_mem_access_get()    |
> +	 * xe_pm_runtime_get()           |
>   	 *
>   	 * This will clearly deadlock since rpm core needs to wait for
>   	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
>   	 * on CPU0 which prevents CPU1 making forward progress.  With the
> -	 * annotation here and in xe_device_mem_access_get() lockdep will see
> +	 * annotation here and in xe_pm_runtime_get() lockdep will see
>   	 * the potential lock inversion and give us a nice splat.
>   	 */
> -	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> +	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> @@ -343,7 +349,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   	xe_irq_suspend(xe);
>   out:
> -	lock_map_release(&xe_device_mem_access_lockdep_map);
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
>   }
> @@ -363,7 +369,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
>   
> -	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> +	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
>   	/*
>   	 * It can be possible that xe has allowed d3cold but other pcie devices
> @@ -400,11 +406,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   out:
> -	lock_map_release(&xe_device_mem_access_lockdep_map);
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
>   }
>   
> +/*
> + * For places where resume is synchronous it can be quite easy to deadlock
> + * if we are not careful. Also in practice it might be quite timing
> + * sensitive to ever see the 0 -> 1 transition with the callers locks
> + * held, so deadlocks might exist but are hard for lockdep to ever see.
> + * With this in mind, help lockdep learn about the potentially scary
> + * stuff that can happen inside the runtime_resume callback by acquiring
> + * a dummy lock (it doesn't protect anything and gets compiled out on
> + * non-debug builds).  Lockdep then only needs to see the
> + * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
> + * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
> + * For example if the (callers_locks) are ever grabbed in the
> + * runtime_resume callback, lockdep should give us a nice splat.
> + */
> +static void pm_runtime_lockdep_prime(void)
> +{
> +	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
> +}
> +
>   /**
>    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
>    * @xe: xe device instance
> @@ -416,6 +442,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
>   	if (xe_pm_read_callback_task(xe) == current)
>   		return;
>   
> +	pm_runtime_lockdep_prime();
>   	pm_runtime_resume(xe->drm.dev);
>   }
>   
> @@ -445,6 +472,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
>   	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
>   		return -ELOOP;
>   
> +	pm_runtime_lockdep_prime();
>   	return pm_runtime_get_sync(xe->drm.dev);
>   }
>   
> @@ -491,6 +519,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>   		return true;
>   	}
>   
> +	pm_runtime_lockdep_prime();
>   	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
>   }
>   
