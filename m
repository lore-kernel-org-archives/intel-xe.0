Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B6C77B60
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 09:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FAB10E3B6;
	Fri, 28 Apr 2023 09:48:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87310E3B6
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682675322; x=1714211322;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4aa50w5HFtCwwzGK4sp2A5n3rmOsRp+VtSIO2hKf5OY=;
 b=hU912AeVJvmelmc7MxaSmT+8yfUk+dgkl5nvXPcCFLNr7hhY5N2SJ0iC
 qkEk6tWJle9pFNJIIJL1yhDfuEz1GRV2ifftNABHX5UuT5iBV1u3oItFS
 hGqvz8bQBdaUcn6GLHW3F9q08uXx2iGbIYGzxwR0It2pkqv6W3FANQtwz
 820F90fW9Lr2RzE1B5oHvJoLdOpxvbhb8Qq858iB6ERwHjd6RW0+qMkCy
 1bo+pTdABZroTG/brhy2Ukgv6ZORppNwwcbRSB+KudO6es09YQerb0T/h
 ET2vbzjslUrz1TMcT79f1Mn7IOaWqF+7m/eqVsrQdJC8vusxHtLmnhFdx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327328756"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="327328756"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="645064359"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="645064359"
Received: from rgahan-mobl1.ger.corp.intel.com (HELO [10.252.11.149])
 ([10.252.11.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:48:38 -0700
Message-ID: <ad97e587-4d4b-4c02-c595-a1beb8eb8a64@intel.com>
Date: Fri, 28 Apr 2023 10:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230427195213.3958260-1-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230427195213.3958260-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Simplify rebar sizing
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
Cc: himal.prasad.ghimiray@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 27/04/2023 20:52, Michael J. Ruhl wrote:
> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
> size to the maximum available.
> 
> Allow for specific sizing as well.
> 
> Update associated code for consistency.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h   |  12 +--
>   drivers/gpu/drm/xe/xe_migrate.c        |   2 +-
>   drivers/gpu/drm/xe/xe_mmio.c           | 130 +++++++++++--------------
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  16 +--
>   4 files changed, 69 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1cb404e48aaa..24dc5d2e9e05 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -194,14 +194,14 @@ struct xe_device {
>   			 * @io_size: IO size of VRAM.
>   			 *
>   			 * This represents how much of VRAM we can access via
> -			 * the CPU through the VRAM BAR. This can be smaller
> -			 * than @size, in which case only part of VRAM is CPU
> -			 * accessible (typically the first 256M). This
> -			 * configuration is known as small-bar.
> +			 * the CPU through the VRAM BAR.
> +			 * On systems that do not support large BAR IO space,
> +			 * this can be smaller than the actual memory size, in
> +			 * which case only part of VRAM is CPU accessible
> +			 * (typically the first 256M).  This configuration is
> +			 * known as small-bar.
>   			 */
>   			resource_size_t io_size;
> -			/** @size: Total size of VRAM */
> -			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
>   		} vram;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f40f47ccb76f..a1d507db0098 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -270,7 +270,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>   		 * Use 1GB pages, it shouldn't matter the physical amount of
>   		 * vram is less, when we don't access it.
>   		 */
> -		for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8)
> +		for (pos = 0; pos < xe->mem.vram.io_size; pos += SZ_1G, ofs += 8)
>   			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5536f84682c0..6c1591a4f43e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2021 Intel Corporation
> + * Copyright © 2021-2023 Intel Corporation
>    */
>   
>   #include "xe_mmio.h"
> @@ -21,6 +21,8 @@
>   #define TILE_COUNT		REG_GENMASK(15, 8)
>   #define GEN12_LMEM_BAR		2
>   
> +#define BAR_SIZE_SHIFT 20
> +
>   static int xe_set_dma_info(struct xe_device *xe)
>   {
>   	unsigned int mask_size = xe->info.dma_mask_size;
> @@ -61,50 +63,65 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>   	if (ret) {
>   		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>   			 resno, 1 << bar_size, ERR_PTR(ret));
> -		return -1;
> +		return ret;
>   	}
>   
>   	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> -	return 1;
> +	return ret;
>   }
>   
> -static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> +/*
> + * if force_vram_bar_size is set, attempt to set to the requested size
> + * else set to maximum possible size
> + */
> +static int xe_resize_vram_bar(struct xe_device *xe)
>   {
> +	u64 force_vram_bar_size = xe_force_vram_bar_size;
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct pci_bus *root = pdev->bus;
> -	struct resource *root_res;
> -	resource_size_t rebar_size;
>   	resource_size_t current_size;
> +	resource_size_t rebar_size;
> +	struct resource *root_res;
> +	u32 bar_sizes;
>   	u32 pci_cmd;
>   	int i;
>   	int ret;
> -	u64 force_vram_bar_size = xe_force_vram_bar_size;
>   
> -	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
> +	/* gather some relevant info */
> +	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> +	bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
> +
> +	if (!bar_sizes)
> +		return 0;
>   
> +	/* set to a specific size? */
>   	if (force_vram_bar_size) {
> -		u32 bar_sizes;
> +		u32 bar_size;
>   
>   		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> -		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>   
> -		if (rebar_size == current_size)
> -			return 0;
> +		bar_size = bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size));
>   
> -		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
> -		    rebar_size >= roundup_pow_of_two(vram_size)) {
> -			rebar_size = vram_size;
> +		if (!bar_size) {
>   			drm_info(&xe->drm,
> -				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
> -				 (u64)vram_size >> 20);
> +				 "Requested size: 0x%llx is not supported by rebar sizes: 0x%x. Leaving default: 0x%llx\n",
> +				 (u64)rebar_size >> 2, bar_sizes, (u64)current_size >> 20);
> +			return 0;
>   		}
> +
> +		rebar_size = 1ULL << (bar_size + BAR_SIZE_SHIFT);
> +
> +		if (rebar_size == current_size)
> +			return 0;
>   	} else {
> -		rebar_size = current_size;
> +		rebar_size = 1ULL << (__fls(bar_sizes) + BAR_SIZE_SHIFT);
>   
> -		if (rebar_size != roundup_pow_of_two(vram_size))
> -			rebar_size = vram_size;
> -		else
> +		/* only resize if larger than current */
> +		if (rebar_size <= current_size) {
> +			drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual size: 0x%llx\n",
> +				 rebar_size, current_size);
>   			return 0;
> +		}
>   	}
>   
>   	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
> @@ -148,49 +165,39 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>   	return true;
>   }
>   
> -int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
> +int xe_determine_lmem_bar_size(struct xe_device *xe)
>   {
> -	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	int err;
> -	u32 reg;
>   
> -	if (!xe->info.has_flat_ccs)  {
> -		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -		if (usable_size)
> -			*usable_size = min(*vram_size, xe_mmio_read64(gt, GEN12_GSMBASE.reg));
> -		return 0;
> +	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> +		drm_err(&xe->drm, "pci resource is not valid\n");
> +		return -ENXIO;
>   	}
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	err = xe_resize_vram_bar(xe);
>   	if (err)
>   		return err;
>   
> -	reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE0_ADDR_RANGE);
> -	*vram_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> -	if (usable_size) {
> -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> -		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> -		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
> -			 *vram_size, *usable_size);
> -	}
> +	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> +	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> +	if (!xe->mem.vram.io_size)
> +		return -EIO;
> +
> +	/* set up a map to the total memory area. */
> +	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>   
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	return 0;
>   }
>   
>   int xe_mmio_probe_vram(struct xe_device *xe)
>   {
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct xe_gt *gt;
> -	u8 id;
> -	u64 vram_size;
> -	u64 original_size;
> -	u64 usable_size;
>   	int err;
> +	u8 id;
>   
>   	if (!IS_DGFX(xe)) {
>   		xe->mem.vram.mapping = 0;
> -		xe->mem.vram.size = 0;
>   		xe->mem.vram.io_start = 0;
>   		xe->mem.vram.io_size = 0;
>   
> @@ -203,35 +210,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		return 0;
>   	}
>   
> -	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> -		return -ENXIO;
> -	}
> -
> -	gt = xe_device_get_gt(xe, 0);
> -	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -
> -	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);

