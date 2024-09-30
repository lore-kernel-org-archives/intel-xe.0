Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD5CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 09:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B410E0AC;
	Mon, 30 Sep 2024 09:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahN6eMxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06D910E0AC
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727687692; x=1759223692;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t9JXy+9LJJ+OX98TW0kD3ALqUx5loKVfK+JV7Ou5l6E=;
 b=ahN6eMxPvazgKX0yq223YByu/ENVCfzJUMwUpcYkDHgMtPZT34CvP7I9
 5n/svNsLOpDxGTPbwuF0I50U4qMjDFrlob6fN8VR0JeVlUsGN919CBcVO
 JuSIFG/R7iAEFEx0VNZsFLuHTNTKO/9Zp/bYBGHzZ4FDcifSr6JCvlo5o
 VCwNEOkICReMSPPt1mnWGwRlq+NFbDsXavcW9WgOzk7wX7wxin5xxbKPV
 Lva6onOGxezfDMZMJOkb9ysrgRZLk+SCXLQ3Jd/OUm4v9nNPR655zx6V8
 b1YwCdFQ5U/iGIHaK49+CUTMqxgFgQE9swYU/jZwRgXISYas/3s6FbD7+ A==;
X-CSE-ConnectionGUID: uuEXhEjNSrid3yctajYliw==
X-CSE-MsgGUID: HQajGEjIRMyRiUYNqsTnKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26232987"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26232987"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:14:51 -0700
X-CSE-ConnectionGUID: YKsQM1UzQfK4ZC9JC7vFeQ==
X-CSE-MsgGUID: vY0E2ZBmRLCSlioC+Gtuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73105015"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.244.244])
 ([10.245.244.244])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 02:14:50 -0700
Message-ID: <3b8a9c0b-15cc-4bce-b053-cfa396177b35@intel.com>
Date: Mon, 30 Sep 2024 10:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add support for object purgeability
To: Pallavi Mishra <pallavi.mishra@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, alex.zuo@intel.com
References: <20240930001413.3378863-1-pallavi.mishra@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240930001413.3378863-1-pallavi.mishra@intel.com>
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

On 30/09/2024 01:14, Pallavi Mishra wrote:
> Introduce madvise ioctl in KMD for object level advice.
> Userspace applications can utilize this feature to inform
> KMD whether an object will be needed in near future or can
> be safely discarded under memory pressure.

So this allows re-using the object after being purged? If so needs to be 
mindful of bo->ccs_cleared [1] AFAICT. Also would need to reset bo->madv 
somewhere? I guess this is sightly different from i915 where the object 
becomes dead once PURGED. Not sure if we also want that or not.

[1] https://patchwork.freedesktop.org/series/138889/

> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Needs some UMD Cc.

> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 71 ++++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_bo.h       |  7 ++++
>   drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
>   drivers/gpu/drm/xe/xe_device.c   |  1 +
>   include/uapi/drm/xe_drm.h        | 20 +++++++++
>   5 files changed, 90 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5f2f1ec46b57..0e7e7a624676 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -644,6 +644,22 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   	return 0;
>   }
>   
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place = {};
> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> +
> +		drm_WARN_ON(&xe->drm, ret);
> +
> +		if (bo && !ret)
> +			bo->madv = XE_MADV_PURGED;
> +	}
> +}
> +
>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		      struct ttm_operation_ctx *ctx,
>   		      struct ttm_resource *new_mem,
> @@ -663,6 +679,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>   	int ret = 0;
>   
> +	if (bo->madv == XE_MADV_DONTNEED) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);
> +		return ret;

So say user does DONTNEED on some non-populated bo and then tries to use 
that object in something like vm_bind, this here purges it instead of 
populating it which gives NULL bo->resource and returns success. But 
that would mean we have NULL bo->resource after calling bo_validate 
which I think will crash with NPD at some later point, since that 
shouldn't ever happen.

It looks like we can potentially set empty placement in evict_flags() 
depending on the madv and then ttm will do the purge for us (see 
ttm_bo_evict()) which should then handle the eviction case.. And then 
for swap case we already call this in swap_notify(). I think normally we 
only need to purge stuff when low on memory, like with eviction/swap. 
Not sure what to do here if not WILLNEED, do we just return an error or 
are we meant to continue on, or perhaps something else?

> +	}
> +
>   	/* Bo creation path, moving to system or TT. */
>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>   		if (new_mem->mem_type == XE_PL_TT)
> @@ -1084,18 +1105,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>   	}
>   }
>   
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place = {};
> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>   {
>   	struct ttm_operation_ctx ctx = {
> @@ -2416,6 +2425,44 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>   	list_del_init(&bo->vram_userfault_link);
>   }
>   
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct drm_xe_vm_madvise *args = data;
> +	struct drm_gem_object *gem_obj = drm_gem_object_lookup(file_priv, args->handle);

This is also grabbing a bo ref underneath, which needs to be dropped 
otherwise the bo is leaked.

> +	struct xe_bo *bo;
> +	int err;
> +
> +	if (XE_IOCTL_DBG(xe, (!(args->madv & DRM_XE_MADV_DONTNEED) &&
> +			!(args->madv & DRM_XE_MADV_WILLNEED))))

madv doesn't seem to be flags, but rather a single value? Also user can 
do stuff like WILLNEED | DONTNEED and we don't reject it.

> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !gem_obj))
> +		return -EINVAL;
> +
> +	bo = gem_to_xe_bo(gem_obj);
> +	if (!bo)

I don't think bo can be NULL here. I think this is only possible with 
ghost objects, but those are internal to kmd.

> +		return -ENOENT;
> +
> +	err = xe_bo_lock(bo, true);
> +	if (err)
> +		return err;
> +
> +	if (XE_IOCTL_DBG(xe, ((bo->madv == XE_MADV_PURGED) && (args->madv == DRM_XE_MADV_WILLNEED)))) {

Probably don't want to spam dmesg with this, since this is normal and 
expected if something got evicted?

Also should we validate that args->retained is zero above or set it here?

> +		xe_bo_unlock(bo);
> +		return -EINVAL;
> +	}
> +
> +	args->retained = (bo->madv != XE_MADV_PURGED) ? 1 : 0;
> +
> +	bo->madv = (args->madv == DRM_XE_MADV_WILLNEED) ? XE_MADV_WILLNEED : XE_MADV_DONTNEED;

Is there a way to influence the LRU stuff here? It might make sense to 
bump DONTNEED so that stuff like eviction will victimize the stuff that 
can be freely discarded first.


> +
> +	xe_bo_unlock(bo);
> +
> +	return 0;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_bo.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6e4be52306df..515dea54a8e8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -63,6 +63,10 @@
>   
>   #define XE_BO_PROPS_INVALID	(-1)
>   
> +#define XE_MADV_WILLNEED               0
> +#define XE_MADV_DONTNEED               1
> +#define XE_MADV_PURGED                 2
> +
>   struct sg_table;
>   
>   struct xe_bo *xe_bo_alloc(void);
> @@ -223,6 +227,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   			     struct drm_file *file);
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv);
> +
>   void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
>   
>   int xe_bo_dumb_create(struct drm_file *file_priv,
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 2ed558ac2264..00b4de912dcf 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -76,6 +76,9 @@ struct xe_bo {
>   
>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>   		struct list_head vram_userfault_link;
> +
> +	/** @madv: user space advise on obj purgeability */
> +	u16 madv;
>   };
>   
>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8e9b551c7033..efeb0bf08b1b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -197,6 +197,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..e32ba5598a8b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -102,6 +102,7 @@ extern "C" {
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>   #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_MADVISE		0x0c
>   
>   /* Must be kept compact -- no holes */
>   
> @@ -117,6 +118,7 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1694,6 +1696,24 @@ struct drm_xe_oa_stream_info {
>   	__u64 reserved[3];
>   };
>   
> +/**
> + * struct drm_xe_vm_madvise - Input of &DRM_IOCTL_XE_VM_MADVISE
> + */
> +struct drm_xe_vm_madvise {

What is the relation to 'vm' here?

> +	/** Handle of the buffer to change the backing store advice */
> +	__u32 handle;
> +	/* Advice: either the buffer will be needed again in the near future,
> +	 *         or won't be and could be discarded under memory pressure.
> +	 */

I think needs properly formatted kernel-doc. Below also.

> +#define DRM_XE_MADV_WILLNEED 0
> +#define DRM_XE_MADV_DONTNEED 1
> +
> +	__u32 madv;
> +
> +	/** Whether the backing store still exists. */
> +	__u32 retained;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
