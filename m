Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D807EC77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 16:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D5610E297;
	Wed,  3 May 2023 16:06:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508210E297
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683130015; x=1714666015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ewdek8dTGNgZys+CZ+LZsUH9i0lov/RfbzEk3M1nqfk=;
 b=QqfzJXWGIQ7BTxvqIM+fQLNneYzitCjwpScqpDZv43TUWfrP9NrE4YZd
 /n64FbXANglCj5+4w32qo4X7/Wo8VhbehVWVk7OWz8o5P3pOWT6zbWdpT
 QVj+z5/YAyCiz1S+vq5p5S7wevWv0tf0XnYZjeZZHUjHbB53MfIUQyGja
 bBpZDYBFNUNGGc0aBkPOe6b9m0/O+qlKgGeJd2qnkit+DV6AZHfRaQZQ1
 6z20VY/QC6KR1B3x2ZdHrh7Lryq97lZUdqPRQ5vudJjXI7iKB9nxmrIXP
 nYaOymZACr4zLOp4eCM8wlwVcHutcvdrOnavsbaoXseUAYjQpHGG6qDgW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351670047"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="351670047"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 09:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729388367"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="729388367"
Received: from dmadorsx-mobl2.ger.corp.intel.com (HELO [10.252.12.249])
 ([10.252.12.249])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 09:04:30 -0700
Message-ID: <db6fa769-81de-d18b-7cc0-373ed33caf09@intel.com>
Date: Wed, 3 May 2023 17:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
 <20230501115826.4191472-3-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230501115826.4191472-3-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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
