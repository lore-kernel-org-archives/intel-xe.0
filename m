Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC18C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 10:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C510E5BD;
	Fri,  5 May 2023 10:39:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A203A10E5BD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683283159; x=1714819159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lrMdBNXFky5Y7BEwbztWPUTQnayu34o9FaDRu4sA4FQ=;
 b=G5WTId9ygOsLcVDbnvbcaTCrbUO02gFLxtm3ENxcTmiJtK3lSTgRs50k
 1PKo/TSXKsTVYY+aQcHy8oHRUVZND0ECISfyyI0hVCueNyeLQ0JEacZFN
 iFg28W3xowDRWBGRx24rNXKkgMbA0GmQC53aQ9LL7eeZWA41V4N701DCm
 K0+87Jk5qRsMofvX5sNhMxw8XmwKthUYFP69LfiXAHPh2g+fv07qg4BuD
 0WmPZK7SNA4OXD5aHDAOf5UpRkz4ry5r3oxkpMDwzUWcKBfySygGonorI
 ssfntNE2jFlLO0Fu2dNjI1yK/LYAMfPZYDfRPzq5FF9/hqbpu717uIlJt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="346651558"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="346651558"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 03:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="730279133"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="730279133"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO [10.252.12.254])
 ([10.252.12.254])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 03:39:16 -0700
Message-ID: <f6ed70d4-6534-edf5-7e39-83d0a9a40b56@intel.com>
Date: Fri, 5 May 2023 11:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
 <20230504205250.3898282-4-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230504205250.3898282-4-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Size GT device memory correctly
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

