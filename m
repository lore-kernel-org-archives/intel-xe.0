Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13610C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 12:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84D510E995;
	Thu, 22 Jan 2026 12:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eByTLuel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0F10E9A7;
 Thu, 22 Jan 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769084389; x=1800620389;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bDITrLfQ3+KgmUEYA1sedqv5H8kgHoxyRRKmvev2H3U=;
 b=eByTLuel0Co3RJWKhviCNZLw0tBzmoF6jbYSN5B8gH8NzArBbR7OR1by
 dmD6QpExicWHKWOmTXSTVB0TM1dsfRnlbD1SSgK2C5dHotPoocCKygS1H
 6q2b4f1uS/LD4bPID5NpOogxX2m7V1n4X05iBN5M/jKyjAEek5g5uspgK
 dhxWI5l3kXtnQ0Ki4S1aPhLNnecUfQBxZ+P6E1gaydVvmPDtBIPzzucVi
 2jFXrm5KZHBYW/X7hOBdMsP1yEpBYs/EU5fZCQhcA3QgsccOpmvJZStEr
 sNKg5H/drxVTh32EzG33R3+/KwvzjjTsJixT8o8YJVtbFCDNTAbNT2tkV Q==;
X-CSE-ConnectionGUID: c4fU5r2kQwuOXgCnEuQrsQ==
X-CSE-MsgGUID: vyVlyzB9SbGA38HAwmw+GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70490047"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70490047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:19:49 -0800
X-CSE-ConnectionGUID: eAvgb4DESYSAIfsSAQRHDA==
X-CSE-MsgGUID: uNIPPs5JQ5G5FXtInzUj8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237979443"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:19:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 17/19] drm/{i915, xe}: Remove i915_reg.h from
 intel_display_power_well.c
In-Reply-To: <20260121232414.707192-18-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-18-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 14:19:43 +0200
Message-ID: <59509430119357e7c4e591bda331fd77aafd2054@intel.com>
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
> Make intel_display_power_well.c free from including i915_reg.h.
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_power_well.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_regs.h       | 2 ++
>  drivers/gpu/drm/i915/i915_reg.h                         | 3 ---
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index db185a859133..8a1f1c61c6da 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -6,8 +6,8 @@
>  #include <linux/iopoll.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>

Again, I dislike the catch-all header, because I have no idea why this
is included. More granular is better.

BR,
Jani.

>  
> -#include "i915_reg.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_combo_phy.h"
>  #include "intel_combo_phy_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index fb21b1cf6124..1def3dccdf61 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -319,6 +319,8 @@
>  #define  FW_CSPWRDWNEN		(1 << 15)
>  
>  #define MI_ARB_VLV		_MMIO(VLV_DISPLAY_BASE + 0x6504)
> +/* Disable display A/B trickle feed */
> +#define   MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE	(1 << 2)
>  
>  #define CZCLK_CDCLK_FREQ_RATIO	_MMIO(VLV_DISPLAY_BASE + 0x6508)
>  #define   CDCLK_FREQ_SHIFT	4
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index a85e2d9ab561..c68a64bc7646 100644
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
