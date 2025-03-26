Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F87C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 09:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07A310E675;
	Wed, 26 Mar 2025 09:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTPquV1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08BE10E675
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742979831; x=1774515831;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K5R31NBvq7NwzGfKBwtkHpieZyZBVfDlmdl9soWPnO0=;
 b=FTPquV1JUz7wBGulO7qccF7zYR8ru/tSFQ8x5FyAngJ39AObGHIXiH74
 7MFChtwpoDaWUuGZJLfRi6ZwhrNv8prT1vB1Z6i87Z1UA1LIFRLo596nA
 TZD7yHr9zoMQc/DncoH/8Zf8Fk3/FQixEh4YLqW9lin8dYnXL1E0rMhR5
 Exy00PveDQnTvhPqcBtLEuI6JSwGoAolBhEgwNNtZ0KV+Qm7w21Go44YQ
 mHl0UPqljsPHddc3YdibqBK9Vhy5MiOzoU/WgRwQUftfm8kOzL1xF1AXE
 GrjobbPCAyKO40Pe6Fer7iondzV9PyOzI9RkbqyHnfdq1gjEgJ/C+isKW g==;
X-CSE-ConnectionGUID: WLy76u0LRyGz0nDkjw3BwQ==
X-CSE-MsgGUID: H1O+guuORzySjm5KGB3zSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44146015"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44146015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:03:50 -0700
X-CSE-ConnectionGUID: 2fZSG7lNTeac5UluUXw+jw==
X-CSE-MsgGUID: eoYWYl+mRROvMD5uP32oQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155712859"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.12])
 ([10.245.245.12])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:03:49 -0700
Message-ID: <8d12310e-1953-459e-a9d1-21db60630495@intel.com>
Date: Wed, 26 Mar 2025 09:03:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
 <20250307182856.304850-15-matthew.auld@intel.com>
 <LV3PR11MB86957A4ED4A4134F55A2B00CF9A62@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <LV3PR11MB86957A4ED4A4134F55A2B00CF9A62@LV3PR11MB8695.namprd11.prod.outlook.com>
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

