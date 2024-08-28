Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1AC7112B
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 20:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780E10E5CF;
	Wed, 28 Aug 2024 20:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mr7rdM9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A3A10E5CE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 20:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724876241; x=1756412241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lOSXU10+YWE3ZZXjpOm6DKhH91//QEoRTj/E/L/w/NA=;
 b=mr7rdM9DwqF799/DL7aDVhiMXc8en3Oez4knv4Afo03Ra0Kxg0en6BXF
 idFaB1CJaWlqvDUUaK42/K8dBeMW+Pj/fPcNsJlpujbBOxH3AOeQvNIcl
 h3F7GfOQ5xcOLL5FKoXJgwfJOrggSI4QkDwpXdB90OvkuvaKReQKdTSVY
 1ffk+pAsqvc0MfNMlEdTG2dp0U8h8P6RZ3uav+EANZdCbU3XsuRhho7PF
 e1GR+01zRgfVcN8FAvnzfNSxLNJ3WQg1gwh01SHqL6VH+6ptnA+/jrpLH
 O2AlO7Ku8eRLSzupremMAzW9Hdr1LWHCNOtExLq82DoLfR5NjT1BwwnJG w==;
X-CSE-ConnectionGUID: +VrFizMKTBqlRyEQA11jCQ==
X-CSE-MsgGUID: PodrIX+DSGip9FmpDMvDRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23298556"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23298556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:17:20 -0700
X-CSE-ConnectionGUID: tGEpB6rOQhSdCLkjFXjZGQ==
X-CSE-MsgGUID: ZSBo0YjdRuSYmxx1tGiGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63855329"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 28 Aug 2024 13:17:17 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2348D312D4;
 Wed, 28 Aug 2024 21:17:16 +0100 (IST)
Message-ID: <18abd6bc-c71b-4ae7-9300-ea51a9d303f0@intel.com>
Date: Wed, 28 Aug 2024 22:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe: memirq infra changes for msix
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-3-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240828091841.1840086-3-ilia.levi@intel.com>
Content-Type: text/plain; charset=UTF-8
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

please s/msix/MSI-X in the title

On 28.08.2024 11:18, Ilia Levi wrote:
> When using MSI-X, hw engines report interrupt status and source to engine
> instance 0. We pass a flag to memirq initialization routine for this case.
> 
> For this scenario, in order to differentiate between the engines, we need
> to pass different status/source pointers in the lrc.

s/lrc/LRC

> 
> The requirements on those pointers are:
> - Interrupt status should be 4KiB aligned
> - Interrupt source should be 64 bytes aligned
> 
> To accommodate this, we duplicate the current memirq page layout -
> allocating a page for each engine instance and pass this page in the lrc.
> Note that the same page can be reused for different engine types.
> For example, an lrc executing on ccs #x will have pointers to page #x,
> and an lrc executing on bcs #x will have the same pointers. Thus, to
> locate the proper page, the pointer accessors were modified to receive
> the hw engine.
> 

s/ccs/CCS
s/bcs/BCS

> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c          |  4 +--
>  drivers/gpu/drm/xe/xe_memirq.c       | 49 +++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_memirq.h       |  7 ++--
>  drivers/gpu/drm/xe/xe_memirq_types.h |  6 ++--
>  5 files changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 623e4a977ba3..c4f8bfd08b09 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
>  		if (IS_SRIOV_VF(xe)) {
> -			err = xe_memirq_init(&tile->memirq);
> +			err = xe_memirq_init(&tile->memirq, false);

this knowledge about 'report-to-engine-0' should be internal to the
MEMIRQ, no need to pollute xe_device.c with that

>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index e01d88899890..daeeadceeb0c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -613,9 +613,9 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
>  				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
>  	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
> -	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
> +	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
>  	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
> -	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
> +	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
>  }
>  
>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 0db0726b76f3..a1d4bc3f9e42 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -112,18 +112,18 @@ static void __release_xe_bo(struct drm_device *drm, void *arg)
>  	xe_bo_unpin_map_no_vm(bo);
>  }
>  
> -static int memirq_alloc_pages(struct xe_memirq *memirq)
> +static int memirq_alloc_pages(struct xe_memirq *memirq, size_t bo_size)
>  {
>  	struct xe_device *xe = memirq_to_xe(memirq);
>  	struct xe_tile *tile = memirq_to_tile(memirq);
>  	struct xe_bo *bo;
>  	int err;
>  
> -	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET, SZ_64));
> -	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
>  
>  	/* XXX: convert to managed bo */
> -	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_SYSTEM |
>  				  XE_BO_FLAG_GGTT |
> @@ -138,11 +138,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	memirq_assert(memirq, !xe_bo_is_vram(bo));
>  	memirq_assert(memirq, !memirq->bo);
>  
> -	iosys_map_memset(&bo->vmap, 0, 0, SZ_4K);
> +	iosys_map_memset(&bo->vmap, 0, 0, bo_size);
>  
>  	memirq->bo = bo;
> -	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET);
> -	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET);
> +	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
> +	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
>  	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
>  
>  	memirq_assert(memirq, !memirq->source.is_iomem);
> @@ -150,7 +150,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  	memirq_assert(memirq, !memirq->mask.is_iomem);
>  
>  	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
> -		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
> +		     xe_memirq_source_ptr(memirq, NULL), xe_memirq_status_ptr(memirq, NULL));
>  
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>  
> @@ -170,6 +170,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
>  /**
>   * xe_memirq_init - Initialize data used by `Memory Based Interrupts`_.
>   * @memirq: the &xe_memirq to initialize
> + * @reports_to_e0: Does the HW report status and source to engine instance 0?

xe_memirq should know that as it can find out on which platform it is
initialized

btw, the 'e0' name is not very intuitive, maybe introduce helper in this
file with full name:

static bool memirq_reports_instance_zero(struct xe_memirq *)
{
	xe_tile_assert(tile, has_memirq);

	return !IS_SRIOV_VF(xe);
}

>   *
>   * Allocate `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
>   * used by `Memory Based Interrupts`_.
> @@ -181,15 +182,19 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_memirq_init(struct xe_memirq *memirq)
> +int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0)
>  {
>  	struct xe_device *xe = memirq_to_xe(memirq);
> +	size_t bo_size;
>  	int err;
>  
>  	if (!xe_device_has_memirq(xe))
>  		return 0;
>  
> -	err = memirq_alloc_pages(memirq);
> +	memirq->reports_to_e0 = reports_to_e0;
> +	bo_size = reports_to_e0 ? XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;
> +
> +	err = memirq_alloc_pages(memirq, bo_size);

memirq_alloc_pages() should be able to find out the required allocation
size, no need to pollute init() function

>  	if (unlikely(err))
>  		return err;
>  
> @@ -202,35 +207,47 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  /**
>   * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
>   * @memirq: the &xe_memirq to query
> + * @hwe: the hw engine for which we want the report page
>   *
>   * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Source Report Page`_.
>   */
> -u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
> +	u16 instance = 0;
> +
> +	if (memirq->reports_to_e0 && hwe)
> +		instance = hwe->instance;

hmm, can hwe be ever NULL ? I would just add:

	xe_tile_assert(tile, hwe);

and then:

	instance = memirq_reports_instance_zero() ? hwe->instance : 0;


> +
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
>  }
>  
>  /**
>   * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
>   * @memirq: the &xe_memirq to query
> + * @hwe: the hw engine for which we want the report page
>   *
>   * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Status Report Page`_.
>   */
> -u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
> +	u16 instance = 0;
> +
> +	if (memirq->reports_to_e0 && hwe)
> +		instance = hwe->instance;

ditto

> +
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
>  }
>  
>  /**
> @@ -273,8 +290,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> -	source = xe_memirq_source_ptr(memirq) + offset;
> -	status = xe_memirq_status_ptr(memirq) + offset * SZ_16;
> +	source = xe_memirq_source_ptr(memirq, NULL) + offset;
> +	status = xe_memirq_status_ptr(memirq, NULL) + offset * SZ_16;
>  
>  	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
>  				source);
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 2d40d03c3095..98e2b61ef973 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -10,11 +10,12 @@
>  
>  struct xe_guc;
>  struct xe_memirq;
> +struct xe_hw_engine;
>  
> -int xe_memirq_init(struct xe_memirq *memirq);
> +int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0);
>  
> -u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
> -u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
>  u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
>  
>  void xe_memirq_reset(struct xe_memirq *memirq);
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 625b6b8736cc..078a1500c918 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -11,9 +11,9 @@
>  struct xe_bo;
>  
>  /* ISR */
> -#define XE_MEMIRQ_STATUS_OFFSET		0x0
> +#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
>  /* IIR */
> -#define XE_MEMIRQ_SOURCE_OFFSET		0x400
> +#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
>  /* IMR */
>  #define XE_MEMIRQ_ENABLE_OFFSET		0x440
>  
> @@ -25,6 +25,7 @@ struct xe_bo;
>   * @status: iosys pointer to `Interrupt Status Report Page`_.
>   * @mask: iosys pointer to Interrupt Enable Mask.
>   * @enabled: internal flag used to control processing of the interrupts.
> + * @reports_to_e0: configuration parameter (see xe_memirq_init)
>   */
>  struct xe_memirq {
>  	struct xe_bo *bo;
> @@ -32,6 +33,7 @@ struct xe_memirq {
>  	struct iosys_map status;
>  	struct iosys_map mask;
>  	bool enabled;
> +	bool reports_to_e0;

since this is needed only during init (slow path) then maybe static
helper is anough ?


>  };
>  
>  #endif
