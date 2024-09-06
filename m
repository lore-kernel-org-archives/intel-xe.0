Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E941E6FE2B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E6B10EA9A;
	Fri,  6 Sep 2024 15:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Co2tkrxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A70610EA9A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725636530; x=1757172530;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CgeC6ymwp66YL3CW8W4+CAfHlrSv6R+TtIaQOvETaes=;
 b=Co2tkrxwXJ0FDnj5VLGT1qqLg5IUGHnml8dcv6pv3jipzEVp6cmh5PNA
 dKVtUdP5Nv9H2INjUHwGUimNHk7sqI9D/B37LW2iaJ/OsBTHP56atemPm
 1o/SJq5W1FpS8P2QYGNFA/BT7msSOLVmZy5jEv1FCeGrFtDu0281O7gEX
 fcKxbnPBig0v8Kp5wjmqr5oalWsXTTzmr1Om98YZueXXpYf5PCJduPqqP
 a2cXBb7JmtusszUm1JDo3nKUHhu1AhjyPZqODyl0B8YGXtlYvENUxnkzv
 +GypQl9ntFfsAi/1NplPO/UN5gKijsRX3YR13J0VLJGg5Uf928BEv0P8Q Q==;
X-CSE-ConnectionGUID: 2GOvjjcITN2X+0tZe9vGGQ==
X-CSE-MsgGUID: AZdz4G5SQkqailDoIe+Ing==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24508600"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24508600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:28:50 -0700
X-CSE-ConnectionGUID: vVXN4k2/Sz6o9azzDbNgeg==
X-CSE-MsgGUID: mEJJsusyTAyv8eJyhrHyhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66321183"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 06 Sep 2024 08:28:40 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A38402FC42;
 Fri,  6 Sep 2024 16:28:38 +0100 (IST)
Message-ID: <b524f27f-f3f3-4c5b-960e-f7c98455ae82@intel.com>
Date: Fri, 6 Sep 2024 17:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/43] drm/xe: Adjust mmio code to pass VF substructure to
 SRIOV code
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-53-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240904002100.2023834-53-matthew.d.roper@intel.com>
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



On 04.09.2024 02:21, Matt Roper wrote:
> Although we want to break the GT-centric nature of the MMIO code in the
> general driver, the SRIOV handling still relies on data in a VF
> substructure of the GT.  Pass this substructure, rather than the GT

hmm, I would prefer to keep GT as VF function param, this substructure
is not used as explicit param in any other function by design

> itself, to the SRIOV code called from the MMIO operations.  Most of what
> the SRIOV code needs is within this substructure, and container_of() can
> be used to get back to the GT itself if necessary.
> Also store a backpointer to this structure within the xe_mmio in
> preparation for removal of xe_gt from the MMIO interface.

maybe in addition to backpointer to the xe_tile we can also keep more
generic backpointer to the xe_gt?

but then the question would be whether the xe_mmio unification at GT
level brings any value ...

maybe instead we should consider adding GT oriented MMIO functions that
will do necessary address adjustments and then use the pure xe_mmio from
the tile:

u32 xe_gt_mmio_read32(gt, reg)
{
	struct xe_reg adj = reg;

	// maybe we should have XE_REG_OPTION_GT ?
	adj.addr += gt->mmio.adj_offset;

	// we can place SRIOV VF hook here
	return xe_tile_mmio_read32(&gt_to_tile(gt), adj);
}

and for the whole series introduce (or even keep):

#define xe_mmio_read32(p, reg) 					\
	_Generic(p,						\
		struct xe_mmio *: __xe_mmio_read32,		\
		struct xe_tile *: xe_tile mmio_read32,		\
		struct xe_gt *: xe_gt_mmio_read32)(p, reg)

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 6 ++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h  | 5 +++--
>  drivers/gpu/drm/xe/xe_mmio.c         | 4 ++--
>  drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
>  5 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 19c21e55e153..15a371f81c60 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -121,6 +121,9 @@ struct xe_mmio {
>  	/** @regs: Map used to access registers. */
>  	void __iomem *regs;
>  
> +	/** @sriov_vf: For GT regions, backpointer to SRIOV VF structure */
> +	struct xe_gt_sriov_vf *sriov_vf;
> +
>  	/**
>  	 * @map_size: Length of the register region within the map.
>  	 *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ebc82e607af..2c61882ea411 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -879,8 +879,9 @@ static struct vf_runtime_reg *vf_lookup_reg(struct xe_gt *gt, u32 addr)
>   *
>   * Return: register value obtained from the PF or 0 if not found.
>   */
> -u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
> +u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg)
>  {
> +	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	struct vf_runtime_reg *rr;
>  
> @@ -915,8 +916,9 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>   * This function is for VF use only.
>   * Currently it will trigger a WARN if running on debug build.
>   */
> -void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> +void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val)
>  {
> +	struct xe_gt *gt = container_of(vf, struct xe_gt, sriov.vf);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index e541ce57bec2..0437c937f5b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -10,6 +10,7 @@
>  
>  struct drm_printer;
>  struct xe_gt;
> +struct xe_gt_sriov_vf;
>  struct xe_reg;
>  
>  int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> @@ -21,8 +22,8 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> -u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> -void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> +u32 xe_gt_sriov_vf_read32(struct xe_gt_sriov_vf *vf, struct xe_reg reg);
> +void xe_gt_sriov_vf_write32(struct xe_gt_sriov_vf *vf, struct xe_reg reg, u32 val);
>  
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index dd2076b9003e..8068663e7d28 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -239,7 +239,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>  
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> -		xe_gt_sriov_vf_write32(gt, reg, val);
> +		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
>  	else
>  		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
> @@ -254,7 +254,7 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	mmio_flush_pending_writes(gt);
>  
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> -		val = xe_gt_sriov_vf_read32(gt, reg);
> +		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
>  	else
>  		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e222539022d5..04d34fd015ce 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -715,6 +715,9 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->mmio.regs = tile->mmio.regs;
>  		gt->mmio.regs_length = tile->mmio.regs_length;
>  		gt->mmio.xe = xe;
> +		if (IS_SRIOV_VF(xe))
> +			gt->mmio.sriov_vf = &gt->sriov.vf;
> +
>  		if (MEDIA_VER(xe) < 13 && media_desc)
>  			gt->info.engine_mask |= media_desc->hw_engine_mask;
>  
> @@ -738,6 +741,8 @@ static int xe_info_init(struct xe_device *xe,
>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>  		gt->mmio.xe = xe;
> +		if (IS_SRIOV_VF(xe))
> +			gt->mmio.sriov_vf = &gt->sriov.vf;
>  
>  		/*
>  		 * FIXME: At the moment multi-tile and standalone media are
