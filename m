Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56927C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC710E988;
	Thu, 22 Jan 2026 11:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/TyBMzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4179D10E988;
 Thu, 22 Jan 2026 11:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769082128; x=1800618128;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b7Bmine4y6uO93K/thWf1HLQEQyIOH7A4URbwqf8gI0=;
 b=k/TyBMzM2JpqhMXvAUxJZY/BhtkLrDoUIbzf2usrm+SkQDS/8Jad0u+m
 FxVvXdMS0crtC9OPrjMaq3Hd+ih08karYgRx1iarMVxsjsYVw1OCGgY0M
 hr3MZd7LNAyLU0FHPyXmAZSIC8ADkz5km6vs+zRujutvK8FYB/QSgqDow
 p02tE24kUjfmaZwL+s13hQuTh9BRgFbwOd7SflAq+WBQTX0urGAiqKamE
 h/VFoWQPVcQY0C1Ueb6eTl3FFB5+nkQG6LyL8UpRTftZdlaVwzcUatpGe
 9Fk5YD0k6qErGWmMPbi9vyeu1QkieRxf9OkltW/nuEv+CX0G5Gpz6eNLj g==;
X-CSE-ConnectionGUID: BZ4VKhs7Ql6UjVh1wB4hcw==
X-CSE-MsgGUID: YKS+6/cnQlix7Q/J5f9C5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="92985396"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="92985396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:42:07 -0800
X-CSE-ConnectionGUID: dPJxNaa6T/SQUEM1sxm0lA==
X-CSE-MsgGUID: MhQlVJa9ThSjZXFTLGG+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211731009"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:42:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 07/19] drm/{i915, xe}: Remove i915_reg.h from intel_dram.c
In-Reply-To: <20260121232414.707192-8-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-8-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 13:41:58 +0200
Message-ID: <c2f3a128c1b75d051e53942432603374b9f418aa@intel.com>
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

On Thu, 22 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Make intel_dram.c free from including i915_reg.h.
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 6 +++++-
>  drivers/gpu/drm/i915/display/intel_dram.c         | 3 ++-
>  drivers/gpu/drm/i915/i915_reg.h                   | 6 ------
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 3447ee229354..f395b7d4d640 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -3075,6 +3075,10 @@ enum skl_power_gate {
>  #define   MTL_TRAS_MASK			REG_GENMASK(16, 8)
>  #define   MTL_TRDPRE_MASK		REG_GENMASK(7, 0)
>  
> -
> +#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
> +#define   XE3P_ECC_IMPACTING_DE			REG_BIT(12)
> +#define   MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)
> +#define   MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
> +#define   MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)
>  
>  #endif /* __INTEL_DISPLAY_REGS_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
> index 170de304fe96..73a127dd6720 100644
> --- a/drivers/gpu/drm/i915/display/intel_dram.c
> +++ b/drivers/gpu/drm/i915/display/intel_dram.c
> @@ -7,10 +7,11 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>

dram only needs a few pcode things, so I'd prefer having a file for
pcode regs and only including that here.

>  
> -#include "i915_reg.h"
>  #include "intel_display_core.h"
>  #include "intel_display_utils.h"
> +#include "intel_display_regs.h"
>  #include "intel_dram.h"
>  #include "intel_mchbar_regs.h"
>  #include "intel_pcode.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index fac24a649d61..c9fb9af1a35c 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1005,12 +1005,6 @@
>  #define OROM_OFFSET				_MMIO(0x1020c0)
>  #define   OROM_OFFSET_MASK			REG_GENMASK(20, 16)
>  
> -#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
> -#define   XE3P_ECC_IMPACTING_DE			REG_BIT(12)
> -#define   MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)
> -#define   MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
> -#define   MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)
> -
>  #define MTL_MEDIA_GSI_BASE		0x380000
>  
>  #endif /* _I915_REG_H_ */

-- 
Jani Nikula, Intel
