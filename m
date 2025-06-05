Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE3C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 16:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5177710E336;
	Thu,  5 Jun 2025 16:57:42 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B210E8E0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 16:57:38 +0000 (UTC)
Message-ID: <6a477105-eafd-42e1-a465-4a5916c2af33@lankhorst.se>
Date: Thu, 5 Jun 2025 18:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/xe/ggtt: Seperate flags and address in PTE
 encoding
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-6-dev@lankhorst.se>
 <aEGzfGJlIM3W43YW@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <aEGzfGJlIM3W43YW@lstrano-desk.jf.intel.com>
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

Hey,

On 2025-06-05 17:10, Matthew Brost wrote:
> On Mon, May 05, 2025 at 02:19:18PM +0200, Maarten Lankhorst wrote:
>> Pinning large linear display framebuffers is becoming a bottleneck.
>> My plan of attack is doing a custom walk over the BO, this allows for
>> easier optimization of consecutive entries.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c       | 85 +++++++++++++++++++++---------
>>  drivers/gpu/drm/xe/xe_ggtt.h       |  2 +
>>  drivers/gpu/drm/xe/xe_ggtt_types.h |  5 +-
>>  3 files changed, 65 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index bdda9302ae294..7526739034ea0 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -27,6 +27,7 @@
>>  #include "xe_map.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pm.h"
>> +#include "xe_res_cursor.h"
>>  #include "xe_sriov.h"
>>  #include "xe_wa.h"
>>  #include "xe_wopcm.h"
>> @@ -64,13 +65,9 @@
>>   * give us the correct placement for free.
>>   */
>>  
>> -static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> -				   u16 pat_index)
>> +static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>>  {
>> -	u64 pte;
>> -
>> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> -	pte |= XE_PAGE_PRESENT;
>> +	u64 pte = XE_PAGE_PRESENT;
>>  
>>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>>  		pte |= XE_GGTT_PTE_DM;
>> @@ -78,13 +75,17 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  	return pte;
>>  }
>>  
>> -static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> -				    u16 pat_index)
>> +static u64 xelp_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
>> +{
>> +	return xelp_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> +}
>> +
>> +static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>>  {
>>  	struct xe_device *xe = xe_bo_device(bo);
>>  	u64 pte;
>>  
>> -	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
>> +	pte = xelp_ggtt_pte_flags(bo, pat_index);
>>  
>>  	xe_assert(xe, pat_index <= 3);
>>  
>> @@ -97,6 +98,12 @@ static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  	return pte;
>>  }
>>  
>> +static u64 xelpg_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> +				u16 pat_index)
>> +{
>> +	return xelpg_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> +}
>> +
>>  static unsigned int probe_gsm_size(struct pci_dev *pdev)
>>  {
>>  	u16 gmch_ctl, ggms;
>> @@ -149,8 +156,9 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>>  	xe_tile_assert(ggtt->tile, start < end);
>>  
>>  	if (ggtt->scratch)
>> -		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
>> -							  pat_index);
>> +		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
>> +			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
>> +							     pat_index);
> 
> Why this change? Does the vfunc not return bo_addr | flags?
> 
>>  	else
>>  		scratch_pte = 0;
>>  
>> @@ -210,17 +218,20 @@ static void primelockdep(struct xe_ggtt *ggtt)
>>  }
>>  
>>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>> -	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
>> +	.pte_encode_bo = xelp_ggtt_encode_bo,
>> +	.pte_encode_flags = xelp_ggtt_pte_flags,
>>  	.ggtt_set_pte = xe_ggtt_set_pte,
>>  };
>>  
>>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
>> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
>>  	.ggtt_set_pte = xe_ggtt_set_pte,
>>  };
>>  
>>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
>> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
>>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
>>  };
>>  
>> @@ -612,23 +623,39 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
>>  /**
>>   * xe_ggtt_map_bo - Map the BO into GGTT
>>   * @ggtt: the &xe_ggtt where node will be mapped
>> + * @node: the &xe_ggtt_node where this BO is mapped
>>   * @bo: the &xe_bo to be mapped
>> + * @pat_index: Which pat_index to use.
>>   */
>> -static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>> +		    struct xe_bo *bo, u16 pat_index)
>>  {
>> -	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>> -	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>> -	u64 start;
>> -	u64 offset, pte;
>>  
>> -	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
>> +	u64 start, pte, end;
>> +	struct xe_res_cursor cur;
>> +
>> +	if (XE_WARN_ON(!node))
>>  		return;
>>  
>> -	start = bo->ggtt_node[ggtt->tile->id]->base.start;
>> +	start = node->base.start;
>> +	end = start + bo->size;
>> +
>> +	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
>> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>> +		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
>> +
>> +		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
>> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
>> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
>> +						   pte | xe_res_dma(&cur));
>> +	} else {
>> +		/* Prepend GPU offset */
>> +		pte |= vram_region_gpu_offset(bo->ttm.resource);
> 
> Does this actually help vs pte_encode_bo? I not entirely convinced it
> would. Any data on the speedup? I can't say I love open coded nature of
> this vs just calling a vfunc.

This is similar to what we already do for VM_BIND.
We construct default_vram_pte and default_system_pte there, append some VMA specific flags and then append the BO address later.

I felt doing the same for display FB pinning makes a lot of sense, especially since DPT is essentially a flat LUT that uses the same encoding as GGTT, but doesn't need to use any other GGTT function, other than the DPT itself being mapped into GGTT.

Kind regards,
~Maarten

> Matt
> 
>>  
>> -	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>> -		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
>> -		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
>> +		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
>> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
>> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
>> +						   pte + cur.start);
>>  	}
>>  }
>>  
>> @@ -641,8 +668,11 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>   */
>>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>  {
>> +	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>> +
>>  	mutex_lock(&ggtt->lock);
>> -	xe_ggtt_map_bo(ggtt, bo);
>> +	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
>>  	mutex_unlock(&ggtt->lock);
>>  }
>>  
>> @@ -682,7 +712,10 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>>  		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
>>  		bo->ggtt_node[tile_id] = NULL;
>>  	} else {
>> -		xe_ggtt_map_bo(ggtt, bo);
>> +		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>> +		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>> +
>> +		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
>>  	}
>>  	mutex_unlock(&ggtt->lock);
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 0bab1fd7cc817..c48da99908848 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -26,6 +26,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>>  			       u32 size, u32 align, u32 mm_flags);
>>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
>>  bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
>> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>> +		    struct xe_bo *bo, u16 pat_index);
>>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index cb02b7994a9ac..06b1a602dd8d1 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -74,8 +74,11 @@ struct xe_ggtt_node {
>>   * Which can vary from platform to platform.
>>   */
>>  struct xe_ggtt_pt_ops {
>> -	/** @pte_encode_bo: Encode PTE address for a given BO */
>> +	/** @pte_encode_bo: Encode PTE flags for a given BO */
>>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>> +
>> +	/** @pte_encode_flags: Encode PTE flags for a given BO */
>> +	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>>  };
>> -- 
>> 2.45.2
>>