Cc: tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 01/05/2023 12:58, Michael J. Ruhl wrote:
> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
> size to the maximum available.
> 
> Preserve the force_vram_bar_size sizing.
> 
> Update associated code for consistency.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  14 +--
>   drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
>   drivers/gpu/drm/xe/xe_mmio.c         | 138 +++++++++++++++------------
>   3 files changed, 86 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1cb404e48aaa..2eeb10e97381 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -193,15 +193,15 @@ struct xe_device {
>   			/**
>   			 * @io_size: IO size of VRAM.
>   			 *
> -			 * This represents how much of VRAM we can access via
> -			 * the CPU through the VRAM BAR. This can be smaller
> -			 * than @size, in which case only part of VRAM is CPU
> -			 * accessible (typically the first 256M). This
> -			 * configuration is known as small-bar.
> +			 * This represents how much of VRAM the CPU can access
> +			 * via the VRAM BAR.
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
> index 7d53d382976c..7a5fce0ae7ab 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -1,8 +1,10 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2021 Intel Corporation
> + * Copyright © 2021-2023 Intel Corporation
>    */
>   
> +#include <linux/minmax.h>
> +
>   #include "xe_mmio.h"
>   
>   #include <drm/drm_managed.h>
> @@ -21,6 +23,8 @@
>   #define TILE_COUNT		REG_GENMASK(15, 8)
>   #define GEN12_LMEM_BAR		2
>   
> +#define BAR_SIZE_SHIFT 20
> +
>   static int xe_set_dma_info(struct xe_device *xe)
>   {
>   	unsigned int mask_size = xe->info.dma_mask_size;
> @@ -61,50 +65,65 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
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
> +	u32 bar_size_mask;
>   	u32 pci_cmd;
>   	int i;
>   	int ret;
> -	u64 force_vram_bar_size = xe_force_vram_bar_size;
>   
> -	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
> +	/* gather some relevant info */
> +	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>   
> +	if (!bar_size_mask)
> +		return 0;
> +
> +	/* set to a specific size? */
>   	if (force_vram_bar_size) {
> -		u32 bar_sizes;
> +		u32 bar_size_bit;
>   
>   		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> -		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>   
> -		if (rebar_size == current_size)
> -			return 0;
> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
>   
> -		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
> -		    rebar_size >= roundup_pow_of_two(vram_size)) {
> -			rebar_size = vram_size;
> +		if (!bar_size_bit) {
>   			drm_info(&xe->drm,
> -				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
> -				 (u64)vram_size >> 20);
> +				 "Requested size: 0x%llx is not supported by rebar sizes: 0x%x. Leaving default: 0x%llx\n",
> +				 (u64)rebar_size >> 2, bar_size_mask, (u64)current_size >> 20);
> +			return 0;
>   		}
> +
> +		rebar_size = 1ULL << (bar_size_bit + BAR_SIZE_SHIFT);
> +
> +		if (rebar_size == current_size)
> +			return 0;
>   	} else {
> -		rebar_size = current_size;
> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
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
> @@ -148,6 +167,31 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>   	return true;
>   }
>   
> +static int xe_determine_lmem_bar_size(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int err;
> +
> +	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> +		drm_err(&xe->drm, "pci resource is not valid\n");
> +		return -ENXIO;
> +	}
> +
> +	err = xe_resize_vram_bar(xe);
> +	if (err)
> +		return err;
> +
> +	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> +	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> +	if (!xe->mem.vram.io_size)
> +		return -EIO;
> +
> +	/* set up a map to the total memory area. */
> +	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_mmio_tile_vram_size - Collect vram size and off set information
>    * @gt: tile to get info for
> @@ -203,59 +247,33 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
>   
>   int xe_mmio_probe_vram(struct xe_device *xe)
>   {
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct xe_gt *gt;
> -	u64 original_size;
>   	u64 tile_offset;
>   	u64 tile_size;
>   	u64 vram_size;
>   	int err;
>   	u8 id;
>   
> -	if (!IS_DGFX(xe)) {
> -		xe->mem.vram.mapping = 0;
> -		xe->mem.vram.size = 0;
> -		xe->mem.vram.io_start = 0;
> -		xe->mem.vram.io_size = 0;
> -
> -		for_each_gt(gt, xe, id) {
> -			gt->mem.vram.mapping = 0;
> -			gt->mem.vram.size = 0;
> -			gt->mem.vram.io_start = 0;
> -			gt->mem.vram.io_size = 0;
> -		}
> +	if (!IS_DGFX(xe))
>   		return 0;
> -	}
> -
> -	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> -		return -ENXIO;
> -	}
>   
> +	/* Get the size of the gt0 vram for later accessibility comparison */
>   	gt = xe_device_get_gt(xe, 0);
> -	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -
>   	err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
>   	if (err)
>   		return err;
>   
> -	xe_resize_vram_bar(xe, vram_size);
> -	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> -	xe->mem.vram.io_size = min(vram_size,
> -				   pci_resource_len(pdev, GEN12_LMEM_BAR));
> -	xe->mem.vram.size = xe->mem.vram.io_size;

I think we still need to keep the io_size and vram.size clamping in this 
patch.

> -
> -	if (!xe->mem.vram.size)
> -		return -EIO;
> -
> -	if (vram_size > xe->mem.vram.io_size)
> -		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
> -			 (u64)vram_size >> 20, (u64)xe->mem.vram.io_size >> 20);
> +	err = xe_determine_lmem_bar_size(xe);
> +	if (err)
> +		return err;
>   
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> -	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, vram_size);
> +	/* small bar issues will only cover gt0 sizes */
> +	if (xe->mem.vram.io_size < vram_size)
> +		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> +			 vram_size, (u64)xe->mem.vram.io_size);
>   
> -	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &xe->mem.vram.io_size);
>   
>   	/* FIXME: Assuming equally partitioned VRAM, incorrect */
>   	if (xe->info.tile_count > 1) {
> @@ -268,7 +286,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   
>   		XE_BUG_ON(!adj_tile_count);
>   
> -		size = xe->mem.vram.size / adj_tile_count;
> +		size = xe->mem.vram.io_size / adj_tile_count;
>   		io_start = xe->mem.vram.io_start;
>   		io_size = xe->mem.vram.io_size;
>   
> @@ -301,7 +319,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   				 &gt->mem.vram.size);
>   		}
>   	} else {
> -		gt->mem.vram.size = xe->mem.vram.size;
> +		gt->mem.vram.size = xe->mem.vram.io_size;
>   		gt->mem.vram.io_start = xe->mem.vram.io_start;
>   		gt->mem.vram.io_size = xe->mem.vram.io_size;
>   		gt->mem.vram.mapping = xe->mem.vram.mapping;
