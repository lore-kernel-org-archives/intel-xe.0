Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F070C4450A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CFC10E590;
	Tue, 14 Jul 2026 18:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qmQ87JYp";
	dkim-atps=neutral
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992DD10E590
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:49:14 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-ca88130e09aso3101716a12.3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784054954; x=1784659754;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Yu2VkQegY6s8oxlxwLfb7z+1O8UYLu7h4V2JST+iK84=;
 b=qmQ87JYpeLgDMhxv5aaMtaLO9lAhWj58yCQIOoGCo2Jb+IaHvB2UpsOMTiQegZD8JV
 c+IBfAByA/5OWp0PKt6lQh1ecK2k/3VUJKAHb8UrpD1K8M4eMhhsHiP/MSEuL1wp7Bgh
 Yl8FyglaDy9iyd4+0suHztPUw9P8aPi67Lm/JaAu7P6XZAHs55zah5u+xNzj1PLeGX3x
 6DdrbjuYoQI20JBU2p7TFK39Mpc1guHwko+H93kUTY5QeNQKbZayakjLswE78TlppFlH
 kAcmBL807g+ANTroeymhU7+Cp6FAM+yHc/oneoRtbuc5NV71mZV4wZa5mflVRSZkHDTq
 mddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784054954; x=1784659754;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Yu2VkQegY6s8oxlxwLfb7z+1O8UYLu7h4V2JST+iK84=;
 b=nto2nO+jp0y9pFBXh7jS1Uvn+Y+04O/SChpEn14RlcVaBMxXCn74uxGs0qXrPsvT6c
 bA2HtHG30in1mOtqK6iHIMroW0wvD5HGJIJlh/j7o8DjrFmtgxzTyZ3SFUKl5LjVRw/H
 rBhhMegFkvBpUaB+d0cu5Mb47Cltk7xX3ZnXfH/TJE7Ea45CEJAj3rHAN/HvB5Y5yMuG
 eU3v6MfevlcsbRDQfvAecE2pyo4gIQ9lHkNoNbyHiAKwBRqkml70206Git3UgPh/VgwZ
 tGFB9l0aAkByngQpTZDK9UKmd8Y97laUAOpol+OYWBV5MOEC8KWyRjVb89wF2fdoKuZN
 iV5w==
X-Gm-Message-State: AOJu0YwR/rTwY2S6dhXa1cNRrUO8cKmixAzoOJnmlZbuSmNE8LR4dRI6
 ekWJc0+pbeCWKRVUz2hMlS0wky+CZdMXCa/Z8Wi5qNgaon3mN/8bci6Yy21QGuwW+w==
X-Gm-Gg: AfdE7clsIujqmMCvpXrooQ3XiCgcVE7CTyTUDVYEpV1eAfipV0ejvymGcGunhOd+gNK
 6ymXtOn0MgQv3Hpx4xre1peO1w8OderQlQtGlt8jseztmHQUwenylsu7vSDVPO+73e6Xxygwsb2
 kWQCq2edwIm23iDI5SXY4r+EFTS38MU52DEXOuknet2Wnia0VZn7VJGIbsXOmyuXoeYeJOXDOA3
 4bBqPKRTy0vZxGfPRFfXlpD8PHNL514Ug5qD4Na4+PNMoRPjrhBPHdVSXaNrSzXXAYnHkc8cWiZ
 Iypk8UMpE8imvBLJ7g9FW7RspRMUPQepqaNxPQ/+yYAzh7eYQSx6o9ftw0ZMbqY6vJM3of1y4KW
 ysbslMCwmz9YEYUOPu2bMCBVpE6eFjMSUfPFsru+7jaDXVH47eljrKe2r00atLIzCwlcWnlB+By
 g8a3IDdL0+lqzLl9//UuQTjzqClgzMgKVpBVbvzV/lmtClMg==
X-Received: by 2002:a05:6a20:d04b:b0:3c0:9c18:d5a4 with SMTP id
 adf61e73a8af0-3c3572821d3mr4522956637.65.1784054953561; 
 Tue, 14 Jul 2026 11:49:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:646f:4966:8780:dafa])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-313af819732sm53950816eec.16.2026.07.14.11.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 11:49:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:49:07 -0700
From: Ryan Neph <ryanneph@google.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Set BO TTM priority based on VM exec queue
 priority band
Message-ID: <alaClrPwc_3hr8yK@google.com>
References: <20260713234606.3367215-1-matthew.brost@intel.com>
 <20260713234606.3367215-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713234606.3367215-2-matthew.brost@intel.com>
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

Testing now, but the corner-case you anticipated is showing itself; i.e.
a client that allocates before creating exec_queues has those BOs with
the default XE_BO_PRIORITY_NORMAL.

In vkDeviceCreate(), ANV creates the sole VM, allocs several MB worth of
internal BOs [1], then creates the exec_queues.

For an application that is expected to create its exec_queue(s) with
XE_EXEC_QUEUE_PRIORITY_LOW, when its BOs get shrunk I see a mixture of
LOW and NORMAL priority BOs.

ANV could reorder device creation to:
create VM -> create exec_queues -> alloc internal BOs

Or Xe can add the BO priority as a property of BO allocation or VM creation
ioctls.

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/blob/ed807097ebdea0b490ce4d091619ca1c325e296c/src/intel/vulkan/anv_device.c#L851-1246

Best,
Ryan

