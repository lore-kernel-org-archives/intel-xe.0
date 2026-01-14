Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0164D31A3A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 09:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542010E3AF;
	Wed, 14 Jan 2026 09:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Il7cukn2";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605C10E3AF
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768384131;
 bh=qpDWjArJfLXu4JzoguXHsQe9IsXH4l6UYHaofitANdw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Il7cukn27Wfl+XbuZobh7o7km+pn800qZvIGU/rSLYwIp1sPRJuG8NqxdcU/lu/Px
 PGvP1JSlKGgBd2gAta448Iz/zIIbru0P+MmYLN/PgB+kKkIct3c1CF2YUs/v32nMwB
 3Kv34/5/sjZxS5iyhtJuiaBwnEVi938q9ctPazpzvMA1xaFPzdKBgwqPtsQirgrt7C
 Xn7zLWIBdaUaYvSmOYnqlGPek2wEvjAi0L0RsCqc9pQ4K2A6eeSJ6kVCo7wFkYfrpN
 v6gepvOExHOYpP3dIgfqPlYJhjuACChy6vRmgu4YqLaqHimLwiNL1Y92YksCFRoR4e
 F2+t8y9n4GFPw==
Message-ID: <62358c4f-081f-4cc5-9db9-511cc6c988af@lankhorst.se>
Date: Wed, 14 Jan 2026 10:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-2-dev@lankhorst.se>
 <33fb21fa-b75a-4109-9d4e-71f954a2e787@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <33fb21fa-b75a-4109-9d4e-71f954a2e787@intel.com>
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

Den 2026-01-13 kl. 23:07, skrev Michal Wajdeczko:
> 
> 
> On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:
>> Fix all functions that use node->start to use xe_ggtt_node_addr,
>> and add ggtt->start to node->start.
>>
>> This will make node shifting for SRIOV-VF a one-liner, instead of
> 
> SR-IOV VF
> 
>> manually changing each GGTT node's base address.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 58 ++++++++++++++++++++++--------------
>>  1 file changed, 36 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index cb23d97845a86..4bdd2c94021cd 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -300,7 +300,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>>  {
>>  	ggtt->start = start;
>>  	ggtt->size = size;
>> -	drm_mm_init(&ggtt->mm, start, size);
>> +	drm_mm_init(&ggtt->mm, 0, size);
>>  }
>>  
>>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>> @@ -402,7 +402,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>>  	mutex_lock(&ggtt->lock);
>>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>> -		xe_ggtt_clear(ggtt, start, end - start);
>> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>>  
>>  	xe_ggtt_invalidate(ggtt);
>>  	mutex_unlock(&ggtt->lock);
>> @@ -419,7 +419,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>>  
>>  	mutex_lock(&ggtt->lock);
>>  	if (bound)
>> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
>> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);
> 
> nit: maybe
> 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
> 
> 
>>  	drm_mm_remove_node(&node->base);
>>  	node->base.size = 0;
>>  	mutex_unlock(&ggtt->lock);
>> @@ -574,13 +574,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>>  	lockdep_assert_held(&ggtt->lock);
>>  
>>  	node->base.color = 0;
>> -	node->base.start = start;
>> +	node->base.start = start - ggtt->start;
> 
> nit: maybe we should add:
> 
> 	xe_assert(xe, start >= ggtt->start);
> 
>>  	node->base.size = end - start;
>>  
>>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>>  
>>  	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
>> +			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
>>  		return err;
>>  
>>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
>> @@ -771,7 +771,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>>  	if (XE_WARN_ON(!node))
>>  		return;
>>  
>> -	start = node->base.start;
>> +	start = xe_ggtt_node_addr(node);
>>  	end = start + xe_bo_size(bo);
>>  
>>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>> @@ -892,6 +892,17 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>>  	}
>>  
>>  	mutex_lock(&ggtt->lock);
>> +	/*
>> +	 * all cases where start < ggtt_start when 0 is passed as argument are
>> +	 * set to 0, as negative offsets are invalid.
> 
> but all start values < ggtt->start seems to be programming errors
> (except start == 0 which is like a "don't care" flag)
> 
> so maybe this should be just:
I think the asserts are ok to add, but why not handle it anyway instead of failing in a hard to debug way?

> 
> 	xe_assert(xe, start >= ggtt->start || !start);
> 	xe_assert(xe, end >= ggtt->start);
> 
> 	if (start) {
> 		start -= ggtt->start;
> 		end -= ggtt->start;
> 	}
> 
>> +	 */
>> +	if (start < ggtt->start)
>> +		start = 0;
>> +	else
>> +		start -= ggtt->start;
>> +
>> +	end -= ggtt->start;
>> +
>>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>>  	if (err) {
>> @@ -1003,16 +1014,17 @@ static u64 xe_encode_vfid_pte(u16 vfid)
>>  	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
>>  }
>>  
>> -static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
>> +static void xe_ggtt_assign_locked(const struct xe_ggtt_node *node, u16 vfid)
>>  {
>> -	u64 start = node->start;
>> -	u64 size = node->size;
>> +	struct xe_ggtt *ggtt = node->ggtt;
>> +	u64 start = xe_ggtt_node_addr(node);
>> +	u64 size = xe_ggtt_node_size(node);
>>  	u64 end = start + size - 1;
>>  	u64 pte = xe_encode_vfid_pte(vfid);
>>  
>>  	lockdep_assert_held(&ggtt->lock);
>>  
>> -	if (!drm_mm_node_allocated(node))
>> +	if (!xe_ggtt_node_allocated(node))
> 
> nit: this could be:
> 
> 	if (!drm_mm_node_allocated(&node->base))

Perhaps, but I'm deleting it anyway in the last patch.

>>  		return;
>>  
>>  	while (start < end) {
>> @@ -1034,9 +1046,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>>   */
>>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>>  {
>> -	mutex_lock(&node->ggtt->lock);
>> -	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
>> -	mutex_unlock(&node->ggtt->lock);
>> +	if (!node)
>> +		return;
> 
> calling xe_ggtt_assign(NULL) is a clear programming error, why do we want to hide it now?

There was already error handling in checking drm_mm_allocated(). That one will be removed soon, so this is the replacement.

>> +
>> +	guard(mutex)(&node->ggtt->lock);
>> +	xe_ggtt_assign_locked(node, vfid);
>>  }
>>  
>>  /**
>> @@ -1058,14 +1072,14 @@ int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfi
>>  	if (!node)
>>  		return -ENOENT;
>>  
>> -	guard(mutex)(&node->ggtt->lock);
>> +	ggtt = node->ggtt;
>> +	guard(mutex)(&ggtt->lock);
> 
> nit: nice but unrelated change
> 
>>  
>>  	if (xe_ggtt_node_pt_size(node) != size)
>>  		return -EINVAL;
>>  
>> -	ggtt = node->ggtt;
>> -	start = node->base.start;
>> -	end = start + node->base.size - 1;
>> +	start = xe_ggtt_node_addr(node);
>> +	end = start + xe_ggtt_node_size(node) - 1;
>>  
>>  	while (start < end) {
>>  		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
>> @@ -1098,14 +1112,14 @@ int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u
>>  	if (!node)
>>  		return -ENOENT;
>>  
>> -	guard(mutex)(&node->ggtt->lock);
>> +	ggtt = node->ggtt;
>> +	guard(mutex)(&ggtt->lock);
> 
> ditto
Yeah, but too small for a separate commit, which is why I added it to this one. :-)
> 
>>  
>>  	if (xe_ggtt_node_pt_size(node) != size)
>>  		return -EINVAL;
>>  
>> -	ggtt = node->ggtt;
>> -	start = node->base.start;
>> -	end = start + node->base.size - 1;
>> +	start = xe_ggtt_node_addr(node);
>> +	end = start + xe_ggtt_node_size(node) - 1;
>>  
>>  	while (start < end) {
>>  		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
>> @@ -1212,7 +1226,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>>   */
>>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>>  {
>> -	return node->base.start;
>> +	return node->base.start + node->ggtt->start;
>>  }
>>  
>>  /**
> 

