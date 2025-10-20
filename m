Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06706CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 11:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02610E41C;
	Mon, 20 Oct 2025 11:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHwZOIUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7710E29D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760959900; x=1792495900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9mEq6y4NZjkiv/dVDQdc59NiJordmnytNx++mLuGgmY=;
 b=MHwZOIUUB5o+ieTs02FKoL+UT6jtbU/354XODkTvOy/n2KvjiPCpaVUz
 tqFhZcSNz0Fl/XQCpVMclby16rpVrKB+dc+MWwLdWGFTVulTvoGlhwLgC
 Fl+z7kGPpmWMtJlgl/1PA3LZm+LfpOtIUh1IvXZ+LdtwncXR0zzO+vVQJ
 f6WY+cCu7sUr/wzN+vBf1p4mBnOFTsiZgWxwERgJM7vpekVg4ekurvkA4
 DC3h7T1gIpBBTNM8rsIntTkoUuXzrxsLC/ip0ACmD8875hSGR9suq3hml
 RnsI47NSmXD4dtPwnUBExfmSXsxXlv3UUyC8/GNuYakpFi5P13TlOvA6b g==;
X-CSE-ConnectionGUID: 2Plb9RICRQGzNW3pvmbd8g==
X-CSE-MsgGUID: Oq0xZSFASlSu5tkEPlQl+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65687670"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="65687670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:31:40 -0700
X-CSE-ConnectionGUID: lshRlvoCSUi6FJJDA9NcUw==
X-CSE-MsgGUID: 1G3Bnqa+QQ2RdqeVcK6wSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187324217"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:31:39 -0700
Date: Mon, 20 Oct 2025 14:31:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v13 08/12] drm/xe/xelp: Add AuxCCS invalidation to the
 indirect context workarounds
Message-ID: <aPYdlzzeMLg4bQuJ@intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-9-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020075831.32818-9-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Oct 20, 2025 at 08:58:26AM +0100, Tvrtko Ursulin wrote:
> Following from the i915 reference implementation, we add the AuxCCS
> invalidation to the indirect context workarounds page.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..c77a166a2742 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -27,6 +27,7 @@
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_ring_ops.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -88,6 +89,16 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  					       class, NULL))
>  		return true;
>  
> +	/* AuxCCS invalidation */
> +	if (GRAPHICS_VERx100(xe) >= 1200 &&
> +	    GRAPHICS_VERx100(xe) <= 1210 &&
> +	    (class == XE_ENGINE_CLASS_RENDER ||
> +	     class == XE_ENGINE_CLASS_COMPUTE ||
> +	     class == XE_ENGINE_CLASS_COPY ||
> +	     class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +	     class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
> +		return true;
> +
>  	return false;
>  }
>  
> @@ -1188,6 +1199,31 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 *batch, size_t max_len)
> +{
> +	struct xe_gt *gt = lrc->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int class = hwe->class;
> +	u32 *cmd;
> +
> +	if (GRAPHICS_VERx100(xe) < 1200 || GRAPHICS_VERx100(xe) > 1210 ||
> +	    !(class == XE_ENGINE_CLASS_RENDER ||
> +	      class == XE_ENGINE_CLASS_COMPUTE ||
> +	      class == XE_ENGINE_CLASS_COPY ||
> +	      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +	      class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
> +		return 0;

I would extract that into a function instead of repeating it twice.

> +
> +	if (xe_gt_WARN_ON(gt, max_len < 8))
> +		return -ENOSPC;
> +
> +	cmd = xe_emit_aux_table_inv(hwe, batch);
> +
> +	return cmd - batch;
> +}
> +
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> @@ -1320,9 +1356,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
>  	static const struct bo_setup rcs_funcs[] = {
>  		{ .setup = setup_timestamp_wa },
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	static const struct bo_setup xcs_funcs[] = {
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
