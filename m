Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E943C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 09:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D5010E751;
	Tue, 14 Mar 2023 09:53:57 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818F10E751
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678787636; x=1710323636;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Xq4Y3VMpfqE/+jqZDB1f6wuP5fStscV+oAvtX+xZXT0=;
 b=iAOTy6DDcwA++8PoTpkNNzCjUPuvJD1bE9f00t/+0ziKV2k21pL2Rbq6
 6aJV2mKB5Oh1I2othIFd0ppBdxmGqWCWDikSxjxIXEgzIHe7+A0tD/U/a
 EUDPUGERsU3p6DgKsLCDU7ZLl12il/ThkixUd19xoopsi4S1IKtpXNwxI
 1KhhVsGryaBn8GbPoXmSO2+RC1NgNE6xShTHwzOAta0PXzQCBW/HeB9Mm
 eLt4SDaMb5UaYimN3qMI+bH6gufQnilNGbHzN78Q0Qnw5W3HM6XiDsVue
 K5Bo3yHjtkFjCIfqiZ7KbXhy/iQOKOT2GVcorWDz2Ko3ou+RVc/tiKk59 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423650205"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="423650205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711459083"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="711459083"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO [10.249.254.202])
 ([10.249.254.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:53:54 -0700
Message-ID: <a4299d2e-0f0b-c525-02b5-b0d23ec60e1f@linux.intel.com>
Date: Tue, 14 Mar 2023 10:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230314085842.134239-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 2/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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


On 3/14/23 09:58, Matthew Auld wrote:
> xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
> case where stolen is not directly CPU accessible on some older
> integrated platforms, and as such a GGTT mapping was also required for
> CPU access (as per the check in xe_bo_create_pin_map_at()).
>
> However with small-bar systems on dgfx we have one more case where
> stolen is also inaccessible, however here we don't have any fallback
> GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
> make this distinction clear. In such a case the later vmap() will fail
> anyway.
>
> v2: fix kernel-doc warning
> v3: Simplify further and remove cpu_inaccessible()
>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 39 ++++++++------------------
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
>   3 files changed, 14 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3e90ea42e075..73a7f2cd4ad8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>   	u64 end = offset == ~0ull ? offset : start + size;
>   
>   	if (flags & XE_BO_CREATE_STOLEN_BIT &&
> -	    xe_ttm_stolen_cpu_inaccessible(xe))
> +	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		flags |= XE_BO_CREATE_GGTT_BIT;
>   
>   	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 27cc31f022a5..8759c13acd9b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -38,32 +38,17 @@ to_stolen_mgr(struct ttm_resource_manager *man)
>   }
>   
>   /**
> - * xe_ttm_stolen_cpu_inaccessible - Can we directly CPU access stolen memory for
> - * this device.
> + * xe_ttm_stolen_cpu_access_needs_ggtt - If we can't directly CPU access stolen,

Nit: Should be xe_ttm_stolen_cpu_access_needs_ggtt() ?

Otherwise LGTM.

/Thomas


> + * can we then fallback to mapping through the GGTT.
>    * @xe: xe device
>    *
> - * On some integrated platforms we can't directly access stolen via the CPU
> - * (like some normal system memory).  Also on small-bar systems for discrete,
> - * since stolen is always as the end of normal VRAM, and the BAR likely doesn't
> - * stretch that far. However CPU access of stolen is generally rare, and at
> - * least on discrete should not be needed.
> - *
> - * If this is indeed inaccessible then we fallback to using the GGTT mappable
> - * aperture for CPU access. On discrete platforms we have no such thing, so when
> - * later attempting to CPU map the memory an error is instead thrown.
> + * Some older integrated platforms don't support reliable CPU access for stolen,
> + * however on such hardware we can always use the mappable part of the GGTT for
> + * CPU access. Check if that's the case for this device.
>    */
> -bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>   {
> -	struct ttm_resource_manager *ttm_mgr =
> -		ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr;
> -
> -	if (!ttm_mgr)
> -		return true;
> -
> -	mgr = to_stolen_mgr(ttm_mgr);
> -
> -	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
> +	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
>   }
>   
>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> @@ -178,7 +163,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>   		    stolen_size);
>   
> -	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> +	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
>   }
>   
> @@ -191,7 +176,7 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>   
>   	XE_BUG_ON(!mgr->io_base);
>   
> -	if (!IS_DGFX(xe) && xe_ttm_stolen_cpu_inaccessible(xe))
> +	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>   
>   	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
> @@ -257,10 +242,10 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>   	if (!mgr || !mgr->io_base)
>   		return -EIO;
>   
> -	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> -		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
> -	else
> +	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		return __xe_ttm_stolen_io_mem_reserve_stolen(xe, mgr, mem);
> +	else
> +		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
>   }
>   
>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 2fda97b97a05..1777245ff810 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -14,7 +14,7 @@ struct xe_device;
>   
>   void xe_ttm_stolen_mgr_init(struct xe_device *xe);
>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
> -bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
>   
