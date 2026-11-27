Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE8606A331
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A1G59ORk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAAD10EA85;
	Fri, 27 Nov 2026 14:20:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946F910EA85
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795789244; x=1827325244;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/yMxUpRvtZvy92HNpnh1XDtY2UweGwMEP0R34X7khnw=;
 b=A1G59ORkEVyQUFAVXvhiredl1foAk7AqMo1Bt1llIuC87BOlJjkydJMA
 chkjc3c/qxWtyI8pf+Nyu8dqU8kLyYnq1d3Iex9HvT8mucYvVfYGMxHrs
 /F+WoMYgtRAyxUryviQu0nh7JoXk9CRsNXD8Prko/qHFD6/jkqNFjZHzj
 X/gwE1EJadrBRNZsBRKaxwY5Xh6h8G5joM32gyKI8gfXQSEy1E9X5Sr5n
 y8PNvJQ8Wn8HDr5hTpkjHEEp8B4tieak7H8SS+NpCPF2Ej5PpeV99eO32
 CGJh7Wz6w1ypM5e10cksRd5jUJYB5WksfGcME6uFOJB834H40njVV5yH1 g==;
X-CSE-ConnectionGUID: MhpWK+bSQF+6+oU5ukLatw==
X-CSE-MsgGUID: yVna4NhVRZCg+YghN1V59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4701071"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4701071"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:20:34 -0800
X-CSE-ConnectionGUID: xG4raxJ0RkGSCAcAaG3TUA==
X-CSE-MsgGUID: upFNXIBJTaukAmvEKeaPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12295692"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.87])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:20:33 -0800
Message-ID: <08d63844-2c69-4a89-8acc-b7369571ee2e@intel.com>
Date: Fri, 27 Nov 2026 14:20:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/xe/bb: drop per-batch prefetch padding
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
 <20261127-migrate-bb-optimise-v2-5-808d0d520ddb@intel.com>
 <sashiko-outbox-237412@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-237412@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 12:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe: batch size underestimation in pte_update_cmd_size()
>    for non-4K pages
> --
> 
> commit 8de4bf033cf5665a8ffaac384549e82ba2ea902c
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe/bb: drop per-batch prefetch padding
> 
> This commit drops the per-batch bb_prefetch() padding from __xe_bb_new(),
> relying on the 4K guard region at the end of the suballocation pool BO to
> cover hardware CS prefetch.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> 
>> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>> index 6308a1dca4647..bcb3a56995a6f 100644
>> --- a/drivers/gpu/drm/xe/xe_bb.c
>> +++ b/drivers/gpu/drm/xe/xe_bb.c
>> @@ -14,20 +14,6 @@
>>   #include "xe_sched_job.h"
>>   #include "xe_vm_types.h"
>>   
>> -static int bb_prefetch(struct xe_gt *gt)
>> -{
>> -	struct xe_device *xe = gt_to_xe(gt);
>> -
>> -	if (GRAPHICS_VERx100(xe) >= 1250 && xe_gt_is_main_type(gt))
>> -		/*
>> -		 * RCS and CCS require 1K, although other engines would be
>> -		 * okay with 512.
>> -		 */
>> -		return SZ_1K;
>> -	else
>> -		return SZ_512;
>> -}
>> -
>>   struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -38,13 +24,13 @@ struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
>>   		return ERR_PTR(-ENOMEM);
>>   
>>   	/*
>> -	 * We need to allocate space for the requested number of dwords,
>> -	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
>> -	 * space to accommodate the platform-specific hardware prefetch
>> -	 * requirements.
>> +	 * We need to allocate space for the requested number of dwords and
>> +	 * one additional MI_BATCH_BUFFER_END dword. Hardware CS prefetch
>> +	 * at the end of the pool BO is covered by the SZ_4K guard region
>> +	 * reserved by xe_sa_bo_manager_init().
>>   	 */
>>   	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
>> -			      4 * (dwords + 1) + bb_prefetch(gt), intr);
>> +			      4 * (dwords + 1), intr);
>>   	if (IS_ERR(bb->bo)) {
>>   		err = PTR_ERR(bb->bo);
>>   		goto err;
>> @@ -129,7 +115,7 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>>   	if (bb->len == 0 || bb->cs[bb->len - 1] != MI_BATCH_BUFFER_END)
>>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>   
>> -	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
>> +	xe_gt_assert(q->gt, bb->len * 4 <= size);
>>   
>>   	xe_sa_bo_flush_write(bb->bo);
> 
> [Severity: Medium]
> Without the trailing bb_prefetch() padding, can build_pt_update_batch_sram()
> overflow bb->bo when PAGE_SIZE > 4K?
> 
> pte_update_cmd_size() sizes the batch assuming each MI_STORE_DATA_IMM
> command writes up to MAX_PTE_PER_SDI (510) entries, whereas
> build_pt_update_batch_sram() rounds level-0 chunks down to a multiple of
> PAGE_SIZE / XE_PAGE_SIZE (496 entries on 64K pages, 508 on 16K pages):
> 
> drivers/gpu/drm/xe/xe_migrate.c:pte_update_cmd_size() {
>      ...
> 	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, MAX_PTE_PER_SDI);
> 	num_dword += entries * 2;
>      ...
> }
> 
> drivers/gpu/drm/xe/xe_migrate.c:build_pt_update_batch_sram() {
>      ...
> 	while (ptes) {
> 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> 
> 		if (!level)
> 			chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
> 
> 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>      ...
> }
> 
> When the smaller chunk size requires an extra 3-dword MI_STORE_DATA_IMM
> header (for example, migrating 63 64K pages = 1008 4K PTEs emits 3 headers
> instead of 2), bb->cs writes 12 bytes past the end of bb->bo, triggering
> the xe_gt_assert() in __xe_bb_create_job() and truncating the last 3
> dwords of the batch when xe_sa_bo_flush_write() copies drm_suballoc_size()
> bytes to VRAM.

Indeed. It's pre-existing issue which will pop an assert, but series 
will potentially make it much worse than just an assert that pops. Will fix.

> 

