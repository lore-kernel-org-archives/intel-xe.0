Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E09E87822
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 12:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9242610E63D;
	Tue,  3 Feb 2026 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyFvfDLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552910E63C;
 Tue,  3 Feb 2026 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770122955; x=1801658955;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=d5QR04+abxXdIY5yS4SJTxRK6XY8Mo4Rq5Qom6G8HyQ=;
 b=ZyFvfDLY32zMpJaol/HKh3FkbZrhcKfNSo1Mu35Opg2fgILnUYQSTBNq
 4ors83txXrgMQ1FoMloIuuONxtw4LQx51VsvLvng4C7RUGdRmPIJSHhQL
 vNhQyFwwTPdybehrir5Rvj/Rzcm433M4hF+HZZFr6Z+69AkDokF4FKLs+
 DIg7SgHb2KconC0cysffcZZegOlkAJvriFJTBTdl8yuS5iSN1fu2olfZh
 k2lkKUyH8X20VyWiabJPopy+Q+Bg9blTQnxzZmj8a7IOMCsxotxjx+cdE
 vXaR6CxARD94ZX+XLe3TaestBNBC3EhzoNNqwsoSfDmDiX0hl0ub3jpcm w==;
X-CSE-ConnectionGUID: pZa8D9IZTiGz/0ziTDCGxA==
X-CSE-MsgGUID: UQLmlbY2T2mkJA5jllBUEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71014852"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71014852"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:49:15 -0800
X-CSE-ConnectionGUID: c+QxJUkmRZKwVdXDzBRteg==
X-CSE-MsgGUID: NOW9oPr3TGykREoJScWJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="214796743"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:49:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v3 17/19] drm/i915: Remove i915_reg.h from
 intel_display_power_well.c
In-Reply-To: <20260129211358.1240283-18-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260129211358.1240283-1-uma.shankar@intel.com>
 <20260129211358.1240283-18-uma.shankar@intel.com>
Date: Tue, 03 Feb 2026 14:49:09 +0200
Message-ID: <1990f0bcf49821dea3f5161099776bc975ec4c2f@intel.com>
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

On Fri, 30 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Make intel_display_power_well.c free from including i915_reg.h.
>
> v2: Include specific pcode header, drop common header (Jani)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power_well.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_regs.h       | 2 ++
>  drivers/gpu/drm/i915/i915_reg.h                         | 3 ---
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index 6f9bc6f9615e..f98de1baa63d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -6,8 +6,8 @@
>  #include <linux/iopoll.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_pcode.h>

Hmm, nothing's being moved there in this patch, so this change feels
unrelated.

BR,
Jani.

>  
> -#include "i915_reg.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_combo_phy.h"
>  #include "intel_combo_phy_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 4a9b7560ce8c..758749c5c322 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -359,6 +359,8 @@
>  #define  FW_CSPWRDWNEN		(1 << 15)
>  
>  #define MI_ARB_VLV		_MMIO(VLV_DISPLAY_BASE + 0x6504)
> +/* Disable display A/B trickle feed */
> +#define   MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE	(1 << 2)
>  
>  #define CZCLK_CDCLK_FREQ_RATIO	_MMIO(VLV_DISPLAY_BASE + 0x6508)
>  #define   CDCLK_FREQ_SHIFT	4
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 9cd7fce09ebe..e4fc61dcd384 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -428,9 +428,6 @@
>  #define   MI_ARB_LOW_PRIORITY_GRACE_4KB		(0 << 4)	/* default */
>  #define   MI_ARB_LOW_PRIORITY_GRACE_8KB		(1 << 4)
>  
> -/* Disable display A/B trickle feed */
> -#define   MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE	(1 << 2)
> -
>  /* Set display plane priority */
>  #define   MI_ARB_DISPLAY_PRIORITY_A_B		(0 << 0)	/* display A > display B */
>  #define   MI_ARB_DISPLAY_PRIORITY_B_A		(1 << 0)	/* display B > display A */

-- 
Jani Nikula, Intel
