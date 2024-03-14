Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42122C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 18:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECC210FC75;
	Thu, 14 Mar 2024 18:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1+cPVd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B3610F51F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 18:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710439496; x=1741975496;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=C04Fclc0batlxjCFXulfxscbiCyEF95mNBivbuRr3rc=;
 b=J1+cPVd/DpATyLbQa2ePO2qqIlZOqbJdbu9PiDZ4pmsIFvltaDdGWHfC
 SZucKZvIy/TYHmBzcKkgYjkcrQu4GqglRRdH3DtZYSmHh/xtAKw2SYo/Q
 DXT9pbzRGTtmW+zhMXmStyuztVAO8Li87DcVwb2gxIk1kRL0XktBEtSKV
 yliLNrEfuBiyG393xyKgHTd7Enp4qljLUbFJxTrM8xY6XoFha6EBja3va
 ZGdRWthN4+5TGv6mFL4pua56YAhrQiQnC6YCyYs7IjtK1mDFrfWxk95Cb
 l/28ANTHQjVc7TgNSwWW0o0hA3E9VceB+VPrluId8x/iMaiUeWZeI7Pl9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5216623"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5216623"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 11:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17061211"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 14 Mar 2024 11:04:53 -0700
Received: from [10.249.155.117] (unknown [10.249.155.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9E1E57159D;
 Thu, 14 Mar 2024 18:04:51 +0000 (GMT)
Message-ID: <9d85ca96-b42d-4f48-b302-bf861e31479e@intel.com>
Date: Thu, 14 Mar 2024 19:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/1] drm/xe: Add helper macro to loop each DSS
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240314160026.232786-1-zhanjun.dong@intel.com>
 <20240314160026.232786-2-zhanjun.dong@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240314160026.232786-2-zhanjun.dong@intel.com>
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



On 14.03.2024 17:00, Zhanjun Dong wrote:
> Add helper macro to loop each DSS. This is a precursor patch to allow
> for easier iteration through MCR registers and other per-DSS uses.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 25 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
>  drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
>  4 files changed, 57 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a7ab9ba645f9..866bbd26ba3f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -6,6 +6,7 @@
>  #include "xe_gt_mcr.h"
>  
>  #include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
>  #include "xe_gt_types.h"
> @@ -294,14 +295,35 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> -static void init_steering_dss(struct xe_gt *gt)
> +static unsigned int dss_per_group(struct xe_gt *gt)
> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
> +/**
> + * xe_gt_mcr_get_dss_steering - Get the group/instance steering for a DSS
> + * @gt: GT structure
> + * @dss: DSS ID to obtain steering for
> + * @group: pointer to storage for steering group ID
> + * @instance: pointer to storage for steering instance ID
> + */
> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
>  {
> -	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> -			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	int dss_per_grp = dss_per_group(gt);
> +
> +	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
> +
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +}
>  
> -	gt->steering[DSS].group_target = dss / dss_per_grp;
> -	gt->steering[DSS].instance_target = dss % dss_per_grp;
> +static void init_steering_dss(struct xe_gt *gt)
> +{
> +	xe_gt_mcr_get_dss_steering(gt,
> +				   min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> +				       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0)),
> +				   &gt->steering[DSS].group_target,
> +				   &gt->steering[DSS].instance_target);
>  }
>  
>  static void init_steering_oaddrm(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..77fd858b2c0d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_topology.h"

if you really don't want to define for_each_dss() in "xe_gt_topology.h"
then likely you just need to include "xe_gt_types.h"

>  
>  struct drm_printer;
>  struct xe_gt;
> @@ -25,5 +26,29 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
> +
> +/*
> + * Loop over each DSS with the bit is 1 in geometry or compute mask
> + * @dss: DSS ID to obtain steering for

hmm, macro looks like more generic than its first usage, so maybe:

	@dss: iterated DSS bit from the DSS mask

> + * @gt: GT structure
> + */
> +#define for_each_dss(dss, gt) \
> +	for_each_or_bit((dss), \
> +			(gt)->fuse_topo.g_dss_mask, \
> +			(gt)->fuse_topo.c_dss_mask, \
> +			XE_MAX_DSS_FUSE_BITS)

and IMO this macro will look better in xe_gt_topology.h

but otherwise LGTM, so with macro moved or with fixed include, this is:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +
> +/*
> + * Loop over each DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + * @dss: DSS ID to obtain steering for
> + * @gt: GT structure
> + * @group: steering group ID, data type: u16
> + * @instance: steering instance ID, data type: u16
> + */
> +#define for_each_dss_steering(dss, gt, group, instance) \
> +	for_each_dss((dss), (gt)) \
> +		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))
>  
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 5dc62fe1be49..f5773a14f3c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..f6da2ad9719f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,10 +25,12 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>  
> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> -typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
> +typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
>  
>  struct xe_mmio_range {
>  	u32 start;
