Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24F8C3ABC5
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 11:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9278510E8E7;
	Thu,  8 May 2025 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwYDhZwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11310E8E7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746705039; x=1778241039;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ajkPMAqv2c6xD2KbCjc2fcFK6htg9kGtFuEmAUvzJbg=;
 b=MwYDhZwYJyMntVGLqwO5jigRHHiJT2Gz/u4svkWDTN1d/orItBR7WdOc
 /0pEzDUUPBw9El7T5RMSIddgZYGargoMO9FVK6h3jXeT/0UsC5sI4Z3QF
 21vBK/krqE+XRLHmmUF103hX+2LVcAimvEDODmrOfSE+JLWtX1j6rChrf
 Fhgb5L5I+bEo4CdAfFbYQtHdTiOqSQG0b7oeUW3l45R0e60qAdaTCWhDJ
 D0fyVluqig0YrOKV9GS/fEjMGjeZhQioheZeQwB0JcglFC3/nXzLU+2IY
 0eigUrjp2wu1t/dz26cESHWJr+jRuCufdmVv6l8QyDaw+z0A2a8MRrVJT Q==;
X-CSE-ConnectionGUID: 9VnbTfkHTqOQZ4DxzNDstQ==
X-CSE-MsgGUID: AOwUhcFOSj+j1QyOVsmudQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48631465"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48631465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:50:39 -0700
X-CSE-ConnectionGUID: T2rVc6sdS7qk7rtXpnpXNA==
X-CSE-MsgGUID: N3BuW2GCRfWqilDd1WfexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="135975699"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.213])
 ([10.245.245.213])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:50:38 -0700
Message-ID: <763f8ea8-0055-4f75-8419-f42aa51028eb@intel.com>
Date: Thu, 8 May 2025 12:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Make the gem shrinker drm managed
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250508113015.3374-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250508113015.3374-1-thomas.hellstrom@linux.intel.com>
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

On 08/05/2025 12:30, Thomas Hellström wrote:
> Make the xe drm shrinker drm managed like many other resources
> created at device creation time.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c   |  9 +++-----
>   drivers/gpu/drm/xe/xe_shrinker.c | 37 ++++++++++++++++----------------
>   drivers/gpu/drm/xe/xe_shrinker.h |  4 +---
>   3 files changed, 22 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c02c4c4e9412..399ae5f40321 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -402,9 +402,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   	if (xe->unordered_wq)
>   		destroy_workqueue(xe->unordered_wq);
>   
> -	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
> -		xe_shrinker_destroy(xe->mem.shrinker);
> -
>   	if (xe->destroy_wq)
>   		destroy_workqueue(xe->destroy_wq);
>   
> @@ -438,9 +435,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (err)
>   		goto err;
>   
> -	xe->mem.shrinker = xe_shrinker_create(xe);
> -	if (IS_ERR(xe->mem.shrinker))
> -		return ERR_CAST(xe->mem.shrinker);
> +	err = xe_shrinker_create(xe);
> +	if (err)
> +		goto err;
>   
>   	xe->info.devid = pdev->device;
>   	xe->info.revid = pdev->revision;
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 86d47aaf0358..125c836e0ee4 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/shrinker.h>
>   
> +#include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_backup.h>
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_tt.h>
> @@ -213,24 +214,34 @@ static void xe_shrinker_pm(struct work_struct *work)
>   	xe_pm_runtime_put(shrinker->xe);
>   }
>   
> +static void xe_shrinker_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_shrinker *shrinker = arg;
> +
> +	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> +	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> +	shrinker_free(shrinker->shrink);
> +	flush_work(&shrinker->pm_worker);

As an aside, would it make sense of us to cut over to async rpm get 
instead of having to do something similar by hand? IIRC it also does 
some more fancy stuff under the hood which might be beneficial.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	kfree(shrinker);
> +}
> +
>   /**
>    * xe_shrinker_create() - Create an xe per-device shrinker
>    * @xe: Pointer to the xe device.
>    *
> - * Returns: A pointer to the created shrinker on success,
> - * Negative error code on failure.
> + * Return: %0 on success. Negative error code on failure.
>    */
> -struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
> +int xe_shrinker_create(struct xe_device *xe)
>   {
>   	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
>   
>   	if (!shrinker)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>   
>   	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
>   	if (!shrinker->shrink) {
>   		kfree(shrinker);
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>   	}
>   
>   	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> @@ -240,19 +251,7 @@ struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
>   	shrinker->shrink->scan_objects = xe_shrinker_scan;
>   	shrinker->shrink->private_data = shrinker;
>   	shrinker_register(shrinker->shrink);
> +	xe->mem.shrinker = shrinker;
>   
> -	return shrinker;
> -}
> -
> -/**
> - * xe_shrinker_destroy() - Destroy an xe per-device shrinker
> - * @shrinker: Pointer to the shrinker to destroy.
> - */
> -void xe_shrinker_destroy(struct xe_shrinker *shrinker)
> -{
> -	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> -	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> -	shrinker_free(shrinker->shrink);
> -	flush_work(&shrinker->pm_worker);
> -	kfree(shrinker);
> +	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
> index 28a038f4fcbf..5132ae5192e1 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -11,8 +11,6 @@ struct xe_device;
>   
>   void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
>   
> -struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
> -
> -void xe_shrinker_destroy(struct xe_shrinker *shrinker);
> +int xe_shrinker_create(struct xe_device *xe);
>   
>   #endif

