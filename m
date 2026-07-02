Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93256C43327
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 15:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9C10F47D;
	Thu,  2 Jul 2026 15:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRDovvY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198C510F479;
 Thu,  2 Jul 2026 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783006888; x=1814542888;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9Ea14lAEOGohg0ov7VbDShfDUsza34y/w/Usg3DtUm4=;
 b=SRDovvY2RwLwayQBdJb14yyhunV6vwVPxjR4Oqh8djEJ6yoQSqO72YFI
 Lo9w/EogvPFu8D9Yo93zDdk/q7a/cmye1aIA5mbKYJ3Q3a6rN8txKcyhN
 I+tTXvZ/CMsETXnIVlCKjwnmQ2bscjuoswcjmeYZ5/UlryoDoCEegsBOe
 PEXZjTncj4tQBG3pof2yGtzkAWDivkP4pBslSiZezrm+07RIwWtjdJbJs
 IUFNBjoSxREAz7kIQAoDkc5UHny0ozUVxrAjgCfJGiNCHIVZ1mA1K1Tyh
 BjdFQ+2qhS3+1GFty8OnVcPCf7MSbjcmA+UhT9bpOZS/KX68YrxsET/pH g==;
X-CSE-ConnectionGUID: FicJ1Sf4TaG91P/tZOSPRQ==
X-CSE-MsgGUID: A0IdAXKBSECgA5tn2X8eyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83814489"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="83814489"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:41:28 -0700
X-CSE-ConnectionGUID: 8Kp58UXZQoC0FzXQrBzptQ==
X-CSE-MsgGUID: EnNdNwH/ToKaEQv+xbSOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="282977504"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.43])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:41:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, suraj.kandpal@intel.com
Subject: Re: [PATCH RESEND v2] drm/i915/display: Program TRANS_VTOTAL from
 mode vtotal
In-Reply-To: <20260617045850.862100-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617045850.862100-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 02 Jul 2026 18:41:21 +0300
Message-ID: <0b7919083586f3ba26159f909f87666ea9b41045@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 17 Jun 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> w=
rote:
> There are monitors being sensitive to MSA and end up
> blanking out when we override Vtotal, DP transcoder
> uses TRANS_VTOTAL to derive MSA VTotal. Avoid overriding
> crtc_vtotal to 1 on platform which supports VRR Timing
> generator and always program VTOTAL from mode timing in
> transcoder timing paths.

Should this have had Fixes: tag? Does it require a backport?

BR,
Jani.

>
> --v2:
> - Remove write to crtc_state->hw.adjusted_mode.crtc_vtotal
> during intel_vrr_get_config. (Ankit)
> - Fix merge conflicts.
>
> Bspec: 70001
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 17 -----------------
>  drivers/gpu/drm/i915/display/intel_vrr.c     | 10 ----------
>  2 files changed, 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index e76aa6c8dab6..42eb4c5bc9b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2737,15 +2737,6 @@ void intel_set_transcoder_timings(const struct int=
el_crtc_state *crtc_state,
>  		       HSYNC_START(adjusted_mode->crtc_hsync_start - 1) |
>  		       HSYNC_END(adjusted_mode->crtc_hsync_end - 1));
>=20=20
> -	/*
> -	 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
> -	 * bits are not required. Since the support for these bits is going to
> -	 * be deprecated in upcoming platforms, avoid writing these bits for the
> -	 * platforms that do not use legacy Timing Generator.
> -	 */
> -	if (intel_vrr_always_use_vrr_tg(display))
> -		crtc_vtotal =3D 1;
> -
>  	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
>  		       VACTIVE(crtc_vdisplay - 1) |
>  		       VTOTAL(crtc_vtotal - 1));
> @@ -2834,14 +2825,6 @@ void intel_set_transcoder_timings_lrr(const struct=
 intel_crtc_state *crtc_state,
>  	intel_de_write(display, TRANS_VSYNC(display, transcoder),
>  		       VSYNC_START(adjusted_mode->crtc_vsync_start - 1) |
>  		       VSYNC_END(adjusted_mode->crtc_vsync_end - 1));
> -	/*
> -	 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtotal
> -	 * bits are not required. Since the support for these bits is going to
> -	 * be deprecated in upcoming platforms, avoid writing these bits for the
> -	 * platforms that do not use legacy Timing Generator.
> -	 */
> -	if (intel_vrr_always_use_vrr_tg(display))
> -		crtc_vtotal =3D 1;
>=20=20
>  	/*
>  	 * The double buffer latch point for TRANS_VTOTAL
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index cd380fe8fd01..5d9b11185296 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1102,16 +1102,6 @@ void intel_vrr_get_config(struct intel_crtc_state =
*crtc_state)
>  			crtc_state->vrr.vmin +=3D intel_vrr_vmin_flipline_offset(display);
>  		}
>=20=20
> -		/*
> -		 * For platforms that always use VRR Timing Generator, the VTOTAL.Vtot=
al
> -		 * bits are not filled. Since for these platforms TRAN_VMIN is always
> -		 * filled with crtc_vtotal, use TRAN_VRR_VMIN to get the vtotal for
> -		 * adjusted_mode.
> -		 */
> -		if (intel_vrr_always_use_vrr_tg(display))
> -			crtc_state->hw.adjusted_mode.crtc_vtotal =3D
> -				intel_vrr_vmin_vtotal(crtc_state);
> -
>  		if (HAS_AS_SDP(display)) {
>  			trans_vrr_vsync =3D
>  				intel_de_read(display,

--=20
Jani Nikula, Intel
