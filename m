Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F357C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 07:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C26810E3B9;
	Thu, 27 Aug 2026 07:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijnH+YwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050610E3B9;
 Thu, 27 Aug 2026 07:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787815454; x=1819351454;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QOGGi8qwuFlaj4GjFjftjV5+CvQyPS5MEltIZewHmC8=;
 b=ijnH+YwO/FhLubFsrbY4NfD1J4ycXDAXCvL/MC6kMe/pi2F1tYV5f05v
 Le1m35cgnDWzWSf+r/Y6kMXECKYARqn/m9CoGA/NOFAZ5TI/LxICciY8y
 Zx1y89k3GUyUhdeICxz7VNQjSysuUgoZHIvWPtPJU/WydwoRdsSNaMsNx
 ZRIO9Y6KsXNrfqec6iA5g5CVnPG7WHiNFY7bPyuM6zuJHxrmFHCFNm0sN
 BfjttsBvfIj/spYKaGg+eBf5rKYB/VdhnVgw38LN/k/XFVRbgRR9r2Fvn
 LoEL2S0lTsaQh2eMtuYlulVQe/hVlg5Z1dY8kKW1hmLkKs/FVDQcQsdBg Q==;
X-CSE-ConnectionGUID: DuXGC4Y8ROe4Br+yqIk4Vg==
X-CSE-MsgGUID: Bm+TnLY1TCWqE1uAxUfZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="113842686"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="113842686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:24:13 -0700
X-CSE-ConnectionGUID: U0/94iFMSkqW3PCtq7MoMw==
X-CSE-MsgGUID: pEGFXkanSzq88TLdXxmvRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="265205500"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:24:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 1/5] drm/i915/display: consolidate Gen9 clock gating
 initialization
In-Reply-To: <20260817092911.342072-2-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <20260817092911.342072-2-luciano.coelho@intel.com>
Date: Thu, 27 Aug 2026 10:24:09 +0300
Message-ID: <c4ffe94d9f37bfadbdf7efaade1d5a063617b63f@intel.com>
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

On Mon, 17 Aug 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> Instead of exporting many of the display clock gating functions,
> consolidate them into a single function that checks the platform and
> calls the appropriate platform-specific function.
>
> Start consolidating the Gen 9 functions first into a new
> intel_display_init_clock_gating() function.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  .../i915/display/intel_display_clock_gating.c | 24 +++++++++++++++----
>  .../i915/display/intel_display_clock_gating.h |  6 +----
>  drivers/gpu/drm/i915/intel_clock_gating.c     | 10 ++++----
>  3 files changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> index d036c7e5863d..d5ecdaeab421 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> @@ -27,7 +27,7 @@ static void intel_display_gen9_init_clock_gating(struct intel_display *display)
>  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_MEMORY_WAKE);
>  }
>  
> -void intel_display_skl_init_clock_gating(struct intel_display *display)
> +static void intel_display_skl_init_clock_gating(struct intel_display *display)
>  {
>  	/*
>  	 * WaCompressedResourceDisplayNewHashMode:skl,kbl
> @@ -47,7 +47,7 @@ void intel_display_skl_init_clock_gating(struct intel_display *display)
>  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
>  }
>  
> -void intel_display_kbl_init_clock_gating(struct intel_display *display)
> +static void intel_display_kbl_init_clock_gating(struct intel_display *display)
>  {
>  	/*
>  	 * WaCompressedResourceDisplayNewHashMode:skl,kbl
> @@ -67,7 +67,7 @@ void intel_display_kbl_init_clock_gating(struct intel_display *display)
>  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
>  }
>  
> -void intel_display_cfl_init_clock_gating(struct intel_display *display)
> +static void intel_display_cfl_init_clock_gating(struct intel_display *display)
>  {
>  	/*
>  	 * WaCompressedResourceDisplayNewHashMode:skl,kbl (and cfl, cml)
> @@ -93,7 +93,7 @@ void intel_display_cfl_init_clock_gating(struct intel_display *display)
>  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
>  }
>  
> -void intel_display_bxt_init_clock_gating(struct intel_display *display)
> +static void intel_display_bxt_init_clock_gating(struct intel_display *display)
>  {
>  	intel_display_gen9_init_clock_gating(display);
>  
> @@ -120,7 +120,7 @@ void intel_display_bxt_init_clock_gating(struct intel_display *display)
>  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
>  }
>  
> -void intel_display_glk_init_clock_gating(struct intel_display *display)
> +static void intel_display_glk_init_clock_gating(struct intel_display *display)
>  {
>  	intel_display_gen9_init_clock_gating(display);
>  
> @@ -268,3 +268,17 @@ void intel_display_i965gm_init_clock_gating(struct intel_display *display)
>  {
>  	intel_de_write(display, DSPCLK_GATE_D, 0);
>  }
> +
> +void intel_display_init_clock_gating(struct intel_display *display)
> +{
> +	if (display->platform.skylake)
> +		intel_display_skl_init_clock_gating(display);
> +	else if (display->platform.kabylake)
> +		intel_display_kbl_init_clock_gating(display);
> +	else if (display->platform.coffeelake || display->platform.cometlake)
> +		intel_display_cfl_init_clock_gating(display);
> +	else if (display->platform.broxton)
> +		intel_display_bxt_init_clock_gating(display);
> +	else if (display->platform.geminilake)
> +		intel_display_glk_init_clock_gating(display);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> index b6dd34ca92dd..4e50e388656a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> @@ -8,11 +8,7 @@
>  
>  struct intel_display;
>  
> -void intel_display_skl_init_clock_gating(struct intel_display *display);
> -void intel_display_kbl_init_clock_gating(struct intel_display *display);
> -void intel_display_cfl_init_clock_gating(struct intel_display *display);
> -void intel_display_bxt_init_clock_gating(struct intel_display *display);
> -void intel_display_glk_init_clock_gating(struct intel_display *display);
> +void intel_display_init_clock_gating(struct intel_display *display);
>  void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display);
>  void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display);
>  void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display);
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
> index 86bdeb20f427..84f838c660fd 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -57,12 +57,12 @@ static void bxt_init_clock_gating(struct drm_i915_private *i915)
>  	 */
>  	intel_uncore_rmw(&i915->uncore, GEN8_UCGCTL6, 0, GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ);
>  
> -	intel_display_bxt_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void glk_init_clock_gating(struct drm_i915_private *i915)
>  {
> -	intel_display_glk_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void ilk_init_clock_gating(struct drm_i915_private *i915)
> @@ -170,7 +170,7 @@ static void cfl_init_clock_gating(struct drm_i915_private *i915)
>  	/* WAC6entrylatency:cfl */
>  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
>  
> -	intel_display_cfl_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void kbl_init_clock_gating(struct drm_i915_private *i915)
> @@ -188,7 +188,7 @@ static void kbl_init_clock_gating(struct drm_i915_private *i915)
>  		intel_uncore_rmw(&i915->uncore, GEN6_UCGCTL1,
>  				 0, GEN6_GAMUNIT_CLOCK_GATE_DISABLE);
>  
> -	intel_display_kbl_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void skl_init_clock_gating(struct drm_i915_private *i915)
> @@ -200,7 +200,7 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
>  
> -	intel_display_skl_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void bdw_init_clock_gating(struct drm_i915_private *i915)

-- 
Jani Nikula, Intel
