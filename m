Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047F5CCD195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 06:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07F10E963;
	Thu, 16 Oct 2025 06:40:05 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2810E963
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 06:40:04 +0000 (UTC)
Message-ID: <764b9a47-d490-4558-9d0d-0ea1931d0419@lankhorst.se>
Date: Thu, 16 Oct 2025 08:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-22-dev@lankhorst.se>
 <aPAiapLgXihvfKES@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <aPAiapLgXihvfKES@lstrano-desk.jf.intel.com>
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

Den 2025-10-16 kl. 00:38, skrev Matthew Brost:
> On Wed, Oct 15, 2025 at 09:47:17AM +0200, Maarten Lankhorst wrote:
>> This will make node shifting in the next commit a one-liner.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 5c07d63189ab1..1c97a06424b5c 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -289,7 +289,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>>  {
>>  	ggtt->start = start;
>>  	ggtt->size = size;
>> -	drm_mm_init(&ggtt->mm, start, size);
>> +	drm_mm_init(&ggtt->mm, 0, size - start);
> 
> We should probably fix the drm_mm_init function signature so the last
> argument is called 'end' rather than 'size'. Can be done in a follow up
> though.
> 
>>  }
>>  
>>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>> @@ -388,7 +388,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>>  	mutex_lock(&ggtt->lock);
>>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>> -		xe_ggtt_clear(ggtt, start, end - start);
>> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>>  
>>  	xe_ggtt_invalidate(ggtt);
>>  	mutex_unlock(&ggtt->lock);
>> @@ -405,7 +405,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>>  
>>  	mutex_lock(&ggtt->lock);
>>  	if (bound)
>> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
>> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);
>>  	drm_mm_remove_node(&node->base);
>>  	node->base.size = 0;
>>  	mutex_unlock(&ggtt->lock);
>> @@ -561,13 +561,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>>  	lockdep_assert_held(&ggtt->lock);
>>  
>>  	node->base.color = 0;
>> -	node->base.start = start;
>> +	node->base.start = start - ggtt->start;
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
>> @@ -744,7 +744,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>>  	if (XE_WARN_ON(!node))
>>  		return;
>>  
>> -	start = node->base.start;
>> +	start = xe_ggtt_node_addr(node);
>>  	end = start + xe_bo_size(bo);
>>  
>>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>> @@ -865,6 +865,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>>  	}
>>  
>>  	mutex_lock(&ggtt->lock);
>> +	if (start >= ggtt->start)
>> +		start -= ggtt->start;
>> +	else
>> +		start = 0;
> 
> Does this logic work if let's say start == 0x1000 and ggtt->start ==
> 0x2000. It seems like that is caller bug which we should assert 'start
>> = ggtt->start', right?

This is to handle the special case start = 0 with end = UINT_MAX, and then being permissive
and allowing all values < ggtt->start as well.

Specifying start = 0 is valid.

>> +
>> +	end -= ggtt->start;
>> +
>>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>>  	if (err) {
>> @@ -1106,5 +1113,5 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>>   */
>>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>>  {
>> -	return node->base.start;
>> +	return node->base.start + READ_ONCE(node->ggtt->start);
> 
> Why the READ_ONCE here?

Will be paired with a WRITE_ONCE in shift_nodes() in the next couple of patches.

Best regards,
~Maarten Lankhorst
