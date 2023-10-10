Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE2CD68E5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 09:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF710E330;
	Tue, 10 Oct 2023 09:11:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1595710E330
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696929069; x=1728465069;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6JW3pEMdKJ/1h+/ItL5HiD5yoRbWPWRNqoZ2vnvgTlU=;
 b=StJ/Q20q51vRbdxMk8d5J03zOhRjzHCDKiygPg3Lr7mut8dPLa0k7BWK
 KwrfX3s86Yxh5zRw7gpDM5jKm995FFEEIT4RAsEquqGC5xMiC05GwnzaO
 LQllnkymlg7ZNDkjtHLd2fNjWYIzwLvg1v6rQU3eLm75WmKUIYOHJStzK
 DTAyW3OukJO0vExXP7+3M0FB+LPu6bPBi89C+mpbDIne3pblE3+lM57B0
 u7Svqsyaq8hhpyN21rv+L6MrJVY83gOpusJR3rk30kMSE67PAPCwgRwxL
 q+bPhQpIGRgRSnkFwn6+r3Fr8ug+8eU0H1smgWlZAjjmmxBy/h5XdZPbE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369412426"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="369412426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="730010251"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="730010251"
Received: from kiliansu-mobl.ger.corp.intel.com (HELO [10.252.31.117])
 ([10.252.31.117])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:11:06 -0700
Message-ID: <f70be810-bd1c-fc50-fa6e-5ee00ef4d962@intel.com>
Date: Tue, 10 Oct 2023 10:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231009062209.4009360-1-riana.tauro@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231009062209.4009360-1-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On 09/10/2023 07:22, Riana Tauro wrote:
> gem_create_ioctl does not have a mem_access_get till it reaches
> xe_bo_move.
> 
> When the device is runtime suspended (in D3cold), new bo created
> as part of gem_create_ioctl steals the buddy block of the kernel objects
> that are yet to be restored as part of runtime resume (D3cold). The runtime
> resume triggers only in xe_bo_move. While trying to restore the kernel
> objects it finds the buddy block is not free.
> Tries to evict the new bo which is already locked causing a deadlock
> 
> Prevent deadlock by taking mem_access get early in the ioctl
> 
> 	INFO: task kworker/1:1:44 blocked for more than 61 seconds.
> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 	task:kworker/1:1     state:D stack:25272 pid:44 ppid:2  flags:0x00004000
> 	[  +0.008395] Workqueue: pm pm_runtime_work
> 	[  +0.004068] Call Trace:
> 	[  +0.002486]  <TASK>
> 	[  +0.002161]  __schedule+0x6f5/0x1640
> 	[  +0.003702]  ? __pfx___schedule+0x10/0x10
> 	[  +0.004133]  ? __ww_mutex_lock.constprop.0+0xf4f/0x1e60
> 	[  +0.005330]  schedule+0x92/0x120
> 	....
> 	[  +0.003922]  ttm_bo_mem_space+0x46d/0x490 [ttm]
> 	[  +0.004586]  xe_bo_restore_pinned+0x200/0x320 [xe]
> 	[  +0.005007]  ? __pfx_xe_bo_restore_pinned+0x10/0x10 [xe]
> 	[  +0.005503]  ? __pfx__printk+0x10/0x10
> 	[  +0.003791]  ? __pfx_do_raw_spin_lock+0x10/0x10
> 	[  +0.004597]  xe_bo_restore_kernel+0x2e4/0x470 [xe]
> 	[  +0.005521]  xe_pm_runtime_resume+0x20a/0x750 [xe]
> 	....
> 	INFO: task xe_mmap:1836 blocked for more than 61 seconds.
> 	"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 	task:xe_mmap   state:D stack:23600 pid:1836  ppid:1831 flags:0x00004002
> 	[  +0.008395] Call Trace:
> 	[  +0.002486]  <TASK>
> 	[  +0.003271]  rpm_resume+0x341/0xad0
> 	[  +0.005269]  __pm_runtime_resume+0x53/0xc0
> 	[  +0.004152]  xe_device_mem_access_get+0x2b/0x60 [xe]
> 	[  +0.005172]  xe_bo_move+0x2ef/0x9f0 [xe]
> 	[  +0.004131]  ttm_bo_handle_move_mem+0x15a/0x230 [ttm]
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256

I think we should mention that the overall idea was to first attempt to 
move all xe_device_mem_access_get() further up in the hierarchy (like 
ioctl level) to ensure that dma-resv lock is never held (potentially 
other locks also) when trying to wake up the device with d3cold enabled. 
Any async work pushed out from the ioctl should rather use 
xe_device_mem_access_get_if_ongoing() and attach to the work item, like 
in xe_bo_move(). Currently xe_device_mem_access_get() is called much too 
deep in the call chain in various places which is going to inherit loads 
of scary locking dependencies making d3cold very tricky to implement.

The secondary issue is that kernel BOs need to be restored to the same 
place in VRAM, and with d3cold that means that any VRAM allocation can 
potentially steal the spot from kernel BOs which then blows up when 
waking the device up. However if we end up moving 
xe_device_mem_access_get() much higher up in the hierarchy then it might 
that this is no longer possible.

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..e453a5264c82 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -630,6 +630,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	bool tt_has_data;
>   	bool needs_clear;
>   	int ret = 0;
> +	bool device_awake;
>   
>   	/* Bo creation path, moving to system or TT. No clearing required. */
>   	if (!old_mem && ttm) {
> @@ -712,7 +713,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	xe_tile_assert(tile, tile->migrate);
>   
>   	trace_xe_bo_move(bo);
> -	xe_device_mem_access_get(xe);
> +
> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);

Should this return an error if the device is not awake, and maybe also 
throw a warning?

I think there are likely still other callers that might not have woken 
up the device. What about bo_dumb_create?  Also I guess make sure we 
also test with display disabled, since that more often triggers rpm in 
normal runs.

Do we need some kind of assert in the vram allocate path? Pretty much 
every place calling bo_create() needs the device to be awake, and not 
all them will reach this point. See move_null() above.

>   
>   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>   		/*
> @@ -735,7 +737,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   
>   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>   					ret = -EINVAL;
> -					xe_device_mem_access_put(xe);
> +					if (device_awake)
> +						xe_device_mem_access_put(xe);
>   					goto out;
>   				}
>   
> @@ -753,7 +756,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						bo, bo, old_mem, new_mem);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
> -			xe_device_mem_access_put(xe);
> +			if (device_awake)
> +				xe_device_mem_access_put(xe);
>   			goto out;
>   		}
>   		if (!move_lacks_source) {
> @@ -778,10 +782,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		dma_fence_put(fence);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> +	if (device_awake)
> +		xe_device_mem_access_put(xe);
>   	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
>   
>   out:
> +
>   	return ret;
>   
>   }
> @@ -1810,13 +1816,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>   	}
>   
> +	xe_device_mem_access_get(xe);
>   	if (args->vm_id) {
>   		vm = xe_vm_lookup(xef, args->vm_id);
> -		if (XE_IOCTL_DBG(xe, !vm))
> +		if (XE_IOCTL_DBG(xe, !vm)) {
> +			xe_device_mem_access_put(xe);
>   			return -ENOENT;
> +		}
>   		err = xe_vm_lock(vm, true);
>   		if (err) {
>   			xe_vm_put(vm);
> +			xe_device_mem_access_put(xe);
>   			return err;
>   		}
>   	}
> @@ -1845,6 +1855,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		xe_vm_unlock(vm);
>   		xe_vm_put(vm);
>   	}
> +
> +	xe_device_mem_access_put(xe);
>   	return err;
>   }
>   
