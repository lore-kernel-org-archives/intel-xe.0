Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95273C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 12:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5902910E09C;
	Thu, 11 May 2023 12:20:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C9D10E0EA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683807639; x=1715343639;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S8txwB1xeop2IbFlr1vMMWs4HamA37uMcW3YhD/vln0=;
 b=h7bbOX/1kW7pDRtqN2Vi+85bB5pigIl3rEB5o+3fXGfirLBGiom6bIlP
 pSQXr7o7SfENty5jc0NE+GnbLS6IUlSD0rs2mdI8zDK9TmBNhJyxxhFfn
 KZpoqKqsZZJP89deGCJ8I0yN0dv4MjksePt7JXi2KMT2pRaDCbaUyCeME
 GwvlnAnzwnpdolaMBcMEFmXHezu7R12fHNdU0YUr49XA1yrjuHf1vyWSd
 1hg+5EuTY+m5MclNsOkhVWXlXV7C0iZAt0/tYgiF8SG7/59GmJW9l3VC9
 HAkP1VXQilUKazj9aK/kUnK8FAPV1/5/uea7fWJRfS2Y4untt3OQ2s4z+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352692474"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="352692474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873960810"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="873960810"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:20:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230511034722.1929038-6-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-6-matthew.d.roper@intel.com>
Date: Thu, 11 May 2023 15:20:35 +0300
Message-ID: <87v8gzkqjw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 05/26] drm/xe: Move register MMIO into xe_tile
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 10 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> Each tile has its own register region in the BAR, containing instances
> of all registers for the platform.  In contrast, the multiple GTs within
> a tile share the same MMIO space; there's just a small subset of
> registers (the GSI registers) which have multiple copies at different
> offsets (0x0 for primary GT, 0x380000 for media GT).  Move the register
> MMIO region size/pointers to the tile structure, leaving just the GSI
> offset information in the GT structure.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h      | 16 ++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.c              |  3 ++-
>  drivers/gpu/drm/xe/xe_gt_types.h          |  9 +++-----
>  drivers/gpu/drm/xe/xe_mmio.c              | 26 ++++++++++++-----------
>  drivers/gpu/drm/xe/xe_mmio.h              | 21 +++++++++++++-----
>  6 files changed, 52 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> index afde97b6faa6..a9cbd7b59360 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> @@ -920,7 +920,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
>  
>  void gen11_display_irq_handler(struct drm_i915_private *i915)
>  {
> -	void __iomem * const regs = to_gt(i915)->mmio.regs;
> +	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;

Side note, I'm hoping to merge [1] into i915, backport (or rebase) that
into xe, nuking ext/i915_irq.c completely.

IDK if that means adding new ifdefs in the display irq file, or how we
could abstract this in a way that doesn't require changes in i915
display code.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/117344/



>  	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5dcf1695925f..2481b2045284 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -80,6 +80,22 @@ struct xe_tile {
>  	struct xe_gt primary_gt;
>  
>  	/* TODO: Add media GT here */
> +
> +	/**
> +	 * @mmio: MMIO info for a tile.
> +	 *
> +	 * Each tile has its own 16MB space in BAR0, laid out as:
> +	 * * 0-4MB: registers
> +	 * * 4MB-8MB: reserved
> +	 * * 8MB-16MB: global GTT
> +	 */
> +	struct {
> +		/** @size: size of tile's MMIO space */
> +		size_t size;
> +
> +		/** @regs: pointer to tile's MMIO space (starting with registers) */
> +		void *regs;
> +	} mmio;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 546240261e0a..200976da3dc1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -93,6 +93,7 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
>  int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
>  
> @@ -106,7 +107,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  		return -ENOMEM;
>  	}
>  
> -	ggtt->gsm = gt->mmio.regs + SZ_8M;
> +	ggtt->gsm = tile->mmio.regs + SZ_8M;
>  	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>  
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index c4376d50786b..03dd625b2781 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -124,14 +124,11 @@ struct xe_gt {
>  	} info;
>  
>  	/**
> -	 * @mmio: mmio info for GT, can be subset of the global device mmio
> -	 * space
> +	 * @mmio: mmio info for GT.  All GTs within a tile share the same
> +	 * register space, but have their own copy of GSI registers at a
> +	 * specific offset, as well as their own forcewake handling.
>  	 */
>  	struct {
> -		/** @size: size of MMIO space on GT */
> -		size_t size;
> -		/** @regs: pointer to MMIO space on GT */
> -		void *regs;
>  		/** @fw: force wake for GT */
>  		struct xe_force_wake fw;
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 254b4a63d901..54fa1212fcd9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -307,6 +307,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  
>  	if (xe->info.tile_count > 1) {
>  		const int mmio_bar = 0;
> +		struct xe_tile *tile;
>  		size_t size;
>  		void *regs;
>  
> @@ -320,11 +321,11 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  		size = xe->mmio.size / adj_tile_count;
>  		regs = xe->mmio.regs;
>  
> -		for_each_gt(gt, xe, id) {
> -			if (id && !xe_gt_is_media_type(gt))
> -				regs += size;
> -			gt->mmio.size = size;
> -			gt->mmio.regs = regs;
> +		for_each_tile(tile, xe, id) {
> +			tile->mmio.size = size;
> +			tile->mmio.regs = regs;
> +
> +			regs += size;
>  		}
>  	}
>  }
> @@ -340,15 +341,16 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  
>  int xe_mmio_init(struct xe_device *xe)
>  {
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  	const int mmio_bar = 0;
>  	int err;
>  
>  	/*
> -	 * Map the entire BAR, which includes registers (0-4MB), reserved space
> -	 * (4MB-8MB), and GGTT (8MB-16MB). Other parts of the driver (GTs,
> -	 * GGTTs) will derive the pointers they need from the mapping in the
> -	 * device structure.
> +	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> +	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
> +	 * This will get remapped later if we determine that we're running
> +	 * on a multi-tile system.
>  	 */
>  	xe->mmio.size = SZ_16M;
>  	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
> @@ -362,9 +364,9 @@ int xe_mmio_init(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	/* 1 GT for now, 1 to 1 mapping, may change on multi-GT devices */
> -	gt->mmio.size = xe->mmio.size;
> -	gt->mmio.regs = xe->mmio.regs;
> +	/* Setup first tile; other tiles (if present) will be setup later. */
> +	root_tile->mmio.size = xe->mmio.size;
> +	root_tile->mmio.regs = xe->mmio.regs;
>  
>  	/*
>  	 * The boot firmware initializes local memory and assesses its health.
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 1407f1189b0d..acf0b18f3111 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -10,6 +10,7 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  
>  struct drm_device;
> @@ -20,27 +21,33 @@ int xe_mmio_init(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readb(gt->mmio.regs + reg.addr);
> +	return readb(tile->mmio.regs + reg.addr);
>  }
>  
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   struct xe_reg reg, u32 val)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	writel(val, gt->mmio.regs + reg.addr);
> +	writel(val, tile->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readl(gt->mmio.regs + reg.addr);
> +	return readl(tile->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> @@ -58,18 +65,22 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>  static inline void xe_mmio_write64(struct xe_gt *gt,
>  				   struct xe_reg reg, u64 val)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	writeq(val, gt->mmio.regs + reg.addr);
> +	writeq(val, tile->mmio.regs + reg.addr);
>  }
>  
>  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -	return readq(gt->mmio.regs + reg.addr);
> +	return readq(tile->mmio.regs + reg.addr);
>  }
>  
>  static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,

-- 
Jani Nikula, Intel Open Source Graphics Center
