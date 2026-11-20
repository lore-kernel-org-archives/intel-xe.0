Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFD60A261B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ey9pIuUu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51584112B79;
	Fri, 20 Nov 2026 14:59:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CD112B77;
 Fri, 20 Nov 2026 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795186784; x=1826722784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Mc3TQKAkEPj8M41125eC6jV4jm6ka5QqlciR82U0d0A=;
 b=ey9pIuUucVkgPOU0wNjSWvAEDnE0/fGDcjfxHB/oBeZppXn5mRpTIKMg
 U2/xAFrm/giqvQvWIGwuM+quDxkmRIVBSz5D93qx/t0rXhYuIyS2hLGrA
 l7UVsc/o197Gt7Y0RffZDs1y5HeMBwo5n5HT12XFCVhUqrREcTR3r40NM
 jgQbVoxF8kQI88p0k8MRqnKPD4sAYjBkKBfAZ+LeBBOHta1J6TFj3gWY1
 0D/Gxs4dMPOG+lum6liDMtXWtgqHly98NO7fpF8MS1csKlk8JqarYeABz
 PmaPnd36pTv1ZirUohOi8/YCgkMx42Pr1/lx04LMecL1vAOkj6cTHe+Qr A==;
X-CSE-ConnectionGUID: lHj3C+DtSZyiiIH1TaPQJg==
X-CSE-MsgGUID: IDHZ+vhoQ76x0C9gVdIjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3957346"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3957346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:59:43 -0800
X-CSE-ConnectionGUID: CePIaZ/8QtGCDW4RJeYaGQ==
X-CSE-MsgGUID: 2EjZiOmxRKavxvyIeF5VfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10611337"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:59:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Animesh Manna
 <animesh.manna@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/alpm: Track the configured transcoder lifetime
In-Reply-To: <20261120112446.1562267-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261120112446.1562267-1-jouni.hogander@intel.com>
Date: Fri, 20 Nov 2026 16:59:38 +0200
Message-ID: <df6089c2500a2f5d3b79bcaa2ac6a440222f7f4e@intel.com>
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

On Fri, 20 Nov 2026, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> ALPM disable can access a stale transcoder when ALPM was not configured
> for the current modeset, causing unclaimed register accesses during
> pipe teardown.
>
> Record the transcoder only when programming ALPM and invalidate it
> after disable. Check it under the ALPM lock to avoid register accesses
> on repeated or unconfigured disables.
>
> Fixes: 504766382edb ("drm/i915/lobf: Disintegrate alpm_disable from psr_d=
isable")
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index f54b29e193ee9..105006ca6be7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -46,6 +46,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel=
_dp,
>  void intel_alpm_init(struct intel_dp *intel_dp)
>  {
>  	mutex_init(&intel_dp->alpm.lock);
> +	intel_dp->alpm.transcoder =3D INVALID_TRANSCODER;
>  }
>=20=20
>  static int get_silence_period_symbols(const struct intel_crtc_state *crt=
c_state)
> @@ -549,6 +550,7 @@ static void lnl_alpm_configure(struct intel_dp *intel=
_dp,
>  	alpm_ctl |=3D ALPM_CTL_ALPM_ENTRY_CHECK(crtc_state->alpm_state.check_en=
try_lines);
>=20=20
>  	intel_de_write(display, ALPM_CTL(display, cpu_transcoder), alpm_ctl);
> +	intel_dp->alpm.transcoder =3D cpu_transcoder;
>  	mutex_unlock(&intel_dp->alpm.lock);
>  }
>=20=20
> @@ -556,7 +558,6 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
>  			  const struct intel_crtc_state *crtc_state)
>  {
>  	lnl_alpm_configure(intel_dp, crtc_state);
> -	intel_dp->alpm.transcoder =3D crtc_state->cpu_transcoder;
>  }
>=20=20
>  void intel_alpm_port_configure(struct intel_dp *intel_dp,
> @@ -733,17 +734,23 @@ void intel_alpm_lobf_debugfs_add(struct intel_conne=
ctor *connector)
>  void intel_alpm_disable(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> -	enum transcoder cpu_transcoder =3D intel_dp->alpm.transcoder;
> +	enum transcoder cpu_transcoder;
>=20=20
>  	if (DISPLAY_VER(display) < 20 || !intel_dp->alpm_dpcd)
>  		return;
>=20=20
>  	mutex_lock(&intel_dp->alpm.lock);
>=20=20
> +	cpu_transcoder =3D intel_dp->alpm.transcoder;
> +	if (cpu_transcoder =3D=3D INVALID_TRANSCODER)
> +		goto unlock;
> +
>  	intel_de_rmw(display, ALPM_CTL(display, cpu_transcoder),
>  		     ALPM_CTL_ALPM_ENABLE | ALPM_CTL_LOBF_ENABLE, 0);
> +	intel_dp->alpm.transcoder =3D INVALID_TRANSCODER;
>=20=20
>  	drm_dbg_kms(display->drm, "Disabling ALPM\n");
> +unlock:
>  	mutex_unlock(&intel_dp->alpm.lock);
>  }

--=20
Jani Nikula, Intel
