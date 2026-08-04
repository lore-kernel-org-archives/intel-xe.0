Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103BC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3034C10E66F;
	Tue,  4 Aug 2026 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh8btySd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EAC10E66F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785836171; x=1817372171;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PTgODTSOyYoPIitFWwNJrFFngDdNSzo+gySdbNeFMVg=;
 b=Qh8btySdXdQRmjftOt6xEtSwFRW7FuXDf/e9JkygtTIClknqsaKxy1sB
 Cgw+MR74il453n/7uUUH09NgCju96gDNu0bUad6TfaFYu3phi78v7PEmK
 q8I5FLYO+iwPDuP6bl2YEcV2EWOJxNQ2pVQl5aGdTC7FwpXzb6z71Mfwe
 w5PRLFyE+L1447pOT39UxJoIp66LUb1dRrF3RJb2z6q8rq+yMlpr96X48
 +P0CnCnxgl/tO4u6tc05nDbEUzbcvLuktc3Xpp0DQP5HYgSdDRLw1B+tm
 VmNCoPpLRAjpv8SAdxavyipyBQXu7e50n9EaGxwH8QueEHC72aLYGPst6 w==;
X-CSE-ConnectionGUID: J3eSqtsYTSu7huTx2f4c2w==
X-CSE-MsgGUID: qrUb+daPTTSChPa45wzhiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85513159"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="85513159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:36:09 -0700
X-CSE-ConnectionGUID: rtLoMbzkTRODtNAQmqmY6g==
X-CSE-MsgGUID: p+V95zCLQ/e8NPKMeEztQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="299696401"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.172])
 ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:36:08 -0700
Message-ID: <9ec5c038-8e59-4419-90f5-474305f4822b@intel.com>
Date: Tue, 4 Aug 2026 10:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/xe/guc_ads: allocate UM queues in a separate BO
To: Matthew Brost <matthew.brost@intel.com>
Cc: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, stable@vger.kernel.org
References: <20260803200838.98826-1-jia.yao@intel.com>
 <20260803200838.98826-2-jia.yao@intel.com>
 <fff60c87-460c-4713-a65a-e9c3841bbf2b@intel.com>
 <anGo2nE/j1QUKE0J@gsse-cloud1.jf.intel.com>
 <23d6d8e8-a885-4bed-8384-d2b0b8dc5e11@intel.com>
 <anGwGd94veAeFIJ/@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <anGwGd94veAeFIJ/@gsse-cloud1.jf.intel.com>
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

