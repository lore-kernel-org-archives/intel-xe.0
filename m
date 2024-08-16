Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EA2C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 14:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252D10E7D5;
	Fri, 16 Aug 2024 14:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hfb2jW0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FCA10E7D4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723818311; x=1755354311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rrg3uwP+LNyrNsh1Pt/7kX6Jz8Yx7sEK1q2ZnAgAii0=;
 b=Hfb2jW0mawbQBOAx+vNaYJz0cpt64+FO972tdXvQ0DuY6Y8QZmpfcPrQ
 +PVIpx70Y/Z1p4St1mYTk99Uenzo/G5NIpQk7v8aMAu1gbipqaQVhIBEP
 4unwAdlS7H3C8Jm1g3/y6OgvVygDisro2+rLzP5X2GanUlvWq5bkhiyDt
 9UzWATdnjKx9AUfLsLa3u6y3H/QQzc4FW7GdsUw2nYkQiTV0YLTeyhW/9
 md+bcAV5TmNJ0M4YKPruoy4ldmEZvdCI0VrcQmPXFENB/EbAT3HcTb1A3
 l1zMGmjH1smmIPTruOz24xVhB/OvpaRLn6OKmaR0tr4rhhul7kYxSjPM9 w==;
X-CSE-ConnectionGUID: fSzPPBH+SLOFBu5al/nrSA==
X-CSE-MsgGUID: yxKwI1/uTkuc28i0rNfSxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39628139"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="39628139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:25:10 -0700
X-CSE-ConnectionGUID: H4vQNFg8RCSBU6lk0AqsaA==
X-CSE-MsgGUID: rkhGsFQ2S965mku9Z2S8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="90417606"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.109])
 ([10.245.146.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:25:07 -0700
Message-ID: <bbf44d0f-3a02-4559-84f6-5d7de2920e73@linux.intel.com>
Date: Fri, 16 Aug 2024 16:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240809220347.25330-1-nirmoy.das@intel.com>
 <ef360a74-72c3-42a9-9553-76f2d165613e@intel.com>
 <fbae468accaa4ca50550dec93af5a118699bc7e5.camel@linux.intel.com>
 <64e70498-f38d-498b-985b-4b2ade3115ff@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <64e70498-f38d-498b-985b-4b2ade3115ff@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 8/12/2024 11:04 AM, Nirmoy Das wrote:
>
> On 8/12/2024 10:55 AM, Thomas Hellström wrote:
>> On Sat, 2024-08-10 at 00:23 +0200, Nirmoy Das wrote:
>>> Extracting this from
>>> https://patchwork.freedesktop.org/series/136277/ as
>>> there is a regression in performance number on drm-tip.
>>>
>>> I think it will take some time to find out what is going on. This
>>> patch
>>> can be applied independently sending it separately.
>> Hi, Nirmoy.
>>
>> What's the regression
>
> Offloading zeroing  pages to GPU seems to provide worse performance 
> than existing CPU page zeroing.
>
> This wasn't the case when I was testing the series on kernel before 6.10.
>
>>   and do we have a Fixes: tag for this patch?
>
>
> Unfortunately, I don't have an answer yet. I am still trying to figure 
> out what has changed.


I went back to my previous build and still the performance regression 
exists. My best guess is

low CPU <--> mem BW which resolved with a IFWI update.


Regards,

Nirmoy

>
> Regards,
>
> Nirmoy
>
>> /Thomas
>>
>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>> On 8/10/2024 12:03 AM, Nirmoy Das wrote:
>>>> Parameterize clearing ccs and bo data in xe_migrate_clear() which
>>>> higher
>>>> layers can utilize. This patch will be used later on when doing bo
>>>> data
>>>> clear for igfx as well.
>>>>
>>>> v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
>>>> v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
>>>>       xe_migrate.h. other nits(Matt B)
>>>>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>>>>    drivers/gpu/drm/xe/tests/xe_migrate.c | 12 ++++++++----
>>>>    drivers/gpu/drm/xe/xe_bo.c            | 12 ++++++++++--
>>>>    drivers/gpu/drm/xe/xe_migrate.c       | 27 +++++++++++++++++++---
>>>> -----
>>>>    drivers/gpu/drm/xe/xe_migrate.h       |  7 ++++++-
>>>>    5 files changed, 45 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
>>>> b/drivers/gpu/drm/xe/tests/xe_bo.c
>>>> index 1768483da1b7..df9fd907edd4 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>>>> @@ -36,7 +36,8 @@ static int ccs_test_migrate(struct xe_tile *tile,
>>>> struct xe_bo *bo,
>>>>           /* Optionally clear bo *and* CCS data in VRAM. */
>>>>        if (clear) {
>>>> -        fence = xe_migrate_clear(tile->migrate, bo, bo-
>>>>> ttm.resource);
>>>> +        fence = xe_migrate_clear(tile->migrate, bo, bo-
>>>>> ttm.resource,
>>>> +
>>>> XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>            if (IS_ERR(fence)) {
>>>>                KUNIT_FAIL(test, "Failed to submit bo
>>>> clear.\n");
>>>>                return PTR_ERR(fence);
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> index 4344a1724029..47ae9d0b8864 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> @@ -105,7 +105,8 @@ static void test_copy(struct xe_migrate *m,
>>>> struct xe_bo *bo,
>>>>        }
>>>>           xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
>>>> -    fence = xe_migrate_clear(m, remote, remote->ttm.resource);
>>>> +    fence = xe_migrate_clear(m, remote, remote->ttm.resource,
>>>> +                 XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>        if (!sanity_fence_failed(xe, fence, big ? "Clearing remote
>>>> big bo" :
>>>>                     "Clearing remote small bo",
>>>> test)) {
>>>>            retval = xe_map_rd(xe, &remote->vmap, 0, u64);
>>>> @@ -279,7 +280,8 @@ static void xe_migrate_sanity_test(struct
>>>> xe_migrate *m, struct kunit *test)
>>>>        kunit_info(test, "Clearing small buffer object\n");
>>>>        xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>>>>        expected = 0;
>>>> -    fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
>>>> +    fence = xe_migrate_clear(m, tiny, tiny->ttm.resource,
>>>> +                 XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>        if (sanity_fence_failed(xe, fence, "Clearing small bo",
>>>> test))
>>>>            goto out;
>>>>    @@ -300,7 +302,8 @@ static void xe_migrate_sanity_test(struct
>>>> xe_migrate *m, struct kunit *test)
>>>>        kunit_info(test, "Clearing big buffer object\n");
>>>>        xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>>>>        expected = 0;
>>>> -    fence = xe_migrate_clear(m, big, big->ttm.resource);
>>>> +    fence = xe_migrate_clear(m, big, big->ttm.resource,
>>>> +                 XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>        if (sanity_fence_failed(xe, fence, "Clearing big bo",
>>>> test))
>>>>            goto out;
>>>>    @@ -603,7 +606,8 @@ static void test_clear(struct xe_device *xe,
>>>> struct xe_tile *tile,
>>>>           kunit_info(test, "Clear vram buffer object\n");
>>>>        expected = 0x0000000000000000;
>>>> -    fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo-
>>>>> ttm.resource);
>>>> +    fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo-
>>>>> ttm.resource,
>>>> +                 XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>        if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>>>>            return;
>>>>        dma_fence_put(fence);
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 3295bc92d7aa..56a089aa3916 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -793,8 +793,16 @@ static int xe_bo_move(struct ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>                }
>>>>            }
>>>>        } else {
>>>> -        if (move_lacks_source)
>>>> -            fence = xe_migrate_clear(migrate, bo,
>>>> new_mem);
>>>> +        if (move_lacks_source) {
>>>> +            u32 flags = 0;
>>>> +
>>>> +            if (mem_type_is_vram(new_mem->mem_type))
>>>> +                flags |=
>>>> XE_MIGRATE_CLEAR_FLAG_FULL;
>>>> +            else if (handle_system_ccs)
>>>> +                flags |=
>>>> XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>>>> +
>>>> +            fence = xe_migrate_clear(migrate, bo,
>>>> new_mem, flags);
>>>> +        }
>>>>            else
>>>>                fence = xe_migrate_copy(migrate, bo, bo,
>>>> old_mem,
>>>>                            new_mem,
>>>> handle_system_ccs);
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>> index 6f24aaf58252..a2d0ce3c59bf 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> @@ -1037,9 +1037,11 @@ static void emit_clear(struct xe_gt *gt,
>>>> struct xe_bb *bb, u64 src_ofs,
>>>>     * @m: The migration context.
>>>>     * @bo: The buffer object @dst is currently bound to.
>>>>     * @dst: The dst TTM resource to be cleared.
>>>> + * @clear_flags: flags to specify which data to clear: CCS, BO, or
>>>> both.
>>>>     *
>>>> - * Clear the contents of @dst to zero. On flat CCS devices,
>>>> - * the CCS metadata is cleared to zero as well on VRAM
>>>> destinations.
>>>> + * Clear the contents of @dst to zero when
>>>> XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
>>>> + * On flat CCS devices, the CCS metadata is cleared to zero with
>>>> XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
>>>> + * Set XE_MIGRATE_CLEAR_FLAG_FULL to clear bo as well as CCS
>>>> metadata.
>>>>     * TODO: Eliminate the @bo argument.
>>>>     *
>>>>     * Return: Pointer to a dma_fence representing the last clear
>>>> batch, or
>>>> @@ -1048,18 +1050,27 @@ static void emit_clear(struct xe_gt *gt,
>>>> struct xe_bb *bb, u64 src_ofs,
>>>>     */
>>>>    struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>>                       struct xe_bo *bo,
>>>> -                   struct ttm_resource *dst)
>>>> +                   struct ttm_resource *dst,
>>>> +                   u32 clear_flags)
>>>>    {
>>>>        bool clear_vram = mem_type_is_vram(dst->mem_type);
>>>> +    bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA &
>>>> clear_flags;
>>>> +    bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA &
>>>> clear_flags;
>>>>        struct xe_gt *gt = m->tile->primary_gt;
>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>> -    bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) &&
>>>> !IS_DGFX(xe)) ? true : false;
>>>> +    bool clear_only_system_ccs = false;
>>>>        struct dma_fence *fence = NULL;
>>>>        u64 size = bo->size;
>>>>        struct xe_res_cursor src_it;
>>>>        struct ttm_resource *src = dst;
>>>>        int err;
>>>>    +    if (WARN_ON(!clear_bo_data && !clear_ccs))
>>>> +        return NULL;
>>>> +
>>>> +    if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
>>>> +        clear_only_system_ccs = true;
>>>> +
>>>>        if (!clear_vram)
>>>>            xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
>>>> &src_it);
>>>>        else
>>>> @@ -1085,7 +1096,7 @@ struct dma_fence *xe_migrate_clear(struct
>>>> xe_migrate *m,
>>>>            batch_size = 2 +
>>>>                pte_update_size(m, pte_flags, src,
>>>> &src_it,
>>>>                        &clear_L0, &clear_L0_ofs,
>>>> &clear_L0_pt,
>>>> -                    clear_system_ccs ? 0 :
>>>> emit_clear_cmd_len(gt), 0,
>>>> +                    clear_bo_data ?
>>>> emit_clear_cmd_len(gt) : 0, 0,
>>>>                        avail_pts);
>>>>               if (xe_migrate_needs_ccs_emit(xe))
>>>> @@ -1107,13 +1118,13 @@ struct dma_fence *xe_migrate_clear(struct
>>>> xe_migrate *m,
>>>>            if (clear_vram &&
>>>> xe_migrate_allow_identity(clear_L0, &src_it))
>>>>                xe_res_next(&src_it, clear_L0);
>>>>            else
>>>> -            emit_pte(m, bb, clear_L0_pt, clear_vram,
>>>> clear_system_ccs,
>>>> +            emit_pte(m, bb, clear_L0_pt, clear_vram,
>>>> clear_only_system_ccs,
>>>>                     &src_it, clear_L0, dst);
>>>>               bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>>>            update_idx = bb->len;
>>>>    -        if (!clear_system_ccs)
>>>> +        if (clear_bo_data)
>>>>                emit_clear(gt, bb, clear_L0_ofs, clear_L0,
>>>> XE_PAGE_SIZE, clear_vram);
>>>>               if (xe_migrate_needs_ccs_emit(xe)) {
>>>> @@ -1172,7 +1183,7 @@ struct dma_fence *xe_migrate_clear(struct
>>>> xe_migrate *m,
>>>>            return ERR_PTR(err);
>>>>        }
>>>>    -    if (clear_system_ccs)
>>>> +    if (clear_ccs)
>>>>            bo->ccs_cleared = true;
>>>>           return fence;
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
>>>> b/drivers/gpu/drm/xe/xe_migrate.h
>>>> index 453e0ecf5034..7929cc2425e8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>>> @@ -102,9 +102,14 @@ struct dma_fence *xe_migrate_copy(struct
>>>> xe_migrate *m,
>>>>                      struct ttm_resource *dst,
>>>>                      bool copy_only_ccs);
>>>>    +#define XE_MIGRATE_CLEAR_FLAG_BO_DATA        BIT(0)
>>>> +#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA        BIT(1)
>>>> +#define
>>>> XE_MIGRATE_CLEAR_FLAG_FULL    (XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
>>>> +                    XE_MIGRATE_CLEAR_FLAG_CCS_
>>>> DATA)
>>>>    struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>>                       struct xe_bo *bo,
>>>> -                   struct ttm_resource *dst);
>>>> +                   struct ttm_resource *dst,
>>>> +                   u32 clear_flags);
>>>>       struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
