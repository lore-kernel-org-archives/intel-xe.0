Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA186C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 16:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079DA10E1BB;
	Mon, 17 Mar 2025 16:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRIdVV7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B510E1BB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230208; x=1773766208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t9pUwLMfpfk33OVAFa+b/MizJT7AJRH0EO85dd+3G48=;
 b=iRIdVV7L5D7DaIzjtg5zYwrfX3hxQNbIEySXMdjaGxgCgjFQLzJTmYRe
 WqUjGQRnbmmQGujzt61sRLCF31PAzZgjQYKF/agKvRUfNioRipEkZr2yI
 xwhwn62ufpGY0DQzQwSfzPgjVGPzEHjWOBfAeBfWxAXLtIXFj6qd23TWX
 VAKaHXT2otWPHmx4P0e4Q8WOce1awykqlrbgALKlD9csETl9u99Z0jubm
 8wzrX8hy7dhxnZKWmYdc7IlO2Dy5GF2aGUNpiv2v4rZu0TEh2ObgqfyYK
 xXqvLE1zaWdu+WQJE+TOO8l1w2tjQxga0VTVh5pdj7yRlhIO4lDDE+2NG A==;
X-CSE-ConnectionGUID: gk//f9ygS6yJtGn3MEDsEA==
X-CSE-MsgGUID: PYG2yuB6Sp6pW54YyOoDkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="46102236"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="46102236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:50:04 -0700
X-CSE-ConnectionGUID: vA1uLcLdTveLB7H2neQ5/A==
X-CSE-MsgGUID: h0+t7v3aTDSwVSInhJnelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="126653527"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.8])
 ([10.245.245.8])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:50:03 -0700
Message-ID: <93fe9e47-6cbd-443c-b08f-0c5a62daafa5@intel.com>
Date: Mon, 17 Mar 2025 16:50:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/bo: Add a bo remove callback
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-4-thomas.hellstrom@linux.intel.com>
 <46faf433-a7d7-480e-be87-4989c5162ea1@intel.com>
 <1d313655ac3c7e0444ccd354166fa83d2dc6244a.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1d313655ac3c7e0444ccd354166fa83d2dc6244a.camel@linux.intel.com>
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

