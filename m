Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C5CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 09:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFB210FE00;
	Mon, 29 Apr 2024 09:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pl9sn+Yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DDD112B75
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 09:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714381555; x=1745917555;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nQ7eMWlz/jT67ZHDlDEwGcJiVeDpsAbPYX4q2nkHRD8=;
 b=Pl9sn+YtlEO3iudQ2Dk6dDYm1CAJG6kEFrTTfo9K3UjTwCytgBRTTbbS
 NNT2EMLgY2yVbocqVhvtzc5f/REgG/Np/VPUzn0WIz29O1fgthZRiLwhX
 IzNkzS/BlphvlvH/Ea21uRc3/W501DtVh2pEe+Z5PcG21OkN5hEr4i3il
 +krpZlNYTtTs7enZlycq84MBdxYkquEbEPVAtrYawh/BRpvIUuSJicuil
 8TriK8n2Q2U/VjPw/Q6zogH9xlZjTAWBwRnRGg5fsrfevf/557mRoRw8h
 bW5DOvszZmNd6VOg0/FxkKV9XdaxlV/yjhF8mkIfXCICJoSS1dp2KhNHc g==;
X-CSE-ConnectionGUID: m9ZGh5nCSuyw4FUx9BBp3g==
X-CSE-MsgGUID: KuodRXjZQXuXd7xIdDeNBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9864063"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9864063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:05:54 -0700
X-CSE-ConnectionGUID: /77UZev7QemYPY9lrVouPQ==
X-CSE-MsgGUID: ZaGEmCnTSXiAwVGsu+Ty2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="25928386"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.254])
 ([10.246.32.254])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:05:53 -0700
Message-ID: <f68727e7-03db-44f8-b5eb-7ceed550eddc@linux.intel.com>
Date: Mon, 29 Apr 2024 11:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
To: "Souza, Jose" <jose.souza@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
 <20240426105655.23738-6-nirmoy.das@intel.com>
 <ac8e78466a4a33e48f718781e47b15a7c5c73a1f.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ac8e78466a4a33e48f718781e47b15a7c5c73a1f.camel@intel.com>
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

Hi Jose,

On 4/26/2024 11:04 PM, Souza, Jose wrote:
> On Fri, 2024-04-26 at 12:56 +0200, Nirmoy Das wrote:
>> The default behavior of device atomics depends on the
>> VM type and buffer allocation types. Device atomics are
>> expected to function with all types of allocations for
>> traditional applications/APIs. Additionally, in compute/SVM
>> API scenarios with fault mode or LR mode VMs, device atomics
>> must work with single-region allocations. In all other cases
>> device atomics should be disabled by default also on platforms
>> where we know device atomics doesn't on work on particular
>> allocations types.
>>
>> v2: Fix platform checks to correct atomics behaviour on PVC.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 27 ++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c |  2 +-
>>   2 files changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 5b7930f46cf3..237e4a4985a4 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -619,9 +619,30 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>   	int ret;
>>   
>> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -	    (is_devmem || !IS_DGFX(xe)))
>> -		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +	/**
>> +	 * Default atomic expectations for different allocation scenarios are as follows:
>> +	 *
>> +	 * 1. Traditional API: When the VM is not in fault mode or LR mode:
>> +	 *    - Device atomics are expected to function with all allocations.
>> +	 *
>> +	 * 2. Compute/SVM API: When the VM is either in fault mode or LR mode:
>> +	 *    - Device atomics are the default behavior when the bo is placed in a single region.
>> +	 *    - In all other cases device atomics will be disabled with AE=0 until an application
>> +	 *      request differently using a ioctl like madvise.
>> +	 */
>> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> +		if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
>> +		    xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> nit: xe_vm_in_fault_mode requires xe_vm_in_lr_mode, so you can just check for the later.

Will do that. I think scratch page is also part of non-traditional API, 
I will confirm that and add that if needed.


Thanks,

Nirmoy

>
>> +			if (bo && xe_bo_has_single_placement(bo))
>> +				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +		} else {
>> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +		}
>> +
>> +		/* Unset AE if the platform(PVC) doesn't support it */
>> +		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
>> +			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
>> +	}
>>   
>>   	if (is_devmem) {
>>   		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8fc37c5a0196..f795016a80d5 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -805,7 +805,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	for_each_tile(tile, vm->xe, id)
>>   		vma->tile_mask |= 0x1 << id;
>>   
>> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
>> +	if (vm->xe->info.has_atomic_enable_pte_bit)
>>   		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>   
>>   	vma->pat_index = pat_index;
