Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4FC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DCB10E740;
	Wed, 25 Jun 2025 14:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hheRnoNu";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF4B10E765
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2KYuM+cfnqq7EdiF2N74oLlJe8jWZKVNlWujQvjYI4o=; b=hheRnoNuC+k1BUOvIyUyiUBW0M
 695E4VSMKMLOOCn07sUIKrLw8kZLh1KHZqjB9GgrFHLMWDniezDzUKncWWXFMi7jTH+B2xXZlUEiw
 iYiY1jp4+3c43pXCnZ4j4ux6bJeeQzLgMbtvG97EQHHQV3DJAR9AvAha4x/bRrzR22vn10bF7QHD4
 mKT4u9EL2WsDvmxbt4XLcAkvmeO6t3ELEEqtbjlwsKjNXlzSDdQ2KAboLyd6NrVagQaiMgiSV9OmF
 ftX8F/vCmIdr7GLia2NtiyLcGa87PmOIjF8uqZZvcLAPYlT4XkkJRUkin1I2LVus7rK4uaX/3D/Un
 m8Uf8ZVg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uUR3d-008Yck-Tg; Wed, 25 Jun 2025 16:25:01 +0200
Message-ID: <53ffb5f3-cbfd-4378-a05c-69c37c0e1f47@igalia.com>
Date: Wed, 25 Jun 2025 15:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe: Consolidate LRC offset calculations
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250625113241.19362-1-tvrtko.ursulin@igalia.com>
 <aFwBYzApyBNcs5ZH@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aFwBYzApyBNcs5ZH@lstrano-desk.jf.intel.com>
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


On 25/06/2025 15:02, Matthew Brost wrote:
> On Wed, Jun 25, 2025 at 12:32:41PM +0100, Tvrtko Ursulin wrote:
>> Attempt to consolidate the LRC offsets calculations by alignning the
>> recently added wa_bb_offset with the naming scheme in the file and
>> also change the size stored in struct xe_lrc to not include the ring
>> buffer.
>>
>> The former makes it somewhat visually easier to follow the layout of the
>> various logical blocks stored in the LRC bo, while the latter reduces the
>> number of sprinkled around calculations.
>>
> 
> I think this is a good a cleanup. We have bunch of other work on going
> in this area - trying to root cause a LRC hang, Lucas is adding some
> needed documentation, etc... Maybe let's hold on making changes here
> until those issues are resolved or perhaps we can pull in your patch to
> one of rounds of changes.

That's fine - I don't need this particular patch really, apart from it 
being a part of a series which is adding indirect context workarounds. 
(Which benefits from consolidating this area.)

Anyway, something in that series was a bit buggy but it looks it wasn't 
this patch but something later on.

You will likely see this patch sent again, as part of that series, in 
which case if the decision is to postpone all that feel free to ignore 
it. For me it is worthwhile to at least stabilise the rest of that series.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Matthew Brost <matthew.brost@intel.com
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c       | 41 ++++++++++++++-----------------
>>   drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
>>   2 files changed, 19 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 37598588a54f..f0c33de4eb6c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -717,8 +717,12 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>>   
>>   static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>   {
>> -	/* Indirect ring state page is at the very end of LRC */
>> -	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
>> +	return lrc->bo->size - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>> +}
>> +
>> +static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>> +{
>> +	return lrc->bo->size - LRC_WA_BB_SIZE;
>>   }
>>   
>>   #define DECL_MAP_ADDR_HELPERS(elem) \
>> @@ -973,11 +977,6 @@ struct wa_bb_setup {
>>   			 u32 *batch, size_t max_size);
>>   };
>>   
>> -static size_t wa_bb_offset(struct xe_lrc *lrc)
>> -{
>> -	return lrc->bo->size - LRC_WA_BB_SIZE;
>> -}
>> -
>>   static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>   {
>>   	const size_t max_size = LRC_WA_BB_SIZE;
>> @@ -993,7 +992,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>   			return -ENOMEM;
>>   		cmd = buf;
>>   	} else {
>> -		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
>> +		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
>>   	}
>>   
>>   	remain = max_size / sizeof(*cmd);
>> @@ -1017,13 +1016,13 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>   
>>   	if (buf) {
>>   		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>> -				 wa_bb_offset(lrc), buf,
>> +				 __xe_lrc_wa_bb_offset(lrc), buf,
>>   				 (cmd - buf) * sizeof(*cmd));
>>   		kfree(buf);
>>   	}
>>   
>>   	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
>> -			     wa_bb_offset(lrc) + 1);
>> +			     __xe_lrc_wa_bb_offset(lrc) + 1);
>>   
>>   	return 0;
>>   
>> @@ -1040,19 +1039,22 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   		       u32 init_flags)
>>   {
>>   	struct xe_gt *gt = hwe->gt;
>> +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>> +	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct iosys_map map;
>>   	void *init_data = NULL;
>>   	u32 arb_enable;
>> -	u32 lrc_size;
>>   	u32 bo_flags;
>>   	int err;
>>   
>>   	kref_init(&lrc->refcount);
>>   	lrc->gt = gt;
>> +	lrc->size = lrc_size;
>>   	lrc->flags = 0;
>> -	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>> +	lrc->ring.size = ring_size;
>> +	lrc->ring.tail = 0;
>>   	if (xe_gt_has_indirect_ring_state(gt))
>>   		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>>   
>> @@ -1065,17 +1067,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>>   	 * via VM bind calls.
>>   	 */
>> -	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
>> -				       lrc_size + LRC_WA_BB_SIZE,
>> +	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>>   				       ttm_bo_type_kernel,
>>   				       bo_flags);
>>   	if (IS_ERR(lrc->bo))
>>   		return PTR_ERR(lrc->bo);
>>   
>> -	lrc->size = lrc_size;
>> -	lrc->ring.size = ring_size;
>> -	lrc->ring.tail = 0;
>> -
>>   	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>>   			     hwe->fence_irq, hwe->name);
>>   
>> @@ -1096,10 +1093,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>>   		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>>   				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
>> -				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
>> +				 lrc_size - LRC_PPHWSP_SIZE);
>>   	} else {
>> -		xe_map_memcpy_to(xe, &map, 0, init_data,
>> -				 xe_gt_lrc_size(gt, hwe->class));
>> +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
>>   		kfree(init_data);
>>   	}
>>   
>> @@ -1859,8 +1855,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>   	snapshot->seqno = xe_lrc_seqno(lrc);
>>   	snapshot->lrc_bo = xe_bo_get(lrc->bo);
>>   	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
>> -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
>> -		LRC_WA_BB_SIZE;
>> +	snapshot->lrc_size = lrc->size;
>>   	snapshot->lrc_snapshot = NULL;
>>   	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>>   	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index 883e550a9423..2c7c81079801 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -22,7 +22,7 @@ struct xe_lrc {
>>   	 */
>>   	struct xe_bo *bo;
>>   
>> -	/** @size: size of lrc including any indirect ring state page */
>> +	/** @size: size of the lrc and optional indirect ring state */
>>   	u32 size;
>>   
>>   	/** @gt: gt which this LRC belongs to */
>> -- 
>> 2.48.0
>>

