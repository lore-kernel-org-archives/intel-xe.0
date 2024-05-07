Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D4C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 15:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794CC10F2CD;
	Tue,  7 May 2024 15:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMZQtWPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF010EAED
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715094813; x=1746630813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y7QHeY9+IikP78V856BvOhi8UF2D+E/CZCNQee5Zr3M=;
 b=NMZQtWPYWk8MwumNOJ5IwUxQ1EoUVRjU4QmNAjfETMkb/5ufVi++DS6N
 FM0xRcanv991vMKtr4r7Ufn74ZYvvmKvpn7kI+oVTTQcDh/zMYtTzAMik
 rx5vlCo4FvrXwX2NXN5RM18JSDduPpb0YdUWgZbUytnnltbvGO14IdJiv
 WVOihnpQC/5MvXw+PLlescwjaGE0PLRCycjeIJfWc2gir1Ybh+70+0wY+
 hKyjU6VLRgSSpcZDTA09hSbh1/dI7JfahXJZGTdjbVGa7B15+9nEAnZAc
 94m1YzokmJRYPfFaQlxO/5T9Oh1BbuUtaW55RUg+39V8Kez2bd5x538nv Q==;
X-CSE-ConnectionGUID: KN3ZpWo3Tne1AfmfIMhkEQ==
X-CSE-MsgGUID: 7CpTib76RfG85RGp2/o/MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10765736"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="10765736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 08:13:29 -0700
X-CSE-ConnectionGUID: BcDG6N0uRrO+5K29aEpyXg==
X-CSE-MsgGUID: 2lrVDECkTuOu+NDpxAeX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="33233904"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.245])
 ([10.246.50.245])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 08:13:28 -0700
Message-ID: <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
Date: Tue, 7 May 2024 17:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240507130411.630361-1-shuicheng.lin@intel.com>
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

+Lucas

On 5/7/2024 3:04 PM, Shuicheng Lin wrote:
> Here is the failure stack:
> [   12.988209] ------------[ cut here ]------------
> [   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
> [   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
> [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
> [   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
> [   12.988239] Call Trace:
> [   12.988240]  <TASK>
> [   12.988242]  dump_stack_lvl+0xd7/0xf0
> [   12.988248]  dump_stack+0x10/0x20
> [   12.988250]  ubsan_epilogue+0x9/0x40
> [   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
> [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
> [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
> [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
> [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>
> It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
> And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
> For num_fences == 0 case, drm_exec_prepare_obj is the same as drm_exec_lock_obj in
> function, so call drm_exec_lock_obj instead to solve it.
>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d17192c8b7de..c5b1694b292f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>   
>   	if (bo) {
>   		if (!bo->vm)
> -			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
> +			err = drm_exec_lock_obj(exec, &bo->ttm.base);
>   		if (!err && validate)
>   			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
>   	}
> @@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>   	struct xe_vma_op *op;
>   	int err;
>   
> -	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> +	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
>   	if (err)
>   		return err;
>   
