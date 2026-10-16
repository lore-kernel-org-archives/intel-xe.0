Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5086CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0D5112738;
	Fri, 16 Oct 2026 10:41:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71253112738
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792147257; x=1823683257;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=l8rG1plIOFxjT7hYjdc9Ehlm3jGolpJUH3M/msSotrs=;
 b=NfyRQcjeJejBHVxxvteWICof4GEIUQyrzxDGFTl23EwlGf/y0IEwhC5d
 FtHiAlbsXcTutUmsPUrODoDJOvG8JnXFXGviX6VR0ZjQ13uC5ioZQZwxd
 bXtCWKySIOWyjYqyirBbUU01WVX0oWURoW4ILBsgO4FhIyiOrgkcJ+NB8
 BASbWl39VCneXCUGgvoVlKBfOIv9zvBKY9wcqjHD6Dq0DVKqrlbGCpjHk
 MLhUqCNpTtpyraeGqsn1TDUK1mWyo4DBP5wTMYgsEExiQ1vNYteHJGpR+
 yXPl0Db6ly9XKsD+DE4xEe4e362t4gS2uUcdzmEB9y1NLEG4KpthfWsKD g==;
X-CSE-ConnectionGUID: HSy5qThHSAOQKllsYbDP7Q==
X-CSE-MsgGUID: ShwzdpaKRyuyhtJWRiN6xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="834134"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="834134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:40:57 -0700
X-CSE-ConnectionGUID: DpHDFr0HQ0K+/c+IybBDcA==
X-CSE-MsgGUID: Wql9Hcd3S/2UlpB46z4GLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1909052"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.33])
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:40:56 -0700
Message-ID: <55cee314-d5e9-44b7-98c4-8989bff2ce14@intel.com>
Date: Fri, 16 Oct 2026 11:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe: Favor evicting WB-cached BOs within each
 priority band
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20260731022439.2446486-1-matthew.brost@intel.com>
 <20260731022439.2446486-9-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260731022439.2446486-9-matthew.brost@intel.com>
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

On 31/07/2026 03:24, Matthew Brost wrote:
> Split each of the four logical XE_BO_PRIORITY_* bands into two adjacent
> TTM LRU priorities, using the now-doubled TTM_MAX_BO_PRIORITY (8). Within
> a band, buffer objects whose system-memory backing uses write-back (WB)
> CPU caching are placed at the lower (evicted-first) of the two actual
> priorities, while everything else - VRAM residents, write-combined/
> uncached system memory, and kernel BOs - lands at the higher one.
> 
> Evicting a WB-cached BO is comparatively cheap since its contents are
> already coherent with the CPU cache, so preferring these BOs for
> eviction over otherwise equal-priority peers reduces the odds of having
> to evict a more expensive placement first. This distinction has no
> meaning for VRAM-only BOs, which always land in the higher of the two
> priorities in their band.

I think this will also implicitly favour non-compressed buffers over 
compressed buffers on platforms like lnl+, given that all compressed 
buffers are also WC. Might be worth mentioning that in the commit. Not 
sure if that is intentional, but is maybe an interesting idea, since 
compressed buffers require a GPU blit + device wakeup, while 
non-compressed buffers just need a CPU copy, so are technically cheaper 
to evict. But on newer platforms you can technicaly now do WB + 
compression so we added a bo flag so userspace can tell us if there is 
potentially compression, but this is also useful when you have WC + 
no-compression on lnl.

Would it make sense to account for this by checking 
XE_BO_FLAG_NO_COMPRESSION somehow? Just thinking out loud.

