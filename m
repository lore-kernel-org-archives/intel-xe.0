Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910BFC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 19:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1F910E19E;
	Thu, 30 Jan 2025 19:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbNo/JVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D26610E19E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 19:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738266880; x=1769802880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I3JmfAT1sr3dI4ti0XpqmF5cnf2o5I9eNV2aj5mjabs=;
 b=CbNo/JVrtzHe7s82h5pCL/N7DUNc4pGiTmhOYofYQkQiJCTs864rSuze
 yarxFviqvuSPqSAtagL9oRl78GKBkTCiOnucGnC4LG6VcUOOki/Fgt1eB
 BO8OfuUmhp3NR02Gy2EpOGB7BDe+jNRa2y7umU7wmxVbB5jW8EevIafQK
 UGwHmOAgb4zlqmbXvaisbeSOZnvAcH+R6RVg4xyXeUS+w0xFYjmkbZUKO
 vJgIesKPRTi7+GhSJ1NvqDGSrD8Zfi8AQZsfLpojJzarLJKyA8zSwVsnt
 HSVp99pTkI3G9qxPSYd1NGS2yFyo+WGOUtzbqMSM780bSIZ4I4Nta2ADg A==;
X-CSE-ConnectionGUID: BR8x+DeqRVicmYdA8Gx4+A==
X-CSE-MsgGUID: 2aE7SQCBRRCCa5VdQHiqnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38992220"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38992220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 11:54:39 -0800
X-CSE-ConnectionGUID: cQOcOVKtS6moXxb/SaC51A==
X-CSE-MsgGUID: nnEWAv9sSQ2XeeQf21kzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113447785"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2025 11:54:37 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 211842FC55;
 Thu, 30 Jan 2025 19:54:35 +0000 (GMT)
Message-ID: <efc3c364-a41d-4ab6-a3bc-f1e571326712@intel.com>
Date: Thu, 30 Jan 2025 20:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add xe_mmio_init() initialization function
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20250130105057.136586-1-ilia.levi@intel.com>
 <20250130105057.136586-2-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250130105057.136586-2-ilia.levi@intel.com>
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



On 30.01.2025 11:50, Ilia Levi wrote:
> Add a convenience function for minimal initialization of struct xe_mmio.
> This function also validates that the space referred by this xe_mmio is
> small enough to be accessed with struct xe_reg.

hmm, maybe is _large_ enough ?

> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 +++-
>  drivers/gpu/drm/xe/xe_gt.c            |  7 +++----
>  drivers/gpu/drm/xe/xe_mmio.c          | 24 +++++++++++++-----------
>  drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
>  4 files changed, 21 insertions(+), 16 deletions(-)
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
> index 3aed849a128b..8cee986947bc 100644
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
> @@ -140,13 +134,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
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

missing kernel-doc for this new public function

> +void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
> +{
> +	/* Validate that we can use XE_REG macro with this xe_mmio later */
> +	xe_assert(tile_to_xe(tile), size <= (1 << (XE_REG_ADDR_WIDTH + 1)));

you can use xe_tile_assert(tile, ...) here and BIT() instead of shift

but I'm not sure I follow the logic here: if in the future we will
change xe_reg.addr to more than 22 bits to allow new extended register
definitions for new platforms, this assert will trigger when we would
initialize older platforms with smaller MMIO BAR, no?

maybe better place for such assert would be in xe_mmio_read|write():

	xe_tile_assert(mmio->tile, reg.addr < mmio->regs_size);

and likely this new assert/ADDR_WIDTH could be added in separate patch

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

