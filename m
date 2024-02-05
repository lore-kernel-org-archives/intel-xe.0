Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B6C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3E10F9A2;
	Mon,  5 Feb 2024 13:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+Q8IxhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C13E10F9C3
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707139800; x=1738675800;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EP+nMLQ1ycvupV3rm1+UNCgjHeD6WXOHughsTWgTLxw=;
 b=Q+Q8IxhK9H45ucoVPKw8Q/xp+Vi+/gEYIysEVIDnW9CtCHu6vhMAsD83
 lbUhWJLNWenkvJhTPqn7WYB6luy0tyrhD0vkFFhjhTHV61p/xs0LtSi57
 FJ32SJ/gaBriUzKAszP62i08EtK72fq8cQgDV6Hg9sRPVbLgv9sPtfyme
 ujKY9sivmHLg4XWAV1kXJQeb1SUmKVXVlRZxu/sR2o94iB1l8e+Ufi3PD
 z61wsQLOrVv4cNenoSEJof9ndrteRooDTEvu919ZVEHGYJFcNuUW2j6+t
 HQWA9y5gPmOZGuOlCPCljukeUj9oSg0ALmGPklzufmPwSJSMOgYBEgPKf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4315859"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="4315859"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31803611"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:29:59 -0800
Message-ID: <e295d9fb-4a3f-43c9-b784-1bb37d38a72c@intel.com>
Date: Mon, 5 Feb 2024 13:29:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 26/34] drm/xe: VMs don't need the mem_access protection
 anymore
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-27-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-27-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> All the VM operations are now protected or by the IOCTL
> calls, or by sched/exec operations or by the specific
> xe_pm_runtime_{get,put} around the duration of the LR VMs.
> 
> So, these inner mem_access protections can be removed.

Would this be a good place to split the series? AFAICT a lot of the 
nightmares originate from here. Like first part of the series moves the 
rpm to be the outermost thing, but we still keep the important vm rpm 
protection here, so shouldn't need the CT, sched stuff etc yet. And in 
theory there is still a path to d3cold without this patch, I think. Also 
playing devils advocate, since we already end up having rpm protection 
for LR vm, why not normal vm. Is it worth it?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9ad154a01ad7..f314ff128028 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1280,9 +1280,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->pt_ops = &xelp_pt_ops;
>   
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_get(xe);
> -
>   	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
>   	if (!vm_resv_obj) {
>   		err = -ENOMEM;
> @@ -1391,8 +1388,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
>   	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_put(xe);
>   	return ERR_PTR(err);
>   }
>   
> @@ -1515,8 +1510,6 @@ static void vm_destroy_work_func(struct work_struct *w)
>   	xe_assert(xe, !vm->size);
>   
>   	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
> -		xe_device_mem_access_put(xe);
> -
>   		if (xe->info.has_asid && vm->usm.asid) {
>   			mutex_lock(&xe->usm.lock);
>   			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
