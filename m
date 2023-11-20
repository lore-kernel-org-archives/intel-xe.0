Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E8AC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 15:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528CA10E042;
	Mon, 20 Nov 2023 15:31:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40E10E042
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700494269; x=1732030269;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FBouwX4HtkUEM9wfNWECbZIhnWd3vKQV+esSFM+I6V0=;
 b=JYR/NRCVSUM2HqSHcWNwKWsjk1az6lDqxj6Tc9/Xd5WCTHbLYZzI0xV7
 3pVzeAh8OnEzq9coJONvK29z4l093Plp4+YkH4jPx2Usuz2KIBC2jPn/L
 VO7NkhLxO8CCw8APo4h0dXueIhbQTIXfcVPmFl1V6cYArzUFvklErwOKl
 JLH1J1G9BtX2ADUfJy8FF2lf2NQRepCLuJu/KKCr4YJrMPnJjPOdJUeEj
 E3UgPXtOI1fIYXHsyOl9lVwEAvX9tza53uflDhgdBsj6TJIkPJ4vdU/8C
 7xhpCTuaGqBzWpJMnXOMyy143pg0LnjZ+ifAf5rr9WT7waDpr7T/n2Yg+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477845536"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477845536"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 07:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759807280"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="759807280"
Received: from hasifnax-mobl1.gar.corp.intel.com (HELO [10.249.254.30])
 ([10.249.254.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 07:31:07 -0800
Message-ID: <b17f0e91-5d97-3c8c-8c30-0677819a449a@linux.intel.com>
Date: Mon, 20 Nov 2023 16:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20231009090037.29132-2-matthew.auld@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231009090037.29132-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: don't hold dma-resv lock over
 drm_gem_handle_create
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 10/9/23 11:00, Matthew Auld wrote:
> This seems to create a locking inversion with object_name_lock. The lock
> is held by drm_prime_fd_to_handle when calling our xe_gem_prime_import
> hook, which might eventually go on to grab the dma-resv lock during the
> attach. However we also have the opposite locking order in
> xe_gem_create_ioctl which is holding the dma-resv lock when calling
> drm_gem_handle_create, which wants to eventually grab object_name_lock:
>
> -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
> <4> [635.739288]        lock_acquire+0x169/0x3d0
> <4> [635.739294]        __ww_mutex_lock.constprop.0+0x164/0x1e60
> <4> [635.739300]        ww_mutex_lock_interruptible+0x42/0x1a0
> <4> [635.739305]        drm_gem_shmem_pin+0x4b/0x140 [drm_shmem_helper]
> <4> [635.739317]        dma_buf_dynamic_attach+0x101/0x430
> <4> [635.739323]        xe_gem_prime_import+0xcc/0x2e0 [xe]
> <4> [635.739499]        drm_prime_fd_to_handle_ioctl+0x184/0x2e0 [drm]
> <4> [635.739594]        drm_ioctl_kernel+0x16f/0x250 [drm]
> <4> [635.739693]        drm_ioctl+0x35e/0x620 [drm]
> <4> [635.739789]        __x64_sys_ioctl+0xb7/0xf0
> <4> [635.739794]        do_syscall_64+0x3c/0x90
> <4> [635.739799]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> <4> [635.739805]
> -> #0 (&dev->object_name_lock){+.+.}-{3:3}:
> <4> [635.739813]        check_prev_add+0x1ba/0x14a0
> <4> [635.739818]        __lock_acquire+0x203e/0x2ff0
> <4> [635.739823]        lock_acquire+0x169/0x3d0
> <4> [635.739827]        __mutex_lock+0x124/0x1310
> <4> [635.739832]        drm_gem_handle_create+0x32/0x50 [drm]
> <4> [635.739927]        xe_gem_create_ioctl+0x1d3/0x550 [xe]
> <4> [635.740102]        drm_ioctl_kernel+0x16f/0x250 [drm]
> <4> [635.740197]        drm_ioctl+0x35e/0x620 [drm]
> <4> [635.740293]        __x64_sys_ioctl+0xb7/0xf0
> <4> [635.740297]        do_syscall_64+0x3c/0x90
> <4> [635.740302]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> <4> [635.740307]
>
> It looks like it should be safe to simply drop the dma-resv lock prior
> to publishing the object when calling drm_gem_handle_create.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/743
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM. Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> ---
>   drivers/gpu/drm/xe/xe_bo.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..ff116d3a8861 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1815,14 +1815,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		if (XE_IOCTL_DBG(xe, !vm))
>   			return -ENOENT;
>   		err = xe_vm_lock(vm, true);
> -		if (err) {
> -			xe_vm_put(vm);
> -			return err;
> -		}
> +		if (err)
> +			goto out_vm;
>   	}
>   
>   	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>   			  bo_flags);
> +
> +	if (vm)
> +		xe_vm_unlock(vm);
> +
>   	if (IS_ERR(bo)) {
>   		err = PTR_ERR(bo);
>   		goto out_vm;
> @@ -1836,15 +1838,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	goto out_put;
>   
>   out_bulk:
> -	if (vm && !xe_vm_in_fault_mode(vm))
> +	if (vm && !xe_vm_in_fault_mode(vm)) {
> +		xe_vm_lock(vm, false);
>   		__xe_bo_unset_bulk_move(bo);
> +		xe_vm_unlock(vm);
> +	}
>   out_put:
>   	xe_bo_put(bo);
>   out_vm:
> -	if (vm) {
> -		xe_vm_unlock(vm);
> +	if (vm)
>   		xe_vm_put(vm);
> -	}
> +
>   	return err;
>   }
>   
