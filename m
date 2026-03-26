Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC60010A88C6
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 15:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761FE10E382;
	Thu, 26 Mar 2026 15:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpNBR4Ir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F59B10E253;
 Thu, 26 Mar 2026 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774538438; x=1806074438;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HP7iObSQDaFEskIdMjcNl5duokJpRJigkr3f0fOeWjU=;
 b=RpNBR4IrGd3oqe7JvqIyyEhIWM/CtDniKVAKEtgDdWokG5FDm/b2nLAH
 g2ObGQPtBGbjZU9TzDTmi9wjnF6/wkcbTIQLIQAa9ECJ/4sYnp9GoHYNi
 hhAS7zsUOkEC7j2uwm56Tx99ZxxLKvta78kkgyQHzwAIQuXNpb0c64bM7
 z9TRrGtewl3EAfbBvyohVAJpLpspVdw+KyIIb2rtDVOLi/uL2yr5qYagR
 5oJ2f3+tJlVl66WTIwYcRRtwy8SLIED60tVjIBh7Xyatq3HkFtJ1NPCnH
 4vj4TfWIZP2RNujtb8vxWW5zh3KCTMKwNlABjWgiz9r05VWlSueNdGdKw w==;
X-CSE-ConnectionGUID: +w/rIkb0SsK5so+RcfWmYA==
X-CSE-MsgGUID: depGKo2PSYOsFSTRcgYGZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75483568"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75483568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:20:37 -0700
X-CSE-ConnectionGUID: O+kaIYG6QL2nsuwmLpV0bQ==
X-CSE-MsgGUID: wreXQJT9RGKuYoxdkGsVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="222116385"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.199])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:20:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/i915/dsi: Don't do DSC horizontal timing
 adjustments in command mode
In-Reply-To: <20260326111814.9800-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
 <20260326111814.9800-2-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 17:20:31 +0200
Message-ID: <18c2a71298928c8a3ee39603d1a783a13c9e62b0@intel.com>
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

On Thu, 26 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Stop adjusting the horizontal timing values based on the
> compression ratio in command mode. Bspec seems to be telling
> us to do this only in video mode, and this is also how the
> Windows driver does things.
>
> This should also fix a div-by-zero on some machines because due to
> the adjusted htotal ends up being so small that we end up with
> line_time_us=3D=3D0 when trying to determine the vtotal value in
> command mode.
>
> Note that this doesn't actually make the display on the
> Huawei Matebook E work, but at least the kernel no longer
> explodes when the driver loads.
>
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12045
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Fixes: 53693f02d80e ("drm/i915/dsi: account for DSC in horizontal timings")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index c04327979678..a763f2b13ff2 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -888,7 +888,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder=
 *encoder,
>  	 * non-compressed link speeds, and simplifies down to the ratio between
>  	 * compressed and non-compressed bpp.
>  	 */
> -	if (crtc_state->dsc.compression_enable) {
> +	if (is_vid_mode(intel_dsi) && crtc_state->dsc.compression_enable) {
>  		mul =3D fxp_q4_to_int(crtc_state->dsc.compressed_bpp_x16);
>  		div =3D mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
>  	}
> @@ -1502,7 +1502,7 @@ static void gen11_dsi_get_timings(struct intel_enco=
der *encoder,
>  	struct drm_display_mode *adjusted_mode =3D
>  					&pipe_config->hw.adjusted_mode;
>=20=20
> -	if (pipe_config->dsc.compressed_bpp_x16) {
> +	if (is_vid_mode(intel_dsi) && pipe_config->dsc.compressed_bpp_x16) {
>  		int div =3D fxp_q4_to_int(pipe_config->dsc.compressed_bpp_x16);
>  		int mul =3D mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);

--=20
Jani Nikula, Intel