On 26/03/2025 06:15, K V P, Satyanarayana wrote:
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Friday, March 7, 2025 11:59 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: [PATCH v3 5/8] drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
>>
>> With the idea of having more pinned objects using the blitter engine
>> where possible, during suspend/resume, mark the pinned objects which
>> can be done during the late phase once submission/migration has been
>> setup. Start out simple with lrc and page-tables from userspace.
>>
>> v2:
>>   - s/early_restore/late_restore; early restore was way too bold with too
>>     many places being impacted at once.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       |  4 ++--
>>   drivers/gpu/drm/xe/xe_bo.h       |  9 +++++----
>>   drivers/gpu/drm/xe/xe_bo_evict.c |  6 ++++--
>>   drivers/gpu/drm/xe/xe_lrc.c      | 10 +++++++---
>>   drivers/gpu/drm/xe/xe_pt.c       | 13 ++++++++-----
>>   5 files changed, 26 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index f22b02700778..fe5a386d5dc8 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1103,7 +1103,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>>   		goto out_unlock_bo;
>>   	}
>>
>> -	if (xe_bo_is_user(bo)) {
>> +	if (xe_bo_is_user(bo) || (bo->flags &
>> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
>>   		struct xe_migrate *migrate;
>>   		struct dma_fence *fence;
>>
>> @@ -1198,7 +1198,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>   		goto out_backup;
>>   	}
>>
>> -	if (xe_bo_is_user(bo)) {
>> +	if (xe_bo_is_user(bo) || (bo->flags &
>> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
>>   		struct xe_migrate *migrate;
>>   		struct dma_fence *fence;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 3937111c2adb..c1961eebd0bc 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -40,10 +40,11 @@
>>   #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>>   #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
>>   #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
>> -#define XE_BO_FLAG_GGTT0                BIT(19)
>> -#define XE_BO_FLAG_GGTT1                BIT(20)
>> -#define XE_BO_FLAG_GGTT2                BIT(21)
>> -#define XE_BO_FLAG_GGTT3                BIT(22)
>> +#define XE_BO_FLAG_PINNED_LATE_RESTORE BIT(19)
>> +#define XE_BO_FLAG_GGTT0                BIT(20)
>> +#define XE_BO_FLAG_GGTT1                BIT(21)
>> +#define XE_BO_FLAG_GGTT2                BIT(22)
>> +#define XE_BO_FLAG_GGTT3                BIT(23)
>>   #define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
>>   					 XE_BO_FLAG_GGTT1 | \
>>   					 XE_BO_FLAG_GGTT2 | \
> 
> nit: Can't we define XE_BO_FLAG_PINNED_LATE_RESTORE as BIT(23)? Do we see any issue with this?
> Other than this, LGTM.

I mostly just wanted it grouped with PINNED_NORESTORE since they are 
related concepts.


> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 
>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
>> b/drivers/gpu/drm/xe/xe_bo_evict.c
>> index 41a948de3583..0c2cfa534495 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>> @@ -24,7 +24,8 @@ static int xe_evict_pinned(struct xe_device *xe, bool
>> memcpy_only)
>>   		if (!bo)
>>   			break;
>>
>> -		if (!memcpy_only && !xe_bo_is_user(bo)) {
>> +		if (!memcpy_only &&
>> +		    !(xe_bo_is_user(bo) || (bo->flags &
>> XE_BO_FLAG_PINNED_LATE_RESTORE))) {
>>   			list_move_tail(&bo->pinned_link, &skipped);
>>   			continue;
>>   		}
>> @@ -135,7 +136,8 @@ static int xe_restore_pinned(struct xe_device *xe,
>> bool memcpy_only)
>>   		if (!bo)
>>   			break;
>>
>> -		if (memcpy_only && xe_bo_is_user(bo)) {
>> +		if (memcpy_only &&
>> +		    (xe_bo_is_user(bo) || (bo->flags &
>> XE_BO_FLAG_PINNED_LATE_RESTORE))) {
>>   			list_move_tail(&bo->pinned_link, &skipped);
>>   			continue;
>>   		}
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index df3ceddede07..ffa07648690e 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -893,6 +893,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct
>> xe_hw_engine *hwe,
>>   	void *init_data = NULL;
>>   	u32 arb_enable;
>>   	u32 lrc_size;
>> +	u32 bo_flags;
>>   	int err;
>>
>>   	kref_init(&lrc->refcount);
>> @@ -901,15 +902,18 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct
>> xe_hw_engine *hwe,
>>   	if (xe_gt_has_indirect_ring_state(gt))
>>   		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>>
>> +	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
>> +		   XE_BO_FLAG_GGTT_INVALIDATE;
>> +	if (vm && vm->xef) /* userspace */
>> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>> +
>>   	/*
>>   	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT
>> address
>>   	 * via VM bind calls.
>>   	 */
>>   	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
>>   				       ttm_bo_type_kernel,
>> -				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> -				       XE_BO_FLAG_GGTT |
>> -				       XE_BO_FLAG_GGTT_INVALIDATE);
>> +				       bo_flags);
>>   	if (IS_ERR(lrc->bo))
>>   		return PTR_ERR(lrc->bo);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index ffaf0d02dc7d..05209f0ffe5c 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -103,6 +103,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct
>> xe_tile *tile,
>>   {
>>   	struct xe_pt *pt;
>>   	struct xe_bo *bo;
>> +	u32 bo_flags;
>>   	int err;
>>
>>   	if (level) {
>> @@ -115,14 +116,16 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm,
>> struct xe_tile *tile,
>>   	if (!pt)
>>   		return ERR_PTR(-ENOMEM);
>>
>> +	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>> XE_BO_FLAG_PINNED |
>> +		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
>> +	if (vm->xef) /* userspace */
>> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>> +
>>   	pt->level = level;
>>   	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>   				  ttm_bo_type_kernel,
>> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> -				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>> -				  XE_BO_FLAG_PINNED |
>> -				  XE_BO_FLAG_NO_RESV_EVICT |
>> -				  XE_BO_FLAG_PAGETABLE);
>> +				  bo_flags);
>>   	if (IS_ERR(bo)) {
>>   		err = PTR_ERR(bo);
>>   		goto err_kfree;
>> --
>> 2.48.1
> 

