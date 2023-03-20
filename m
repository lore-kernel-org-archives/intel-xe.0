Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAE5C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 13:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937F410E18E;
	Mon, 20 Mar 2023 13:03:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3510E18E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679317434; x=1710853434;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mL1lfm6KpQz4yO0MsT70xm0NFMWe2vmtPj6KseDrABU=;
 b=YXZhzvSR0OfRybJyprmvGj+RloE6OTkmM4icDrDoQFJ81DGZq5qRsEhk
 ixckiGKW35Ahsow3re+RzkTblQeSnmsSvE84s8TtQAxesL6gTpIMLSkUP
 nCsN6f1ftQgNy1vzLxWTYKUA6RmQiWVlGu4QrsVV4TUVOMzP6RCl8kueR
 0cTZHCSqCOR/EsBawAg+DmB5A1+k2ohuVXQu7Q9I6SIZ5GBu/Ua9EE4Id
 ViBLZ1igWuyftUZwnxPOCl5K21ilhILr0cqsmqfVYDlcN8fAY9mRnYReV
 p0M8v0Y/8nfAv5QqE2JGHUwoIVs/zYOyFzYF+xVgVObv34Q7NFuIIPkOb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322494584"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="322494584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="791604603"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="791604603"
Received: from vmiceli-mobl.amr.corp.intel.com (HELO [10.252.26.135])
 ([10.252.26.135])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:03:47 -0700
Message-ID: <3b98447d-40f6-604a-ae61-b90e5c31b3e8@intel.com>
Date: Mon, 20 Mar 2023 13:03:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-6-matthew.auld@intel.com>
 <15701e64-9d2a-bd62-7628-c37b31152654@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <15701e64-9d2a-bd62-7628-c37b31152654@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 20/03/2023 12:08, Gwan-gyeong Mun wrote:
