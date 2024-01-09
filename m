Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB315C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 12:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952E910E401;
	Tue,  9 Jan 2024 12:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23F10E41B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704803609; x=1736339609;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NXdo64M/zkbwO4vdzTmJQbGhJXTIBogJJuhQtairwAg=;
 b=X29Rmr2Pb6m/B0YdkjvTPmyV2urQkoczHbccxH8LqAXKOVfHQuvaUIn6
 tgSSSlKcPiOfntUv1ofAiOgXXl6F5P37tYvUftLK+p1fzCzOXFLcGwQ6F
 0I0MeSKTFblPgVFaRWIxmRE4zA3GMl/nBr0rrg7owpGsGIKw54xbpq7+0
 1ox2jk63SZjzXF9yuvnvfVnnl6m85OF2xUYXtvVoH7wsDQUHlyga3VIBP
 wkWLra693dFEJc9aAb8GGrg7nzdTryf+FprrWD8Go5KLrg4MIOA4PuiBR
 Vnwpl4fYPr09s80OM5XJ8AlaB4PSK+9a8h8Pye6UpJz/guLQA7w6DHZLu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388624927"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="388624927"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="757979096"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="757979096"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:33:27 -0800
Message-ID: <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com>
Date: Tue, 9 Jan 2024 12:33:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-17-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-17-rodrigo.vivi@intel.com>
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> The sched jobs runtime pm calls already protects every execution,
> including these migration ones.

Is job really enough here? I assume queue is only destroyed once it has 
no more jobs and the final queue ref is dropped. And destroying the 
queue might involve stuff like de-register the context with GuC etc. 
which needs to use CT which will need rpm ref. What is holding the rpm 
if not the vm or queue?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
>   drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
>   drivers/gpu/drm/xe/xe_device.h        |  1 -
>   drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
>   4 files changed, 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 7a32faa2f6888..2257f0a28435b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
>   
>   		kunit_info(test, "Testing tile id %d.\n", id);
>   		xe_vm_lock(m->q->vm, true);
> -		xe_device_mem_access_get(xe);
>   		xe_migrate_sanity_test(m, test);
> -		xe_device_mem_access_put(xe);
>   		xe_vm_unlock(m->q->vm);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ee9b6612eec43..a7bec49da49fa 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
>   	XE_WARN_ON(xe_pm_runtime_suspended(xe));
>   }
>   
> -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> -{
> -	bool active;
> -
> -	if (xe_pm_read_callback_task(xe) == current)
> -		return true;
> -
> -	active = xe_pm_runtime_get_if_active(xe);
> -	if (active) {
> -		int ref = atomic_inc_return(&xe->mem_access.ref);
> -
> -		xe_assert(xe, ref != S32_MAX);
> -	}
> -
> -	return active;
> -}
> -
>   void xe_device_mem_access_get(struct xe_device *xe)
>   {
>   	int ref;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index af8ac2e9e2709..4acf4c2973390 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>   }
>   
>   void xe_device_mem_access_get(struct xe_device *xe);
> -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>   void xe_device_mem_access_put(struct xe_device *xe);
>   
>   void xe_device_assert_mem_access(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 44fe8097b7cda..d3a8d2d8caaaf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>   	if (err)
>   		goto err_lrc;
>   
> -	/*
> -	 * Normally the user vm holds an rpm ref to keep the device
> -	 * awake, and the context holds a ref for the vm, however for
> -	 * some engines we use the kernels migrate vm underneath which offers no
> -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> -	 * can perform GuC CT actions when needed. Caller is expected to have
> -	 * already grabbed the rpm ref outside any sensitive locks.
> -	 */
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
> -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> -
>   	return q;
>   
>   err_lrc:
> @@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_finish(q->lrc + i);
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_device_mem_access_put(gt_to_xe(q->gt));
>   	if (q->vm)
>   		xe_vm_put(q->vm);
>   
> @@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   			if (XE_IOCTL_DBG(xe, !hwe))
>   				return -EINVAL;
>   
> -			/* The migration vm doesn't hold rpm ref */
> -			xe_device_mem_access_get(xe);
> -
>   			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>   			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
>   						   args->width, hwe,
> @@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
>   						    0));
>   
> -			xe_device_mem_access_put(xe); /* now held by engine */
> -
>   			xe_vm_put(migrate_vm);
>   			if (IS_ERR(new)) {
>   				err = PTR_ERR(new);
