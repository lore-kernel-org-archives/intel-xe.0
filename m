Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF54CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1AE10EB23;
	Wed, 10 Jun 2026 17:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMjrG234";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D81410E6BB;
 Wed, 10 Jun 2026 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781112889; x=1812648889;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=auhw9EI7oQ6rZPhyf1GfeejMBPwGwywnR/8nYEmpe4s=;
 b=GMjrG234MeGE3ZTxdXqQPiwUESIjKKVsCtcH2kvlAeIQ3S3g88f1J5vQ
 kSkGo//f+kXOiWj3io0m+2qMCUiloXvvz9TFgXKwNMAd4vS4lODIGEdTc
 naiselEqVk7ofKL2Wd6cB4SVlWyZjyIhedhV0stHvZKoChMr1iYfRY24I
 1hAPYNi/dLNgZVdDNU3W+5FU/2DY3Z/7T5lVL1P9+KMQ9oO7olBIyFMAj
 wqXFFy89YKKIwOANI3Yn8uI7aRJus2txJ/KcE8fY8P/J/iiX7TfEzoHM2
 6dkwA+5tuJz9bzXPTbgYFxMNkH9BFjYsmkwsog/ykzjBaMw5szy4RO6O3 A==;
X-CSE-ConnectionGUID: rapsEzoFSO+pPzyDpls6zw==
X-CSE-MsgGUID: d6F0TZT3TCSy9yW/oa/POQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81958883"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81958883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:34:49 -0700
X-CSE-ConnectionGUID: 3kDIXqIQSiedJfOZSLOaxg==
X-CSE-MsgGUID: tRNwtB40T4KQWt5hIb0k/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="276424493"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:34:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/14] drm/i915/dg2: s/intel_/dg2_/ for DG2 specific stuff
In-Reply-To: <20260610170652.5320-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-8-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:34:44 +0300
Message-ID: <28164f6d514abe35703c361ad953ad061d039b2f@intel.com>
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
> intel_pcode_*notify() are all DG2 specific code. Rename them
> to have a dg2_ namespace.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 31 ++++++++++------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index bbf3603f889b..659c1c0e3432 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2575,19 +2575,16 @@ void intel_cdclk_dump_config(struct intel_display=
 *display,
>  		    cdclk_config->voltage_level);
>  }
>=20=20
> -static void intel_pcode_notify(struct intel_display *display,
> -			       u8 voltage_level,
> -			       u8 active_pipe_count,
> -			       u16 cdclk,
> -			       bool cdclk_update_valid,
> -			       bool pipe_count_update_valid)
> +static void dg2_cdclk_pcode_notify(struct intel_display *display,
> +				   u8 voltage_level,
> +				   u8 active_pipe_count,
> +				   u16 cdclk,
> +				   bool cdclk_update_valid,
> +				   bool pipe_count_update_valid)
>  {
>  	int ret;
>  	u32 update_mask =3D 0;
>=20=20
> -	if (!display->platform.dg2)
> -		return;
> -
>  	update_mask =3D DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, =
voltage_level);
>=20=20
>  	if (cdclk_update_valid)
> @@ -2672,7 +2669,7 @@ static bool dg2_power_well_count(struct intel_displ=
ay *display,
>  	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
>  }
>=20=20
> -static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *stat=
e)
> +static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
>  {
>  	struct intel_display *display =3D to_intel_display(state);
>  	const struct intel_cdclk_state *old_cdclk_state =3D
> @@ -2715,11 +2712,11 @@ static void intel_cdclk_pcode_pre_notify(struct i=
ntel_atomic_state *state)
>  	if (update_pipe_count)
>  		num_active_pipes =3D dg2_power_well_count(display, new_cdclk_state);
>=20=20
> -	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> -			   change_cdclk, update_pipe_count);
> +	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> +			       change_cdclk, update_pipe_count);
>  }
>=20=20
> -static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *sta=
te)
> +static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
>  {
>  	struct intel_display *display =3D to_intel_display(state);
>  	const struct intel_cdclk_state *new_cdclk_state =3D
> @@ -2754,8 +2751,8 @@ static void intel_cdclk_pcode_post_notify(struct in=
tel_atomic_state *state)
>  	if (update_pipe_count)
>  		num_active_pipes =3D dg2_power_well_count(display, new_cdclk_state);
>=20=20
> -	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> -			   update_cdclk, update_pipe_count);
> +	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
> +			       update_cdclk, update_pipe_count);
>  }
>=20=20
>  bool intel_cdclk_is_decreasing_later(struct intel_atomic_state *state)
> @@ -2821,7 +2818,7 @@ intel_set_cdclk_pre_plane_update(struct intel_atomi=
c_state *state)
>  	drm_WARN_ON(display->drm, !new_cdclk_state->base.changed);
>=20=20
>  	if (display->platform.dg2)
> -		intel_cdclk_pcode_pre_notify(state);
> +		dg2_cdclk_pcode_pre_notify(state);
>=20=20
>  	intel_set_cdclk(display, &cdclk_config, pipe,
>  			"Pre changing CDCLK to");
> @@ -2865,7 +2862,7 @@ intel_set_cdclk_post_plane_update(struct intel_atom=
ic_state *state)
>  			"Post changing CDCLK to");
>=20=20
>  	if (display->platform.dg2)
> -		intel_cdclk_pcode_post_notify(state);
> +		dg2_cdclk_pcode_post_notify(state);
>  }
>=20=20
>  /* pixels per CDCLK */

--=20
Jani Nikula, Intel
