Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05162C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 21:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8383510EBB4;
	Tue, 12 Mar 2024 21:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pi28oxGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E7310EBB4
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710280224; x=1741816224;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7YzzHUKT9G88vUijTJY23FzhpQsLoyWBj5psMQN/UGE=;
 b=Pi28oxGUucIZkQMsRuVPkwLjDH63L1BH5/6qKyC5hJ46ROyCpFrTYncS
 fwBQq80wN2hhsGVJGpHWtCU9bittpQRJhN2ZfflEWlVlpjSD0knjNdYGK
 RtTjy3c9M6pViJvAxyNDvdBcf+xQlW8oLh+B7YIN2iiRNIwMAUldONMxw
 ijGUPAwSSEUphIFG42+YIkhizXoFaxJlD0kXevejaEmE48POu3Ia9jmJk
 vg/t3ccmOP6c+Cxvsjz7jlUyvwyzkh4WR8n+FnCwBTVi3YIuGgfFWA44a
 /SuTiELMjGRqNWXlAJJ+azf3irSYlJ6r3LQah6cQLU3P5nUJYljjuMd2h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="30458085"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="30458085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11619911"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 12 Mar 2024 14:50:15 -0700
Received: from [10.249.155.68] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.155.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3167F34337;
 Tue, 12 Mar 2024 21:50:07 +0000 (GMT)
Message-ID: <1f18385d-010a-4146-8a59-40efd1fbf330@intel.com>
Date: Tue, 12 Mar 2024 22:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] drm/xe: Add helper macro to loop each dss
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240220161937.11714-1-zhanjun.dong@intel.com>
 <20240220161937.11714-2-zhanjun.dong@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240220161937.11714-2-zhanjun.dong@intel.com>
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



On 20.02.2024 17:19, Zhanjun Dong wrote:
> Add helper macro to loop each dss. This is a precursor patch to allow

please be consistent in naming: s/dss/DSS

> for easier iteration through MCR registers and other per-DSS uses.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 16 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
>  5 files changed, 83 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a7ab9ba645f9..2ee727ebc4a2 100644
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
> @@ -294,14 +295,41 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> -static void init_steering_dss(struct xe_gt *gt)
> +static unsigned int get_dss_per_group(struct xe_gt *gt)

nit: as there is no "set" then maybe s/get_dss_per_group/dss_per_group ?

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
> + *
> + * Return: Always return true. The steering IDs (via the @group and @instance parameters) that
> + * correspond to a specific DSS ID is saved to *group and *instance

if return is always true then maybe function should be void and just use
comma operator if you need bool somewhere in the macro

> + */
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
>  {
> -	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> -			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	int dss_per_grp = get_dss_per_group(gt);
> +
> +	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
> +	xe_gt_assert(gt, group);
> +	xe_gt_assert(gt, instance);

as general rule we shouldn't assert NULL pointers as any NPD will end
with nice report anyway

>  
> -	gt->steering[DSS].group_target = dss / dss_per_grp;
> -	gt->steering[DSS].instance_target = dss % dss_per_grp;
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +	return true;
> +}
> +
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
> index 27ca1bc880a0..0d8abd320e08 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_topology.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> @@ -25,5 +26,20 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
> +
> +/*
> + * Loop over each DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + * @dss_: DSS ID to obtain steering for
> + * @gt_: GT structure
> + * @group_: steering group ID, data type: u16
> + * @instance_: steering instance ID, data type: u16
> + */

1) no need to use underscore in param names
2) remember to wrap params into ()

> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
> +	for (dss_ = xe_gt_topology_get_next_dss(gt_, 0); \
> +	     dss_ >= 0; \
> +	     dss_ = xe_gt_topology_get_next_dss(gt_, dss_ + 1)) \
> +		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

I was hoping that there could be for_each_dss defined in gt_topology.h
something like this:

#define for_each_dss(dss, gt) 					\
	for ((dss) = xe_gt_topology_get_next_dss((gt), 0); 	\
	     (dss) >= 0;					\
	     (dss) = xe_gt_topology_get_next_dss((gt), (dss) + 1))

followed by:

#define for_each_dss_steering(dss, gt, group, instance) \
  for_each_dss((dss), (gt))
    for_each_if(get_dss_steering((gt), (dss), &(group), &(instance)))

>  
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..d9566867c7ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)

nit: this definition move could be a small separate patch

> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> @@ -167,3 +164,31 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  
>  	return quad_first < (quad + 1) * dss_per_quad;
>  }
> +
> +/**
> + * xe_gt_topology_get_next_dss - returns the next DSS id from a start position
> + * @gt: GT structure
> + * @from: An index to start search from
> + *
> + * Search from this GT's DSS-fuses-topology and return the DSS-ID of the
> + * next valid DSS instance after DSS-ID 'from'. Depending on the platform
> + * construction, DSS instances could be for geometry (RENDER engine) or
> + * compute (COMPUTE engine). However, all current platforms that have
> + * both engines have the same instances thus we can combine both masks
> + * internally before performing this operation.
> + *
> + * Return: The next DSS id from a start position if found, otherwise -1.
> + */
> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from)
> +{
> +	xe_dss_mask_t all_dss;
> +	unsigned long next;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
> +	if (next == XE_MAX_DSS_FUSE_BITS)
> +		return -1;
> +	return next;
> +}

maybe there is no need for this function at all as likely below macro
could do the trick:

#define for_each_dss(dss, gt) 					\
	for_each_or_bit((dss),					\
			(gt)->fuse_topo.g_dss_mask,  		\
			(gt)->fuse_topo.c_dss_mask,		\
			XE_MAX_DSS_FUSE_BITS)

> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index d1b54fb52ea6..44bd8a58f9ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -21,5 +21,6 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  
>  bool
>  xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from);
>  
>  #endif /* _XE_GT_TOPOLOGY_H_ */
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
