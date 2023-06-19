Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CDCEB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 09:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA6110E1D0;
	Mon, 19 Jun 2023 09:51:18 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783010E1D0
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687168276; x=1718704276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M6gV2arm5Q6vqPOmqI2gln1N4dsbp9TxW4fRGeVUu/E=;
 b=dcH+SsqTVYlO3LWJ68VgsirmxZls9ZVaULbeySWHHpGk3Qsdwugp6AFR
 y4WVHX1n4ClFHZFoFW/I2kups/Hn4TiPVzVq3yao4oezy8lgJLXw0rvJ4
 G5mrzsGggWtgnVn4nCzY39k5Stjbcm41t26Ym3rMVC0blKvp1QfiVuJeM
 YQurhnJdSeE5cY+MysCmdHsON5d6vdOYG57750qAPYsKwEGd02Eyo2z+m
 PxOSZ1iMAEfOl0oLYmTj2ZY64e5DZV7pECE17gBu9Ck+YHUV3Js9SRK+v
 grzeiaUXXciV1oO7Jz8kQlJHN5xxDoTVOa5Tz/6jHqPeg5b6KFcoL7wJR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423256466"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="423256466"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713610640"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="713610640"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 02:51:14 -0700
Message-ID: <fb68c2bc-d729-6b07-9a84-cb591e641124@linux.intel.com>
Date: Mon, 19 Jun 2023 11:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-4-thomas.hellstrom@linux.intel.com>
 <ZIzG5elB1mlrltsy@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZIzG5elB1mlrltsy@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/bo: Avoid creating a system
 resource when allocating a fresh VRAM bo
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 6/16/23 22:32, Matthew Brost wrote:
> On Fri, Jun 16, 2023 at 11:55:01AM +0200, Thomas Hellström wrote:
>> When creating a new bo, on the first move the bo->resource is typically
>> NULL. Our move callback rejected that instructing TTM to create a system
>> resource. In addition a struct ttm_tt with a page-vector was created,
>> although not populated with pages. Similarly when the clearing of VRAM
>> was complete, the system resource was put on a ghost object and freed
>> using the TTM delayed destroy mechanism.
>>
>> This is a lot of pointless work. So avoid creating the system resource and
>> instead change the code to cope with a NULL bo->resource.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 40 +++++++++++++++++++-------------------
>>   1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 43d81f37a855..94dd11066f51 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -479,7 +479,6 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>>    * to unconditionally call unmap_attachment() when moving out to system.
>>    */
>>   static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>> -			     struct ttm_resource *old_res,
>>   			     struct ttm_resource *new_res)
>>   {
>>   	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
>> @@ -564,6 +563,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>   	struct ttm_resource *old_mem = ttm_bo->resource;
>> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>>   	struct ttm_tt *ttm = ttm_bo->ttm;
>>   	struct xe_tile *tile = NULL;
>>   	struct dma_fence *fence;
>> @@ -572,35 +572,28 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool needs_clear;
>>   	int ret = 0;
>>   
>> -	if (!old_mem) {
>> -		if (new_mem->mem_type != TTM_PL_SYSTEM) {
>> -			hop->mem_type = TTM_PL_SYSTEM;
>> -			hop->flags = TTM_PL_FLAG_TEMPORARY;
>> -			ret = -EMULTIHOP;
>> -			goto out;
>> -		}
>> -
>> +	if (!old_mem && ttm) {
> Just making sure I understand this, this is memory without a source and
> not allocating in VRAM (no clear required), right?
>
> Assuming I'm correct or even if I'm not can add a comment explaining
> this as it took be a while to understand this.
>
>>   		ttm_bo_move_null(ttm_bo, new_mem);
>> -		goto out;
>> +		return 0;
>>   	}
>>   
>>   	if (ttm_bo->type == ttm_bo_type_sg) {
>>   		ret = xe_bo_move_notify(bo, ctx);
>>   		if (!ret)
>> -			ret = xe_bo_move_dmabuf(ttm_bo, old_mem, new_mem);
>> +			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
>>   		goto out;
>>   	}
>>   
>>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>>   
>> -	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
>> +	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
>>   
>>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
>>   
>>   	if ((move_lacks_source && !needs_clear) ||
>> -	    (old_mem->mem_type == XE_PL_SYSTEM &&
>> +	    (old_mem_type == XE_PL_SYSTEM &&
>>   	     new_mem->mem_type == XE_PL_TT)) {
>>   		ttm_bo_move_null(ttm_bo, new_mem);
>>   		goto out;
>> @@ -612,7 +605,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   			goto out;
>>   	}
>>   
>> -	if (old_mem->mem_type == XE_PL_TT &&
>> +	if (old_mem_type == XE_PL_TT &&
>>   	    new_mem->mem_type == XE_PL_SYSTEM) {
>>   		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>>   						     DMA_RESV_USAGE_BOOKKEEP,
>> @@ -627,8 +620,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	}
>>   
>>   	if (!move_lacks_source &&
>> -	    ((old_mem->mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
>> -	     (resource_is_vram(old_mem) &&
>> +	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
>> +	     (mem_type_is_vram(old_mem_type) &&
>>   	      new_mem->mem_type == XE_PL_SYSTEM))) {
>>   		hop->fpfn = 0;
>>   		hop->lpfn = 0;
>> @@ -642,8 +635,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		tile = bo->tile;
>>   	else if (resource_is_vram(new_mem))
>>   		tile = mem_type_to_tile(xe, new_mem->mem_type);
>> -	else if (resource_is_vram(old_mem))
>> -		tile = mem_type_to_tile(xe, old_mem->mem_type);
>> +	else if (mem_type_is_vram(old_mem_type))
>> +		tile = mem_type_to_tile(xe, old_mem_type);
>>   
>>   	XE_BUG_ON(!tile);
>>   	XE_BUG_ON(!tile->migrate);
>> @@ -693,8 +686,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   			xe_device_mem_access_put(xe);
>>   			goto out;
>>   		}
>> -		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
>> -						new_mem);
>> +		if (!move_lacks_source) {
>> +			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
>> +							true, new_mem);
>> +		} else {
> So this is doing a clear here and old_mem could be NULL so
> ttm_bo_move_accel_cleanup could blow up. In this case we just need to
> install the fence from the clear and assign the new_mem, right?

Yes correct on both.

I'll add some comments there.

/Thomas

>
> Matt
>
>> +			dma_resv_add_fence(ttm_bo->base.resv, fence,
>> +					   DMA_RESV_USAGE_KERNEL);
>> +			ttm_bo_move_null(ttm_bo, new_mem);
>> +		}
>> +
>>   		dma_fence_put(fence);
>>   	}
>>   
>> -- 
>> 2.40.1
>>
