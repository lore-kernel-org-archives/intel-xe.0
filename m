Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D36C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 07:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E805510E7F3;
	Tue, 28 Jul 2026 07:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+6zhRNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739C10E7F0;
 Tue, 28 Jul 2026 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785224529; x=1816760529;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=m3gLxBWSZ0Y7PMoWtj9QzCZoJvTaivBLQZeTj7jC6D8=;
 b=U+6zhRNra3FoEbY1+Vj9mXbc6GzXqagIsLdCr7wZZLw6ZcjRWHS0R3Uo
 ZHC2w1JRZBgyAi3JcIHXIGcJpPB37xrbqyhNb1AAwTKD5PdKpcdAlYX5R
 jAQ8u/bX6XROSOqiasPuQ3Hwal6v6GubDbIxkvXqm3VovOj/wtc6Ht1pO
 1dNC4kZhmPeNIwaro3BIEssNFVZwRBGVmyOchHc/nRrs71sPsjUSkCgXZ
 ls8bMQUsNoIL9AS5jHyo3MThPVHIsI4qp0glWrA0t572M6J6ck5AvaYWq
 1KkILp3lsG1mVbTq1t7N3AxHSDgu4a6i7wy2P82ZJP9YAjA/R1Y5ZIMJG Q==;
X-CSE-ConnectionGUID: Cfd+cH48RbyBfHVCgLK1fw==
X-CSE-MsgGUID: xC1pJhW4Tp29DSWdkMn+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96157188"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96157188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:42:08 -0700
X-CSE-ConnectionGUID: DARnW5noS5OAHaVg7Ps4UA==
X-CSE-MsgGUID: WFhjdRb5T2q72tTzb8czng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="264623669"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 00:42:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>, Chaitanya
 Borah Kumar <chaitanya.borah.kumar@intel.com>
Subject: Re: [PATCH v1 2/2] drm/i915/xe2lpd+: disable 3D LUT if unsupported
In-Reply-To: <20260727222125.2459634-3-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260727222125.2459634-1-michal.grzelak@intel.com>
 <20260727222125.2459634-3-michal.grzelak@intel.com>
Date: Tue, 28 Jul 2026 10:42:04 +0300
Message-ID: <b85aa98ca27e9a63218570fa1aa928c7a90110e2@intel.com>
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

On Tue, 28 Jul 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> XE2LPD_DE_CAP_3DLUT_MASK is defined but never used. Check with it if
> 3DLUT is enabled.
>
> Check DE_CAP register if 3D LUT is disabled. Store the info in a new
> field of struct intel_display_runtime_info.
>
> Add macros for checking both 3D LUT hardware and 3D LUT capability.

What's the difference?

