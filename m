Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C97C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E5010E22C;
	Thu, 15 Feb 2024 19:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEko9wKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6F510E22C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708024843; x=1739560843;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=dtjYn/m0XM1man6mf+b4DKIOMaz6bbBL9d0dH4/9lb0=;
 b=nEko9wKuasihToZpyTae4pIvCN2rounQPRND1kYtJKoXBjQozxj1lSNc
 vwFn9kgTqhVLWkmafjHT5mW7q+LkL0XESa1mxa8xkLhz8up5J34Oo9xXH
 TuQyc2KYg2XTXnoo4ADsMgvmW+akTuv48SzCgN5p4KsZdpwJ6y2ZAvvRz
 yTwCID0jFt1u/ad8qRG9IqWF7GlxPhBxoWOW44//zeVBXP1ARCUtATUty
 g2+8QGoi3IFdLAqVrj6xJbftWg7ZTiJ/gN3naDjNSOUz/Q12m3NcVGgD5
 u2mrzY1AwmxVvo/z0ip0qSNsAaAGqz+C8U5ajrsir0fJ2Di35YIDllKfD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5103247"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="5103247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3987688"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 15 Feb 2024 11:20:39 -0800
Received: from [10.249.139.11] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.11])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D485128187;
 Thu, 15 Feb 2024 19:20:36 +0000 (GMT)
Message-ID: <eb7c2696-077f-4274-b5ae-448ef756b9e1@intel.com>
Date: Thu, 15 Feb 2024 20:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] drm/xe: Add helper macro to loop each dss
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240209174548.19389-1-zhanjun.dong@intel.com>
 <20240209174548.19389-2-zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240209174548.19389-2-zhanjun.dong@intel.com>
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

Hi Zhanjun,

I was about to push this patch, but it needs new revision, see below.
Also added some nits

On 09.02.2024 18:45, Zhanjun Dong wrote:
> Add helper macro to loop each dss. This is a precursor patch to allow
> for easier iteration through MCR registers and other per-DSS uses.

nit: please be consistent on naming dss vs DSS

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 32 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 13 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>  5 files changed, 75 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 8546cd3cc50d..44163fe8c7b9 100644
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
> @@ -291,11 +292,40 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> +static int get_dss_per_group(struct xe_gt *gt)

nit: shouldn't this function be 'unsigned int' ?

> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
> +/**
> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
> + * @gt: GT structure
> + * @dss: DSS ID to obtain steering for
> + * @group: pointer to storage for steering group ID
> + * @instance: pointer to storage for steering instance ID
> + *
> + * Returns the steering IDs (via the @group and @instance parameters) that
> + * correspond to a specific DSS ID.

nit: this is a 'bool' function so having a "Return:" section is desired

> + */
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance)
> +{
> +	int dss_per_grp;

nit: this could be one-liner:

	unsigned int dss_per_grp = get_dss_per_group(gt);

> +
> +	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
> +
> +	dss_per_grp = get_dss_per_group(gt);
> +
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +	return true;
> +}
> +
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;

nit: this looks like a good candidate to use this new function
xe_gt_mcr_get_dss_steering() to avoid code duplication


> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..5b4e74da82a1 100644
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
> @@ -25,5 +26,17 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance);
> +
> +/*
> + * Loop over each DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + */

shouldn't this be regular kernel-doc ?

> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
> +	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \

BUG: using outside "gt" instead of "gt_" parameter

also it looks that upstream BKM is to _not_ use underscore for param
names as params shouldn't leak anyway)


> +	     dss_ >= 0; \
> +	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \

ditto

> +		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))

btw, did you consider to split this macro into two:

xe_gt_topology.h:

	#define for_each_dss(dss, gt) \
		for (dss = xe_gt_topology_get_next_dss(gt, 0); \
		     dss >= 0; \
		     dss = xe_gt_topology_get_next_dss(gt, dss + 1))

xe_gt_mcr.h:

	#define for_each_dss_steering(dss, gt, group, instance) \
		 for_each_if(xe_gt_mcr_get_dss_steering(gt, dss, &(group), &(instance)))

>  
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..97c0a4b8fe40 100644
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
> @@ -167,3 +164,31 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  
>  	return quad_first < (quad + 1) * dss_per_quad;
>  }
> +
> +/**
> + * xe_gt_topology_get_next_dss - returns the next DSS id from a start position
> + * @gt: GT structure
> + * @from: An index to start search form

typo s/form/from

> + *
> + * Search from this GT's DSS-fuses-topology and return the DSS-ID of the
> + * next valid DSS instance after DSS-ID 'from'. Depending on the platform
> + * construction, DSS instances could be for geometry (RENDER engine) or
> + * compute (COMPUTE engine). However, all current platforms that have
> + * both engines have the same instances thus we can combine both masks
> + * internally before performing this operation.
> + *
> + * Return -1 if not found since given "from" position.

you should use "Return:" tag and likely say what is returned if found

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
> index 70c615dd1498..b926606edb38 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,7 +25,9 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];

nit: above looks like a good candidates to use new FUSE_BITS definitions

Michal

