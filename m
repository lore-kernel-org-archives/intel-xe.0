Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BACC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 07:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCF10E491;
	Wed, 31 May 2023 07:57:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7433910E491
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685519856; x=1717055856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4vXgsbw8av2yMb9Gxe6s1AAofxz0OzJJqKDgSbx/LvU=;
 b=Lu2VW6/xfL/R0Shr+rwWjzG6KpS/089WNVn9EYRTlT3eJiI48m3Ld/63
 tw1xg6CsPfrK3XHNGi6MD32VfrXa7zGCvCv87vf2Mpprsbp6pOAmIntP2
 YA7nTLbIvnEC8xJhn9os9EbsAbLYEJoryJ6llsTccKtQb+xnez6jTq/yx
 x5SjkjO9oAE3Hi9900B7lrTgsp1/7MMRandrKQlc3kw7oEjMERlHxxA1p
 /JbfIYpdDv/Ig2RwEx+qOAKzuwF01480zLQks2HS0a/TDyWN1ELC189GP
 Ap3LJyh7e1ncKD/tTowEj0zJLFmBmynY4tHbCPqGjV3GVIlVw33/iSV+Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352664081"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="352664081"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 00:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709972457"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="709972457"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 00:57:25 -0700
Message-ID: <ba015cdf-3b98-48c7-8a2d-ec4419c6668e@linux.intel.com>
Date: Wed, 31 May 2023 09:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
References: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
 <a0112b3f617356d507f055f081dc72071607ea0e.camel@intel.com>
 <ZHZVN6NOZw1hAcJK@nvishwa1-DESK>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZHZVN6NOZw1hAcJK@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Apply upper limit to sg element
 size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/30/23 21:57, Niranjana Vishwanathapura wrote:
