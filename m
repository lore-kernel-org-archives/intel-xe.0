Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53861C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 08:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18BF10E59E;
	Fri,  3 Jul 2026 08:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6oBxIH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37FA10E59E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783068358; x=1814604358;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/EwpHi6J5UJVM7ZmMt0AyaCEgH5luC7CEHQjRvGOyYI=;
 b=J6oBxIH5WseVEhugI9mPNVJS4pyfAfxx2TeeNP/F+e31O+NxAqEX/CQy
 STjUnnYU5+XflUM8cszqoyQwjDIXi3CA5l6dAoj7QhBjIcVU+z825bQAg
 4m143OLQDOU2OHBtN7SKoR0rLJOQGGRuhc62oM7owH63i6zbgP+n/xTcy
 uCq3772JTMJRoq+Fz80eixnlXdsW9AtWRDDOj7YvU0m/mutSzIH/SNIs3
 gnRIyCOBP1I0kzBiG1oe6KRI2y1jpa38VLVTtGIU6+vb74MAzCvjnb/2G
 WV8kBcQVrCPKwxk+CWf26TMdZSAobP0peklXA9F2cnsunMbxwMAeX2YAS Q==;
X-CSE-ConnectionGUID: 1s/KvfOcSN+Mki5dVfXirw==
X-CSE-MsgGUID: r5WGgpu/TTCnR4yKXy//SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101240456"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101240456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 01:45:57 -0700
X-CSE-ConnectionGUID: 8hHC5PI0TWGDRU9ej3SrmA==
X-CSE-MsgGUID: 4tpIW1sFQMuC4Nxexcsf0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="254980022"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.138])
 ([10.245.245.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 01:45:56 -0700
Message-ID: <d5c3258a-04d1-42d6-9d74-cdd9a1172d97@intel.com>
Date: Fri, 3 Jul 2026 09:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Wait on external BO kernel fences in exec IOCTL
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20260702215805.4011228-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260702215805.4011228-1-matthew.brost@intel.com>
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

On 02/07/2026 22:58, Matthew Brost wrote:
> Before arming a user job, xe_exec_ioctl() only added the VM's
> dma-resv KERNEL slot as a dependency. That slot covers rebinds and
> the kernel operations of the VM's private BOs, but not external BOs
> (bo->vm == NULL), which carry their kernel operations (evictions,
> moves, ...) in their own dma-resv KERNEL slot.
> 
> The DMA_RESV_USAGE_KERNEL slot is the cross-driver contract for
> memory management operations that must complete before the BO or its
> backing store may be used: any accessor is required to wait on the
> KERNEL fences before touching the resv. By skipping the external BOs'
> KERNEL slots, the exec path violated that contract and could schedule
> a user job while a kernel operation on an external BO mapped by the VM
> was still in flight, racing against it and potentially reading or
> writing memory that was being moved.
> 
> Replace the VM-only dependency with an iteration over every object
> locked by the exec, adding each object's KERNEL slot as a job
> dependency. This covers the VM resv (rebinds and private BOs) as well
> as every external BO, mirroring the drm_gpuvm_resv_add_fence() call
> that later publishes the job fence to the same set of objects.
> Long-running mode continues to skip this, as before.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Wow, kind of surprised we missed this.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index e05dabfcd43c..d5293bc33a67 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -292,13 +292,23 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> -	/* Wait behind rebinds */
> +	/*
> +	 * Wait behind rebinds and any kernel operations (evictions, defrag
> +	 * moves, ...) on the VM and all external BOs. The VM's private BOs
> +	 * carry their kernel ops in the VM dma-resv KERNEL slot, while each
> +	 * external BO carries them in its own dma-resv KERNEL slot; both are
> +	 * covered by iterating every object locked by the exec, mirroring the
> +	 * drm_gpuvm_resv_add_fence() below.
> +	 */
>   	if (!xe_vm_in_lr_mode(vm)) {
> -		err = xe_sched_job_add_deps(job,
> -					    xe_vm_resv(vm),
> -					    DMA_RESV_USAGE_KERNEL);
> -		if (err)
> -			goto err_put_job;
> +		struct drm_gem_object *obj;
> +
> +		drm_exec_for_each_locked_object(exec, obj) {
> +			err = xe_sched_job_add_deps(job, obj->resv,
> +						    DMA_RESV_USAGE_KERNEL);
> +			if (err)
> +				goto err_put_job;
> +		}
>   	}
>   
>   	for (i = 0; i < num_syncs && !err; i++)