On 04/05/2023 21:52, Michael J. Ruhl wrote:
> The current method of sizing GT device memory is not quite right.
> 
> Update the algorithm to use the relevant HW information and offsets
> to set up the sizing correctly.
> 
> Update the stolen memory sizing to reflect the changes, and to be
> GT specific.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h   |  4 +-
>   drivers/gpu/drm/xe/xe_gt_types.h       | 14 ++--
>   drivers/gpu/drm/xe/xe_mmio.c           | 89 ++++++++++++--------------
>   drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  2 +
>   5 files changed, 55 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2eeb10e97381..8898aea4bc2b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: MIT */
>   /*
> - * Copyright © 2022 Intel Corporation
> + * Copyright © 2022-2023 Intel Corporation
>    */
>   
>   #ifndef _XE_DEVICE_TYPES_H_
> @@ -202,6 +202,8 @@ struct xe_device {
>   			 * known as small-bar.
>   			 */
>   			resource_size_t io_size;
> +			/** @base: Offset to apply for Device Physical Address control */
> +			resource_size_t base;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
>   		} vram;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..47f059bb8c6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: MIT */
>   /*
> - * Copyright © 2022 Intel Corporation
> + * Copyright © 2022-2023 Intel Corporation
>    */
>   
>   #ifndef _XE_GT_TYPES_H_
> @@ -148,13 +148,15 @@ struct xe_gt {
>   			/**
>   			 * @io_size: IO size of this VRAM instance
>   			 *
> -			 * This represents how much of this VRAM we can access
> -			 * via the CPU through the VRAM BAR. This can be smaller
> -			 * than @size, in which case only part of VRAM is CPU
> -			 * accessible (typically the first 256M). This
> -			 * configuration is known as small-bar.
> +			 * This represents how much of the VRAM the CPU can access
> +			 * via the VRAM BAR.
> +			 * This can be smaller than the actual @size, in which
> +			 * case only part of VRAM is CPU accessible (typically
> +			 * the first 256M). This configuration is known as small-bar.
>   			 */
>   			resource_size_t io_size;
> +			/** @base: offset of VRAM starting base */
> +			resource_size_t base;
>   			/** @size: size of VRAM. */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8ec044473886..739e04d066e4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -185,6 +185,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>   	if (!xe->mem.vram.io_size)
>   		return -EIO;
>   
> +	xe->mem.vram.base = 0; /* DPA offset */
> +
>   	/* set up a map to the total memory area. */
>   	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>   
> @@ -246,6 +248,9 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
>   
>   int xe_mmio_probe_vram(struct xe_device *xe)
>   {
> +	resource_size_t io_size;
> +	u64 available_size = 0;
> +	u64 total_size = 0;
>   	struct xe_gt *gt;
>   	u64 tile_offset;
>   	u64 tile_size;
> @@ -271,63 +276,54 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>   			 vram_size, (u64)xe->mem.vram.io_size);
>   
> -	/* Limit size to available memory to account for the current memory algorithm */
> -	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size, vram_size);
> -
>   	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
>   		 &xe->mem.vram.io_size);
>   
> -	/* FIXME: Assuming equally partitioned VRAM, incorrect */
> -	if (xe->info.tile_count > 1) {
> -		u8 adj_tile_count = xe->info.tile_count;
> -		resource_size_t size, io_start, io_size;
> +	io_size = xe->mem.vram.io_size;
>   
> -		for_each_gt(gt, xe, id)
> -			if (xe_gt_is_media_type(gt))
> -				--adj_tile_count;
> +	/* gt specific ranges */
> +	for_each_gt(gt, xe, id) {
> +		if (xe_gt_is_media_type(gt))
> +			continue;
>   
> -		XE_BUG_ON(!adj_tile_count);
> +		err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
> +		if (err)
> +			return err;
>   
> -		size = xe->mem.vram.io_size / adj_tile_count;
> -		io_start = xe->mem.vram.io_start;
> -		io_size = xe->mem.vram.io_size;
> +		gt->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
> +		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
>   
> -		for_each_gt(gt, xe, id) {
> -			if (id && !xe_gt_is_media_type(gt)) {
> -				io_size -= min(io_size, size);
> -				io_start += io_size;
> -			}
> +		if (!gt->mem.vram.io_size) {
> +			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +			return -ENODEV;
> +		}
>   
> -			gt->mem.vram.size = size;
> -
> -			/*
> -			 * XXX: multi-tile small-bar might be wild. Hopefully
> -			 * full tile without any mappable vram is not something
> -			 * we care about.
> -			 */
> -
> -			gt->mem.vram.io_size = min(size, io_size);
> -			if (io_size) {
> -				gt->mem.vram.io_start = io_start;
> -				gt->mem.vram.mapping = xe->mem.vram.mapping +
> -					(io_start - xe->mem.vram.io_start);
> -			} else {
> -				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> -				return -ENODEV;
> -			}
> +		gt->mem.vram.base = xe->mem.vram.base + tile_offset;
> +		gt->mem.vram.size = vram_size;
> +		gt->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>   
> -			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
> -				 id, gt->info.vram_id, &gt->mem.vram.io_start,
> -				 &gt->mem.vram.size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt->info.vram_id,
> +			 &gt->mem.vram.io_start, &gt->mem.vram.size);
> +
> +		if (gt->mem.vram.io_size < gt->mem.vram.size)
> +			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
> +				 gt->info.vram_id, &gt->mem.vram.io_size);
> +
> +		/* calculate total size using tile size to get the correct HW sizing */
> +		total_size += tile_size;
> +		available_size += vram_size;
> +
> +		if (total_size > xe->mem.vram.io_size) {
> +			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> +				 &total_size, &xe->mem.vram.io_size);
>   		}
> -	} else {
> -		gt->mem.vram.size = xe->mem.vram.io_size;
> -		gt->mem.vram.io_start = xe->mem.vram.io_start;
> -		gt->mem.vram.io_size = xe->mem.vram.io_size;
> -		gt->mem.vram.mapping = xe->mem.vram.mapping;
>   
> -		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
> +		io_size -= min_t(u64, tile_size, io_size);
>   	}
> +
> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &available_size);
> +
>   	return 0;
>   }
>   
> @@ -347,9 +343,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>   	if (xe->info.media_verx100 >= 1300)
>   		xe->info.tile_count *= 2;
>   
> -	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
> -		 xe->info.tile_count, adj_tile_count);
> -
>   	if (xe->info.tile_count > 1) {
>   		const int mmio_bar = 0;
>   		size_t size;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 9bc00b0dbc4a..424c129ae0f3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: MIT */
>   /*
> - * Copyright © 2021 Intel Corporation
> + * Copyright © 2021-2023 Intel Corporation
>    */
>   
>   #ifndef _XE_MMIO_H_
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 7cd0c98ab8cb..55fa728f1bd3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -12,9 +12,11 @@
>   #include <drm/ttm/ttm_range_manager.h>
>   
>   #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_mcr.h"

Wrong patch maybe?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   #include "xe_mmio.h"
>   #include "xe_res_cursor.h"
>   #include "xe_ttm_stolen_mgr.h"
