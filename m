Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E30CAC5A7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 09:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0B310E01F;
	Mon, 22 Sep 2025 09:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGE50KMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423910E01F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758532264; x=1790068264;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wIroFN37NYWoNCvwj6+Z5z2jnD4PryI26NeU0IM9ff4=;
 b=NGE50KMUWVWoT+h4JhXMKwsMVp/HXzs4bFs7/Fjbc7lxzHc9umykuYGi
 bONKcI2XeJXZN52g4Ul0a1nS7hlysGpf4mkEXq8wxAk2+ZKAHzhogs8eX
 3Mpv125ttqWJQyYIkVslgqKXEqckGTzWhv11dTS+LmkRG/AS3D+y/v6jq
 KdnsxuMIYUuoylwU9aXV0muwTqWasTM0PV4DQMDFsCImXgNSUYEelTZQO
 gbmm4juTyWF8bukoUBLdrQ7U6KWtICPjOcVTHTT1I7UUg8+CNHk8qZVol
 AJdNE4ENj1gpPsj5ZylFn/l97wawKwoTv4W561pcfDF68EtmruLT/ROsu w==;
X-CSE-ConnectionGUID: bOpiRIbBS16vgMWU8afO+A==
X-CSE-MsgGUID: nLKKWna3QZq6owZUCpoE4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60678152"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60678152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 02:11:04 -0700
X-CSE-ConnectionGUID: KzY5bbGRTiyUnQ4R2cBg+w==
X-CSE-MsgGUID: LpYZb0lnSTCvx0e2r0jLng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="180840703"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.110])
 ([10.245.244.110])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 02:10:57 -0700
Message-ID: <2f4e1611-853c-4461-aa50-c2f40337b9e2@intel.com>
Date: Mon, 22 Sep 2025 11:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/dma-buf: Allow pinning of p2p dma-buf
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
 <20250918092207.54472-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <20250918092207.54472-4-thomas.hellstrom@linux.intel.com>
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

Hey,

Patch itself looks good. Lets see if we can revive the discussion on pinning in cgroups.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2025-09-18 11:22, Thomas Hellström wrote:
> RDMA NICs typically requires the VRAM dma-bufs to be pinned in
> VRAM for pcie-p2p communication, since they don't fully support
> the move_notify() scheme. We would like to support that.
>
> However allowing unaccounted pinning of VRAM creates a DOS vector
> so up until now we haven't allowed it.
>
> However with cgroups support in TTM, the amount of VRAM allocated
> to a cgroup can be limited, and since also the pinned memory is
> accounted as allocated VRAM we should be safe.
>
> An analogy with system memory can be made if we observe the
> similarity with kernel system memory that is allocated as the
> result of user-space action and that is accounted using __GFP_ACCOUNT.
>
> Ideally, to be more flexible, we would add a "pinned_memory",
> or possibly "kernel_memory" limit to the dmem cgroups controller,
> that would additionally limit the memory that is pinned in this way.
> If we let that limit default to the dmem::max limit we can
> introduce that without needing to care about regressions.
>
> Considering that we already pin VRAM in this way for at least
> page-table memory and LRC memory, and the above path to greater
> flexibility, allow this also for dma-bufs.
>
> v2:
> - Update comments about pinning in the dma-buf kunit test
>   (Niranjana Vishwanathapura)
>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 17 +++++++++--
>  drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
>  2 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index a7e548a2bdfb..5df98de5ba3c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  			    struct drm_exec *exec)
>  {
>  	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
> +	struct dma_buf_attachment *attach;
>  	u32 mem_type;
>  	int ret;
>  
> @@ -46,7 +47,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  		mem_type = XE_PL_TT;
>  	else if (params->force_different_devices && !is_dynamic(params) &&
>  		 (params->mem_mask & XE_BO_FLAG_SYSTEM))
> -		/* Pin migrated to TT */
> +		/* Pin migrated to TT on non-dynamic attachments. */
>  		mem_type = XE_PL_TT;
>  
>  	if (!xe_bo_is_mem_type(exported, mem_type)) {
> @@ -88,6 +89,18 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  
>  	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
>  
> +	/* Check that we can pin without migrating. */
> +	attach = list_first_entry_or_null(&dmabuf->attachments, typeof(*attach), node);
> +	if (attach) {
> +		int err = dma_buf_pin(attach);
> +
> +		if (!err) {
> +			KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
> +			dma_buf_unpin(attach);
> +		}
> +		KUNIT_EXPECT_EQ(test, err, 0);
> +	}
> +
>  	if (params->force_different_devices)
>  		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
>  	else
> @@ -150,7 +163,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  			xe_bo_lock(import_bo, false);
>  			err = xe_bo_validate(import_bo, NULL, false, exec);
>  
> -			/* Pinning in VRAM is not allowed. */
> +			/* Pinning in VRAM is not allowed for non-dynamic attachments */
>  			if (!is_dynamic(params) &&
>  			    params->force_different_devices &&
>  			    !(params->mem_mask & XE_BO_FLAG_SYSTEM))
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index a7d67725c3ee..54e42960daad 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
>  
>  static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
> -	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	struct drm_gem_object *obj = dmabuf->priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	struct xe_device *xe = xe_bo_device(bo);
>  	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> +	bool allow_vram = true;
>  	int ret;
>  
> -	/*
> -	 * For now only support pinning in TT memory, for two reasons:
> -	 * 1) Avoid pinning in a placement not accessible to some importers.
> -	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
> -	 */
> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
> +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> +		allow_vram = false;
> +	} else {
> +		list_for_each_entry(attach, &dmabuf->attachments, node) {
> +			if (!attach->peer2peer) {
> +				allow_vram = false;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT) &&
> +	    !(xe_bo_is_vram(bo) && allow_vram)) {
>  		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> -	if (ret) {
> -		if (ret != -EINTR && ret != -ERESTARTSYS)
> -			drm_dbg(&xe->drm,
> -				"Failed migrating dma-buf to TT memory: %pe\n",
> -				ERR_PTR(ret));
> -		return ret;
> +	if (!allow_vram) {
> +		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> +		if (ret) {
> +			if (ret != -EINTR && ret != -ERESTARTSYS)
> +				drm_dbg(&xe->drm,
> +					"Failed migrating dma-buf to TT memory: %pe\n",
> +					ERR_PTR(ret));
> +			return ret;
> +		}
>  	}
>  
> -	ret = xe_bo_pin_external(bo, true, exec);
> +	ret = xe_bo_pin_external(bo, !allow_vram, exec);
>  	xe_assert(xe, !ret);
>  
>  	return 0;