> Initialize has_3dlut to 1 on each platform since LNL.
>
> Log value of has_3dlut in intel_display_device_info_print().
>
> Bspec: 71161
> Cc: Chaitanya Borah Kumar <chaitanya.borah.kumar@intel.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c          | 3 +++
>  drivers/gpu/drm/i915/display/intel_display_device.c | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display_device.h | 4 ++++
>  drivers/gpu/drm/i915/display/intel_display_regs.h   | 1 +
>  4 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index 87ced9f6ff40..ffdefb51a264 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4258,6 +4258,9 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>  bool
>  intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
>  {
> +	if (!HAS_3DLUT(display))
> +		return false;
> +
>  	if (DISPLAY_VER(display) >=3D 12)
>  		return pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B;
>  	else
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index f17fc2c68472..45c791531f85 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1335,6 +1335,7 @@ static const struct platform_desc dg2_desc =3D {
>  		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
>  		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),				\
>  	.__runtime_defaults.fbc_mask =3D BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B),	\
> +	.__runtime_defaults.has_3dlut =3D 1,					\
>  	.__runtime_defaults.has_dmc =3D 1,					\
>  	.__runtime_defaults.has_dsc =3D 1,					\
>  	.__runtime_defaults.has_hdcp =3D 1,					\
> @@ -1345,6 +1346,7 @@ static const struct platform_desc dg2_desc =3D {
>=20=20
>  static const struct intel_display_device_info xe_lpdp_display =3D {
>  	XE_LPDP_FEATURES,
> +	.__runtime_defaults.has_3dlut =3D 0,

There's no need to initialize to 0.

>  };
>=20=20
>  static const struct intel_display_device_info xe2_lpd_display =3D {
> @@ -1385,6 +1387,7 @@ static const struct intel_display_device_info xe2_h=
pd_display =3D {
>  	XE_LPDP_FEATURES,
>  	.__runtime_defaults.port_mask =3D BIT(PORT_A) |
>  		BIT(PORT_TC1) | BIT(PORT_TC2) | BIT(PORT_TC3) | BIT(PORT_TC4),
> +	.__runtime_defaults.has_3dlut =3D 0,

Ditto.

>  };
>=20=20
>  static const u16 mtl_u_ids[] =3D {
> @@ -1935,6 +1938,10 @@ static void __intel_display_device_info_runtime_in=
it(struct intel_display *displ
>  	if (DISPLAY_VER(display) >=3D 20) {
>  		u32 cap =3D intel_de_read(display, XE2LPD_DE_CAP);
>=20=20
> +		if (REG_FIELD_GET(XE2LPD_DE_CAP_3DLUT_MASK, cap) =3D=3D
> +		    XE2LPD_DE_CAP_3DLUT_REMOVED)
> +			display_runtime->has_3dlut =3D 0;
> +
>  		if (REG_FIELD_GET(XE2LPD_DE_CAP_DSC_MASK, cap) =3D=3D
>  		    XE2LPD_DE_CAP_DSC_REMOVED)
>  			display_runtime->has_dsc =3D 0;
> @@ -1996,6 +2003,7 @@ void intel_display_device_info_print(const struct i=
ntel_display_device_info *inf
>  	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
>  #undef PRINT_FLAG
>=20=20
> +	drm_printf(p, "has_3dlut: %s\n", str_yes_no(runtime->has_3dlut));
>  	drm_printf(p, "has_hdcp: %s\n", str_yes_no(runtime->has_hdcp));
>  	drm_printf(p, "has_dmc: %s\n", str_yes_no(runtime->has_dmc));
>  	drm_printf(p, "has_dsc: %s\n", str_yes_no(runtime->has_dsc));
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> index 7121e7cd9512..34ee7993be33 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -147,6 +147,9 @@ struct intel_display_platforms {
>=20=20
>  #define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(=
__display)->platform.i915gm)
>  #define HAS_2PPC(__display)		(DISPLAY_VER(__display) >=3D 10)
> +#define HAS_3DLUT_HW(__display)		(DISPLAY_VER(__display) >=3D 10)
> +#define HAS_3DLUT_CAP(__display)	(IS_DISPLAY_VER(__display, 10, 20) || D=
ISPLAY_RUNTIME_INFO(__display)->has_3dlut)

I don't understand the difference between "HW" and "CAP" or the need for
both.

It's generally better to either use the runtime info flag or the display
version check, not both.

> +#define HAS_3DLUT(__display)		(HAS_3DLUT_HW(__display) && HAS_3DLUT_CAP(=
__display))
>  #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(=
__display) >=3D 14)
>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >=3D 5)
>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >=3D 13)
> @@ -304,6 +307,7 @@ struct intel_display_runtime_info {
>=20=20
>  	u8 fbc_mask;
>=20=20
> +	bool has_3dlut;
>  	bool has_hdcp;
>  	bool has_dmc;
>  	bool has_dsc;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index 0677ca2dde00..7b2332e2fae2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1773,6 +1773,7 @@
>=20=20
>  #define XE2LPD_DE_CAP			_MMIO(0x41100)
>  #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
> +#define   XE2LPD_DE_CAP_3DLUT_REMOVED	1
>  #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
>  #define   XE2LPD_DE_CAP_DSC_REMOVED	1
>  #define   XE2LPD_DE_CAP_SCALER_MASK	REG_GENMASK(27, 26)

--=20
Jani Nikula, Intel
