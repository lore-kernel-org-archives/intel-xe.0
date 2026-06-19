Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60292CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 13:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F68610F5CE;
	Fri, 19 Jun 2026 13:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mnpeln5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278D010E065;
 Fri, 19 Jun 2026 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781875151; x=1813411151;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=NPlNAXXsXxJH+YFOo9puxSUdkfJNkAcH77S0IF+Afas=;
 b=Mnpeln5vWROSPTbN0z1R2ArDmjjt9GUe9b3Cxj8bAPc5GoMrASHvL5X+
 SpWzTslHTAHZmoJnSwFbHcd/Yl7V8JCau7DnPjMG3lh8BRxSBrO1A9n2N
 FbIccBUYPrzsMGVhN+BPsjy4D1vnd052BWxRKEKyZk+87a16H6U3bHXhm
 JZIWA5L25vUVXlQis4IvZF7V9zrysq3FjhpBhxNunfUe0gij5yD7rMy4Y
 M+n3yT71hcCOEYWvuekGD9mCT4Jg91aecd6ehx1YUiOG4EPGTw6XUgnmG
 Wu2y8AH2WoVnUIha+qBYhSARguaY+I6oNXTGPcqce5p6TQtzLeVCUy58+ A==;
X-CSE-ConnectionGUID: 19S1sbhQRbCI55bgQg6gXQ==
X-CSE-MsgGUID: OQlsXtBqTeeJJKnnRe3CEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="108267176"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="108267176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:19:10 -0700
X-CSE-ConnectionGUID: +jS6c1X9RQ2pahlNatWBMA==
X-CSE-MsgGUID: sgr3+WDkSNuUnTHWSRGK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="272695101"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:19:09 -0700
Date: Fri, 19 Jun 2026 15:19:07 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/i915/display: Switch DG2 to use DPLL framework
In-Reply-To: <20260518103642.3678448-5-mika.kahola@intel.com>
Message-ID: <59f13c29-5741-749c-072a-b9c7b111adc8@intel.com>
References: <20260518103642.3678448-1-mika.kahola@intel.com>
 <20260518103642.3678448-5-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1145897918-1781874314=:605841"
Content-ID: <4558a5d3-dc74-8e28-5d6a-f4f886435b6d@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1145897918-1781874314=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <dcb91e74-18d1-5d64-a751-9b752ea9f773@intel.com>

