Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4123AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 11:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085410E135;
	Fri, 12 Apr 2024 11:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zd/ZMdoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B41710E135
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712921630; x=1744457630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2nn/RIJIbFoVN3BLMgxJmaLo87cN0mQ/NtQcwTWVUVw=;
 b=Zd/ZMdoqj6MM+B9gVY2/+5BZBokvCQSL6Sm400o9cx+PyBRlSIW78kcs
 rAeFXq1xGt42r8lYGBGJUqYiWhoZKblO12FKKnqvfafJfeFtRvZ+enbbX
 6PfmwER2yikQh6LKrs+SKgzeWwwAt7UY8+d3jPR9VKlfg9KNgN0MTO1+C
 XNp4z3jgZtEkR7lrahrGXlCv3koWiqc3wolenGgyS0uhm+kr3JLdABMvK
 LjbHReBPW70EnlOESYFtesSgKOSGuYSJ3LXcZXFPyaV41nnHGRkSPd33x
 FNrZtW/9SMAGmN31aIkdr+7foEtwUPmGFlS68cLAib+nnHwZsXg4PDHbk w==;
X-CSE-ConnectionGUID: yeyPu7vCQ4iPn5/kQRy/7w==
X-CSE-MsgGUID: MFujFAclSGGNbG3x9TUqDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8928277"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8928277"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:33:49 -0700
X-CSE-ConnectionGUID: YNJCtyJWQMSjYJcyUOIQKw==
X-CSE-MsgGUID: GeL/hrFOTieOdQMTScmYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21785092"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:33:48 -0700
Message-ID: <b41140f9-7f2d-411d-be1c-0666917b93a8@linux.intel.com>
Date: Fri, 12 Apr 2024 13:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Consolidate setting PTE_AE into one place
To: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-2-nirmoy.das@intel.com>
 <20240411232243.GG6571@mdroper-desk1.amr.corp.intel.com>
 <cefb9860-9c63-45bc-95b8-db5d8558a600@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <cefb9860-9c63-45bc-95b8-db5d8558a600@linux.intel.com>
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

Hi Matt,

On 4/12/2024 11:34 AM, Nirmoy Das wrote:
> Hi Matt,
>
> On 4/12/2024 1:22 AM, Matt Roper wrote:
>> On Wed, Apr 10, 2024 at 07:03:06PM +0200, Nirmoy Das wrote:
>>> Currently decision to set PTE_AE is spread between xe_pt
>>> and xe_vm files and there is no reason to be keep it that
>>> way. Consolidate the logic for better maintainability.
>> Does this series bisect properly?  I.e., if we run the driver with this
>> patch applied, but the other two patches missing, isn't it going to turn
>> on the AE bit in the page table in some BMG SMEM cases where it
>> shouldn't?  It seems like we should at least mention that in the commit
>> message to avoid confusion.
> Sorry for the confusion; it came up because I made a mistake with the 
> if-conditions. I didn't intend to introduce any functional changes 
> with this patch.
>
> Version 2 corrects the if-condition, which now only allows setting 
> PTE_AE on PVC+VRAM, XE2+VRAM, and XE2+iGFX, thus maintaining the 
> functionality as it was


I miss understood your comment. Indeed, this is setting PTE_AE when only 
BO exist  and leaving others. This need to be noted in the commit 
message. I will do that.


Regards,

Nirmoy

>
> Regards,
>
> Nirmoy
>
>>
>>
>> Matt
>>
>>> This also remove the extra care needed for PVC which only
>>> allows setting PTE_AE for LMEM.
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pt.c | 4 +---
>>>   drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 5b7930f46cf3..7dc13a8bb44f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -597,7 +597,6 @@ static int
>>>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>            struct xe_vm_pgtable_update *entries, u32 *num_entries)
>>>   {
>>> -    struct xe_device *xe = tile_to_xe(tile);
>>>       struct xe_bo *bo = xe_vma_bo(vma);
>>>       bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>>>           (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>>> @@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>>> xe_vma *vma,
>>>       struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>>       int ret;
>>>   -    if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>>> -        (is_devmem || !IS_DGFX(xe)))
>>> +    if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>>>           xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>         if (is_devmem) {
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index a196dbe65252..8f3474c5f480 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -904,9 +904,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>>> *vm,
>>>       for_each_tile(tile, vm->xe, id)
>>>           vma->tile_mask |= 0x1 << id;
>>>   -    if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == 
>>> XE_PVC)
>>> -        vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>> -
>>>       vma->pat_index = pat_index;
>>>         if (bo) {
>>> @@ -914,6 +911,10 @@ static struct xe_vma *xe_vma_create(struct 
>>> xe_vm *vm,
>>>             xe_bo_assert_held(bo);
>>>   +        if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>>> +            !IS_DGFX(vm->xe))
>>> +            vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>> +
>>>           vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>>>           if (IS_ERR(vm_bo)) {
>>>               xe_vma_free(vma);
>>> -- 
>>> 2.42.0
>>>
