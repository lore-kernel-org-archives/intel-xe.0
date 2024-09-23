Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF73CF9C72
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 13:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A9110E267;
	Mon, 23 Sep 2024 13:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkr5aGBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ED610E267
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727097006; x=1758633006;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KyTCQKGnZi6M1f+wKxs17uTu139rWq17Utz08kpPPsg=;
 b=kkr5aGBlchkPqNaby22o9m/6FBf+1m850RPIS1+mCuszRogEst8TgHog
 r66Dq948x69KGO6jOg9mD/9Vl2sWChHZpFOsXkSvutBXU4Wu69ewNDckU
 3a5N9zGCI9ry3N78biqNbxSSMahX/0tg7rK24eXX9uKaP0jcG9NyA1f0p
 3/knK+EYOt0sW3NT4fh0muJvdhyeil34YIKHdd0gEfSqHJaH+WnF0uvDv
 jXMwIhc4RaSFwFYBDTKgpkgDIqPoboCSCY4lLAPJ1C1kM+a4C9SNt8725
 MaRZXrOAB8JAWsF2z1ByRrLnVh9syrRM3E4OnjFul4qRWdIZYvsRlMF5F Q==;
X-CSE-ConnectionGUID: dvIAyjWVSUinHg0bz5mvmg==
X-CSE-MsgGUID: QeKHtFXJRpqeuDhccIwDug==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25993322"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25993322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 06:10:04 -0700
X-CSE-ConnectionGUID: BnQ8FM9MRSOHhRMbFoXGIQ==
X-CSE-MsgGUID: zRdLn94HSl2IyJqwJGpZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="108499630"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.234])
 ([10.245.245.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 06:10:03 -0700
Message-ID: <14d95781-5122-41dd-a4a4-5870012d3a0c@intel.com>
Date: Mon, 23 Sep 2024 14:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Clean up VM / exec queue file lock usage.
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240921011712.2681510-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240921011712.2681510-1-matthew.brost@intel.com>
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

On 21/09/2024 02:17, Matthew Brost wrote:
> Both the VM / exec queue file lock protect the lookup and reference to
> the object, nothing more. These locks are not intended anything else
> underneath them. XA have their own locking too, so no need to take the
> VM / exec queue file lock aside from when doing a lookup and reference
> get.
> 
> Add some kernel doc to make this clear and cleanup a few typos too.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  2 --
>   drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++++++---
>   drivers/gpu/drm/xe/xe_drm_client.c   |  9 ++++++++-
>   drivers/gpu/drm/xe/xe_exec_queue.c   |  2 --
>   drivers/gpu/drm/xe/xe_vm.c           |  4 ----
>   5 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cb5a9fd820cf..53dcece40fc5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -171,10 +171,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   		xe_exec_queue_kill(q);
>   		xe_exec_queue_put(q);
>   	}
> -	mutex_lock(&xef->vm.lock);
>   	xa_for_each(&xef->vm.xa, idx, vm)
>   		xe_vm_close_and_put(vm);
> -	mutex_unlock(&xef->vm.lock);
>   
>   	xe_file_put(xef);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5ad96d283a71..484fb34dde98 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -593,15 +593,23 @@ struct xe_file {
>   	struct {
>   		/** @vm.xe: xarray to store VMs */
>   		struct xarray xa;
> -		/** @vm.lock: protects file VM state */
> +		/**
> +		 * @vm.lock: Protects VM lookup + reference and removal a from
> +		 * file xarray. Not an intended to be an outer lock which does
> +		 * thing while being held.
> +		 */
>   		struct mutex lock;
>   	} vm;
>   
>   	/** @exec_queue: Submission exec queue state for file */
>   	struct {
> -		/** @exec_queue.xe: xarray to store engines */
> +		/** @exec_queue.xa: xarray to store exece queues */
>   		struct xarray xa;
> -		/** @exec_queue.lock: protects file engine state */
> +		/**
> +		 * @exec_queue.lock: Protects exec queue lookup + reference and
> +		 * removal a frommfile xarray. Not an intended to be an outer
> +		 * lock which does thing while being held.
> +		 */
>   		struct mutex lock;
>   	} exec_queue;
>   
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index c4add8b38bbd..fb52a23e28f8 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -283,8 +283,15 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   
>   	/* Accumulate all the exec queues from this client */
>   	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q)
> +	xa_for_each(&xef->exec_queue.xa, i, q) {
> +		xe_exec_queue_get(q);
> +		mutex_unlock(&xef->exec_queue.lock);
> +
>   		xe_exec_queue_update_run_ticks(q);
> +
> +		mutex_lock(&xef->exec_queue.lock);
> +		xe_exec_queue_put(q);
> +	}
>   	mutex_unlock(&xef->exec_queue.lock);
>   
>   	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7f28b7fc68d5..7743ebdcbf4b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -635,9 +635,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   		}
>   	}
>   
> -	mutex_lock(&xef->exec_queue.lock);
>   	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> -	mutex_unlock(&xef->exec_queue.lock);
>   	if (err)
>   		goto kill_exec_queue;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a3d7cb7cfd22..31fe31db3fdc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1765,9 +1765,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> -	mutex_lock(&xef->vm.lock);
>   	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
> -	mutex_unlock(&xef->vm.lock);

While reviewing this also spotted some potential uaf here and for queue:
https://patchwork.freedesktop.org/series/138995/

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	if (err)
>   		goto err_close_and_put;
>   
> @@ -1799,9 +1797,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	return 0;
>   
>   err_free_id:
> -	mutex_lock(&xef->vm.lock);
>   	xa_erase(&xef->vm.xa, id);
> -	mutex_unlock(&xef->vm.lock);
>   err_close_and_put:
>   	xe_vm_close_and_put(vm);
>   
