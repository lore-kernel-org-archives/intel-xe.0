Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36BAC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 07:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2EE10EEBF;
	Thu, 27 Aug 2026 07:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkrYdFt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2B010EEBC;
 Thu, 27 Aug 2026 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787815675; x=1819351675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KsjkuVN5NRG/ODVl6nMOgxGgndxzA5aN3/T2SpWo2ho=;
 b=YkrYdFt1K3jaQwF7+5DFVhY3FYAmvttwpaXlnlSkK1j2xdgD2s6EC8I1
 KF+BU3JHwZg9jUsoZ9N/iSH/kyV+VsoQx59HQl5YaDh64kHt9d8ez/DEd
 FIzDcggjWDgykRQYGHdBRdhCDGGeOSxBgctKGRuvU/SRgVNln4GYwLzhJ
 m671g6sg5XD0b1TCy123o95IEQ/jE9acPEO+WdT/BzMTTyIazgn8KEgXI
 fNAcsV8Mf32LhbacrNlAmPoZxsCi/KZX/1/Jn35LzVtPJ3m7pOVl7SQnd
 JOHMFNZ7kTclq/ekdEVe/zboOiRiJ28c2EvFyMCIhtuUIn4k8moLeYsIS w==;
X-CSE-ConnectionGUID: SVwXhbbmTxiYyS5QpkRcWg==
X-CSE-MsgGUID: 9h5RWAkiQvSn/rdKEngKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92169047"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92169047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:27:55 -0700
X-CSE-ConnectionGUID: LYwIcS13QkCtbRa4Wh5Vmg==
X-CSE-MsgGUID: lWkY4dR9RKCqZtCTv6VWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="292636967"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:27:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] drm/i915/display: consolidate remaining clock
 gating initialization
In-Reply-To: <20260817092911.342072-3-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <20260817092911.342072-3-luciano.coelho@intel.com>
Date: Thu, 27 Aug 2026 10:27:51 +0300
Message-ID: <1a4317911980cdd6017b906337f16df11ce35fe9@intel.com>
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
> The remaining platform-specific display clock gating functions are
> still called directly by i915.
>
> Extend intel_display_init_clock_gating() so that it calls the correct
> functions for the remaining platforms.
>
> This groups Broadwell's three display operations into a single
> function.  This changes the call order slighlty in relation to

*slightly

> non-display workarounds, but it shouldn't be a problem.  For IVB, we
> move the trickle-feed programming to the display helper and runs with
> the other display register setup.

In general, I'd prefer not mixing the refactoring and the functional
changes, e.g. the reordering could've come first as a tiny functional
change, and the rest could be just movement.

