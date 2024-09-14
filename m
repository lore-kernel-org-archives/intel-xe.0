Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92428C02197
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 13:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3385E10E040;
	Sat, 14 Sep 2024 13:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vy8vOyCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A483F10E040
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726321704; x=1757857704;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7QTPhu/anXyVRJxix24HmkInZVtpbe2KwGNYj0XspUQ=;
 b=Vy8vOyCR7N7x7gmv4FE+7q23CO9PKInyf9bF6lIauCRpo/eGs7i1pqqg
 jXLq/NZd9OImGoBjVrBPF6eGQk0EpNrJQR5w+JQKuvwMIp3l/U9MTievw
 eJwthPj7jpcdPQSNYTdhqm2SrD3HUQeeg8rvyvADQJw9zvtQs9Jzc9WX2
 +MFuwoGneEXQMEAMialFF41Y0TyanJ0BbqOf740oMFReWiTm50Ba2v+gW
 Naeu2LE3emz4FBBN/Ea4IVl6UYzErniNhU89mAO0e9L9Xo09solFXTL2v
 IoRneoZ2d4PljvVV0zr26dxwqlZGhFZY6U/irT4a/D36xyWOa0CutWhLR Q==;
X-CSE-ConnectionGUID: AvwJB/V2TiOzp0MuoG3uRw==
X-CSE-MsgGUID: uAS6cWjsSTya5AqeTvHIFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25100755"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="25100755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 06:48:23 -0700
X-CSE-ConnectionGUID: B0N3WFJtQLOln0JTqx3FRQ==
X-CSE-MsgGUID: PN838EftTjWSvEWXv+1meg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="72790493"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 06:48:21 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9356E2879A;
 Sat, 14 Sep 2024 14:48:19 +0100 (IST)
Message-ID: <4aa95e1f-6547-4b68-8c0a-5bab0054702f@intel.com>
Date: Sat, 14 Sep 2024 15:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe: memirq infra changes for MSI-X
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240912085438.737015-1-illevi@habana.ai>
 <20240912085438.737015-3-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912085438.737015-3-illevi@habana.ai>
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



On 12.09.2024 10:54, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> When using MSI-X, hw engines report interrupt status and source to engine
> instance 0. For this scenario, in order to differentiate between the
> engines, we need to pass different status/source pointers in the LRC.
> 
> The requirements on those pointers are:
> - Interrupt status should be 4KiB aligned
> - Interrupt source should be 64 bytes aligned
> 
> To accommodate this, we duplicate the current memirq page layout -
> allocating a page for each engine instance and pass this page in the LRC.
> Note that the same page can be reused for different engine types.
> For example, an LRC executing on CCS #x will have pointers to page #x,
> and an LRC executing on BCS #x will have the same pointers. Thus, to
> locate the proper page, the pointer accessors were modified to receive
> the hw engine.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

few nits below, but

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c          |  4 +--
>  drivers/gpu/drm/xe/xe_memirq.c       | 53 ++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_memirq.h       |  5 +--
>  drivers/gpu/drm/xe/xe_memirq_types.h |  4 +--
>  4 files changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index e40f48f4240f..f0976230012a 100644
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
> index 91a1a91fa930..c590dc0dd9f1 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -127,18 +127,32 @@ static void __release_xe_bo(struct drm_device *drm, void *arg)
>  	xe_bo_unpin_map_no_vm(bo);
>  }
>  
> +static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
> +{
> +	struct xe_device *xe = memirq_to_xe(memirq);

nit: you can use memirq_to_xe() directly below

> +
> +	/*
> +	 * When the HW engines are configured to use MSI-X,
> +	 * they report interrupt status and source to the offset of
> +	 * engine instance 0.
> +	 */
> +	return xe_device_has_msix(xe);
> +}
> +
>  static int memirq_alloc_pages(struct xe_memirq *memirq)
>  {
>  	struct xe_device *xe = memirq_to_xe(memirq);
>  	struct xe_tile *tile = memirq_to_tile(memirq);
> +	size_t bo_size = hw_reports_to_instance_zero(memirq) ?
> +		XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;

nit: it would be good to update diagram in

	DOC: Memory Based Interrupts Page Layout

to reflect those changes in the page layout

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
> @@ -153,19 +167,20 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
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
>  	memirq_assert(memirq, !memirq->status.is_iomem);
>  	memirq_assert(memirq, !memirq->mask.is_iomem);
>  
> -	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
> -		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
> +	memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x status %#x\n",
> +		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
> +		     XE_MEMIRQ_STATUS_OFFSET(0));
>  
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>  
> @@ -216,35 +231,45 @@ int xe_memirq_init(struct xe_memirq *memirq)
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
> +	u16 instance;
> +
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
> +	instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
> +
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
> +	u16 instance;
> +
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
>  
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
> +	instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
> +
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
>  }
>  
>  /**
> @@ -287,8 +312,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
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
> index 2d40d03c3095..15efae2a7a55 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -9,12 +9,13 @@
>  #include <linux/types.h>
>  
>  struct xe_guc;
> +struct xe_hw_engine;
>  struct xe_memirq;
>  
>  int xe_memirq_init(struct xe_memirq *memirq);
>  
> -u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
> -u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
>  u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
>  
>  void xe_memirq_reset(struct xe_memirq *memirq);
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 625b6b8736cc..9d0f6c1cdb9d 100644
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
