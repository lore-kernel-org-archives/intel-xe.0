Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6911BC07E8F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 08:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B210F4A2;
	Mon, 22 Apr 2024 08:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbN5B7dy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B72112899
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713773900; x=1745309900;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HRrebKuFK0s3xddXGE16RXtOzl9o2C9OeEF7J5yS4H8=;
 b=MbN5B7dyOadOWHezqGaWEiI3Ap3dkniVvELKEXXvKaTICisiBK9RZztR
 Bh8qeFyBDeVOvRpdWfd4cgcLQrpejCAuuxjfphCKj0sRE+pFAB+4quGfd
 6Ra0vN02/iJju27gTsw1gwHRQRac19MN10W3CCwsqJ7vRyiNlm3Lj+I5P
 e3EAAdGx4/7J+r9B2W23Phd/i2JIHMkHSSG8K3md13lP2E3Y0pg2i17C3
 Jbm1aro2Kuu1BM5Q5drH1lGEdPuN3TodElfXmYYpWuDOHXZLfsPbIzt/I
 Q851PDDa+Ql06eKDUoBcysNkgt1i6GDArm7AmYWG0hqO9s6/ib1zed+il w==;
X-CSE-ConnectionGUID: Pwg44nxHS6ilnOHpfoe9Sw==
X-CSE-MsgGUID: o9KHbsjUQtKALq2VC4JgGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9177464"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9177464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:18:19 -0700
X-CSE-ConnectionGUID: 1kse6TrqRFu+jfUGdQBaFg==
X-CSE-MsgGUID: bqNSwGxaQgyv8dAhr5PGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="47239237"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.180])
 ([10.246.48.180])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:18:17 -0700
Message-ID: <b1aa42d7-c018-44f5-8e30-894392255b36@linux.intel.com>
Date: Mon, 22 Apr 2024 10:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
To: "Zeng, Oak" <oak.zeng@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-3-nirmoy.das@intel.com>
 <SA1PR11MB69915FD38304C44B99E5880C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <SA1PR11MB69915FD38304C44B99E5880C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
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

Hi Oak,

On 4/19/2024 8:35 PM, Zeng, Oak wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Nirmoy Das
>> Sent: Monday, April 15, 2024 10:52 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy <nirmoy.das@intel.com>
>> Subject: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
>>
>> Currently decision to set PTE_AE is spread between xe_pt
>> and xe_vm files and there is no reason to be keep it that
>> way. Consolidate the logic for better maintainability.
>>
>> Atomics is not expected on userptr memory so this patch
>> also making sure PTE_AE is only applied when a buffer object
>> exist.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 4 +---
>>   drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 5b7930f46cf3..7dc13a8bb44f 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -597,7 +597,6 @@ static int
>>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>>   {
>> -	struct xe_device *xe = tile_to_xe(tile);
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>>   	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>>   		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>> @@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma
>> *vma,
>>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>   	int ret;
>>
>> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -	    (is_devmem || !IS_DGFX(xe)))
>> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>>   		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>
>>   	if (is_devmem) {
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 2dbba55e7785..b1dcaa35b6cc 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -806,9 +806,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>>   	for_each_tile(tile, vm->xe, id)
>>   		vma->tile_mask |= 0x1 << id;
>>
>> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform ==
>> XE_PVC)
>> -		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>> -
>>   	vma->pat_index = pat_index;
>>
>>   	if (bo) {
>> @@ -816,6 +813,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>>
>>   		xe_bo_assert_held(bo);
>>
>> +		if (vm->xe->info.has_atomic_enable_pte_bit &&
>> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
> This is vma creation time. The xe_bo_is_vram works for device or host allocation. But for shared allocation, we can't decide bo placement at vma creation time, as bo can be migrated after vma creation. So I think this should be determined somewhere right before the page table programing, at lease bo migration is done.
Thanks for raising this. In that case, I will drop this patch.
>
>
> Also regarding the IS_DGFX... I think on some dgfx platform, we can support device atomic to host memory, for example, when dgpu is connected to host through cxl. I need to double confirm this with HW

I think CXL should be able to handle atomics even without migration. We 
can look into that once we have a mechanism to detect such platform.

Thanks,

Nirmoy

>
>
> Oak
>
>
>
>
>> +			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>> +
>>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo-
>>> ttm.base);
>>   		if (IS_ERR(vm_bo)) {
>>   			xe_vma_free(vma);
>> --
>> 2.42.0