But it's benign.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  .../i915/display/intel_display_clock_gating.c | 43 ++++++++++++++-----
>  .../i915/display/intel_display_clock_gating.h | 10 -----
>  drivers/gpu/drm/i915/intel_clock_gating.c     | 20 +++------
>  3 files changed, 40 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> index d5ecdaeab421..ef1ee72494df 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> @@ -134,13 +134,13 @@ static void intel_display_glk_init_clock_gating(struct intel_display *display)
>  		       PWM1_GATING_DIS | PWM2_GATING_DIS);
>  }
>  
> -void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display)
> +static void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display)
>  {
>  	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
>  	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
>  }
>  
> -void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
> +static void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
>  {
>  	enum pipe pipe;
>  
> @@ -154,14 +154,21 @@ void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
>  	}
>  }
>  
> -void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display)
> +static void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display)
>  {
>  	/* WaKVMNotificationOnConfigChange:bdw */
>  	intel_de_rmw(display, CHICKEN_PAR2_1, 0,
>  		     KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
>  }
>  
> -void intel_display_hsw_init_clock_gating(struct intel_display *display)
> +static void intel_display_bdw_init_clock_gating(struct intel_display *display)
> +{
> +	intel_display_bdw_clock_gating_disable_fbcq(display);
> +	intel_display_bdw_clock_gating_vblank_in_srd(display);
> +	intel_display_bdw_clock_gating_kvm_notif(display);
> +}
> +
> +static void intel_display_hsw_init_clock_gating(struct intel_display *display)
>  {
>  	enum pipe pipe;
>  
> @@ -178,7 +185,7 @@ void intel_display_hsw_init_clock_gating(struct intel_display *display)
>  	}
>  }
>  
> -void intel_display_disable_trickle_feed(struct intel_display *display)
> +static void intel_display_disable_trickle_feed(struct intel_display *display)
>  {
>  	enum pipe pipe;
>  
> @@ -191,7 +198,7 @@ void intel_display_disable_trickle_feed(struct intel_display *display)
>  	}
>  }
>  
> -void intel_display_ilk_init_clock_gating(struct intel_display *display)
> +static void intel_display_ilk_init_clock_gating(struct intel_display *display)
>  {
>  	u32 dspclk_gate = ILK_VRHUNIT_CLOCK_GATE_DISABLE;
>  
> @@ -223,7 +230,7 @@ void intel_display_ilk_init_clock_gating(struct intel_display *display)
>  	intel_display_disable_trickle_feed(display);
>  }
>  
> -void intel_display_gen6_init_clock_gating(struct intel_display *display)
> +static void intel_display_gen6_init_clock_gating(struct intel_display *display)
>  {
>  	u32 dspclk_gate = ILK_VRHUNIT_CLOCK_GATE_DISABLE;
>  
> @@ -244,13 +251,15 @@ void intel_display_gen6_init_clock_gating(struct intel_display *display)
>  	intel_display_disable_trickle_feed(display);
>  }
>  
> -void intel_display_ivb_init_clock_gating(struct intel_display *display)
> +static void intel_display_ivb_init_clock_gating(struct intel_display *display)
>  {
>  	intel_de_write(display, ILK_DSPCLK_GATE_D, ILK_VRHUNIT_CLOCK_GATE_DISABLE);
>  	intel_de_rmw(display, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
> +
> +	intel_display_disable_trickle_feed(display);
>  }
>  
> -void intel_display_g4x_init_clock_gating(struct intel_display *display)
> +static void intel_display_g4x_init_clock_gating(struct intel_display *display)
>  {
>  	u32 dspclk_gate = VRHUNIT_CLOCK_GATE_DISABLE |
>  			  OVRUNIT_CLOCK_GATE_DISABLE |
> @@ -264,7 +273,7 @@ void intel_display_g4x_init_clock_gating(struct intel_display *display)
>  	intel_display_disable_trickle_feed(display);
>  }
>  
> -void intel_display_i965gm_init_clock_gating(struct intel_display *display)
> +static void intel_display_i965gm_init_clock_gating(struct intel_display *display)
>  {
>  	intel_de_write(display, DSPCLK_GATE_D, 0);
>  }
> @@ -281,4 +290,18 @@ void intel_display_init_clock_gating(struct intel_display *display)
>  		intel_display_bxt_init_clock_gating(display);
>  	else if (display->platform.geminilake)
>  		intel_display_glk_init_clock_gating(display);
> +	else if (display->platform.broadwell)
> +		intel_display_bdw_init_clock_gating(display);
> +	else if (display->platform.haswell)
> +		intel_display_hsw_init_clock_gating(display);
> +	else if (display->platform.ivybridge)
> +		intel_display_ivb_init_clock_gating(display);
> +	else if (display->platform.sandybridge)
> +		intel_display_gen6_init_clock_gating(display);
> +	else if (display->platform.ironlake)
> +		intel_display_ilk_init_clock_gating(display);
> +	else if (display->platform.g4x)
> +		intel_display_g4x_init_clock_gating(display);
> +	else if (display->platform.i965gm)
> +		intel_display_i965gm_init_clock_gating(display);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> index 4e50e388656a..dbfa5892cffe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> @@ -9,15 +9,5 @@
>  struct intel_display;
>  
>  void intel_display_init_clock_gating(struct intel_display *display);
> -void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display);
> -void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display);
> -void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display);
> -void intel_display_hsw_init_clock_gating(struct intel_display *display);
> -void intel_display_disable_trickle_feed(struct intel_display *display);
> -void intel_display_ilk_init_clock_gating(struct intel_display *display);
> -void intel_display_gen6_init_clock_gating(struct intel_display *display);
> -void intel_display_ivb_init_clock_gating(struct intel_display *display);
> -void intel_display_g4x_init_clock_gating(struct intel_display *display);
> -void intel_display_i965gm_init_clock_gating(struct intel_display *display);
>  
>  #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
> index 84f838c660fd..c5c4441f3a61 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -73,7 +73,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
>  	intel_uncore_write(&i915->uncore, PCH_3DCGDIS1,
>  			   VFMUNIT_CLOCK_GATE_DISABLE);
>  
> -	intel_display_ilk_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  	intel_pch_init_clock_gating(i915->display);
>  }
>  
> @@ -90,7 +90,7 @@ static void gen6_check_mch_setup(struct drm_i915_private *i915)
>  
>  static void gen6_init_clock_gating(struct drm_i915_private *i915)
>  {
> -	intel_display_gen6_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  
>  	intel_uncore_write(&i915->uncore, GEN6_UCGCTL1,
>  			   intel_uncore_read(&i915->uncore, GEN6_UCGCTL1) |
> @@ -205,13 +205,11 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
>  
>  static void bdw_init_clock_gating(struct drm_i915_private *i915)
>  {
> -	intel_display_bdw_clock_gating_disable_fbcq(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  
>  	/* WaSwitchSolVfFArbitrationPriority:bdw */
>  	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
>  
> -	intel_display_bdw_clock_gating_vblank_in_srd(i915->display);
> -
>  	/* WaVSRefCountFullforceMissDisable:bdw */
>  	/* WaDSRefCountFullforceMissDisable:bdw */
>  	intel_uncore_rmw(&i915->uncore, GEN7_FF_THREAD_MODE,
> @@ -226,8 +224,6 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
>  	/* WaProgramL3SqcReg1Default:bdw */
>  	gen8_set_l3sqc_credits(i915, 30, 2);
>  
> -	intel_display_bdw_clock_gating_kvm_notif(i915->display);
> -
>  	intel_pch_init_clock_gating(i915->display);
>  
>  	/* WaDisableDopClockGating:bdw
> @@ -240,7 +236,7 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
>  
>  static void hsw_init_clock_gating(struct drm_i915_private *i915)
>  {
> -	intel_display_hsw_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  
>  	/* This is required by WaCatErrorRejectionIssue:hsw */
>  	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
> @@ -256,7 +252,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
>  {
>  	struct intel_display *display = i915->display;
>  
> -	intel_display_ivb_init_clock_gating(display);
> +	intel_display_init_clock_gating(display);
>  
>  	/* WaDisableBackToBackFlipFix:ivb */
>  	intel_uncore_write(&i915->uncore, IVB_CHICKEN3,
> @@ -285,8 +281,6 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
>  	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
>  			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
>  
> -	intel_display_disable_trickle_feed(display);
> -
>  	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
>  			 GEN6_MBC_SNPCR_MED);
>  
> @@ -362,7 +356,7 @@ static void g4x_init_clock_gating(struct drm_i915_private *i915)
>  			   GS_UNIT_CLOCK_GATE_DISABLE |
>  			   CL_UNIT_CLOCK_GATE_DISABLE);
>  	intel_uncore_write(&i915->uncore, RAMCLK_GATE_D, 0);
> -	intel_display_g4x_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  }
>  
>  static void i965gm_init_clock_gating(struct drm_i915_private *i915)
> @@ -371,7 +365,7 @@ static void i965gm_init_clock_gating(struct drm_i915_private *i915)
>  
>  	intel_uncore_write(uncore, RENCLK_GATE_D1, I965_RCC_CLOCK_GATE_DISABLE);
>  	intel_uncore_write(uncore, RENCLK_GATE_D2, 0);
> -	intel_display_i965gm_init_clock_gating(i915->display);
> +	intel_display_init_clock_gating(i915->display);
>  	intel_uncore_write(uncore, RAMCLK_GATE_D, 0);
>  	intel_uncore_write16(uncore, DEUC, 0);
>  	intel_uncore_write(uncore,

-- 
Jani Nikula, Intel
