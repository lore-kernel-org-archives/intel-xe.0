Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D3DC48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29F10E104;
	Thu,  1 Feb 2024 19:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V38L1PMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2EE10E104
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706815138; x=1738351138;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bVo/lKcEmkHx0Svl5InJ16i2scwyd8aZaWuEH8BcH+4=;
 b=V38L1PMCpsnO7kFdCwhvNW5J+t2VjQ/CugCL/vvbtH4OnqaXeSXpEmE3
 N/YEC7KCzvYzUAvBXZeSnMXWhYGcIj9+frVLXJXhrYNCRP0yJNCRNo2bW
 4tpDMc/VGaegeSWdwJ6PvGUToh9tbaYNEvTMdYDRLLGx5Zh0f9eXMxIP9
 nxCgbTf2xBLei29gaBCre1lKiDelh/eQJSGv4uZ1AToiO4Zzr+51j743X
 LpBIOxchILIxOx97IymPUItwhQWVp7XNQhCx3fml0hLbtpMmEvEC1brkM
 U+XWWFGjIKvSBHlXJSgbluDE4ZHz+pkObnllXakMLHqdtrafH9gdjAu/n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407698233"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407698233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912222266"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912222266"
Received: from lhuot-mobl.amr.corp.intel.com (HELO [10.252.59.167])
 ([10.252.59.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:18:55 -0800
Message-ID: <265682a3-b813-4f1f-8031-1d500c3d89af@linux.intel.com>
Date: Thu, 1 Feb 2024 20:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Pick correct userptr VMA to repin on REMAP op
 failure
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240201004849.2219558-1-matthew.brost@intel.com>
 <20240201004849.2219558-3-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240201004849.2219558-3-matthew.brost@intel.com>
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



On 2024-02-01 01:48, Matthew Brost wrote:
> A REMAP op is composed of 3 VMA's - unmap, prev map, and next map. When
> op_execute fails with -EAGAIN we need to update the local VMA pointer to
> the current op state and then repin the VMA if it is a userptr.
> 
> Fixes a failure seen in xe_vm.munmap-style-unbind-userptr-one-partial.
> 
> Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e55161136490..2ab863fe7d0a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2506,13 +2506,25 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   	}
>   	drm_exec_fini(&exec);
>   
> -	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> +	if (err == -EAGAIN) {
>   		lockdep_assert_held_write(&vm->lock);
> -		err = xe_vma_userptr_pin_pages(vma);
> -		if (!err)
> -			goto retry_userptr;
>   
> -		trace_xe_vma_fail(vma);
> +		if (op->base.op == DRM_GPUVA_OP_REMAP) {
> +			if (!op->remap.unmap_done)
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +			else if (op->remap.prev)
> +				vma = op->remap.prev;
> +			else
> +				vma = op->remap.next;
> +		}
I see this same vma picking in handling of DRM_GPUVA_OP_REMAP.

Could the switch in xe_vma_op_execute() be moved to a separate pick_vma 
function instead, called from this place too?

It might make the code slightly more readable.

Cheers,
~Maarten
