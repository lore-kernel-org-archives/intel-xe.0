Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C9C021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 23:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2007E10E2DA;
	Wed, 12 Feb 2025 23:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRb6qnO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9411E10E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739402314; x=1770938314;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qjxICTVywqCYSJ9lBrWZ5hjKHiC4myJESjyeDttsciQ=;
 b=IRb6qnO3ilnsT5MhG1tzbE6IrsC/LfRNw6hpy5OKQK8uSLLMZE0M0hYv
 v6jendPQ1jagLzk0dkLltQuQKan9PBGMkK+DOwC6Sgxv6Bs031JkeBmrO
 SyNtJf8OSWkSGVYEkGheHgKWAXQOQ6I5jvgyn8QEGr8JZRb11cW2uCQJQ
 YzfxDjNBvnGD+6pmMFiNkTPkEsAkuv0XIXisbXSVhelb5fb2Ads5bjuYC
 UZwcjnWIuu1wniFDqqOi95Dh9iLeOu0ZwHG+pf3G3cEUTiei+q+xzYzhg
 +CqlLe4SSE8PeqXjd1GnwvQsPnXovoOnTpw5RZddvQvq3XUAEVtB8kZfZ w==;
X-CSE-ConnectionGUID: ndkr5cEPT7WvT0Up3EAO0A==
X-CSE-MsgGUID: cMQbDSPHTdmdhv1zx2iYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42923300"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="42923300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:18:34 -0800
X-CSE-ConnectionGUID: wIzwGd5sScCaPWkEp50kEw==
X-CSE-MsgGUID: sXigqzffTWWiLC/m3HEQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="143805292"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 12 Feb 2025 15:18:31 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D291332EDD;
 Wed, 12 Feb 2025 23:18:29 +0000 (GMT)
Message-ID: <4ac54f6e-eed7-4f77-ad13-68ef6c078180@intel.com>
Date: Thu, 13 Feb 2025 00:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Add xe_mmio_init() initialization function
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <fd9fd363-a43a-46bb-b85a-cac565adfbcb@intel.com>
 <20250209131319.3346-1-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250209131319.3346-1-ilia.levi@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 09.02.2025 14:13, Ilia Levi wrote:
> Add a convenience function for minimal initialization of struct xe_mmio.
> This function also validates that the entirety of the provided mmio region
> is usable with struct xe_reg.
> 
> v2: Modify commit message, add kernel doc, refactor assert (Michal)
> v3: Fix off-by-one bug, add clarifying macro (Michal)
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 ++-
>  drivers/gpu/drm/xe/xe_gt.c            |  7 ++---
>  drivers/gpu/drm/xe/xe_mmio.c          | 43 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
>  4 files changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index 89716172fbb8..26d00d825454 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -10,6 +10,8 @@
>  
>  #include "compat-i915-headers/i915_reg_defs.h"
>  
> +#define XE_REG_ADDR_WIDTH	22
> +
>  /**
>   * struct xe_reg - Register definition
>   *
> @@ -21,7 +23,7 @@ struct xe_reg {
>  	union {
>  		struct {
>  			/** @addr: address */
> -			u32 addr:22;
> +			u32 addr:XE_REG_ADDR_WIDTH;
>  			/**
>  			 * @masked: register is "masked", with upper 16bits used
>  			 * to identify the bits that are updated on the lower
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 01a4a852b8f4..f10c1f5fbbe1 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -637,10 +637,9 @@ int xe_gt_init(struct xe_gt *gt)
>  void xe_gt_mmio_init(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
>  
> -	gt->mmio.regs = tile->mmio.regs;
> -	gt->mmio.regs_size = tile->mmio.regs_size;
> -	gt->mmio.tile = tile;
> +	xe_mmio_init(&gt->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>  
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> @@ -650,7 +649,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>  		gt->mmio.adj_limit = 0;
>  	}
>  
> -	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +	if (IS_SRIOV_VF(xe))
>  		gt->mmio.sriov_vf_gt = gt;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3aed849a128b..ebbed4ba7ea6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -55,7 +55,6 @@ static void tiles_fini(void *arg)
>  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  {
>  	struct xe_tile *tile;
> -	void __iomem *regs;
>  	u8 id;
>  
>  	/*
> @@ -94,13 +93,8 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  		}
>  	}
>  
> -	regs = xe->mmio.regs;
> -	for_each_tile(tile, xe, id) {
> -		tile->mmio.regs_size = SZ_4M;
> -		tile->mmio.regs = regs;
> -		tile->mmio.tile = tile;
> -		regs += tile_mmio_size;
> -	}
> +	for_each_remote_tile(tile, xe, id)
> +		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
>  }
>  
>  int xe_mmio_probe_tiles(struct xe_device *xe)
> @@ -140,13 +134,40 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  	}
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
> -	root_tile->mmio.regs_size = SZ_4M;
> -	root_tile->mmio.regs = xe->mmio.regs;
> -	root_tile->mmio.tile = root_tile;
> +	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +/**
> + * XE_MMIO_SIZE_MAX - The maximum supported size for an MMIO instance
> + *
> + * This size is limited by the number of bits dedicated to the address field in
> + * struct xe_reg. For example, with 22 bits, the address can be up to (but not
> + * including) 4 MiB (2^22 bytes). In such a case, the xe_mmio read/write
> + * operations are not possible past those 4 MiB; therefore, it makes no sense
> + * for the MMIO region to be larger than 4 MiB.
> + */
> +#define XE_MMIO_SIZE_MAX	BIT(XE_REG_ADDR_WIDTH)

I'm not sure that we need yet another macro that additionally hides the
real size definition behind undocumented macro that holds number of
bits, as this makes documentation here, which directly refers to 4MB,
little disconnected

why not just rely on single definition from xe_reg_defs.h that could be
explicitly defined as size and documented as something like:

/**
 * XE_REG_ADDR_MAX - The maximum supported MMIO register address
 *
 * This macro specifies the largest MMIO register offset supported
 * by the struct xe_reg and functions based on struct xe_mmio.
 *
 * Currently this is defined as 4 MiB.
 */
#define XE_REG_ADDR_MAX		SZ_4M

note that current implementation of xe_reg already implies our 4MB
limit, it's just harder to get that size from:

	u32 addr:22;

hence a need for the separate macro, but it can be still defined as
"size" not as "bits" to make it more clear to understand, and only
convert that back to bits in struct xe_reg.addr as required by C.

Michal

btw, we can also mention in the commit message

	Bspec: 63834

to make it super clear where this 4MB limit comes from

> +
> +/**
> + * xe_mmio_init() - Initialize an MMIO instance
> + * @mmio: Pointer to the MMIO instance to initialize
> + * @tile: The tile to which the MMIO region belongs
> + * @ptr: Pointer to the start of the MMIO region
> + * @size: The size of the MMIO region in bytes
> + *
> + * This is a convenience function for minimal initialization of struct xe_mmio.
> + */
> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
> +{
> +	xe_tile_assert(tile, size <= XE_MMIO_SIZE_MAX);
> +
> +	mmio->regs = ptr;
> +	mmio->regs_size = size;
> +	mmio->tile = tile;
> +}
> +
>  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  {
>  #define DUMMY_REG_OFFSET	0x130030
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index b32e7ee4b23e..c151ba569003 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -14,6 +14,8 @@ struct xe_reg;
>  int xe_mmio_probe_early(struct xe_device *xe);
>  int xe_mmio_probe_tiles(struct xe_device *xe);
>  
> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size);
> +
>  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>  u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>  void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);

