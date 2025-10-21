Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D17CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 09:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706110E270;
	Tue, 21 Oct 2025 09:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQnPbBXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1146810E270
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761038606; x=1792574606;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8Ouq0pvuHAu836XkdLbq6W0ZQyLKyt0NzaTt5qZDMwg=;
 b=NQnPbBXDAnVY5OyXHeWFy/7JHQ9kxdMWPnT25gSEBhyVLjXntvqEPWEt
 ol9vltryRGRBhuHIHtE4aHeV617OxTVWyVOE3oMAJ2ghw9RCOpk7uAkOy
 YlT5Qvauxi/aZiv/qN+4BhPZyFKyETTxNDfWB+G+BHFhTZVyvipxRTOIr
 R0YRDdf/9ytHJIQF1U8CaCUsSkGO9QreXYG7GsgZpY5mJMaK3xXCf+TON
 fedqB4dX4CoFZ1aAFg/gvG621817AkRpovYpglH/s1iZpwZe1GzOzofxJ
 uoVYAGbx584Ijf4vf7oES+vl5MtJTt0UVtYmGNL10PTTzEMu5rxFMO2Lb Q==;
X-CSE-ConnectionGUID: L/xTJj10QMCeRS8D9nXizg==
X-CSE-MsgGUID: MQdO3XTNQu24ESaA7HMw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73451396"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="73451396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:23:26 -0700
X-CSE-ConnectionGUID: H4Y1sF6zSqeDFx4+o4WOHg==
X-CSE-MsgGUID: xagTeNeeSD2CiVDtHEJutQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="214506164"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:23:24 -0700
Message-ID: <36b2ca0b-a576-4990-8971-7c43aa4a5296@intel.com>
Date: Tue, 21 Oct 2025 10:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/xe/migrate: skip bounce buffer path on xe2
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-15-matthew.auld@intel.com>
 <aPaE5T23Z1ZG7N/I@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aPaE5T23Z1ZG7N/I@lstrano-desk.jf.intel.com>
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

On 20/10/2025 19:52, Matthew Brost wrote:
> On Mon, Oct 20, 2025 at 01:54:38PM +0100, Matthew Auld wrote:
>> Now that we support MEM_COPY we should be able to use the PAGE_COPY
>> mode, otherwise falling back to BYTE_COPY mode when we have odd
>> sizing/alignment.
>>
>> v2:
>>   - Use info.has_mem_copy_instr
>>   - Rebase on latest changes.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 14ade32b8b69..7819a168ed17 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1938,8 +1938,9 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>>   	unsigned long i, j;
>>   	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>>   
>> -	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
>> -			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
>> +	if (!xe->info.has_mem_copy_instr &&
>> +	    drm_WARN_ON(&xe->drm,
>> +			(len & XE_CACHELINE_MASK) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
>>   		return ERR_PTR(-EOPNOTSUPP);
>>   
>>   	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
>> @@ -2158,8 +2159,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>   	xe_bo_assert_held(bo);
>>   
>>   	/* Use bounce buffer for small access and unaligned access */
>> -	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
>> -	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
>> +	if (!xe->info.has_mem_copy_instr &&
>> +	    (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
>> +	     !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))) {
>>   		int buf_offset = 0;
>>   		void *bounce;
>>   		int err;
>> @@ -2231,9 +2233,12 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>   		if (current_bytes & ~PAGE_MASK) {
>>   			int pitch = 4;
> 
> Shouldn't the pitch be 1 for info.has_mem_copy_instr and / or we use
> linear copy mode for non-256 byte aligned copies?

Ah yes, this is indeed wrong. Thanks for catching that.

> 
> Matt
> 
>>   
>> -			current_bytes = min_t(int, current_bytes,
>> -					      round_down(S16_MAX * pitch,
>> -							 XE_CACHELINE_BYTES));
>> +			if (xe->info.has_mem_copy_instr)
>> +				current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
>> +			else
>> +				current_bytes =
>> +					min_t(int, current_bytes,
>> +					      round_down(S16_MAX * pitch, XE_CACHELINE_BYTES));
>>   		}
>>   
>>   		__fence = xe_migrate_vram(m, current_bytes,
>> -- 
>> 2.51.0
>>