> 
> 
> On 3/8/23 12:17 PM, Matthew Auld wrote:
>> Replace the allocation code with the i915 version. This simplifies the
>> code a little, and importantly we get the accounting at the mgr level,
>> which is useful for debug (and maybe userspace), plus per resource
>> tracking so we can easily check if a resource is using one or pages in
>> the mappable part of vram (useful for eviction), or if the resource is
>> completely within the mappable portion (useful for checking if the
>> resource can be safely CPU mapped).
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 201 ++++++++++-----------
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>>   4 files changed, 118 insertions(+), 110 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index e608b49072ba..35e6bc62766e 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -158,7 +158,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>   {
>>       struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, 
>> sizeof(*mgr), GFP_KERNEL);
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -    u64 stolen_size, pgsize;
>> +    u64 stolen_size, io_size, pgsize;
>>       int err;
>>       if (IS_DGFX(xe))
>> @@ -177,7 +177,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>       if (pgsize < PAGE_SIZE)
>>           pgsize = PAGE_SIZE;
>> -    err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, 
>> stolen_size, pgsize);
>> +    /*
>> +     * We don't try to attempt partial visible support for stolen vram,
>> +     * since stolen is always at the end of vram, and the BAR size is 
>> pretty
>> +     * much always 256M, with small-bar.
>> +     */
>> +    io_size = 0;
>> +    if (!xe_ttm_stolen_cpu_inaccessible(xe))
>> +        io_size = stolen_size;
>> +
>> +    err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, 
>> stolen_size,
>> +                     io_size, pgsize);
>>       if (err) {
>>           drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>>           return;
>> @@ -186,8 +196,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>       drm_dbg_kms(&xe->drm, "Initialized stolen memory support with 
>> %llu bytes\n",
>>               stolen_size);
>> -    if (!xe_ttm_stolen_cpu_inaccessible(xe))
>> -        mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>> stolen_size);
>> +    if (io_size)
>> +        mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>> io_size);
>>   }
>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index e3ac8c6d3978..f703e962f499 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -49,45 +49,26 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>                      const struct ttm_place *place,
>>                      struct ttm_resource **res)
>>   {
>> -    u64 max_bytes, cur_size, min_block_size;
>>       struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>       struct xe_ttm_vram_mgr_resource *vres;
>> -    u64 size, remaining_size, lpfn, fpfn;
>>       struct drm_buddy *mm = &mgr->mm;
>> -    unsigned long pages_per_block;
>> -    int r;
>> -
>> -    lpfn = (u64)place->lpfn << PAGE_SHIFT;
>> -    if (!lpfn || lpfn > man->size)
>> -        lpfn = man->size;
>> -
>> -    fpfn = (u64)place->fpfn << PAGE_SHIFT;
>> +    u64 size, remaining_size, min_page_size;
>> +    unsigned long lpfn;
>> +    int err;
>> -    max_bytes = mgr->manager.size;
>> -    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -        pages_per_block = ~0ul;
>> -    } else {
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -        pages_per_block = HPAGE_PMD_NR;
>> -#else
>> -        /* default to 2MB */
>> -        pages_per_block = 2UL << (20UL - PAGE_SHIFT);
>> -#endif
>> -
>> -        pages_per_block = max_t(uint32_t, pages_per_block,
>> -                    tbo->page_alignment);
>> -    }
>> +    lpfn = place->lpfn;
>> +    if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
>> +        lpfn = man->size >> PAGE_SHIFT;
>>       vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>>       if (!vres)
>>           return -ENOMEM;
>>       ttm_resource_init(tbo, place, &vres->base);
>> -    remaining_size = vres->base.size;
>>       /* bail out quickly if there's likely not enough VRAM for this 
>> BO */
>> -    if (ttm_resource_manager_usage(man) > max_bytes) {
>> -        r = -ENOSPC;
>> +    if (ttm_resource_manager_usage(man) > man->size) {
>> +        err = -ENOSPC;
>>           goto error_fini;
>>       }
>> @@ -96,95 +77,91 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>           vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>> -    if (fpfn || lpfn != man->size)
>> -        /* Allocate blocks in desired range */
>> +    if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> -    mutex_lock(&mgr->lock);
>> -    while (remaining_size) {
>> -        if (tbo->page_alignment)
>> -            min_block_size = tbo->page_alignment << PAGE_SHIFT;
>> -        else
>> -            min_block_size = mgr->default_page_size;
>> -
>> -        XE_BUG_ON(min_block_size < mm->chunk_size);
>> -
>> -        /* Limit maximum size to 2GiB due to SG table limitations */
>> -        size = min(remaining_size, 2ULL << 30);
>> -
>> -        if (size >= pages_per_block << PAGE_SHIFT)
>> -            min_block_size = pages_per_block << PAGE_SHIFT;
>> -
>> -        cur_size = size;
>> -
>> -        if (fpfn + size != place->lpfn << PAGE_SHIFT) {
>> -            /*
>> -             * Except for actual range allocation, modify the size and
>> -             * min_block_size conforming to continuous flag enablement
>> -             */
>> -            if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -                size = roundup_pow_of_two(size);
>> -                min_block_size = size;
>> -            /*
>> -             * Modify the size value if size is not
>> -             * aligned with min_block_size
>> -             */
>> -            } else if (!IS_ALIGNED(size, min_block_size)) {
>> -                size = round_up(size, min_block_size);
>> -            }
>> -        }
>> +    XE_BUG_ON(!vres->base.size);
>> +    size = vres->base.size;
>> -        r = drm_buddy_alloc_blocks(mm, fpfn,
>> -                       lpfn,
>> -                       size,
>> -                       min_block_size,
>> -                       &vres->blocks,
>> -                       vres->flags);
>> -        if (unlikely(r))
>> -            goto error_free_blocks;
>> +    min_page_size = mgr->default_page_size;
>> +    if (tbo->page_alignment)
>> +        min_page_size = tbo->page_alignment << PAGE_SHIFT;
>> -        if (size > remaining_size)
>> -            remaining_size = 0;
>> -        else
>> -            remaining_size -= size;
>> +    XE_BUG_ON(min_page_size < mm->chunk_size);
>> +    XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
>> +    XE_BUG_ON(size > SZ_2G &&
>> +          (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
> Hi Matt,
> What scenario is the purpose of testing? Is the purpose of reporting an 
> error when it is a small bar case at the current stage?

XE_BUG_ON(min_page_size < mm->chunk_size) - This one is just a general 
sanity check, which seemed good to add. The chunk_size is the minimum 
sized chunk of memory that we can allocate, and so if we ask for 
something smaller then likely that's a bug.

XE_BUG_ON(min_page_size > SZ_2G) - This is also not small-bar related, 
but an existing limitation. If you look below the allocation is split 
into a maximum allocation size of 2G (so that is can always fit in an sg 
entry without overflowing). If someone in the future asks for page_size 
 > 2G, then the alignment might not match, due to this splitting, hence 
better treat that as an error. This one has a FIXME, since the code that 
constructs the sg table could be improved to handle the limitation 
there, instead of leaking it into the buddy code.

XE_BUG_ON(size > SZ_2G && (vres->base.placement & 
TTM_PL_FLAG_CONTIGUOUS)) - And this is basically the same as above. We 
can't have larger than 2G for one chunk AFAICT, so if someone asks for 
CONTIG for such a case, the underlying allocation might not be 
contiguous, since we need to make at least two separate allocation 
requests. But again, I don't think anyone currently needs such a thing, 
but best to just document/assert such limitations.

>> +    XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
> If it is not aligned, can't we increase it to the aligned size and 
> allocate it?

Yeah, that's one possibility. It's just that the existing behaviour is 
to leave that to the responsibility of the caller. AFAICT this is for 
now mostly interesting on platforms where we need 64K min page size for 
VRAM, and there the object size is meant to be rounded up, so we don't 
currently expect anyone to trigger this, unless there is a bug.

>> +
>> +    if (place->fpfn + (vres->base.size >> PAGE_SHIFT) != place->lpfn &&
>> +        place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +        unsigned long pages;
>> +
>> +        size = roundup_pow_of_two(size);
>> +        min_page_size = size;
>> +
>> +        pages = size >> ilog2(mm->chunk_size);
> Why did you use ilog2(mm->chunk_size) instead of PAGE_SHIFT here?

Yeah, it looks like the existing i915 code seems to mix chunk_size and 
PAGE_SHIFT. I think back in the day the buddy allocator just accepted 
the order, but now is happy with the number of bytes, so doesn't make 
much sense. Will fix. Thanks for pointing this out.

>> +        if (pages > lpfn)
>> +            lpfn = pages;
>>       }
>> -    mutex_unlock(&mgr->lock);
>> -    if (cur_size != size) {
>> -        struct drm_buddy_block *block;
>> -        struct list_head *trim_list;
>> -        u64 original_size;
>> -        LIST_HEAD(temp);
>> +    if (size > lpfn << PAGE_SHIFT) {
> In case of DRM_BUDDY_RANGE_ALLOCATION, shouldn't it be compared with 
> size > (lpfn - fpfn) << PAGE_SHIFT?

Yeah, that makes more sense. Also this should be higher up. Thanks for 
reviewing.

> 
> Br,
> 
> G.G.
>> +        err = -E2BIG; /* don't trigger eviction */
>> +        goto error_fini;
>> +    }
>> -        trim_list = &vres->blocks;
>> -        original_size = vres->base.size;
>> +    mutex_lock(&mgr->lock);
>> +    if (lpfn <= mgr->visible_size && size > mgr->visible_avail) {
>> +        mutex_unlock(&mgr->lock);
>> +        err = -ENOSPC;
>> +        goto error_fini;
>> +    }
>> +    remaining_size = size;
>> +    do {
>>           /*
>> -         * If size value is rounded up to min_block_size, trim the last
>> -         * block to the required size
>> +         * Limit maximum size to 2GiB due to SG table limitations.
>> +         * FIXME: Should maybe be handled as part of sg construction.
>>            */
>> -        if (!list_is_singular(&vres->blocks)) {
>> -            block = list_last_entry(&vres->blocks, typeof(*block), 
>> link);
>> -            list_move_tail(&block->link, &temp);
>> -            trim_list = &temp;
>> -            /*
>> -             * Compute the original_size value by subtracting the
>> -             * last block size with (aligned size - original size)
>> -             */
>> -            original_size = drm_buddy_block_size(mm, block) -
>> -                (size - cur_size);
>> -        }
>> +        u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
>> +
>> +        err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +                         (u64)lpfn << PAGE_SHIFT,
>> +                         alloc_size,
>> +                         min_page_size,
>> +                         &vres->blocks,
>> +                         vres->flags);
>> +        if (err)
>> +            goto error_free_blocks;
>> -        mutex_lock(&mgr->lock);
>> -        drm_buddy_block_trim(mm,
>> -                     original_size,
>> -                     trim_list);
>> -        mutex_unlock(&mgr->lock);
>> +        remaining_size -= alloc_size;
>> +    } while (remaining_size);
>> -        if (!list_empty(&temp))
>> -            list_splice_tail(trim_list, &vres->blocks);
>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +        if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
>> +            size = vres->base.size;
>>       }
>> +    if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
>> +        vres->used_visible_size = size;
>> +    } else {
>> +        struct drm_buddy_block *block;
>> +
>> +        list_for_each_entry(block, &vres->blocks, link) {
>> +            u64 start = drm_buddy_block_offset(block);
>> +
>> +            if (start < mgr->visible_size) {
>> +                u64 end = start + drm_buddy_block_size(mm, block);
>> +
>> +                vres->used_visible_size +=
>> +                    min(end, mgr->visible_size) - start;
>> +            }
>> +        }
>> +    }
>> +
>> +    mgr->visible_avail -= vres->used_visible_size;
>> +    mutex_unlock(&mgr->lock);
>> +
>>       if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>>           xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>>           vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>> @@ -213,7 +190,7 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       ttm_resource_fini(man, &vres->base);
>>       kfree(vres);
>> -    return r;
>> +    return err;
>>   }
>>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>> @@ -226,6 +203,7 @@ static void xe_ttm_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>       mutex_lock(&mgr->lock);
>>       drm_buddy_free_list(mm, &vres->blocks);
>> +    mgr->visible_avail += vres->used_visible_size;
>>       mutex_unlock(&mgr->lock);
>>       ttm_resource_fini(man, res);
>> @@ -240,6 +218,13 @@ static void xe_ttm_vram_mgr_debug(struct 
>> ttm_resource_manager *man,
>>       struct drm_buddy *mm = &mgr->mm;
>>       mutex_lock(&mgr->lock);
>> +    drm_printf(printer, "default_page_size: %lluKiB\n",
>> +           mgr->default_page_size >> 10);
>> +    drm_printf(printer, "visible_avail: %lluMiB\n",
>> +           (u64)mgr->visible_avail >> 20);
>> +    drm_printf(printer, "visible_size: %lluMiB\n",
>> +           (u64)mgr->visible_size >> 20);
>> +
>>       drm_buddy_print(mm, printer);
>>       mutex_unlock(&mgr->lock);
>>       drm_printf(printer, "man size:%llu\n", man->size);
>> @@ -262,6 +247,8 @@ static void ttm_vram_mgr_fini(struct drm_device 
>> *dev, void *arg)
>>       if (ttm_resource_manager_evict_all(&xe->ttm, man))
>>           return;
>> +    WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>> +
>>       drm_buddy_fini(&mgr->mm);
>>       ttm_resource_manager_cleanup(&mgr->manager);
>> @@ -270,7 +257,8 @@ static void ttm_vram_mgr_fini(struct drm_device 
>> *dev, void *arg)
>>   }
>>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct 
>> xe_ttm_vram_mgr *mgr,
>> -               u32 mem_type, u64 size, u64 default_page_size)
>> +               u32 mem_type, u64 size, u64 io_size,
>> +               u64 default_page_size)
>>   {
>>       struct ttm_resource_manager *man = &mgr->manager;
>>       int err;
>> @@ -279,6 +267,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, 
>> struct xe_ttm_vram_mgr *mgr,
>>       mgr->mem_type = mem_type;
>>       mutex_init(&mgr->lock);
>>       mgr->default_page_size = default_page_size;
>> +    mgr->visible_size = io_size;
>> +    mgr->visible_avail = io_size;
>>       ttm_resource_manager_init(man, &xe->ttm, size);
>>       err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
>> @@ -298,7 +288,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct 
>> xe_ttm_vram_mgr *mgr)
>>       mgr->gt = gt;
>>       return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + 
>> gt->info.vram_id,
>> -                      gt->mem.vram.size, PAGE_SIZE);
>> +                      gt->mem.vram.size, gt->mem.vram.io_size,
>> +                      PAGE_SIZE);
>>   }
>>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> index 78f332d26224..35e5367a79fb 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> @@ -13,7 +13,8 @@ struct xe_device;
>>   struct xe_gt;
>>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct 
>> xe_ttm_vram_mgr *mgr,
>> -               u32 mem_type, u64 size, u64 default_page_size);
>> +               u32 mem_type, u64 size, u64 io_size,
>> +               u64 default_page_size);
>>   int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr 
>> *mgr);
>>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>                     struct ttm_resource *res,
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>> index 39aa2ec1b968..3d9417ff7434 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>>       struct ttm_resource_manager manager;
>>       /** @mm: DRM buddy allocator which manages the VRAM */
>>       struct drm_buddy mm;
>> +    /** @visible_size: Proped size of the CPU visible portion */
>> +    u64 visible_size;
>> +    /** @visible_avail: CPU visible portion still unallocated */
>> +    u64 visible_avail;
>>       /** @default_page_size: default page size */
>>       u64 default_page_size;
>>       /** @lock: protects allocations of VRAM */
>> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>>       struct ttm_resource base;
>>       /** @blocks: list of DRM buddy blocks */
>>       struct list_head blocks;
>> +    /** @used_visible_size: How many CPU visible bytes this resource 
>> is using */
>> +    u64 used_visible_size;
>>       /** @flags: flags associated with the resource */
>>       unsigned long flags;
>>   };