I don't think we can remove this without breaking stuff. It is fixed 
again in a later patch, but ideally each patch should be functional. Is 
it possible to limit the changes to the BAR stuff in this patch? Or 
re-order the series slightly?

> +	err = xe_determine_lmem_bar_size(xe);
>   	if (err)
>   		return err;
>   
> -	xe_resize_vram_bar(xe, vram_size);
> -	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> -	xe->mem.vram.io_size = min(usable_size,
> -				   pci_resource_len(pdev, GEN12_LMEM_BAR));
> -	xe->mem.vram.size = xe->mem.vram.io_size;
> -
> -	if (!xe->mem.vram.size)
> -		return -EIO;
> -
> -	if (usable_size > xe->mem.vram.io_size)
> -		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
> -			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size >> 20);
> -
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> -	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
> -
> -	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &xe->mem.vram.io_size);
>   
>   	/* FIXME: Assuming equally partitioned VRAM, incorrect */
>   	if (xe->info.tile_count > 1) {
> @@ -244,7 +228,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   
>   		XE_BUG_ON(!adj_tile_count);
>   
> -		size = xe->mem.vram.size / adj_tile_count;
> +		size = xe->mem.vram.io_size / adj_tile_count;
>   		io_start = xe->mem.vram.io_start;
>   		io_size = xe->mem.vram.io_size;
>   
> @@ -277,7 +261,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   				 &gt->mem.vram.size);
>   		}
>   	} else {
> -		gt->mem.vram.size = xe->mem.vram.size;
> +		gt->mem.vram.size = xe->mem.vram.io_size;
>   		gt->mem.vram.io_start = xe->mem.vram.io_start;
>   		gt->mem.vram.io_size = xe->mem.vram.io_size;
>   		gt->mem.vram.mapping = xe->mem.vram.mapping;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 31887fec1073..9136c035db0e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -53,25 +53,19 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>   
>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   {
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_gt *gt = to_gt(xe);
>   	u64 vram_size, stolen_size;
> -	int err;
>   
> -	err = xe_mmio_total_vram_size(xe, &vram_size, NULL);
> -	if (err) {
> -		drm_info(&xe->drm, "Querying total vram size failed\n");
> -		return 0;
> -	}
> +	vram_size = xe->mem.vram.io_size;
>   
>   	/* Use DSM base address instead for stolen memory */
> -	mgr->stolen_base = xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
> +	mgr->stolen_base = xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
>   	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
>   		return 0;
>   
>   	stolen_size = vram_size - mgr->stolen_base;
> -	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, 2))
> -		mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
> +
> +	if (mgr->stolen_base + stolen_size <= vram_size)
> +		mgr->io_base = xe->mem.vram.io_start + mgr->stolen_base;
>   
>   	/*
>   	 * There may be few KB of platform dependent reserved memory at the end
