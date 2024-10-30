Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B33D5CC9F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 11:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3B10E792;
	Wed, 30 Oct 2024 11:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAFf0NX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4A210E792
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730289195; x=1761825195;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zx8/qwZEXM2XbbFCrXUNZSr6iO3VaNZ9qTP2+OJirp8=;
 b=QAFf0NX2gT2FzwdegQRJy2L5StGuZfiQTTanH95p82BIRDbWcUkalqo6
 zsN+jE2YBefd/GRQ4eLTqQ4sUKs20YgbnXwcUEQk7aoWqAQ/ImuaESZyk
 CnMWtoJyGEvLNl/5y9wqLGX2nUc2DpGnyn91PGxct6jSrw+YluRCDWvX8
 w/q01Llw6XTzlnncDMRT6RwuXOc7vkIpGKob68gTaSOjv3GI+MCBii+f+
 vLGfc7XQjXzzGnVRjneyXPBykGuHoCH5oC5I3/KMWG63FhJcap2YLDnYr
 Y5wfIIU2Oh5+ltyLxVhinQAmAtDxqH4surF9RIZmQ2onKRjtWo972ObwG g==;
X-CSE-ConnectionGUID: svF+lT3mSBOAkq7P1TNg+w==
X-CSE-MsgGUID: M9NNvJ5uRUq5wvU4cCTEqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29882649"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="29882649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 04:53:13 -0700
X-CSE-ConnectionGUID: IBt8oKs/QO2UKEDdEY/BzA==
X-CSE-MsgGUID: nyUYB7l/Rpqeuox+yHkDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87074798"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.252])
 ([10.245.244.252])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 04:53:12 -0700
Message-ID: <ffeddfe8-6912-4d38-983b-951909c1a614@intel.com>
Date: Wed, 30 Oct 2024 11:53:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 umesh.nerlige.ramappa@intel.com, riana.tauro@intel.com
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-3-matthew.brost@intel.com>
 <326aaf08-60ef-4eb8-8565-093488b4c9d3@intel.com>
 <ZyD346NUGiL76Hbq@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZyD346NUGiL76Hbq@DUT025-TGLU.fm.intel.com>
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

On 29/10/2024 14:57, Matthew Brost wrote:
> On Tue, Oct 29, 2024 at 09:44:32AM +0000, Matthew Auld wrote:
>> On 29/10/2024 00:32, Matthew Brost wrote:
>>> GGTT mappings reside on the device and this state is lost during suspend
>>> / d3cold thus this state must be restored resume regardless if the BO is
>>> in system memory or VRAM.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> I think this needs fixes?
>>
> 
> I don't think we have a user of SYSTEM pinned BOs upstream on DGFX
> platforms yet. But let me double check... If we do, then yea fixes tags
> would be good.
> 
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
>>>    drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index bd747e53eb9b..6c8fd5ced2a2 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -890,8 +890,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>>>    	if (WARN_ON(!xe_bo_is_pinned(bo)))
>>>    		return -EINVAL;
>>> -	if (WARN_ON(!xe_bo_is_vram(bo)))
>>> -		return -EINVAL;
>>> +	if (!xe_bo_is_vram(bo))
>>> +		return 0;
>>
>> In the suspend flow in xe_bo_evict_all() there is:
>>
>> 	if (!IS_DGFX(xe))
>> 		return 0;
>>
>> But seems like we now need this flow for igpu, so need to also drop that
>> check?
>>
> 
> I don't think so. AFIAK GGTT mappings are not blown away on iGPU
> platforms so this isn't needed.

It sounded like GGTT lives inside stolen memory on igpu, which is not 
treated like normal RAM pages. IIRC the way this used to work was that 
core kernel reads some special registers during early boot to get the 
stolen memory range, which is then marked as reserved in e820 memory 
map. It then also sets up intel_graphics_stolen_res, which KMD can later 
access to get the stolen range. There won't be any struct page's for 
this range AFAIK. And I think this range will also then be marked as 
"nosave" which will then be ignored by core-kernel for stuff like 
hibernation. Also historically trying to access stolen directly from the 
CPU like normal RAM was not really always reliable so you had to resort 
to stuff like GGTT mappable aperture, which core-kernel wouldn't know so 
I think makes sense for it to leave well alone. See 
xe_ttm_stolen_cpu_access_needs_ggtt() for example. On MTL+ igpu the 
stolen handling is quite different where it looks more like VRAM and you 
access it through LMEMBAR and there is no intel_graphics_stolen_res, so 
not completely sure what else is different there...

Anyway, I guess can park for now and circle back around later once we 
land this, once we can confirm we need something for igpu case. I was 
just hoping this would also help with: 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3275

> 
> Matt
> 
>>>    	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
>>>    		ttm_bo_move_null(&bo->ttm, NULL);
>>> @@ -946,6 +946,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>>    		.interruptible = false,
>>>    	};
>>>    	struct ttm_resource *new_mem;
>>> +	struct ttm_place *place = &(bo->placements[0]);
>>>    	int ret;
>>>    	xe_bo_assert_held(bo);
>>> @@ -961,6 +962,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>>    			return -EINVAL;
>>>    	}
>>> +	if (!mem_type_is_vram(place->mem_type))
>>> +		return 0;
>>> +
>>>    	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
>>>    	if (ret)
>>>    		return ret;
>>> @@ -1814,7 +1818,10 @@ int xe_bo_pin(struct xe_bo *bo)
>>>    			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>>>    				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
>>>    			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
>>> +		}
>>> +		if (mem_type_is_vram(place->mem_type) ||
>>> +		    bo->flags & XE_BO_FLAG_GGTT) {
>>>    			spin_lock(&xe->pinned.lock);
>>>    			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>>>    			spin_unlock(&xe->pinned.lock);
>>> @@ -1875,7 +1882,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>>>    	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
>>>    		struct ttm_place *place = &(bo->placements[0]);
>>> -		if (mem_type_is_vram(place->mem_type)) {
>>> +		if (mem_type_is_vram(place->mem_type) ||
>>> +		    bo->flags & XE_BO_FLAG_GGTT) {
>>>    			spin_lock(&xe->pinned.lock);
>>>    			xe_assert(xe, !list_empty(&bo->pinned_link));
>>>    			list_del_init(&bo->pinned_link);
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>>> index 541b49007d73..32043e1e5a86 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>>> @@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>>>    		 * should setup the iosys map.
>>>    		 */
>>>    		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
>>> -		xe_assert(xe, xe_bo_is_vram(bo));
>>>    		xe_bo_put(bo);
