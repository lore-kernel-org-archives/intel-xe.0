Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC06EC47DA7
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 08:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6870B10E60C;
	Wed, 17 Jan 2024 08:26:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E099910E60C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705479968; x=1737015968;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ILa0izXzBDObdQFa1EL4J+eieBw8ZepIJ0n7F68OFRg=;
 b=dF2LoEArYJWOZwwnBidT4vgRhBFp1AorVntqVmhUCRKDO1t8FYEeoTM7
 OJRvMmi+uRLyxKgX/nwENGIBNMmlYVxOzERY8VoU/KxDa7R5az2HQOxG+
 UfMdJL9SO9Nr9gwZm75IU601JX9kEc+ja9tvyWJNbDdmAmlIbkt5heX8H
 A3jB21DTIq9HX6ZHw2iHnQW+sXRARA+Q37NbD9oO2sdpucpcI2Nl1oFB7
 57cNr64zuX4IuN3B3yZ4CbKOpiGVXy/P96V7iQLS3DbwwHS26eQthtj/a
 GPQQXn0YqjLzSWN8Hwj5Kah0BBR0evm9dGE5GRjZXpgVasmXG8FfLTi1R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7200890"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7200890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 00:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26107209"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 00:26:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/xe/guc: Expose dss per group for GuC error capture
In-Reply-To: <20240116231600.154097-3-zhanjun.dong@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240116231600.154097-1-zhanjun.dong@intel.com>
 <20240116231600.154097-3-zhanjun.dong@intel.com>
Date: Wed, 17 Jan 2024 10:26:02 +0200
Message-ID: <87mst4qsbp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 16 Jan 2024, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
> Expose helper for dss per group of mcr, GuC error capture feature
> need this info to prepare buffer required.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.h          |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c     |  3 ---
>  drivers/gpu/drm/xe/xe_guc_capture.c     | 27 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 +++
>  5 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8d..5874eb71cbc1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -295,7 +295,7 @@ static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..fa879bf5c271 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,10 +7,13 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"
>  
>  struct drm_printer;
>  struct xe_gt;
>  
> +#define XE_GT_MCR_DSS_PER_GROUP(gt) (gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4);
> +
>  void xe_gt_mcr_init(struct xe_gt *gt);
>  
>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..e973eeaac7f1 100644
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
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0870bfd1b88d..09a61894cf6f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -93,6 +93,33 @@
>  	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>  	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>  
> +static inline void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
> +					     unsigned int *group, unsigned int *instance)
> +{
> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +}
> +
> +static inline bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
> +{
> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
> +	int index = slice * dss_per_grp + subslice;
> +	return index >= XE_MAX_DSS_FUSE_BITS ? false : test_bit(index, gt->fuse_topo.g_dss_mask);
> +}

Generally speaking, you're better off dropping the inline keyword in C
files, and just letting the compiler do its job. In fact, having the
inline prevents the compiler from telling you if the functions are
unused.

> +
> +#define _HAS_SS(ss_, gt_, group_, instance_) xe_sseu_has_subslice(gt_, group_, instance_)
> +
> +/*
> + * Loop over each subslice/DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + */
> +#define for_each_ss_steering(ss_, gt_, group_, instance_) \
> +	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
> +	     ss_ < XE_MAX_DSS_FUSE_BITS; \
> +	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
> +		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
> +
>  int xe_guc_capture_init(struct xe_guc *guc)
>  {
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index dfeaaac08b7f..c258228b244f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -65,6 +65,9 @@ struct xe_bo;
>  struct xe_execlist_port;
>  struct xe_gt;
>  
> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> +
>  /**
>   * struct xe_hw_engine_class_intf - per hw engine class struct interface
>   *

-- 
Jani Nikula, Intel
