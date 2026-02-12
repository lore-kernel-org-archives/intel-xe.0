Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E39EE36B4
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBEF10E0CC;
	Thu, 12 Feb 2026 17:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYnu34lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0B10E0CC
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770918797; x=1802454797;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZmsnWolyHHiaKyqon+Ti20gXqjYvSz/nyMuWMvgqIpY=;
 b=JYnu34lgdwNJrtnYu0lW5qJkA9iYxoJUlnG2X3QKxxRSl3PmKZDerE51
 Xg0sEJIp3xlAY/EFUcOtb5RR3yPsoPQ6MzpLmIswEAulR71uSKQ9gU8xN
 Cd+vy41LGspO+pcAY4pcMjJHfz+Hy55W/1LFqXcrjJtWg2vL11kIqsTlW
 W8+svDvQ1fxX5SxTaT2ui6czPVM9jRarJuxX1R0j2VaufLxLoXpdnyvti
 CNU3SmGvmHTpmRuffOVkhfiJ1lPr1kYxj6/iOcN1CCR1QMGgB9a85bN6D
 TBVZwqry9v6EA3GD3zCx8sO9tB2yaAAOdrrq9pW4ewmtfwgeuRiG+DwMy A==;
X-CSE-ConnectionGUID: WLsH5BEMTDC8PabNCVRiiw==
X-CSE-MsgGUID: gFlR6eeYRh2mCsA17YUGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83541898"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="83541898"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:53:16 -0800
X-CSE-ConnectionGUID: Fe2R9b17QfGXtar4inv/Gg==
X-CSE-MsgGUID: NwSQsIahRLOO9K16gV6L3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217633511"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.140])
 ([10.245.245.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:53:15 -0800
Message-ID: <1e1f6110-e3b7-42c0-963c-d6ba033f883a@intel.com>
Date: Thu, 12 Feb 2026 17:53:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] drm/xe/svm: Use xe_vram_addr_to_region
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
References: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
 <20260212163439.1514363-11-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260212163439.1514363-11-tejas.upadhyay@intel.com>
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

On 12/02/2026 16:34, Tejas Upadhyay wrote:
> Replace the direct use of block->private with the helper function
> xe_vram_addr_to_region to get vram region.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 213f0334518a..e773456af040 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -762,7 +762,8 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
>   	int j = 0;
>   
>   	list_for_each_entry(block, blocks, link) {
> -		struct xe_vram_region *vr = block->private;
> +		u64 block_start = drm_buddy_block_offset(block);
> +		struct xe_vram_region *vr = xe_vram_addr_to_region(bo->tile->xe, block_start);

Oh, I think block_offset is the relative offset, which always starts 
from zero, but here you want the real addr, but that info comes from the 
region...

I was gonna say since you seem to already have bo->tile above, why not 
just pick the VRAM from that tile? Like with bo->tile->mem.vram? But I 
think bo->tile is NULL even here so above looks like it will crash?

What about looking at the bo flags or current ttm placement to figure 
out which VRAM this belongs to? There looks to already be 
res_to_mem_region() and you have res above.

>   		struct drm_buddy *buddy = vram_to_buddy(vr);
>   		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
>   						    drm_buddy_block_offset(block));
> @@ -1033,9 +1034,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   	struct dma_fence *pre_migrate_fence = NULL;
>   	struct xe_device *xe = vr->xe;
>   	struct device *dev = xe->drm.dev;
> -	struct drm_buddy_block *block;
>   	struct xe_validation_ctx vctx;
> -	struct list_head *blocks;
>   	struct drm_exec exec;
>   	struct xe_bo *bo;
>   	int err = 0, idx;
> @@ -1072,10 +1071,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   					&dpagemap_devmem_ops, dpagemap, end - start,
>   					pre_migrate_fence);
>   
> -		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> -		list_for_each_entry(block, blocks, link)
> -			block->private = vr;
> -
>   		xe_bo_get(bo);
>   
>   		/* Ensure the device has a pm ref while there are device pages active. */

