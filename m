Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29FD6078840
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S5h22PUD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9466410EEBB;
	Mon, 19 Oct 2026 15:49:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2165F10EEC2;
 Mon, 19 Oct 2026 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424972; x=1823960972;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zoR+3VUv9YInVb55GPXedqoRS09GDNW1wEBb82dJR/Q=;
 b=S5h22PUDmfO3oog1jJSTntm/Uy2cSclUXgzMecQxyxK38xree7q0hws6
 85nSQ5iw36HFGoZK1Joc7U95C43Mf+BXSmlmYCA5kLDK2SPIHMHBEDKxE
 nUbpyniexqLasFeSPZuhaSAHmK1ojMJi0Px/Hd6fvWSjIZImMRjbtM+x8
 0TW157ndAS9MIYdx1M+cHZ2b0W6peS3o5caWcCyYMfshGgnGg1CmoC3/v
 F9FINhauO5nQJTIt5SZ1yylJa8bM2z2JQDkmQK1dnl+4MIfBc+3feSzb7
 0NAJY0xQXZklTRaKiXXAxNruzkx1pUlZZ18SSsqB06hhB244vmRVXLgcd w==;
X-CSE-ConnectionGUID: 9Bqb81VjT7+Hl1iCv46g2w==
X-CSE-MsgGUID: uFWEenBpTiy3Pxg/7zkr9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1005217"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1005217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:49:32 -0700
X-CSE-ConnectionGUID: xXfx8MqAS/CmZHb+22albQ==
X-CSE-MsgGUID: j8ECRXfdSDKVNmBRyBY1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="3035563"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:49:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/15] drm/i915/pfit: Stop using HAS_PCH_SPLIT() in
 confusing places
In-Reply-To: <20261019135309.23578-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-4-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 18:49:27 +0300
Message-ID: <c1a018201ff52ce215d1ec0d9d50463b98820325@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Stop using HAS_PCH_SPLIT() in places that have nothing to
> do with PCH. !HAS_GMCH is a more sensible thing top check for.

*to

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_wm.c               | 2 +-
>  drivers/gpu/drm/i915/display/intel_display.c         | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i91=
5/display/i9xx_wm.c
> index 86d1c9f7f0ff..0233f5053d95 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_wm.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
> @@ -4150,7 +4150,7 @@ static const struct intel_wm_funcs nop_funcs =3D {
>  void i9xx_wm_init(struct intel_display *display)
>  {
>  	/* For FIFO watermark updates */
> -	if (HAS_PCH_SPLIT(display)) {
> +	if (!HAS_GMCH(display)) {
>  		ilk_setup_wm_latency(display);
>  		display->wm.funcs =3D &ilk_wm_funcs;
>  	} else if (display->platform.valleyview || display->platform.cherryview=
) {
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 723dec35402a..d1440cc6dba4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6777,7 +6777,7 @@ static void intel_pipe_fastset(const struct intel_c=
rtc_state *old_crtc_state,
>  	if (DISPLAY_VER(display) >=3D 9) {
>  		if (new_crtc_state->pfit.enabled)
>  			skl_pfit_enable(new_crtc_state);
> -	} else if (HAS_PCH_SPLIT(display)) {
> +	} else if (!HAS_GMCH(display)) {
>  		if (new_crtc_state->pfit.enabled)
>  			ilk_pfit_enable(new_crtc_state);
>  		else if (old_crtc_state->pfit.enabled)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drive=
rs/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..dba34f034785 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -96,7 +96,7 @@ static int i915_sr_status(struct seq_file *m, void *unu=
sed)
>=20=20
>  	if (DISPLAY_VER(display) >=3D 9)
>  		/* no global SR status; inspect per-plane WM */;
> -	else if (HAS_PCH_SPLIT(display))
> +	else if (!HAS_GMCH(display))
>  		sr_enabled =3D intel_de_read(display, WM1_LP_ILK) & WM_LP_ENABLE;
>  	else if (display->platform.i965gm || display->platform.g4x ||
>  		 display->platform.i945g || display->platform.i945gm)

--=20
Jani Nikula, Intel