> On Fri, May 26, 2023 at 02:12:23AM -0700, Hellstrom, Thomas wrote:
>> Hi, Niranjana.
>>
>> On Thu, 2023-05-25 at 12:35 -0700, Niranjana Vishwanathapura wrote:
>>> The iommu_dma_map_sg() function ensures iova allocation doesn't
>>> cross dma segment boundary. It does so by padding some sg elements.
>>> This can cause overflow, ending up with sg->length being set to 0.
>>> Avoid this by halving the maximum segment size (rounded down to
>>> PAGE_SIZE).
>>>
>>> Specify maximum segment size for sg elements by using
>>> sg_alloc_table_from_pages_segment() to allocate sg_table.
>>>
>>> v2: Use correct max segment size in dma_set_max_seg_size() call
>>
>> OK, I've finally read up a bit on the code, and as you say
>> dma_set_max_seg_size() doesn't affect the sg_alloc_table_from_pages()
>> code at all, so we must use sg_alloc_table_from_pages_segment() as you
>> say.
>>
>> The problem stems from the iommu code trying to align scatterlist
>> elements to dma segment boundaries, and the scatterlist::length can
>> overflow pretty much regardless of the value of the segment boundaries,
>> as you said previously.
>>
>> But the size of the padding can never exceed the length of an sg
>> element, because then the sg element would have fit and no padding
>> needed. So that the only restriction needed would be
>> scatterlist::length must never exceed UINT_MAX / 2, which was pretty
>> much the version 1 of the patch. So some comments below:
>>
>>>
>>> Signed-off-by: Niranjana Vishwanathapura
>>> <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_bo.c   |  8 +++++---
>>>  drivers/gpu/drm/xe/xe_bo.h   | 21 +++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_mmio.c |  7 ++-----
>>>  drivers/gpu/drm/xe/xe_vm.c   |  8 +++++---
>>>  4 files changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index c82e995df779..21c5aca424dd 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>>>         if (xe_tt->sg)
>>>                 return 0;
>>>
>>> -       ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
>>> num_pages,
>>> -                                       0, (u64)num_pages <<
>>> PAGE_SHIFT,
>>> -                                       GFP_KERNEL);
>>> +       ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt-
>>> >pages,
>>> +                                               num_pages, 0,
>>> +                                               (u64)num_pages <<
>>> PAGE_SHIFT,
>>> +                                               xe_sg_segment_size(xe
>>> _tt->dev),
>>> +                                               GFP_KERNEL);
>>>         if (ret)
>>>                 return ret;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>> index 7e111332c35a..a1c51cc0ac3c 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>> @@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
>>> *deferred);
>>>
>>>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>>>
>>> +/*
>>> + * xe_sg_segment_size() - Provides upper limit for sg segment size.
>>> + * @dev: device pointer
>>> + *
>>> + * Returns the maximum segment size for the 'struct scatterlist'
>>> + * elements.
>>> + */
>>> +static inline unsigned int xe_sg_segment_size(struct device *dev)
>>> +{
>>> +       size_t max = min_t(size_t, UINT_MAX,
>>> dma_max_mapping_size(dev));
>>
>> dma_max_mapping_size() should be unrelated? perhaps
>>
>>     struct scatterlist __maybe_unused sg;
>>     size_t max = 1ULL << (sizeof(sg.length) * 8);
>
> Thanks Thomas,
> '(1ULL << (sizeof(sg.length) * 8) - 1)' is UINT_MAX which is used above.

Yes, that is true, but if someone wonders why UINT_MAX is used or 
someone decides to change the type of sg.length, that expression would 
be safer..


>
> Regarding whether to limit the 'max' to dma_max_mapping_size(dev), I am
> not sure, xe_sg_segment_size() does similiar to i915_sg_segment_size.
> Though it sounds logical to limit max segment size to that imposed by the
> iommu driver, I am not seeing intel iommu driver defining 
> 'max_mapping_size'
> function and not many drivers using dma_max_mapping_size() function. What
> do you suggest?

Hmm. Looking at the history it looks like this was required for correct 
operation of swiotlb. OK, yes then we should probably have it in there.
It's also in drm_prime_pages_to_sg() which also suffer from the iommu 
code flaw from what I can tell.

/Thomas

>
>>
>>> +
>>> +       /*
>>> +        * The iommu_dma_map_sg() function ensures iova allocation
>>> doesn't
>>> +        * cross dma segment boundary. It does so by padding some sg
>>> elements.
>>> +        * This can cause overflow, ending up with sg->length being
>>> set to 0.
>>> +        * Avoid this by ensuring maximum segment size is half of
>>> 'max'
>>> +        * rounded down to PAGE_SIZE.
>>> +        */
>>> +       return round_down(max / 2, PAGE_SIZE);
>>> +}
>>> +
>>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>>  /**
>>>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>> b/drivers/gpu/drm/xe/xe_mmio.c
>>> index c7fbb1cc1f64..4c270a07136e 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -11,6 +11,7 @@
>>>  #include "regs/xe_engine_regs.h"
>>>  #include "regs/xe_gt_regs.h"
>>>  #include "regs/xe_regs.h"
>>> +#include "xe_bo.h"
>>>  #include "xe_device.h"
>>>  #include "xe_gt.h"
>>>  #include "xe_gt_mcr.h"
>>> @@ -26,11 +27,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>>         unsigned int mask_size = xe->info.dma_mask_size;
>>>         int err;
>>>
>>> -       /*
>>> -        * We don't have a max segment size, so set it to the max so
>>> sg's
>>> -        * debugging layer doesn't complain
>>> -        */
>>> -       dma_set_max_seg_size(xe->drm.dev, UINT_MAX);
>>> +       dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe-
>>> >drm.dev));
>>
>> Should not be needed then?
>>
>
> After dma mapping, the iommu code in __finalise_sg() function
> contanenates segments based on dma address while subjecting the
> sg element length to maximum segment size specified here. Though
> at this stage where dma mapping is already done, we probably need
> not adhere to our maximum segment size, I thought it is probably 
> better to stick to spcified maximum segment size throughout.
>
> Niranjana
>
>>>
>>>         err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>>>         if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index a0306526b269..4d9c8de8b348 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>>         if (ret)
>>>                 goto out;
>>>
>>> -       ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages,
>>> pinned,
>>> -                                       0, (u64)pinned << PAGE_SHIFT,
>>> -                                       GFP_KERNEL);
>>> +       ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt,
>>> pages,
>>> +                                               pinned, 0,
>>> +                                               (u64)pinned <<
>>> PAGE_SHIFT,
>>> +                                               xe_sg_segment_size(xe
>>> ->drm.dev),
>>> +                                               GFP_KERNEL);
>>>         if (ret) {
>>>                 vma->userptr.sg = NULL;
>>>                 goto out;
>>
>> Thanks
>> /Thomas
>>
