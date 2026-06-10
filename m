Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61149CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943410EB30;
	Wed, 10 Jun 2026 17:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnobPfBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B3610E6C0;
 Wed, 10 Jun 2026 17:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781113041; x=1812649041;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=p1/3EIguXP1ktVlK9rgS7likB9NQSm+vMuwItoYuoxA=;
 b=HnobPfBTQ13xaRS40N2+ooEGlsWLGHrW5tx1DI/K9LG12tJf4Ze76vQh
 Gvr431EeoBXW8cQu8Kr+CGhkt93hDpN0YCkN9Vzsea7zF3GtJ9tsI2/2e
 RBz0XC4d3dcOJDHBE9t8jTi2kGmusFga7ttKJXdFuaig5a7gxYEL2fTUd
 EUxvlgsgsY/hwr+JYnl7eIwYYxh446eLbFA9YiwrFfi20/gI7CeHqMmyV
 rYi8rW++eNaMHwpXTKeMm7P/5HzwIDOEOm601xjbODPFSjG3GZqplzWkf
 4/90wKk5FbM5L7Y9MzqodxxQuTKqO/4Ekg8z7AiA6KldZ0PJBbuhbEvc0 w==;
X-CSE-ConnectionGUID: gT+S+UuKTHWvjnhgjUYfJA==
X-CSE-MsgGUID: t0I6VC67SEeURelT49xAAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93304080"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93304080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:37:21 -0700
X-CSE-ConnectionGUID: 9nnGOvLmRo6Zt+PFhRA74g==
X-CSE-MsgGUID: kMu957HCQsGDZ8mClcQkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251153755"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:37:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/14] drm/i915/cdclk: Unify pcode related debugs
In-Reply-To: <20260610170652.5320-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-10-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:37:15 +0300
Message-ID: <b983e82eb9da75fe94be29c628325dfb6210ec08@intel.com>
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