On 17/03/2025 16:16, Thomas Hellström wrote:
> On Mon, 2025-03-17 at 15:58 +0000, Matthew Auld wrote:
>> On 17/03/2025 10:41, Thomas Hellström wrote:
>>> On device unbind, migrate exported bos, including pagemap bos to
>>> system. This allows importers to take proper action without
>>> disruption. In particular, SVM clients on remote devices may
>>> continue as if nothing happened, and can chose a different
>>> placement.
>>>
>>> The evict_flags() placement is chosen in such a way that bos that
>>> aren't exported are purged.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c     | 96
>>> +++++++++++++++++++++++++++++++++-
>>>    drivers/gpu/drm/xe/xe_bo.h     |  2 +
>>>    drivers/gpu/drm/xe/xe_device.c |  2 +
>>>    3 files changed, 99 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 64f9c936eea0..c7c206041632 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -55,6 +55,8 @@ static struct ttm_placement sys_placement = {
>>>    	.placement = &sys_placement_flags,
>>>    };
>>>    
>>> +static struct ttm_placement purge_placement;
>>> +
>>>    static const struct ttm_place tt_placement_flags[] = {
>>>    	{
>>>    		.fpfn = 0,
>>> @@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device
>>> *xe, struct xe_bo *bo,
>>>    static void xe_evict_flags(struct ttm_buffer_object *tbo,
>>>    			   struct ttm_placement *placement)
>>>    {
>>> +	struct xe_device *xe = container_of(tbo->bdev,
>>> typeof(*xe), ttm);
>>> +	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
>>>    	struct xe_bo *bo;
>>>    
>>>    	if (!xe_bo_is_xe_bo(tbo)) {
>>> @@ -290,7 +294,7 @@ static void xe_evict_flags(struct
>>> ttm_buffer_object *tbo,
>>>    			return;
>>>    		}
>>>    
>>> -		*placement = sys_placement;
>>> +		*placement = device_unplugged ? purge_placement :
>>> sys_placement;
>>>    		return;
>>>    	}
>>>    
>>> @@ -300,6 +304,11 @@ static void xe_evict_flags(struct
>>> ttm_buffer_object *tbo,
>>>    		return;
>>>    	}
>>>    
>>> +	if (device_unplugged && !tbo->base.dma_buf) {
>>> +		*placement = purge_placement;
>>> +		return;
>>> +	}
>>
>>> +
>>>    	/*
>>>    	 * For xe, sg bos that are evicted to system just triggers
>>> a
>>>    	 * rebind of the sg list upon subsequent validation to
>>> XE_PL_TT.
>>> @@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct
>>> ttm_buffer_object *ttm_bo,
>>>    	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct
>>> xe_ttm_tt,
>>>    					       ttm);
>>>    	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
>>>    	struct sg_table *sg;
>>>    
>>>    	xe_assert(xe, attach);
>>>    	xe_assert(xe, ttm_bo->ttm);
>>>    
>>> +	if (device_unplugged && new_res->mem_type == XE_PL_SYSTEM
>>> &&
>>> +	    ttm_bo->sg) {
>>> +		dma_resv_wait_timeout(ttm_bo->base.resv,
>>> DMA_RESV_USAGE_BOOKKEEP,
>>> +				      false,
>>> MAX_SCHEDULE_TIMEOUT);
>>> +		dma_buf_unmap_attachment(attach, ttm_bo->sg,
>>> DMA_BIDIRECTIONAL);
>>> +		ttm_bo->sg = NULL;
>>> +	}
>>
>>> +
>>>    	if (new_res->mem_type == XE_PL_SYSTEM)
>>>    		goto out;
>>>    
>>> @@ -2945,6 +2963,82 @@ void
>>> xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>>>    	list_del_init(&bo->vram_userfault_link);
>>>    }
>>>    
>>> +static void xe_bo_dma_unmap_pinned(struct xe_device *xe)
>>
>> Should we prefix this with xe_device_ or something?
>> xe_device_unmap_pinned_bo() ?
> 
> Hmm, yes, while it doesn't take a bo as argument, I think it should
> reside in the bo subsystem. Let me check whether we should split this
> up and have the loops elsewhere.
> 
>>
>>> +{
>>> +	struct list_head still_in_list;
>>> +
>>> +	INIT_LIST_HEAD(&still_in_list);
>>
>> LIST_HEAD(still_in_list);
> 
> Right. Will fix.
>>
>>
>>> +	spin_lock(&xe->pinned.lock);
>>> +	for (;;) {
>>> +		struct xe_bo *bo = list_first_entry_or_null(&xe-
>>>> pinned.kernel_bo_present,
>>> +							
>>> typeof(*bo), pinned_link);
>>> +		struct ttm_buffer_object *ttm_bo;
>>> +		struct ttm_tt *tt;
>>> +		struct xe_ttm_tt *xe_tt;
>>> +
>>> +		if (!bo)
>>> +			break;
>>> +
>>> +		list_move_tail(&bo->pinned_link, &still_in_list);
>>> +		xe_bo_get(bo);
>>> +		spin_unlock(&xe->pinned.lock);
>>> +
>>> +		xe_bo_lock(bo, false);
>>> +		ttm_bo = &bo->ttm;
>>> +		tt = ttm_bo->ttm;
>>> +		if (tt) {
>>> +			xe_ttm_bo_delete_mem_notify(ttm_bo);
>>
>> Do we actually need this?
> 
> It's for imported pinned dma-bufs, I don't think we have any of these
> ATM, but might in the future I guess. OFC I can structure that a bit
> nicer.

Ah ok. But here we are looping over kernel_bo_present, do we really have 
dma-buf stuff on that? I only see the vram list thing, did you mean that?

> 
>>
>>> +			xe_tt = container_of(tt, typeof(*xe_tt),
>>> ttm);
>>> +			if (xe_tt->sg) {
>>> +				dma_unmap_sgtable(xe_tt->xe-
>>>> drm.dev, xe_tt->sg,
>>> +						
>>> DMA_BIDIRECTIONAL, 0);
>>> +				sg_free_table(xe_tt->sg);
>>> +				xe_tt->sg = NULL;
>>> +			}
>>
>> Would it make sense to also call ttm_tt_unpopulate() here, so we nuke
>> the pages?
> 
> I think we arrived at not nuking the pages for exported dma-bufs. For
> the other use-cases I guess it's hard to tell: Is there a chance that
> whatever needed the buffer pinned can issue a stray write?
> 
> I still think the best approach would to ensure that those subsystems
> used devm_ managed resources rather than drmm_-managed resources.
> Meanwhile, I can perhaps add a comment about that?

Yeah, for dma-buf leaving the pages alone make sense. I was just getting 
thrown off by the kernel_bo_present. I don't really mind either way.

> 
>>
>>> +		}
>>> +
>>> +		xe_bo_unlock(bo);
>>> +		xe_bo_put(bo);
>>> +		spin_lock(&xe->pinned.lock);
>>> +	}
>>> +	list_splice_tail(&still_in_list, &xe-
>>>> pinned.kernel_bo_present);
>>> +	spin_unlock(&xe->pinned.lock);
>>> +}
>>
>> We could potentially move this type of thing into xe_bo_evict.c?
> 
> Could perhaps be the best choice, actually.
> 
>>
>>> +
>>> +/**
>>> + * xe_bo_remove() - Handle bos when the pci_device is about to be
>>> removed
>>> + * @xe: The xe device.
>>> + *
>>> + * On pci_device removal we need to drop all dma mappings and move
>>> + * the data of exported bos out to system. This includes SVM bos
>>> and
>>> + * exported dma-buf bos. This is done by evicting all bos, but
>>> + * the evict placement in xe_evict_flags() is chosen such that all
>>> + * bos except those mentioned are purged, and thus their memory
>>> + * is released.
>>> + *
>>> + * For pinned bos, we're unmapping dma.
>>> + */
>>> +void xe_bo_remove(struct xe_device *xe)
>>
>> xe_device_remove_bo() ?
> 
> Will look into it.
> 
>>
>>> +{
>>> +	unsigned int mem_type;
>>> +
>>> +	/*
>>> +	 * Move pagemap bos and exported dma-buf to system.
>>
>> ..and purge everything else."
> 
> Will add.
> 
> Thanks for reviewing!
> /Thomas
> 