> 
> Add xe_bo_ttm_priority() to encode a logical band and a BO into the
> actual, stored bo::ttm.priority as (band << 1) | !favor_evict, and
> XE_BO_PRIORITY_BAND() to recover the logical band from a previously
> encoded priority. Update all existing readers/writers of bo->ttm.priority
> (xe_bo_init_locked(), xe_bo_update_ttm_priority(), xe_vma_destroy(),
> xe_vma_update_bo_priority(), xe_vm_update_bo_priority(), and
> __xe_shrinker_walk()'s purge early-exit) to go through these helpers so
> they keep operating on logical bands.
> 
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       |  4 ++--
>   drivers/gpu/drm/xe/xe_bo.h       | 34 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo_types.h | 14 ++++++++++++-
>   drivers/gpu/drm/xe/xe_shrinker.c |  3 ++-
>   drivers/gpu/drm/xe/xe_vm.c       | 17 ++++++++++------
>   5 files changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2669c487b778..b3d77ee44746 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2413,9 +2413,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>   	bo->cpu_caching = cpu_caching;
>   	bo->ttm.base.funcs = &xe_gem_object_funcs;
>   	if (type != ttm_bo_type_device || !vm)
> -		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
> +		bo->ttm.priority = xe_bo_ttm_priority(XE_BO_PRIORITY_HIGHEST, bo);
>   	else
> -		bo->ttm.priority = xe_vm_bo_priority(vm);
> +		bo->ttm.priority = xe_bo_ttm_priority(xe_vm_bo_priority(vm), bo);
>   	INIT_LIST_HEAD(&bo->pinned_link);
>   #ifdef CONFIG_PROC_FS
>   	INIT_LIST_HEAD(&bo->client_link);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6506001730ab..ab15d0909832 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -8,6 +8,8 @@
>   
>   #include <drm/ttm/ttm_tt.h>
>   
> +#include <uapi/drm/xe_drm.h>
> +
>   #include "xe_bo_types.h"
>   #include "xe_ggtt.h"
>   #include "xe_macros.h"
> @@ -164,6 +166,38 @@ static inline struct xe_bo *gem_to_xe_bo(const struct drm_gem_object *obj)
>   
>   #define xe_bo_device(bo) ttm_to_xe_device((bo)->ttm.bdev)
>   
> +/**
> + * xe_bo_ttm_priority() - Encode a BO's actual TTM LRU priority
> + * @band: The logical priority band to use, one of the XE_BO_PRIORITY_*
> + * defines.
> + * @bo: The buffer object @band is to be applied to.
> + *
> + * Each logical priority band is split into two adjacent, actual TTM LRU
> + * priorities: a lower one, favored for eviction, for @bo's whose system
> + * memory backing store uses write-back (WB) CPU caching, and a higher one
> + * for everything else (VRAM residents, write-combined/uncached system
> + * memory, and kernel BOs with no cpu_caching set at all). Evicting a
> + * WB-cached BO is comparatively cheap, since its contents are already
> + * coherent with the CPU cache, so preferring them for eviction over
> + * otherwise equal-priority peers reduces the odds of having to evict a
> + * more expensive placement first. This distinction is meaningless for
> + * VRAM-only BOs, which naturally always fall into the higher of the two
> + * priorities within their band.
> + *
> + * Return: The actual TTM LRU priority to use for @bo, suitable for storing
> + * directly into bo::ttm.priority. Use XE_BO_PRIORITY_BAND() to recover the
> + * logical band from a previously encoded priority.
> + */
> +static inline unsigned int xe_bo_ttm_priority(unsigned int band, const struct xe_bo *bo)
> +{
> +	bool favor_evict = bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB;
> +
> +	BUILD_BUG_ON(XE_BO_PRIORITY_NUM_BANDS * 2 != TTM_MAX_BO_PRIORITY);
> +	xe_assert(xe_bo_device(bo), band < XE_BO_PRIORITY_NUM_BANDS);
> +
> +	return (band << 1) | !favor_evict;
> +}
> +
>   static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>   {
>   	if (bo)
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 7b02552652d3..dfbce9e5b8e8 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -23,11 +23,23 @@ struct xe_vm;
>   
>   #define XE_BO_MAX_PLACEMENTS	3
>   
> -/* TODO: To be selected with VM_MADVISE */
> +/*
> + * TODO: To be selected with VM_MADVISE
> + *
> + * These are logical TTM LRU priority *bands*; each is further split into
> + * two actual TTM LRU priorities by xe_bo_ttm_priority(), to favor evicting
> + * write-back (WB) cached system-memory BOs ahead of their otherwise
> + * equal-priority peers within the same band, see xe_bo_ttm_priority().
> + * Use XE_BO_PRIORITY_BAND() to recover the logical band from a BO's actual,
> + * encoded bo->ttm.priority.
> + */
>   #define	XE_BO_PRIORITY_LOW	0
>   #define	XE_BO_PRIORITY_NORMAL	1
>   #define	XE_BO_PRIORITY_HIGH	2
>   #define	XE_BO_PRIORITY_HIGHEST	3
> +#define	XE_BO_PRIORITY_NUM_BANDS	4
> +
> +#define XE_BO_PRIORITY_BAND(ttm_priority) ((ttm_priority) >> 1)
>   
>   /**
>    * struct xe_bo - Xe buffer object
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 81895b587b56..682594baa17a 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -84,7 +84,8 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
>   			 * rather than walking (and trylocking) BOs that can
>   			 * never satisfy this pass.
>   			 */
> -			if (flags.purge && ttm_bo->priority > XE_BO_PRIORITY_LOW)
> +			if (flags.purge &&
> +			    XE_BO_PRIORITY_BAND(ttm_bo->priority) > XE_BO_PRIORITY_LOW)
>   				break;
>   
>   			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1be367b1c671..93d19bd0a8e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1235,7 +1235,8 @@ static void vma_destroy_cb(struct dma_fence *fence,
>   /**
>    * xe_bo_update_ttm_priority() - Change a BO's TTM LRU priority
>    * @bo: The buffer object
> - * @priority: The new TTM LRU priority, one of the XE_BO_PRIORITY_* levels
> + * @priority: The new TTM LRU priority band, one of the XE_BO_PRIORITY_*
> + * levels
>    *
>    * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move set to
>    * their VM's LRU bulk-move range (see xe_bo_init_locked()), which tracks a
> @@ -1248,6 +1249,9 @@ static void vma_destroy_cb(struct dma_fence *fence,
>    * its bulk-move range moves it with a plain, non-bulk LRU update instead,
>    * and reattaching afterwards re-inserts it into the new priority's bucket.
>    *
> + * @priority is a logical priority band; see xe_bo_ttm_priority() for how it
> + * is translated into @bo's actual, stored bo::ttm.priority.
> + *
>    * Context: Caller must hold @bo's dma-resv lock.
>    */
>   void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
> @@ -1256,12 +1260,12 @@ void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (bo->ttm.priority == priority)
> +	if (XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
>   		return;
>   
>   	if (bulk)
>   		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> -	bo->ttm.priority = priority;
> +	bo->ttm.priority = xe_bo_ttm_priority(priority, bo);
>   	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>   	if (bulk)
>   		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> @@ -1300,7 +1304,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   		 */
>   		if (!drm_gem_is_imported(&bo->ttm.base) &&
>   		    !bo->purgeable.vma_count &&
> -		    bo->ttm.priority != XE_BO_PRIORITY_LOW)
> +		    XE_BO_PRIORITY_BAND(bo->ttm.priority) != XE_BO_PRIORITY_LOW)
>   			xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
>   	}
>   
> @@ -3622,7 +3626,7 @@ void xe_vma_update_bo_priority(struct xe_vma *vma)
>   	xe_assert(vm->xe, !bo->vm || bo->vm == vm);
>   
>   	priority = bo->vm ? xe_vm_bo_priority(vm) : XE_BO_PRIORITY_HIGHEST;
> -	if (bo->ttm.priority == priority)
> +	if (XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
>   		return;
>   
>   	xe_bo_assert_held(bo);
> @@ -5132,7 +5136,8 @@ static void xe_vm_update_bo_priority(struct xe_vm *vm, int priority)
>   		struct xe_vma *vma = gpuva_to_vma(gpuva);
>   		struct xe_bo *bo = xe_vma_bo(vma);
>   
> -		if (!bo || bo->vm != vm || bo->ttm.priority == priority)
> +		if (!bo || bo->vm != vm ||
> +		    XE_BO_PRIORITY_BAND(bo->ttm.priority) == priority)
>   			continue;
>   
>   		xe_bo_update_ttm_priority(bo, priority);