On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The debug spew for the cdclk pcode per/post notify is very
> inconsistent between different platforms. Unify it all to
> the same form.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 65 ++++++++++++----------
>  1 file changed, 36 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 09981a112db4..542724256d0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -891,7 +891,7 @@ static void bdw_set_cdclk(struct intel_display *displ=
ay,
>  	ret =3D intel_parent_pcode_write(display, BDW_PCODE_DISPLAY_FREQ_CHANGE=
_REQ, 0x0);
>  	if (ret) {
>  		drm_err(display->drm,
> -			"failed to inform pcode about cdclk change\n");
> +			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
>  		return;
>  	}
>=20=20
> @@ -918,8 +918,11 @@ static void bdw_set_cdclk(struct intel_display *disp=
lay,
>  	if (ret)
>  		drm_err(display->drm, "Switching back to LCPLL failed\n");
>=20=20
> -	intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
> -				 cdclk_config->voltage_level);
> +	ret =3D intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
> +				       cdclk_config->voltage_level);
> +	if (ret)
> +		drm_err(display->drm,
> +			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
>=20=20
>  	intel_de_write(display, CDCLK_FREQ,
>  		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
> @@ -1181,7 +1184,7 @@ static void skl_set_cdclk(struct intel_display *dis=
play,
>  					 SKL_CDCLK_READY_FOR_CHANGE, 3);
>  	if (ret) {
>  		drm_err(display->drm,
> -			"Failed to inform PCU about cdclk change (%d)\n", ret);
> +			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
>  		return;
>  	}
>=20=20
> @@ -1221,8 +1224,11 @@ static void skl_set_cdclk(struct intel_display *di=
splay,
>  	intel_de_posting_read(display, CDCLK_CTL);
>=20=20
>  	/* inform PCU of the change */
> -	intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
> -				 cdclk_config->voltage_level);
> +	ret =3D intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
> +				       cdclk_config->voltage_level);
> +	if (ret)
> +		drm_err(display->drm,
> +			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
>=20=20
>  	intel_update_cdclk(display);
>  }
> @@ -2263,8 +2269,7 @@ static void bxt_set_cdclk(struct intel_display *dis=
play,
>=20=20
>  	if (ret) {
>  		drm_err(display->drm,
> -			"Failed to inform PCU about cdclk change (err %d, freq %d)\n",
> -			ret, cdclk);
> +			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
>  		return;
>  	}
>=20=20
> @@ -2299,8 +2304,7 @@ static void bxt_set_cdclk(struct intel_display *dis=
play,
>  						       cdclk_config->voltage_level, 2);
>  	if (ret)
>  		drm_err(display->drm,
> -			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
> -			ret, cdclk);
> +			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
>=20=20
>  	intel_update_cdclk(display);
>=20=20
> @@ -2571,14 +2575,13 @@ void intel_cdclk_dump_config(struct intel_display=
 *display,
>  		    cdclk_config->voltage_level);
>  }
>=20=20
> -static void dg2_cdclk_pcode_notify(struct intel_display *display,
> -				   u8 voltage_level,
> -				   u8 active_pipe_count,
> -				   u16 cdclk,
> -				   bool cdclk_update_valid,
> -				   bool pipe_count_update_valid)
> +static int dg2_cdclk_pcode_notify(struct intel_display *display,
> +				  u8 voltage_level,
> +				  u8 active_pipe_count,
> +				  u16 cdclk,
> +				  bool cdclk_update_valid,
> +				  bool pipe_count_update_valid)
>  {
> -	int ret;
>  	u32 update_mask =3D 0;
>=20=20
>  	update_mask =3D DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, =
voltage_level);
> @@ -2589,14 +2592,10 @@ static void dg2_cdclk_pcode_notify(struct intel_d=
isplay *display,
>  	if (pipe_count_update_valid)
>  		update_mask |=3D DISPLAY_TO_PCODE_PIPE_COUNT_VALID;
>=20=20
> -	ret =3D intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> -					 update_mask,
> -					 SKL_CDCLK_READY_FOR_CHANGE,
> -					 SKL_CDCLK_READY_FOR_CHANGE, 3);
> -	if (ret)
> -		drm_err(display->drm,
> -			"Failed to inform PCU about display config (err %d)\n",
> -			ret);
> +	return intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> +					  update_mask,
> +					  SKL_CDCLK_READY_FOR_CHANGE,
> +					  SKL_CDCLK_READY_FOR_CHANGE, 3);
>  }
>=20=20
>  static void intel_set_cdclk(struct intel_display *display,
> @@ -2674,6 +2673,7 @@ static void dg2_cdclk_pcode_pre_notify(struct intel=
_atomic_state *state)
>  		intel_atomic_get_new_cdclk_state(state);
>  	unsigned int cdclk =3D 0; u8 voltage_level, num_active_pipes =3D 0;
>  	bool change_cdclk, update_pipe_count;
> +	int ret;
>=20=20
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
>  				 &new_cdclk_state->actual) &&
> @@ -2708,8 +2708,11 @@ static void dg2_cdclk_pcode_pre_notify(struct inte=
l_atomic_state *state)
>  	if (update_pipe_count)
>  		num_active_pipes =3D dg2_power_well_count(display, new_cdclk_state);
>=20=20
> -	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> -			       change_cdclk, update_pipe_count);
> +	ret =3D dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes=
, cdclk,
> +				     change_cdclk, update_pipe_count);
> +	if (ret)
> +		drm_err(display->drm,
> +			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
>  }
>=20=20
>  static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
> @@ -2721,6 +2724,7 @@ static void dg2_cdclk_pcode_post_notify(struct inte=
l_atomic_state *state)
>  		intel_atomic_get_old_cdclk_state(state);
>  	unsigned int cdclk =3D 0; u8 voltage_level, num_active_pipes =3D 0;
>  	bool update_cdclk, update_pipe_count;
> +	int ret;
>=20=20
>  	/* According to "Sequence After Frequency Change", set voltage to used =
level */
>  	voltage_level =3D new_cdclk_state->actual.voltage_level;
> @@ -2747,8 +2751,11 @@ static void dg2_cdclk_pcode_post_notify(struct int=
el_atomic_state *state)
>  	if (update_pipe_count)
>  		num_active_pipes =3D dg2_power_well_count(display, new_cdclk_state);
>=20=20
> -	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> -			       update_cdclk, update_pipe_count);
> +	ret =3D dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes=
, cdclk,
> +				     update_cdclk, update_pipe_count);
> +	if (ret)
> +		drm_err(display->drm,
> +			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
>  }
>=20=20
>  bool intel_cdclk_is_decreasing_later(struct intel_atomic_state *state)

--=20
Jani Nikula, Intel