On Mon, Jul 13, 2026 at 04:46:06PM -0700, Matthew Brost wrote:
> Add XE_BO_PRIORITY_LOW/HIGH/HIGHEST defines alongside the existing
> XE_BO_PRIORITY_NORMAL, and use them in xe_bo_init_locked() to select
> the TTM LRU priority for a newly created bo.
> 
> Kernel internal buffers (non ttm_bo_type_device) and buffers that can
> be shared cross-process, i.e. not private to a single VM (no VM
> pointer available), should not be evicted ahead of user buffers, so
> they are always given the highest priority. For buffers private to a
> user VM, prioritize the buffer based on the highest priority band of
> any exec queue userspace has created against that VM, since that
> reflects the importance userspace has assigned to work using the VM:
> 
>  - ttm_bo_type != ttm_bo_type_device, or no VM: XE_BO_PRIORITY_HIGHEST
>  - VM with a HIGH priority exec queue: XE_BO_PRIORITY_HIGH
>  - VM with a NORMAL priority exec queue: XE_BO_PRIORITY_NORMAL
>  - VM with a LOW priority exec queue: XE_BO_PRIORITY_LOW
>  - VM with no exec queues at all: XE_BO_PRIORITY_NORMAL
> 
> This relies on the per-priority-band exec queue counts tracked in
> vm->exec_queues.priority_count, read under vm->exec_queues.lock in
> read mode. xe_bo_init_locked() now takes a struct xe_vm * parameter;
> all callers that create ttm_bo_type_kernel/ttm_bo_type_sg bos pass
> NULL since they always get XE_BO_PRIORITY_HIGHEST regardless.
> 
> Cc: Carlos Santa <carlos.santa@intel.com>
> Cc: Ryan Neph <ryanneph@google.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 28 +++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h       |  3 ++-
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
>  4 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 85e6d9a0f575..9da75ade8eaf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1346,7 +1346,8 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>  		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
>  			break;
>  
> -		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +		backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
> +					   xe_bo_size(bo),
>  					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
>  					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
>  					   XE_BO_FLAG_PINNED, &exec);
> @@ -1486,7 +1487,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  			break;
>  
>  		if (!backup) {
> -			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
> +			backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
>  						   xe_bo_size(bo),
>  						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
>  						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> @@ -2276,6 +2277,9 @@ void xe_bo_free(struct xe_bo *bo)
>   * if the function should allocate a new one.
>   * @tile: The tile to select for migration of this bo, and the tile used for
>   * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @vm: The VM this bo will be associated with, used to determine the bo's
> + * TTM LRU priority based on the priority band of the VM's exec queues, or
> + * NULL if the bo is not associated with a user VM.
>   * @resv: Pointer to a locked shared reservation object to use for this bo,
>   * or NULL for the xe_bo to use its own.
>   * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
> @@ -2291,7 +2295,8 @@ void xe_bo_free(struct xe_bo *bo)
>   * Return: The buffer object on success. Negative error pointer on failure.
>   */
>  struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> -				struct xe_tile *tile, struct dma_resv *resv,
> +				struct xe_tile *tile, struct xe_vm *vm,
> +				struct dma_resv *resv,
>  				struct ttm_lru_bulk_move *bulk, size_t size,
>  				u16 cpu_caching, enum ttm_bo_type type,
>  				u32 flags, struct drm_exec *exec)
> @@ -2353,7 +2358,20 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  	bo->flags = flags;
>  	bo->cpu_caching = cpu_caching;
>  	bo->ttm.base.funcs = &xe_gem_object_funcs;
> -	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> +	if (type != ttm_bo_type_device || !vm) {
> +		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
> +	} else {
> +		down_read(&vm->exec_queues.lock);
> +		if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH])
> +			bo->ttm.priority = XE_BO_PRIORITY_HIGH;
> +		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_NORMAL])
> +			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> +		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_LOW])
> +			bo->ttm.priority = XE_BO_PRIORITY_LOW;
> +		else
> +			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> +		up_read(&vm->exec_queues.lock);
> +	}
>  	INIT_LIST_HEAD(&bo->pinned_link);
>  #ifdef CONFIG_PROC_FS
>  	INIT_LIST_HEAD(&bo->client_link);
> @@ -2496,7 +2514,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> +	bo = xe_bo_init_locked(xe, bo, tile, vm, vm ? xe_vm_resv(vm) : NULL,
>  			       vm && !xe_vm_in_fault_mode(vm) &&
>  			       flags & XE_BO_FLAG_USER ?
>  			       &vm->lru_bulk_move : NULL, size,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6340317f7d2e..12625740a47a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -115,7 +115,8 @@ struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
>  
>  struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> -				struct xe_tile *tile, struct dma_resv *resv,
> +				struct xe_tile *tile, struct xe_vm *vm,
> +				struct dma_resv *resv,
>  				struct ttm_lru_bulk_move *bulk, size_t size,
>  				u16 cpu_caching, enum ttm_bo_type type,
>  				u32 flags, struct drm_exec *exec);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index fcc63ae3f455..95904b03c71f 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -24,7 +24,10 @@ struct xe_vm;
>  #define XE_BO_MAX_PLACEMENTS	3
>  
>  /* TODO: To be selected with VM_MADVISE */
> +#define	XE_BO_PRIORITY_LOW	0
>  #define	XE_BO_PRIORITY_NORMAL	1
> +#define	XE_BO_PRIORITY_HIGH	2
> +#define	XE_BO_PRIORITY_HIGHEST	3
>  
>  /**
>   * struct xe_bo - Xe buffer object
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 8a920e58245c..a80831fabd1d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -300,7 +300,7 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>  		if (ret)
>  			break;
>  
> -		bo = xe_bo_init_locked(xe, NULL, NULL, resv, NULL, dma_buf->size,
> +		bo = xe_bo_init_locked(xe, NULL, NULL, NULL, resv, NULL, dma_buf->size,
>  				       0, /* Will require 1way or 2way for vm_bind */
>  				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
>  		drm_exec_retry_on_contention(&exec);
> -- 
> 2.34.1

-- 

Best,
Ryan Neph
