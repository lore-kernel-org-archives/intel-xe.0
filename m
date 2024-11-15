Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255BBD6DDEA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 08:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA810E1BD;
	Fri, 15 Nov 2024 08:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fe9lh26d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2946F10E1BD
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731660843; x=1763196843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yc1SNX+4hthLb3Htm69arID6+NSXXpsOJA6LZdlPFTI=;
 b=Fe9lh26dTIz9etHx6qEMdwtHsvGO+9M5UoxCbyliBW2VOWQKefJC7oy1
 CKibXT+OMB9Ak2lHTgcZffpLTQ4F884QNeKLr3L/mvgefzsgdrdPCr3y0
 xxdjDZ2pRG3RYiX29zJX3K7P2h/TaYUckpxq1kIUcQrNBjsISz9lZk8fE
 HwzcQHkC5b23jyhIGJFT86W9YEqD6CxsdGftN7IrPIobsP1pOphMLTaFD
 5DVtxqfQ7ZyB6nwRTbno8weWDUFOsWVWuOY9tUNfmsYX+7sB5LYW0MiYo
 o8a99Pujir5LqxPJd0RGKFKJE2FPz1ZKgzkQkOHr2ElK6QnKHzzpWXBwA Q==;
X-CSE-ConnectionGUID: A1zHbDxtTUes7ZrXyD0kkw==
X-CSE-MsgGUID: fPMuNtNOQc29NQzg6X/qcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35350016"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="35350016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 00:54:02 -0800
X-CSE-ConnectionGUID: HYWAQzCfSKG2vG2jMuupag==
X-CSE-MsgGUID: QVQDDwL6TbOoto8xrjFDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88252949"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 00:54:00 -0800
Message-ID: <82fbdd0a-d8fe-41e2-bb31-5eb1f1bbb1f9@intel.com>
Date: Fri, 15 Nov 2024 08:53:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vram: drop 2G block restriction
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20241113172346.256165-2-matthew.auld@intel.com>
 <ZzYHt1jixFV3pZyh@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZzYHt1jixFV3pZyh@lstrano-desk.jf.intel.com>
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

On 14/11/2024 14:22, Matthew Brost wrote:
> On Wed, Nov 13, 2024 at 05:23:47PM +0000, Matthew Auld wrote:
>> Currently we limit the max block size for all users to ensure each block
>> can fit within a sg entry (uint). Drop this restriction and tweak the sg
>> construction to instead handle this itself and break down blocks which
>> are too big, if needed. Most users don't need an sg list in the first
>> place.
>>
> 
> Code looks correct. Curious what the motivation for the series as before
> / after the series everything is functional. Just cleaning up a FIXME?

The motivation came from vlk-64377. But regardless of that I was 
thinking that addressing the FIXME here was not a bad idea.

> 
> Anyways LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.

> 
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 51 +++++++---------------------
>>   1 file changed, 12 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 423b261ea743..1d39a8c53b3a 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -52,7 +52,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>   	struct xe_ttm_vram_mgr_resource *vres;
>>   	struct drm_buddy *mm = &mgr->mm;
>> -	u64 size, remaining_size, min_page_size;
>> +	u64 size, min_page_size;
>>   	unsigned long lpfn;
>>   	int err;
>>   
>> @@ -98,17 +98,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   		goto error_fini;
>>   	}
>>   
>> -	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
>> -		err = -EINVAL;
>> -		goto error_fini;
>> -	}
>> -
>> -	if (WARN_ON((size > SZ_2G &&
>> -		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS)))) {
>> -		err = -EINVAL;
>> -		goto error_fini;
>> -	}
>> -
>>   	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
>>   		err = -EINVAL;
>>   		goto error_fini;
>> @@ -116,9 +105,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   
>>   	mutex_lock(&mgr->lock);
>>   	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
>> -		mutex_unlock(&mgr->lock);
>>   		err = -ENOSPC;
>> -		goto error_fini;
>> +		goto error_unlock;
>>   	}
>>   
>>   	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
>> @@ -129,25 +117,11 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
>>   	}
>>   
>> -	remaining_size = size;
>> -	do {
>> -		/*
>> -		 * Limit maximum size to 2GiB due to SG table limitations.
>> -		 * FIXME: Should maybe be handled as part of sg construction.
>> -		 */
>> -		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
>> -
>> -		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> -					     (u64)lpfn << PAGE_SHIFT,
>> -					     alloc_size,
>> -					     min_page_size,
>> -					     &vres->blocks,
>> -					     vres->flags);
>> -		if (err)
>> -			goto error_free_blocks;
>> -
>> -		remaining_size -= alloc_size;
>> -	} while (remaining_size);
>> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +				     (u64)lpfn << PAGE_SHIFT, size,
>> +				     min_page_size, &vres->blocks, vres->flags);
>> +	if (err)
>> +		goto error_unlock;
>>   
>>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>   		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>> @@ -194,9 +168,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>   
>>   	*res = &vres->base;
>>   	return 0;
>> -
>> -error_free_blocks:
>> -	drm_buddy_free_list(mm, &vres->blocks, 0);
>> +error_unlock:
>>   	mutex_unlock(&mgr->lock);
>>   error_fini:
>>   	ttm_resource_fini(man, &vres->base);
>> @@ -393,7 +365,8 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>   	xe_res_first(res, offset, length, &cursor);
>>   	while (cursor.remaining) {
>>   		num_entries++;
>> -		xe_res_next(&cursor, cursor.size);
>> +		/* Limit maximum size to 2GiB due to SG table limitations. */
>> +		xe_res_next(&cursor, min_t(u64, cursor.size, SZ_2G));
>>   	}
>>   
>>   	r = sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
>> @@ -413,7 +386,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>   	xe_res_first(res, offset, length, &cursor);
>>   	for_each_sgtable_sg((*sgt), sg, i) {
>>   		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
>> -		size_t size = cursor.size;
>> +		size_t size = min_t(u64, cursor.size, SZ_2G);
>>   		dma_addr_t addr;
>>   
>>   		addr = dma_map_resource(dev, phys, size, dir,
>> @@ -426,7 +399,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>   		sg_dma_address(sg) = addr;
>>   		sg_dma_len(sg) = size;
>>   
>> -		xe_res_next(&cursor, cursor.size);
>> +		xe_res_next(&cursor, size);
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.47.0
>>

