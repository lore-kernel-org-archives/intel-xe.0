Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E8C41535
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 02:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B037910E032;
	Sun, 17 Dec 2023 02:00:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5A210E032
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702778428; x=1734314428;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tVCIIOfwoZ2S6N1KsK4PlPxa31jjZs7JU2umc4wK+Rw=;
 b=dmuY7YCkyi1P32PWLPFs5bFlYCbYD19LGT4imJCAAsPlcLbFSbqfclDi
 N4W7RdSd2eaVmtMBODe0ReUNWCEZBy2Jqqx/yXn8NZQos2FCL5kD0oAY3
 53/fxF3Swv8CxEUmklb7AvU2donL57GjI0Fp9gqavpDgwGgQu+pht5Hcz
 bxmYkyCY98lEP0zXEaWwmvsQafHDWNKGmtMWQta7e0FzLM2LM8bsl2lz3
 bTRLNLoFfnxhLMmheLIaR1y6REddxJaeFyd0Z/WEMWcYfleGGYP48Ic0O
 jXm8XMV6GhxCy8WBOsnJtdFAEdn0xq8eS8sICXOKxJffkDWplE6NrbUeF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="392561097"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="392561097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="865781580"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="865781580"
Received: from hekner-mobl1.ger.corp.intel.com (HELO [10.249.254.48])
 ([10.249.254.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:50:20 -0800
Message-ID: <e6d66238-cd03-c20f-061c-d2a00ac12b2f@linux.intel.com>
Date: Sat, 16 Dec 2023 22:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
 <20231215234049.GC1327160@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231215234049.GC1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,  Matt

On 12/16/23 00:40, Matt Roper wrote:
> On Fri, Dec 15, 2023 at 01:54:36PM +0100, Thomas Hellström wrote:
>> Since the migrate code is using the identity map for addressing VRAM,
>> copy chunks may become as small as 64K if the VRAM resource is fragmented.
>>
>> However, a chunk size smaller that 1MiB may lead to the *next* chunk's
>> offset into the CCS metadata backup memory may not be page-aligned, and
>> the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it could,
>> the current code doesn't handle the offset calculaton correctly.
>>
>> To fix this, make sure we align the size of VRAM copy chunks to 1MiB. If
> Does this need to be device-specific (derived from
> NUM_BYTES_PER_CCS_BYTE)?  On DG2 the main:ccs ratio is 256:1, but on LNL
> (and presumably future platforms) it's 512:1.

Yes, we need to update this once we have a DGFX card with other than 
256:1 (LNL is not affected since we don't use the identity map), but we 
don't know yet whether there might be other changes as well. Perhaps I 
should look at adjusting the 1MiB size alignment based on 
NUM_BYTES_PER_CCS_BYTE.

/Thomas


> Matt
>
>> the remaining data to copy is smaller than that, that's not a problem,
>> so use the remaining size. If the VRAM copy cunk becomes fragmented due
>> to the size alignment restriction, don't use the identity map, but instead
>> emit PTEs into the page-table like we do for system memory.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>>   drivers/gpu/drm/xe/xe_migrate.c       | 67 ++++++++++++++++-----------
>>   2 files changed, 40 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 47fcd6e6b777..5f5b416dc88c 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>   		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>>   
>>   	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
>> -		 &src_it, XE_PAGE_SIZE, pt);
>> +		 &src_it, XE_PAGE_SIZE, pt->ttm.resource);
>>   
>>   	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 2ca927f3fb2a..0b8a33116322 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -411,14 +411,31 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>   
>>   static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
>>   {
>> -	/*
>> -	 * For VRAM we use identity mapped pages so we are limited to current
>> -	 * cursor size. For system we program the pages ourselves so we have no
>> -	 * such limitation.
>> -	 */
>> -	return min_t(u64, MAX_PREEMPTDISABLE_TRANSFER,
>> -		     mem_type_is_vram(cur->mem_type) ? cur->size :
>> -		     cur->remaining);
>> +	u64 size = min_t(u64, MAX_PREEMPTDISABLE_TRANSFER, cur->remaining);
>> +
>> +	if (mem_type_is_vram(cur->mem_type)) {
>> +		/*
>> +		 * VRAM we want to blit in chunks with sizes aligned to
>> +		 * 1MiB in order for the offset to CCS metadata to be
>> +		 * page-aligned. If it's the last chunk it may be smaller.
>> +		 *
>> +		 * Another constraint is that we need to limit the blit to
>> +		 * the VRAM block size, unless size is smaller than 1MiB.
>> +		 */
>> +		u64 chunk = max_t(u64, cur->size, SZ_1M);
>> +
>> +		size = min_t(u64, size, chunk);
>> +		if (size > SZ_1M)
>> +			size = round_down(size, SZ_1M);
>> +	}
>> +
>> +	return size;
>> +}
>> +
>> +static bool xe_migrate_avoid_identity(u64 size, const struct xe_res_cursor *cur)
>> +{
>> +	/* The chunk is fragmented. Hence can't use identity map. */
>> +	return cur->size < size;
>>   }
>>   
>>   static u32 pte_update_size(struct xe_migrate *m,
>> @@ -431,7 +448,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>>   	u32 cmds = 0;
>>   
>>   	*L0_pt = pt_ofs;
>> -	if (!is_vram) {
>> +	if (!is_vram || xe_migrate_avoid_identity(*L0, cur)) {
>>   		/* Clip L0 to available size */
>>   		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>>   		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> @@ -461,20 +478,13 @@ static void emit_pte(struct xe_migrate *m,
>>   		     struct xe_bb *bb, u32 at_pt,
>>   		     bool is_vram,
>>   		     struct xe_res_cursor *cur,
>> -		     u32 size, struct xe_bo *bo)
>> +		     u32 size, struct ttm_resource *res)
>>   {
>>   	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>>   	u32 ptes;
>>   	u64 ofs = at_pt * XE_PAGE_SIZE;
>>   	u64 cur_ofs;
>>   
>> -	/*
>> -	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>> -	 * we're only emitting VRAM PTEs during sanity tests, so when
>> -	 * that's moved to a Kunit test, we should condition VRAM PTEs
>> -	 * on running tests.
>> -	 */
>> -
>>   	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>   
>>   	while (ptes) {
>> @@ -498,10 +508,10 @@ static void emit_pte(struct xe_migrate *m,
>>   				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
>>   				    !(cur_ofs & (16 * 8 - 1))) {
>>   					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
>> -					flags |= XE_PTE_PS64;
>>   				}
>>   
>> -				addr += vram_region_gpu_offset(bo->ttm.resource);
>> +				addr += vram_region_gpu_offset(res);
>> +				flags |= XE_PTE_PS64;
>>   				devmem = true;
>>   			}
>>   
>> @@ -730,6 +740,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   						      &ccs_ofs, &ccs_pt, 0,
>>   						      2 * NUM_PT_PER_BLIT,
>>   						      NUM_PT_PER_BLIT);
>> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>   		}
>>   
>>   		/* Add copy commands size here */
>> @@ -742,20 +753,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>   			goto err_sync;
>>   		}
>>   
>> -		if (!src_is_vram)
>> +		if (!src_is_vram || xe_migrate_avoid_identity(src_L0, &src_it))
>>   			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
>> -				 src_bo);
>> +				 src);
>>   		else
>>   			xe_res_next(&src_it, src_L0);
>>   
>> -		if (!dst_is_vram)
>> +		if (!dst_is_vram || xe_migrate_avoid_identity(src_L0, &dst_it))
>>   			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
>> -				 dst_bo);
>> +				 dst);
>>   		else
>>   			xe_res_next(&dst_it, src_L0);
>>   
>>   		if (copy_system_ccs)
>> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
>> +			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src);
>>   
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>> @@ -984,12 +995,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		size -= clear_L0;
>>   
>>   		/* Preemption is enabled again by the ring ops. */
>> -		if (!clear_vram) {
>> +		if (!clear_vram || xe_migrate_avoid_identity(clear_L0, &src_it))
>>   			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
>> -				 bo);
>> -		} else {
>> +				 dst);
>> +		else
>>   			xe_res_next(&src_it, clear_L0);
>> -		}
>> +
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   		update_idx = bb->len;
>>   
>> -- 
>> 2.42.0
>>