On Mon, 18 May 2026, Mika Kahola wrote:
> Now that DG2 has a DPLL manager and its users are prepared to obtain
> clock state through the framework, switch the platform over to use the
> shared DPLL manager.
>
> Remove specific MPLLB state verification and use .compare_hw function
> hook to compare HW and SW PLL states.
>
> Assisted-by: Copilot:claude-sonnet-4-6
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> drivers/gpu/drm/i915/display/intel_ddi.c      |  2 -
> drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 13 +++--
> .../drm/i915/display/intel_modeset_verify.c   |  1 -
> drivers/gpu/drm/i915/display/intel_snps_phy.c | 49 -------------------
> 4 files changed, 8 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index b6799ed24de4..1c4820430b68 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -5330,8 +5330,6 @@ void intel_ddi_init(struct intel_display *display,
> 		else
> 			encoder->get_config = mtl_ddi_non_tc_phy_get_config;
> 	} else if (display->platform.dg2) {
> -		encoder->enable_clock = intel_mpllb_enable;
> -		encoder->disable_clock = intel_mpllb_disable;
> 		encoder->get_config = dg2_ddi_get_config;
> 	} else if (display->platform.alderlake_s) {
> 		encoder->enable_clock = adls_ddi_enable_clock;
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index c03560532d94..6678188e3563 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -4950,7 +4950,6 @@ static bool dg2_compare_hw_state(const struct intel_dpll_hw_state *_a,
> 		a->mpllb_sscstep == b->mpllb_sscstep;
> }
>
> -__maybe_unused
> static const struct intel_dpll_mgr dg2_pll_mgr = {
> 	.dpll_info = dg2_plls,
> 	.compute_dplls = dg2_compute_dplls,
> @@ -4977,8 +4976,7 @@ void intel_dpll_init(struct intel_display *display)
> 	mutex_init(&display->dpll.lock);
>
> 	if (display->platform.dg2)
> -		/* No shared DPLLs on DG2; port PLLs are part of the PHY */
> -		dpll_mgr = NULL;
> +		dpll_mgr = &dg2_pll_mgr;
> 	else if (DISPLAY_VER(display) >= 35)
> 		dpll_mgr = &xe3plpd_pll_mgr;
> 	else if (DISPLAY_VER(display) >= 14)
> @@ -5347,8 +5345,13 @@ verify_single_dpll_state(struct intel_display *display,
>
> 	if (pll->on) {
> 		const struct intel_dpll_mgr *dpll_mgr = display->dpll.mgr;
> -
> -		if (HAS_LT_PHY(display))
> +		/*
> +		 * Avoid direct struct comparison here. Some hw state fields, such
> +		 * as DG2 MPLLB ref_control or LT PHY config[1], are written by
> +		 * firmware and may differ from the software state without indicating
> +		 * a real mismatch.
> +		 */
> +		if (HAS_LT_PHY(display) || display->platform.dg2)
> 			pll_mismatch = !dpll_mgr->compare_hw_state(&pll->state.hw_state,
> 								   &dpll_hw_state);
> 		else
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> index 2ec17c2bfe0f..f0761d8a7437 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> @@ -245,7 +245,6 @@ void intel_modeset_verify_crtc(struct intel_atomic_state *state,
> 	verify_connector_state(state, crtc);
> 	verify_crtc_state(state, crtc);
> 	intel_dpll_state_verify(state, crtc);
> -	intel_mpllb_state_verify(state, crtc);
> }
>
> void intel_modeset_verify_disabled(struct intel_atomic_state *state)
> diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> index dfb3a5c35c85..ce94ac689064 100644
> --- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> @@ -1982,52 +1982,3 @@ void intel_mpllb_readout_hw_state(struct intel_encoder *encoder,
> 	 */
> 	pll_state->mpllb_div &= ~SNPS_PHY_MPLLB_FORCE_EN;
> }
> -
> -void intel_mpllb_state_verify(struct intel_atomic_state *state,
> -			      struct intel_crtc *crtc)
> -{
> -	struct intel_display *display = to_intel_display(state);
> -	const struct intel_crtc_state *new_crtc_state =
> -		intel_atomic_get_new_crtc_state(state, crtc);
> -	struct intel_mpllb_state mpllb_hw_state = {};
> -	const struct intel_mpllb_state *mpllb_sw_state = &new_crtc_state->dpll_hw_state.mpllb;
> -	struct intel_encoder *encoder;
> -
> -	if (!display->platform.dg2)
> -		return;
> -
> -	if (!new_crtc_state->hw.active)
> -		return;
> -
> -	/* intel_get_crtc_new_encoder() only works for modeset/fastset commits */
> -	if (!intel_crtc_needs_modeset(new_crtc_state) &&
> -	    !intel_crtc_needs_fastset(new_crtc_state))
> -		return;
> -
> -	encoder = intel_get_crtc_new_encoder(state, new_crtc_state);
> -	intel_mpllb_readout_hw_state(encoder, &mpllb_hw_state);
> -
> -#define MPLLB_CHECK(__name)						\
> -	INTEL_DISPLAY_STATE_WARN(display, mpllb_sw_state->__name != mpllb_hw_state.__name, \
> -				 "[CRTC:%d:%s] mismatch in MPLLB: %s (expected 0x%08x, found 0x%08x)", \
> -				 crtc->base.base.id, crtc->base.name,	\
> -				 __stringify(__name),			\
> -				 mpllb_sw_state->__name, mpllb_hw_state.__name)
> -
> -	MPLLB_CHECK(mpllb_cp);
> -	MPLLB_CHECK(mpllb_div);
> -	MPLLB_CHECK(mpllb_div2);
> -	MPLLB_CHECK(mpllb_fracn1);
> -	MPLLB_CHECK(mpllb_fracn2);
> -	MPLLB_CHECK(mpllb_sscen);
> -	MPLLB_CHECK(mpllb_sscstep);
> -
> -	/*
> -	 * ref_control is handled by the hardware/firemware and never
> -	 * programmed by the software, but the proper values are supplied
> -	 * in the bspec for verification purposes.
> -	 */
> -	MPLLB_CHECK(ref_control);
> -
> -#undef MPLLB_CHECK
> -}
> -- 
> 2.43.0
>
>
--8323329-1145897918-1781874314=:605841--
