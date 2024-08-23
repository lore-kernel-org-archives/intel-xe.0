Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558AC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 17:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D922310EC91;
	Fri, 23 Aug 2024 17:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LR095sEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2806D10EC91
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724433186; x=1755969186;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yaWhkQtSGVQHBb34ZQQjqr1/WdRgIxzVrtSWkBmXig0=;
 b=LR095sEotl6wcUQhxcMeuHQKoiS/anWXxQzvGn/yDQ855FVrPk/AoJBE
 VP1F3n4SAbYlMaCjAS7Yq1Zg+8t2NkKYFB8ncRqn5HByZ+IBXhOc84C6O
 w2ZMUK6vNvggXlCOTmfgR/lXv6SMam4SU9lqghu5jgAkwmz20SFE8d/rk
 1E1OhypdY7aoXi5mRuHlZv+m11cD9iB0ppC38EKf4nJ0+EKK0WlsijyMt
 +fhWzVnQO05yCPQBB/YEZXXLv9/7yHAI8ZyagVlwKOluYwYLnRb5LlV9q
 lXFzVGRDnW6rwhYenapdw4ET50j9+HKEmdXqHowrqNikiXzZ/UTmxlMtr g==;
X-CSE-ConnectionGUID: w/EhGTl/Q6qMy3NL0tjO1A==
X-CSE-MsgGUID: XfIyGDxoR3GfqOt3B8w+Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="48306310"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="48306310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 10:13:05 -0700
X-CSE-ConnectionGUID: A5a01naPQ+a8ak2Inuydaw==
X-CSE-MsgGUID: EhcD1or1QKm6CBqsb9KB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66789625"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.40])
 ([10.245.245.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 10:13:05 -0700
Message-ID: <c518fb6b-ab55-4b5f-b1d4-f503bb9f051c@intel.com>
Date: Fri, 23 Aug 2024 18:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
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

On 23/08/2024 17:58, Thomas Hellström wrote:
> For non-d3cold-capable devices we'd like to be able to wake up the
> device from reclaim. In particular, for Lunar Lake we'd like to be
> able to blit CCS metadata to system at shrink time; at least from
> kswapd where it's reasonable OK to wait for rpm resume and a
> preceding rpm suspend.
> 
> Therefore use a separate lockdep map for such devices and prime it
> reclaim-tainted.
> 
> v2:
> - Rename lockmap acquire- and release functions. (Rodrigo Vivi).
> - Reinstate the old xe_pm_runtime_lockdep_prime() function and
>    rename it to xe_rpm_might_enter_cb(). (Matthew Auld).
> - Introduce a separate xe_pm_runtime_lockdep_prime function
>    called from module init for known required locking orders.
> 
> Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
> Cc: "Auld, Matthew" <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 79 +++++++++++++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_pm.h |  1 +
>   2 files changed, 66 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..747fb96453d3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -70,11 +70,29 @@
>    */
>   
>   #ifdef CONFIG_LOCKDEP
> -static struct lockdep_map xe_pm_runtime_lockdep_map = {
> -	.name = "xe_pm_runtime_lockdep_map"
> +static struct lockdep_map xe_pm_runtime_d3cold_map = {
> +	.name = "xe_rpm_d3cold_map"
> +};
> +
> +static struct lockdep_map xe_pm_runtime_nod3cold_map = {
> +	.name = "xe_rpm_nod3cold_map"
>   };
>   #endif
>   
> +static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
> +{
> +	lock_map_acquire(xe->d3cold.capable ?
> +			 &xe_pm_runtime_d3cold_map :
> +			 &xe_pm_runtime_nod3cold_map);
> +}
> +
> +static void xe_rpm_lockmap_release(const struct xe_device *xe)
> +{
> +	lock_map_release(xe->d3cold.capable ?
> +			 &xe_pm_runtime_d3cold_map :
> +			 &xe_pm_runtime_nod3cold_map);
> +}
> +
>   /**
>    * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
>    * @xe: xe device instance
> @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 * annotation here and in xe_pm_runtime_get() lockdep will see
>   	 * the potential lock inversion and give us a nice splat.
>   	 */
> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> +	xe_rpm_lockmap_acquire(xe);
>   
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   out:
>   	if (err)
>   		xe_display_pm_resume(xe, true);
> -	lock_map_release(&xe_pm_runtime_lockdep_map);
> +	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
>   }
> @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
>   
> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> +	xe_rpm_lockmap_acquire(xe);
>   
>   	if (xe->d3cold.allowed) {
>   		err = xe_pcode_ready(xe, true);
> @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   out:
> -	lock_map_release(&xe_pm_runtime_lockdep_map);
> +	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
>   }
> @@ -451,15 +469,37 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>    * stuff that can happen inside the runtime_resume callback by acquiring
>    * a dummy lock (it doesn't protect anything and gets compiled out on
>    * non-debug builds).  Lockdep then only needs to see the
> - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
> - * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
> + * xe_pm_runtime_xxx_map -> runtime_resume callback once, and then can
> + * hopefully validate all the (callers_locks) -> xe_pm_runtime_xxx_map.
>    * For example if the (callers_locks) are ever grabbed in the
>    * runtime_resume callback, lockdep should give us a nice splat.
>    */
> -static void pm_runtime_lockdep_prime(void)
> +static void xe_rpm_might_enter_cb(const struct xe_device *xe)
> +{
> +	xe_rpm_lockmap_acquire(xe);
> +	xe_rpm_lockmap_release(xe);
> +}
> +
> +/*
> + * Prime the lockdep maps for known locking orders that need to
> + * be supported but that may not always occur on all systems.
> + */
> +static void xe_pm_runtime_lockdep_prime(void)
>   {
> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> -	lock_map_release(&xe_pm_runtime_lockdep_map);
> +	struct dma_resv lockdep_resv;
> +
> +	dma_resv_init(&lockdep_resv);
> +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
> +	/* D3Cold takes the dma_resv locks to evict bos */
> +	dma_resv_lock(&lockdep_resv, NULL);
> +	dma_resv_unlock(&lockdep_resv);
> +	lock_map_release(&xe_pm_runtime_d3cold_map);
> +
> +	/* Shrinkers might like to wake up the device under reclaim. */
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
> +	lock_map_release(&xe_pm_runtime_nod3cold_map);
> +	fs_reclaim_release(GFP_KERNEL);

Would it make sense to also prime the d3cold wrt reclaim, but with the 
opposite ordering?

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   }
>   
>   /**
> @@ -474,7 +514,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
>   	if (xe_pm_read_callback_task(xe) == current)
>   		return;
>   
> -	pm_runtime_lockdep_prime();
> +	xe_rpm_might_enter_cb(xe);
>   	pm_runtime_resume(xe->drm.dev);
>   }
>   
> @@ -506,7 +546,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
>   	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
>   		return -ELOOP;
>   
> -	pm_runtime_lockdep_prime();
> +	xe_rpm_might_enter_cb(xe);
>   	return pm_runtime_get_sync(xe->drm.dev);
>   }
>   
> @@ -574,7 +614,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>   		return true;
>   	}
>   
> -	pm_runtime_lockdep_prime();
> +	xe_rpm_might_enter_cb(xe);
>   	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
>   }
>   
> @@ -666,3 +706,14 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>   	drm_dbg(&xe->drm,
>   		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
>   }
> +
> +/**
> + * xe_pm_module_init() - Perform xe_pm specific module initialization.
> + *
> + * Return: 0 on success. Currently doesn't fail.
> + */
> +int __init xe_pm_module_init(void)
> +{
> +	xe_pm_runtime_lockdep_prime();
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 104a21ae6dfd..9aef673b1c8a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -32,5 +32,6 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> +int xe_pm_module_init(void);
>   
>   #endif
