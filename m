Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC74EF48CC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 05:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A54110E13C;
	Fri, 13 Feb 2026 05:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3wgGbsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9DA10E13C;
 Fri, 13 Feb 2026 05:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770959089; x=1802495089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oslPX89pJ6BYs7TNRSvvWmPzT9hRmePhrIC0taY2aM8=;
 b=Z3wgGbsjss3oEu8PnzdqP1ad/q1WbqHFmLasVQU/SwjcSqDODofhWcA7
 9wwcNZdLRvAuU+8HkYyZeguCCwxkTR09SjyxkfKEa72tC1PmlawFPxTXw
 S1Mv8pkdL++WgEDTNMivYXfhGNhyJ1KsoUW787wWs+x17/mlkICt7DDwv
 zuZZ492a/AV9zCJNpVWrjKXFuozW0Kl6zvXQRvUjXqlb5G61F+pcg/HXo
 GM/TFC0yd35GCt97lbd48SCzcL8oMR5kmPfchXFhekWiNJYpbs2le6I7Y
 CA+DRkOMpu29Bl9Dx01ZBZYg+iWr+9iSWPShgHsoI9UNEfT2OAJaQNL1T Q==;
X-CSE-ConnectionGUID: ftO1OHI5Trao3WRYSYqyUA==
X-CSE-MsgGUID: s9vzvnizQpOn/8P9bvFuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71170940"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="71170940"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 21:04:49 -0800
X-CSE-ConnectionGUID: q6w7n+FbRRumJdiBFEZ5bQ==
X-CSE-MsgGUID: Z5WrO1FYRTaGF9PomokXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211558666"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.239])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 21:04:47 -0800
Date: Fri, 13 Feb 2026 07:04:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 11/15] drm/i915/display: convert W/As in
 intel_modeset_setup.c to new framework
Message-ID: <aY6w7FuoIi0TydHB@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
 <20260212184737.352515-12-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212184737.352515-12-luciano.coelho@intel.com>
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

On Thu, Feb 12, 2026 at 08:46:09PM +0200, Luca Coelho wrote:
> Convert the low-hanging fruits of workaround checks to the workaround
> framework.  Instead of having display structure checks for the
> workarounds all over, concentrate the checks in intel_wa.c.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_wa.c    | 2 ++
>  drivers/gpu/drm/i915/display/intel_display_wa.h    | 1 +
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c | 3 ++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 3aa79e607bf8..72f645686efd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -79,6 +79,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
>  	case INTEL_DISPLAY_WA_13012396614:
>  		return DISPLAY_VERx100(display) == 3000 ||
>  			DISPLAY_VERx100(display) == 3500;
> +	case INTEL_DISPLAY_WA_14010480278:
> +		return (IS_DISPLAY_VER(display, 10, 12));

This is now quite confusing. That w/a number only means something for
tgl+. I think if we want to start converting this kind of places someone
needs to come up with an actual plan how to deal with older platforms.

Also I'm pretty sure that even among the new platforms some w/a's are
listed with different numbers for different platforms. Has anyone
thought what we should do about that?

>  	case INTEL_DISPLAY_WA_14010547955:
>  		return display->platform.dg2;
>  	case INTEL_DISPLAY_WA_14010685332:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 57345d0abe1c..d8359f88de29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -30,6 +30,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_1409120013,
>  	INTEL_DISPLAY_WA_1409767108,
>  	INTEL_DISPLAY_WA_13012396614,
> +	INTEL_DISPLAY_WA_14010480278,
>  	INTEL_DISPLAY_WA_14010547955,
>  	INTEL_DISPLAY_WA_14010685332,
>  	INTEL_DISPLAY_WA_14011294188,
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> index 9b0becee221c..7ee1494a67af 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> @@ -25,6 +25,7 @@
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> +#include "intel_display_wa.h"
>  #include "intel_dmc.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_modeset_setup.h"
> @@ -913,7 +914,7 @@ static void intel_early_display_was(struct intel_display *display)
>  	 * Display WA #1185 WaDisableDARBFClkGating:glk,icl,ehl,tgl
>  	 * Also known as Wa_14010480278.
>  	 */
> -	if (IS_DISPLAY_VER(display, 10, 12))
> +	if (intel_display_wa(display, 14010480278))

>  		intel_de_rmw(display, GEN9_CLKGATE_DIS_0, 0, DARBF_GATING_DIS);
>  
>  	/*
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
