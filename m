Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FA8E64AB6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 15:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576C10E447;
	Tue,  3 Dec 2024 15:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKyfTKk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC90910EA53
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733238963; x=1764774963;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qNh0hbUaR7hYMBNGRGQWnjOKYabW7qJjMdVoWN+vx9g=;
 b=oKyfTKk7x3fF7IhFvLlWBgsMdzut7/D7dX2zrPI8fkU5TnIHMo7Zwa3P
 WFX9JE6/WebI0y649a5W+QnjVKSbwXEVjmzzKIAquW1bhvDLXcoZvUxK6
 oaoIgMt68oj5Y6qANgiV+62D9qHKt7A2ly4DMfsL8DDiVW0gGrorFKknG
 8l8hsibT3NhQ5Kdva2nLOwEwZn0qsGsIDpZtZgk+hjt+7TE4EtDrowsAm
 XI49oluspCdmmUXlHFQhIAMRjY6h7nPYkuo0N+LDNDOpBagHZS5DmxGwV
 oeIyxVoxby08FQiDsO0eFF+A2ehO2Daxc0DyMcRJgPYxirIo+2QFSvVIP Q==;
X-CSE-ConnectionGUID: 4hFe0k2vSzGLECb3qqJEcQ==
X-CSE-MsgGUID: 4saFSdtsQtqf+juIBc3jxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44848801"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="44848801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:16:02 -0800
X-CSE-ConnectionGUID: IjotqWz8TWm18IpFzQEuoA==
X-CSE-MsgGUID: LwkxLwZjQAuJJqrFwxECVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="98540579"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.170])
 ([10.245.197.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:16:01 -0800
Message-ID: <5106bb39-785c-4449-8ddc-f6b126f53af2@linux.intel.com>
Date: Tue, 3 Dec 2024 16:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/display: fix ttm_bo_access() usage
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20241202170102.88893-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241202170102.88893-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/2/2024 6:01 PM, Matthew Auld wrote:
> ttm_bo_access() returns the size on success. Account for that otherwise
> the caller incorrectly thinks this is an error in
> intel_atomic_prepare_plane_clear_colors().
>
> v2 (Thomas)
>  - Make sure we check for the partial copy case. Also since this api is
>    easy to get wrong, wrap the whole thing in a new helper to hide the
>    details and then convert the existing users over.
>
> Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/display/intel_bo.c |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h            |  1 +
>  drivers/gpu/drm/xe/xe_vm.c            |  8 ++------
>  4 files changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index 43141964f6f2..b463f5bd4eed 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -41,7 +41,7 @@ int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, i
>  {
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> +	return xe_bo_read(bo, offset, dst, size);
>  }
>  
>  struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f51d86511cb9..af85e5b8895f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1320,6 +1320,30 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  	return ret;
>  }
>  
> +/**
> + * xe_bo_read() - Read from an xe_bo
> + * @bo: The buffer object to read from.
> + * @offset: The byte offset to start reading from.
> + * @dst: Location to store the read.
> + * @size: Size in bytes for the read.
> +
> + * Read @size bytes from the @bo, starting from @offset, storing into @dst.
> + *
> + * Return: Zero on success, or negative error.
> + */
> +int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
> +{
> +	int ret;
> +
> +	ret = ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> +	if (ret >= 0 && ret != size)
> +		ret = -EIO;
> +	else if (ret == size)
> +		ret = 0;
> +
> +	return ret;
> +}
> +
>  static const struct vm_operations_struct xe_gem_vm_ops = {
>  	.fault = xe_gem_fault,
>  	.open = ttm_bo_vm_open,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d0dce44317c7..d9386ab03140 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -228,6 +228,7 @@ xe_bo_ggtt_addr(struct xe_bo *bo)
>  
>  int xe_bo_vmap(struct xe_bo *bo);
>  void xe_bo_vunmap(struct xe_bo *bo);
> +int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
>  
>  bool mem_type_is_vram(u32 mem_type);
>  bool xe_bo_is_vram(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2492750505d6..7788680da4e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3321,12 +3321,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>  		}
>  
>  		if (bo) {
> -			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
> -					    snap->snap[i].data, snap->snap[i].len, 0);
> -			if (!(err < 0) && err != snap->snap[i].len)
> -				err = -EIO;
> -			else if (!(err < 0))
> -				err = 0;
> +			err = xe_bo_read(bo, snap->snap[i].bo_ofs,
> +					 snap->snap[i].data, snap->snap[i].len);
>  		} else {
>  			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
>  
