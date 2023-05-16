Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D110C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 09:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2110E32C;
	Tue, 16 May 2023 09:17:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0F710E32C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684228677; x=1715764677;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4wX9nP75T3okwFJG3lY32ob11vLSUUNEn+7wNYzBIVs=;
 b=P0NBdX+YeHwStnvF2oeEw7cpYWkq5yBgbpaSeA2Lyrc1ybXfOuEa+zQ3
 E+gzH5cq05LsTU8PAgI9IIK0MUmFA17YV9GztD+tH9Da0cQ9fksd8rT6A
 kzumhjPdzHW7bYOWyLDonqPLNSeLvR3VJiBRjSmKFrxbx6zCyEC5TWy3M
 D9fglEdNzkIzl8yqsrJuGsRP8yWkmUzFJGZCFO66V3YjMRYhdEmuUy7nO
 rlnnHY7DPA+iMwxTvub/f0lG8BcGGgSfn8mVqL7+1EMbBuxIk2kXTiMea
 atYf4ki0T/hkb2ZsFgkFGExKkov/FchGvfX5wtb10g5N7RqJpFiMbX/PA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="351461199"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="351461199"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 02:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="770961787"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="770961787"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO [10.252.19.120])
 ([10.252.19.120])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 02:17:55 -0700
Message-ID: <248432f1-334f-df39-f2ec-19801c4b646a@intel.com>
Date: Tue, 16 May 2023 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230515192628.1990279-1-michael.j.ruhl@intel.com>
 <20230515192628.1990279-4-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230515192628.1990279-4-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 15/05/2023 20:26, Michael J. Ruhl wrote:
> The current method of sizing GT device memory is not quite right.
> 
> Update the algorithm to use the relevant HW information and offsets
> to set up the sizing correctly.
> 
> Update the stolen memory sizing to reflect the changes, and to be
> GT specific.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>   drivers/gpu/drm/xe/xe_gt_types.h     |  2 +
>   drivers/gpu/drm/xe/xe_mmio.c         | 91 ++++++++++++++--------------
>   3 files changed, 49 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a10ce67f11df..b00a23199492 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -203,6 +203,8 @@ struct xe_device {
>   			resource_size_t io_size;
>   			/** @size: Total size of VRAM */
>   			resource_size_t size;
> +			/** @base: Offset to apply for Device Physical Address control */
> +			resource_size_t base;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
>   		} vram;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 4b66e059ba9b..47f059bb8c6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -155,6 +155,8 @@ struct xe_gt {
>   			 * the first 256M). This configuration is known as small-bar.
>   			 */
>   			resource_size_t io_size;
> +			/** @base: offset of VRAM starting base */
> +			resource_size_t base;
>   			/** @size: size of VRAM. */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c8b0eb5aab36..02fe2e71abe2 100644
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
> @@ -271,64 +276,58 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>   			 vram_size, (u64)xe->mem.vram.io_size);
>   
> -	/* Limit size to available memory to account for the current memory algorithm */
> -	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size, vram_size);
> -	xe->mem.vram.size = xe->mem.vram.io_size;
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
> -		size = xe->mem.vram.size / adj_tile_count;
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
> +		gt->mem.vram.base = tile_offset;
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
> -		gt->mem.vram.size = xe->mem.vram.size;
> -		gt->mem.vram.io_start = xe->mem.vram.io_start;
> -		gt->mem.vram.io_size = xe->mem.vram.io_size;
> -		gt->mem.vram.mapping = xe->mem.vram.mapping;
>   
> -		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
> +		io_size -= min_t(u64, tile_size, io_size);
>   	}
> +
> +	xe->mem.vram.size = total_size;
> +
> +	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &xe->mem.vram.size);
> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &available_size);
> +
>   	return 0;
>   }
>   
