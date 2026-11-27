Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA8606A863
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Homz1Q3q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834110E682;
	Fri, 27 Nov 2026 14:39:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0E910E5B6;
 Fri, 27 Nov 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795790339; x=1827326339;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wuvKPpDTCnXeK8egWFKpOKh4PTgOZr+OIyAadoqEhXo=;
 b=Homz1Q3qTLLNB15eLvh8Cx62TGzmFrWfP0NrZGaz6FLeph2G5WfVCMeh
 krNekFBMrgfdemk6M64v67ES8viNOChOEcO2+OcLy/BuPp/9ilkANfdJT
 VrN3pJ3e2xVvN55XD4veYrycPzgO8OvuC+CDa7ponTGZiPmCLqAbMBHiZ
 XDPxQxdj9ruGMjyIr+DB4Tu9IirXzKXtlHJG9DE8gE888yPi8LiuPdBAD
 Gnx6KGa+GMqCd++BEiKuozdJ2QVcPm62KSyJRrTZDtQerRWoEAX4eNtsm
 n8CDybJRpFlemrNNBWEhHhF3r0qqwnEnzWNupyGSeWEx+jW0noiEQ3nuP A==;
X-CSE-ConnectionGUID: REOe1QeTSXOoEkFA4DpTxA==
X-CSE-MsgGUID: jmrswiFwQk2mEUjTkI+Uog==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4548364"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4548364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:38:59 -0800
X-CSE-ConnectionGUID: F87sPrNARt+lOhsxD5lgyQ==
X-CSE-MsgGUID: paKR4lBASzyGoHrE/Ji5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12433744"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:38:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/7] drm/i915/de: Convert intel_de_read_fw() into a vfunc
In-Reply-To: <20261126212728.9034-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-4-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 16:38:55 +0200
Message-ID: <b0f6ec11e1f79fdbcc0968b494c755c1c4b29796@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> When we eventually implement the display MMIO stuff using
> raw readl()/writel()/etc we'll need to implement the LNL
> read vs. write reordering workaround in intel_de_read_fw().
> To avoid runtime platform checks convert intel_de_read_fw()
> into a vfunc. For now everyone implements this the same way,
> and the LNL w/a is still handled in the underlying xe_mmio
> code.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 16 +++++++++++-----
>  drivers/gpu/drm/i915/display/intel_de.h |  6 +++++-
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index fe77e8769c9b..658380cb8973 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -201,11 +201,6 @@ __intel_de_write_fw(struct intel_display *display, i=
ntel_reg_t reg, u32 val)
>  	intel_uncore_write_fw(__to_uncore(display), reg, val);
>  }
>=20=20
> -u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
> -{
> -	return __intel_de_read_fw(display, reg);
> -}
> -
>  void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u=
32 val)
>  {
>  	__intel_de_write_fw(display, reg, val);
> @@ -429,6 +424,11 @@ __intel_de_write(struct intel_display *display, inte=
l_reg_t reg, u32 val,
>=20=20
>  #define I9XX_MMIO_FLAGS 0
>=20=20
> +static u32 i9xx_mmio_read_fw(struct intel_display *display, intel_reg_t =
reg)
> +{
> +	return __intel_de_read_fw(display, reg);
> +}
> +
>  static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
>  {
>  	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
> @@ -442,6 +442,7 @@ static void i9xx_mmio_write(struct intel_display *dis=
play, intel_reg_t reg, u32
>  #undef I9XX_MMIO_FLAGS
>=20=20
>  static const struct intel_mmio_funcs i9xx_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D i9xx_mmio_read,
>  	.write =3D i9xx_mmio_write,
>  };
> @@ -461,6 +462,7 @@ static void snb_mmio_write(struct intel_display *disp=
lay, intel_reg_t reg, u32 v
>  #undef SNB_MMIO_FLAGS
>=20=20
>  static const struct intel_mmio_funcs snb_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D snb_mmio_read,
>  	.write =3D snb_mmio_write,
>  };
> @@ -480,6 +482,7 @@ static void hsw_mmio_write(struct intel_display *disp=
lay, intel_reg_t reg, u32 v
>  #undef HSW_MMIO_FLAGS
>=20=20
>  static const struct intel_mmio_funcs hsw_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D hsw_mmio_read,
>  	.write =3D hsw_mmio_write,
>  	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
> @@ -487,6 +490,7 @@ static const struct intel_mmio_funcs hsw_mmio_funcs =
=3D {
>  };
>=20=20
>  static const struct intel_mmio_funcs vlv_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D hsw_mmio_read,
>  	.write =3D hsw_mmio_write,
>  	.check_for_unclaimed_mmio =3D vlv_check_for_unclaimed_mmio,
> @@ -508,6 +512,7 @@ static void tgl_mmio_write(struct intel_display *disp=
lay, intel_reg_t reg, u32 v
>  #undef TGL_MMIO_FLAGS
>=20=20
>  static const struct intel_mmio_funcs tgl_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D tgl_mmio_read,
>  	.write =3D tgl_mmio_write,
>  	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
> @@ -528,6 +533,7 @@ static void lnl_mmio_write(struct intel_display *disp=
lay, intel_reg_t reg, u32 v
>  #undef LNL_MMIO_FLAGS
>=20=20
>  static const struct intel_mmio_funcs lnl_mmio_funcs =3D {
> +	.read_fw =3D i9xx_mmio_read_fw,
>  	.read =3D lnl_mmio_read,
>  	.write =3D lnl_mmio_write,
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index c21fff7be748..10b66de460be 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -10,6 +10,7 @@
>  #include "intel_dsb.h"
>=20=20
>  struct intel_mmio_funcs {
> +	u32 (*read_fw)(struct intel_display *display, intel_reg_t reg);
>  	u32 (*read)(struct intel_display *display, intel_reg_t reg);
>  	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
>  	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
> @@ -102,7 +103,10 @@ int intel_de_wait_for_clear_ms(struct intel_display =
*display, intel_reg_t reg,
>   *
>   * These will also skip the mmio_debug unclaimed register detection.
>   */
> -u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
> +static inline u32 intel_de_read_fw(struct intel_display *display, intel_=
reg_t reg)
> +{
> +	return display->mmio.funcs->read_fw(display, reg);
> +}
>  void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u=
32 val);
>=20=20
>  static inline u32

--=20
Jani Nikula, Intel