On 04/08/2026 10:25, Matthew Brost wrote:
> On Tue, Aug 04, 2026 at 10:16:07AM +0100, Matthew Auld wrote:
>> On 04/08/2026 09:54, Matthew Brost wrote:
>>> On Tue, Aug 04, 2026 at 09:00:19AM +0100, Matthew Auld wrote:
>>>> On 03/08/2026 21:08, Jia Yao wrote:
>>>>> Move the UM queues into a dedicated UC BO (ads->um_queue_bo) and avoid
>>>>> CPU memset operations on it, which eliminates the CPU as a potential
>>>>> cacheline-polluting agent and helps maintain consistency between GAM
>>>>> writes and GuC reads.
>>>>>
>>>>> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
>>>>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: <stable@vger.kernel.org> # v6.12+
>>>>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc.c           |  6 ++
>>>>>     drivers/gpu/drm/xe/xe_guc_ads.c       | 89 +++++++++++++++++----------
>>>>>     drivers/gpu/drm/xe/xe_guc_ads_types.h |  5 ++
>>>>>     3 files changed, 68 insertions(+), 32 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 4286bd05c686..4f132bf8539d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -732,6 +732,12 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>>>>     	if (ret)
>>>>>     		return ret;
>>>
>>> Add a newline here.
>>>
>>>>> +	if (guc->ads.um_queue_bo) {
>>>>> +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +	}
>>>>> +
>>>>>     	return 0;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> index f0ac00586d3a..ef8e9cc35c8c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> @@ -8,6 +8,7 @@
>>>>>     #include <linux/fault-inject.h>
>>>>>     #include <drm/drm_managed.h>
>>>>> +#include <drm/drm_prime.h>
>>>>>     #include <generated/xe_wa_oob.h>
>>>>> @@ -64,10 +65,14 @@ ads_to_map(struct xe_guc_ads *ads)
>>>>>     /*
>>>>>      * The Additional Data Struct (ADS) has pointers for different buffers used by
>>>>> - * the GuC. One single gem object contains the ADS struct itself (guc_ads) and
>>>>> - * all the extra buffers indirectly linked via the ADS struct's entries.
>>>>> + * the GuC. One gem object (ads->bo) contains the ADS struct itself (guc_ads)
>>>>> + * and most of the extra buffers linked via the ADS struct's entries.  The UM
>>>>> + * fault queues (PAGE_FAULT, PAGE_FAULT_RESPONSE, ACCESS_COUNTER rings) are
>>>>> + * kept in a separate BO (ads->um_queue_bo) so that the full memset of ads->bo
>>>>> + * performed on every GT reset does not discard fault descriptors already
>>>>> + * written into the rings by the GPU.
>>>>>      *
>>>>> - * Layout of the ADS blob allocated for the GuC:
>>>>> + * Layout of the ADS blob (ads->bo):
>>>>>      *
>>>>>      *      +---------------------------------------+ <== base
>>>>>      *      | guc_ads                               |
>>>>> @@ -99,10 +104,6 @@ ads_to_map(struct xe_guc_ads *ads)
>>>>>      *      +---------------------------------------+
>>>>>      *      | padding                               |
>>>>>      *      +---------------------------------------+ <== 4K aligned
>>>>> - *      | UM queues                             |
>>>>> - *      +---------------------------------------+
>>>>> - *      | padding                               |
>>>>> - *      +---------------------------------------+ <== 4K aligned
>>>>>      *      | private data                          |
>>>>>      *      +---------------------------------------+
>>>>>      *      | padding                               |
>>>>> @@ -156,16 +157,6 @@ static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>>>>     	return PAGE_ALIGN(ads->capture_size);
>>>>>     }
>>>>> -static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
>>>>> -{
>>>>> -	struct xe_device *xe = ads_to_xe(ads);
>>>>> -
>>>>> -	if (!xe->info.has_usm)
>>>>> -		return 0;
>>>>> -
>>>>> -	return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
>>>>> -}
>>>>> -
>>>>>     static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
>>>>>     {
>>>>>     	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
>>>>> @@ -206,22 +197,12 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>>>>     	return PAGE_ALIGN(offset);
>>>>>     }
>>>>> -static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
>>>>> -{
>>>>> -	u32 offset;
>>>>> -
>>>>> -	offset = guc_ads_capture_offset(ads) +
>>>>> -		 guc_ads_capture_size(ads);
>>>>> -
>>>>> -	return PAGE_ALIGN(offset);
>>>>> -}
>>>>> -
>>>>>     static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
>>>>>     {
>>>>>     	size_t offset;
>>>>> -	offset = guc_ads_um_queues_offset(ads) +
>>>>> -		guc_ads_um_queues_size(ads);
>>>>> +	offset = guc_ads_capture_offset(ads) +
>>>>> +		guc_ads_capture_size(ads);
>>>>>     	return PAGE_ALIGN(offset);
>>>>>     }
>>>>> @@ -461,6 +442,44 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>>>>     	ads->bo = bo;
>>>>> +	if (xe->info.has_usm) {
>>>>> +		/*
>>>>> +		 * Allocate a separate BO for the HW fault ring (UM queues).
>>>>> +		 *
>>>>> +		 * Round the size up to the next power of two so that
>>>>> +		 * (system memory, no IOMMU) the TTM pool issues a single
>>>>> +		 * alloc_pages(order=N) call, maximising the chance of getting
>>>>> +		 * a physically contiguous block.  GuC requires contiguous DPA.
>>>>> +		 */
>>>>> +		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
>>>>> +						    GUC_UM_HW_QUEUE_MAX);
>>>>> +
>>>>> +		bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
>>>>> +						  XE_BO_FLAG_SYSTEM |
>>>>> +						  XE_BO_FLAG_GGTT |
>>>>> +						  XE_BO_FLAG_GGTT_INVALIDATE |
>>>>> +						  XE_BO_FLAG_PINNED_NORESTORE);
>>>>> +		if (IS_ERR(bo))
>>>>> +			return PTR_ERR(bo);
>>>>> +
>>>>> +		/*
>>>>> +		 * On pre-Xe3p platforms, GAM (not GuC) accesses the UM queue
>>>>> +		 * ring via base_dpa, which must be a contiguous DMA address
>>>>> +		 * range.  Verify that the allocated pages are contiguous in
>>>>> +		 * DMA address space.
>>>>> +		 */
>>>>> +		if (xe_bo_sg(bo) &&
>>>>
>>>>
>>>> There is a comment from Sashiko that there might not be a valid tt for vram
>>>> buffers, so perhaps just make this check !xe_bo_is_vram() instead?
>>>>
>>>>> +		    !xe_guc_using_main_gamctrl_queues(ads_to_guc(ads)) &&
>>>>> +		    unlikely(drm_prime_get_contiguous_size(xe_bo_sg(bo)) <
>>>
>>> Using drm_prime_* really is the wrong layering. Either this helper
>>> should be some drm or sg generic or IMO we implement this helper
>>> ourselves until we have a proper one in drm or sg generic.
>>>
>>> e.g., for SG specific BOs, something like this should work.
>>>
>>> xe_bo_sg_is_contigous(struct xe_bo *bo)
>>> {
>>> 	struct xe_res_cursor cur;
>>>
>>> 	xe_assert(xe_bo_device(bo), xe_bo_sg(bo));
>>> 	xe_res_first_sg(xe_bo_sg(bo), 0, xe_bo_size(bo), &cur);
>>>
>>> 	return cur.size == xe_bo_size(bo);
>>> }
>>
>> AFAICT I don't think it's the same since you could potentially get multiple
>> sg entries underneath, where they still occupy something contig as a whole,
> 
> Yes, that is possible but SG segment in Xe is 1 or 2G iirc.
> 
>> and xe_res_first_sg() doesn't try to coalesce. Maybe it should? The
> 
> As long as segment is at least 1G then it doesn't really matter for
> existing use cases.
> 
>> !xe_bo_sg_is_contigous() will be fatal, so I think we should try as hard as
>> possible for the check.
>>
>> Agreed drm_prime_get_contiguous_size() is a bit odd, but essentially we were
>> previously implementing the same thing.
> 
> Maybe move this into xe_bo helper to make this slighly more palatable
> (i.e., at least only BO layer is looking at prime).
> 
> e.g.,
> 
> xe_bo_sg_is_contigous(bo, len)
> 	return drm_prime_get_contiguous_size(xe_bo_sg(bo)) >= len;

+1

Sounds good to me.

> 
> or
> 
> xe_bo_sg_is_contigous(bo)
> 	return drm_prime_get_contiguous_size(xe_bo_sg(bo)) == xe_bo_size(bo);
> 
> Matt
> 
>>
>>>
>>> Matt
>>>
>>>>> +			     GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX)) {
>>>>> +			drm_err(&xe->drm,
>>>>> +				"UM fault queue memory is not contiguous in DMA address space; GAM requires contiguous DPA\n");
>>>>> +			return -ENOMEM;
>>>>> +		}
>>>>> +
>>>>> +		ads->um_queue_bo = bo;
>>>>> +	}
>>>>> +
>>>>>     	return 0;
>>>>>     }
>>>>>     ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
>>>>> @@ -893,7 +912,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>>>>>     static void guc_um_init_params(struct xe_guc_ads *ads)
>>>>>     {
>>>>> -	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
>>>>> +	struct xe_bo *um_bo = ads->um_queue_bo;
>>>>>     	struct xe_guc *guc = ads_to_guc(ads);
>>>>>     	struct xe_device *xe = ads_to_xe(ads);
>>>>>     	u64 base_dpa;
>>>>> @@ -903,8 +922,14 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>>>>>     	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
>>>>> -	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
>>>>> -	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>>>>> +	if (um_bo) {
>>>>> +		/* All USM platforms: UM queues in dedicated um_queue_bo */
>>>>> +		base_ggtt = xe_bo_ggtt_addr(um_bo);
>>>>> +		base_dpa = xe_bo_main_addr(um_bo, PAGE_SIZE);
>>>>> +	} else {
>>>>> +		/* Platform does not support USM: no UM queues, nothing to do */
>>>>> +		return;
>>>>> +	}
>>>>>     	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>>>>>     		/*
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>>> index 48a8e092023f..845c1fbd93a4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>>> @@ -16,6 +16,11 @@ struct xe_bo;
>>>>>     struct xe_guc_ads {
>>>>>     	/** @bo: Xe BO for GuC ads blob */
>>>>>     	struct xe_bo *bo;
>>>>> +	/**
>>>>> +	 * @um_queue_bo: Dedicated BO for the HW fault ring (UM queues).
>>>>> +	 * NULL if the platform does not support USM.
>>>>> +	 */
>>>>> +	struct xe_bo *um_queue_bo;
>>>>>     	/** @golden_lrc_size: golden LRC size */
>>>>>     	size_t golden_lrc_size;
>>>>>     	/** @regset_size: size of register set passed to GuC for save/restore */
>>>>
>>

