Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C394E87845
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 16:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505E910E70D;
	Tue,  3 Feb 2026 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNcnkt9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192D010E6F8;
 Tue,  3 Feb 2026 16:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770136480; x=1801672480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GrvFj5Mdnhf6/fAz1Z3MqBYmPL4aPhnCgEHlt64s8hI=;
 b=iNcnkt9SH7L86/HZhC4inhi58ouSk3GTaSBX5uQHj1keqMQC01t/+cIz
 9FVMoD9FCUMUIYvqoOCDWuIziTMu0yEniTmusvzoa9HD+IBf/+myB9nUJ
 /iyiIIxmmuy2upRCwhKSOgre530tF+EQIq8OPKdbkfH5BZpZ++1X8Ukid
 wYAOostjbJHc4hPcZ5r6AnI1Y0a1mCUhGiNoFFyrNKsB9OJR1Ty4YAEGB
 Zx273LCg6H3FRd0cfqzyCLv63GNUd4MTDIL+iBKQ9HKXQUyy8b8lfQ+0c
 j9oqwfd2Qq6iN72rZQLILdjn6/ndeu6nV2n4LeR/1Cf20Fab3i8Iwy5P/ w==;
X-CSE-ConnectionGUID: fT5Ce27gQTGmH3oX3+hl+A==
X-CSE-MsgGUID: VS+7XqDJQwSuB7KqNsO/fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88734883"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="88734883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:34:39 -0800
X-CSE-ConnectionGUID: O6fesdVfQnSy4lpFCVutog==
X-CSE-MsgGUID: cJl3phKIRCeok3EyUJyzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210004324"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.148])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:34:37 -0800
Date: Tue, 3 Feb 2026 18:34:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: Re: [v3 17/19] drm/i915: Remove i915_reg.h from
 intel_display_power_well.c
Message-ID: <aYIjmmpOFq0jVXxo@intel.com>
References: <20260129211358.1240283-1-uma.shankar@intel.com>
 <20260129211358.1240283-18-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129211358.1240283-18-uma.shankar@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Jan 30, 2026 at 02:43:56AM +0530, Uma Shankar wrote:
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

Instead of confusing where this bit lives on most platforms
(MI_ARB_STATE) we should probably just add a separate defition
for the VLV bit (since it has a separate register offset definition
as well).

>  /* Set display plane priority */
>  #define   MI_ARB_DISPLAY_PRIORITY_A_B		(0 << 0)	/* display A > display B */
>  #define   MI_ARB_DISPLAY_PRIORITY_B_A		(1 << 0)	/* display B > display A */
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel
