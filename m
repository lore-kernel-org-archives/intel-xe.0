Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94EC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 13:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69410E37A;
	Fri, 17 Mar 2023 13:02:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F8810E37A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679058167; x=1710594167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uOq/+F31h/ccwoHzm9T9CtH6jCm2LMkYyFAC/+Wniy4=;
 b=lOdeKS1cN9wonb+vf+crxP2x6k5WdXHrDW8ZqYwt1ne5AOCJR7XRz4uA
 hNDKW8crbM+/zHbr+buo0gVA16ThufERi8/1mH+8i/TtrJfUU9QFt2F91
 lSP7U/8i1xSM0iBHPlGiFr+SGEW1M39gF73yfH3rZHbQVG4tw7Qnhc92I
 VrkgPTX50dzfObCp2Dlb1AK0hx9lQzPqWGvY6t+8Ui1rWvhW3DJzygB+B
 6RByNHFz38aP7rV50f1MnbYv8g+DKABBdI6sCYj7kwxa/yNdB+vp7/Ldw
 E6b9E0ppC3Ku3JoMGLZmJlrqTMfH3DQOpqKvJjmpxyLvlfrxt52bWAtV5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336954463"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="336954463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 06:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712748819"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="712748819"
Received: from dbyrne3-mobl1.ger.corp.intel.com (HELO [10.252.0.122])
 ([10.252.0.122])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 06:02:45 -0700
Message-ID: <7c940122-20d0-600b-e045-86c1b1712dac@intel.com>
Date: Fri, 17 Mar 2023 13:02:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-5-matthew.auld@intel.com>
 <3f48da8f-7c9a-5cdc-f323-826a50f256ef@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <3f48da8f-7c9a-5cdc-f323-826a50f256ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 4/6] drm/xe/buddy: remove the virtualized
 start
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

On 17/03/2023 11:52, Gwan-gyeong Mun wrote:
> 
> 
> On 3/14/23 10:58 AM, Matthew Auld wrote:
>> Hopefully not needed anymore. We can add a .compatible() hook once we
>> need to differentiate between mappable and non-mappable vram. If the
>> allocation is not contiguous then the start value is kind of
>> meaningless, so rather just mark as invalid.
>>
>> In upstream, TTM wants to eventually remove the ttm_resource.start
>> usage.
> Hi Matt,
> If there is a related rfc or discussion, could you please share a 
> reference?

I think it was maybe discussed off list. But there have been patches 
that try to move in that general direction like: 544432703b2f ("drm/ttm: 
Add new callbacks to ttm res mgr"). Which gets rid of the main user in 
ttm for base.start (drivers still make use of it though). Better is to 
keep it at the resource manager level. The "virtualized" start here is 
basically trying to workaround the fact that [res.start, res.size] can't 
really represent a non-contiguous allocations.

For example, if you look at that patch, ttm was using [res.start, 
res.size] to help determine if the existing resource was compatible with 
the new placement. Basically if you want to move a resource from A -> B, 
where both are the same VRAM, without the above it would always turn the 
move into a noop, since A & B are the same resource type, and are 
therefore "compatible".

However with small-bar, you also have mappable vs non-mappable VRAM, and 
you might want to move between them, so the "virtualized" start ensures 
that [res.start, res.end] <= mappable size, even for non-contiguous 
allocations, if the entire resource is mappable, and vice versa. With 
the .compatible() hook that is all pushed into the resource manager, so 
we don't need such tricks. See also the i915 equivalent: da6198afb01d 
("drm/i915/ttm: remove the virtualized start hack").

>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           |  6 ++++++
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
>>   2 files changed, 20 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 73a7f2cd4ad8..346573f406c2 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -662,6 +662,12 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>                   void *new_addr = gt->mem.vram.mapping +
>>                       (new_mem->start << PAGE_SHIFT);
>> +                if (XE_WARN_ON(new_mem->start == 
>> XE_BO_INVALID_OFFSET)) {
> Are there really any use cases for moving to memory allocated with 
> xe_ttm_gtt_mgr_func()?

The above is only for pinned VRAM objects, which are always contiguous, 
and therefore have a valid start value. I just added the above sanity 
check to double check that, and make the error more obvious if we ever 
trigger it.

> 
> Br,
> G.G.
>> +                    ret = -EINVAL;
>> +                    xe_device_mem_access_put(xe);
>> +                    goto out;
>> +                }
>> +
>>                   XE_BUG_ON(new_mem->start !=
>>                         bo->placements->fpfn);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 159ca7105df1..bafcadaed6b0 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -54,7 +54,6 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       struct xe_ttm_vram_mgr_resource *vres;
>>       u64 size, remaining_size, lpfn, fpfn;
>>       struct drm_buddy *mm = &mgr->mm;
>> -    struct drm_buddy_block *block;
>>       unsigned long pages_per_block;
>>       int r;
>> @@ -186,24 +185,24 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>               list_splice_tail(trim_list, &vres->blocks);
>>       }
>> -    vres->base.start = 0;
>> -    list_for_each_entry(block, &vres->blocks, link) {
>> -        unsigned long start;
>> +    if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>> +        xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>> +        vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>> -        start = drm_buddy_block_offset(block) +
>> -            drm_buddy_block_size(mm, block);
>> -        start >>= PAGE_SHIFT;
>> +    /*
>> +     * For some kernel objects we still rely on the start when io 
>> mapping
>> +     * the object.
>> +     */
>> +    if (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) {
>> +        struct drm_buddy_block *block = list_first_entry(&vres->blocks,
>> +                                 typeof(*block),
>> +                                 link);
>> -        if (start > PFN_UP(vres->base.size))
>> -            start -= PFN_UP(vres->base.size);
>> -        else
>> -            start = 0;
>> -        vres->base.start = max(vres->base.start, start);
>> +        vres->base.start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +    } else {
>> +        vres->base.start = XE_BO_INVALID_OFFSET;
>>       }
>> -    if (xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>> -        vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>> -
>>       *res = &vres->base;
>>       return 0;
