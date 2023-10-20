Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069DBCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 16:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B795A10E5D9;
	Fri, 20 Oct 2023 16:51:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED27C10E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697820718; x=1729356718;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lvlB+jr9gFO3cPlRZXs9hmX6+39kw0OChVShlbk7B3c=;
 b=GtTOhAGaL7/bD1pdpmzuaI6zg51I3YBGtjBvuxFfKk95XdfNNWJBEXgZ
 Jp3WkewTfyna6cM1ZZXtLD8vkg+F97WMbry6J8uqej/qtnTZcP4OqXdZt
 /lrib2JV5wQEJItTDvbMXB9lwbyRXpuEbLIdhJ6RorjI1evdQWgWbaHcY
 W1b0Pi/6u7MvtvEvZANifaPenCHeXqY1zAa+M518IBMuDV/6YOWZUuq6l
 IfGCaIZajdjWTEdyVLfcfj0r5Bh14yc/KzLskD0Fb9e0TWkTLgJiYKLxR
 +r2RyBp5FmD1G4d8JYha2BKJBoimZiSFtGvqCUUpb0Ka2rzRNYqxxiVEq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366761460"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="366761460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 09:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="792461330"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="792461330"
Received: from kgrau-mobl.ger.corp.intel.com (HELO [10.251.208.232])
 ([10.251.208.232])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 09:51:55 -0700
Message-ID: <1d104333-fadc-00d1-1efc-8eafbe98fe01@linux.intel.com>
Date: Fri, 20 Oct 2023 18:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231018083733.12881-1-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231018083733.12881-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3] xe/xe_bo: Reject bo creation of unaligned
 size
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

Hey,

Patch looks sane, lets close the hole.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


On 2023-10-18 10:37, Thomas Hellström wrote:
> From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>
> For xe bo creation we request passing size which matches system or
> vram minimum page alignment. This way we want to ensure userspace
> is aware of region constraints and not aligned allocations will be
> rejected returning EINVAL.
>
> v2:
> - Rebase, Update uAPI documentation. (Thomas)
> v3:
> - Adjust the dma-buf kunit test accordingly. (Thomas)
>
> Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_dma_buf.c |  8 +++++++-
>   drivers/gpu/drm/xe/xe_bo.c            | 24 ++++++++++++++++--------
>   include/uapi/drm/xe_drm.h             | 25 +++++++++++++++++--------
>   3 files changed, 40 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 18c00bc03024..a6756b554069 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -109,14 +109,20 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>   	struct drm_gem_object *import;
>   	struct dma_buf *dmabuf;
>   	struct xe_bo *bo;
> +	size_t size;
>   
>   	/* No VRAM on this device? */
>   	if (!ttm_manager_type(&xe->ttm, XE_PL_VRAM0) &&
>   	    (params->mem_mask & XE_BO_CREATE_VRAM0_BIT))
>   		return;
>   
> +	size = PAGE_SIZE;
> +	if ((params->mem_mask & XE_BO_CREATE_VRAM0_BIT) &&
> +	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +		size = SZ_64K;
> +
>   	kunit_info(test, "running %s\n", __func__);
> -	bo = xe_bo_create(xe, NULL, NULL, PAGE_SIZE, ttm_bo_type_device,
> +	bo = xe_bo_create(xe, NULL, NULL, size, ttm_bo_type_device,
>   			  XE_BO_CREATE_USER_BIT | params->mem_mask);
>   	if (IS_ERR(bo)) {
>   		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..beed93003d40 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1201,6 +1201,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	};
>   	struct ttm_placement *placement;
>   	uint32_t alignment;
> +	size_t aligned_size;
>   	int err;
>   
>   	/* Only kernel objects should set GT */
> @@ -1211,23 +1212,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	if (!bo) {
> -		bo = xe_bo_alloc();
> -		if (IS_ERR(bo))
> -			return bo;
> -	}
> -
>   	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
>   	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
>   	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> -		size = ALIGN(size, SZ_64K);
> +		aligned_size = ALIGN(size, SZ_64K);
> +		if (type != ttm_bo_type_device)
> +			size = ALIGN(size, SZ_64K);
>   		flags |= XE_BO_INTERNAL_64K;
>   		alignment = SZ_64K >> PAGE_SHIFT;
> +
>   	} else {
> -		size = ALIGN(size, PAGE_SIZE);
> +		aligned_size = ALIGN(size, SZ_4K);
> +		flags &= ~XE_BO_INTERNAL_64K;
>   		alignment = SZ_4K >> PAGE_SHIFT;
>   	}
>   
> +	if (type == ttm_bo_type_device && aligned_size != size)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!bo) {
> +		bo = xe_bo_alloc();
> +		if (IS_ERR(bo))
> +			return bo;
> +	}
> +
>   	bo->tile = tile;
>   	bo->size = size;
>   	bo->flags = flags;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..e136b27d8a6c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -185,11 +185,13 @@ struct drm_xe_query_mem_region {
>   	 *
>   	 * When the kernel allocates memory for this region, the
>   	 * underlying pages will be at least @min_page_size in size.
> -	 *
> -	 * Important note: When userspace allocates a GTT address which
> -	 * can point to memory allocated from this region, it must also
> -	 * respect this minimum alignment. This is enforced by the
> -	 * kernel.
> +	 * Buffer objects with an allowable placement in this region must be
> +	 * created with a size aligned to this value.
> +	 * GPU virtual address mappings of (parts of) buffer objects that
> +	 * may be placed in this region must also have their GPU virtual
> +	 * address and range aligned to this value.
> +	 * Affected IOCTLS will return %-EINVAL if alignment restrictions are
> +	 * not met.
>   	 */
>   	__u32 min_page_size;
>   	/**
> @@ -324,6 +326,14 @@ struct drm_xe_query_config {
>   #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define XE_QUERY_CONFIG_FLAGS			1
>   	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> +	/*
> +	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
> +	 * maximum value of the &min_page_size across all memory regions
> +	 * the device implements. User-space code that does not want
> +	 * to track @min_page_size per region can use this value for
> +	 * a buffer-object size and GPU virtual address and -range
> +	 * alignment value that is valid for all regions.
> +	 */
>   #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define XE_QUERY_CONFIG_VA_BITS			3
>   #define XE_QUERY_CONFIG_GT_COUNT		4
> @@ -501,9 +511,8 @@ struct drm_xe_gem_create {
>   	__u64 extensions;
>   
>   	/**
> -	 * @size: Requested size for the object
> -	 *
> -	 * The (page-aligned) allocated size for the object will be returned.
> +	 * @size: Size of the object to be created, must match region
> +	 * (system or vram) minimum alignment (&min_page_size).
>   	 */
>   	__u64 size;
>   
