Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFF10A62D5
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D647610E383;
	Thu, 26 Mar 2026 13:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8+dpa2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F310E383;
 Thu, 26 Mar 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774532462; x=1806068462;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZaEqb3Luf0JEkdSMEo8dY/xCkJJU/pMOEGOWjKxFWUs=;
 b=X8+dpa2//PugH12aElwigw0H6ebcsPMDyf9z/G6SB4h65cGGimrAtaC3
 5fJS2nGROVcRlu7jPCVJi96KizW2QMnra4vYloqHkVUw8StVTevMPsTVs
 X8VAVMXJ99+qUyPr8zHM5rIGc1y6PDMnev+Sdi3hZc0MKXiJLFh5Kx42d
 xC/7XwLg902/8FsV0idZTTq/eYN8UBSjxZaqgH2oABHvmob9aDAQZxWwf
 e9SRmj1eSC4zZNbHXtt5DBXJlXF4Kl+zrLqXjTjC2YVm6ro83KWVBa1jl
 KSHlkx5lOTQ9/UBit8XY4xC5mIntce6nO2K8FwXog5cHOyxYd0asBfa8z g==;
X-CSE-ConnectionGUID: R7xAebZtSgy39AHyr8V45g==
X-CSE-MsgGUID: OnEfY+bHTOaDsZ1kPjt2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79446245"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="79446245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:41:01 -0700
X-CSE-ConnectionGUID: JW/oGE8LTE+EZB2eap6Vhw==
X-CSE-MsgGUID: KDCcXTE/QZe2v4yoKxRkdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229782014"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:40:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915/dsi: Make 'clock_stop' boolean
In-Reply-To: <20260326111814.9800-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
 <20260326111814.9800-4-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 15:40:56 +0200
Message-ID: <1558669af43583b072c8c58eff1e01960c2d9f8c@intel.com>
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
> The DSI 'clock_stop' parameter is a boolean, so use a real
> 'bool' for it. And pimp the debug print while at it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
> index 8e39d2b52c54..0023ac341aa0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -81,7 +81,7 @@ struct intel_dsi {
>  	int video_mode;
>=20=20
>  	bool eot_pkt;
> -	u8 clock_stop;
> +	bool clock_stop;
>=20=20
>  	u8 escape_clk_div;
>  	u8 dual_link;
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
> index 51f6a5b82cb2..23da7f5f9578 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -719,7 +719,7 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
>  	drm_printf(&p, "Burst mode ratio %d\n", intel_dsi->burst_mode_ratio);
>  	drm_printf(&p, "Reset timer %d\n", intel_dsi->rst_timer_val);
>  	drm_printf(&p, "EoT packet %s\n", str_enabled_disabled(intel_dsi->eot_p=
kt));
> -	drm_printf(&p, "Clockstop %s\n", str_enabled_disabled(!intel_dsi->clock=
_stop));
> +	drm_printf(&p, "Clock stop during BLLP %s\n", str_enabled_disabled(inte=
l_dsi->clock_stop));

What's with the reversed !intel_dsi->clock_stop in the existing log and
the change here?

>  	drm_printf(&p, "Mode %s\n", intel_dsi->operation_mode ? "command" : "vi=
deo");
>  	if (intel_dsi->dual_link =3D=3D DSI_DUAL_LINK_FRONT_BACK)
>  		drm_printf(&p, "Dual link: DSI_DUAL_LINK_FRONT_BACK\n");
> @@ -771,7 +771,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, =
u16 panel_id)
>  	drm_dbg_kms(display->drm, "\n");
>=20=20
>  	intel_dsi->eot_pkt =3D !mipi_config->eot_pkt_disabled;
> -	intel_dsi->clock_stop =3D mipi_config->enable_clk_stop ? 1 : 0;
> +	intel_dsi->clock_stop =3D mipi_config->enable_clk_stop;
>  	intel_dsi->lane_count =3D mipi_config->lane_cnt + 1;
>  	intel_dsi->pixel_format =3D
>  		vbt_to_dsi_pixel_format(mipi_config->videomode_color_format);

--=20
Jani Nikula, Intel
