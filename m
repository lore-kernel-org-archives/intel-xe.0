Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A965CD8CB9
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEBD10ED16;
	Thu, 11 Jun 2026 07:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdUSLnbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FEB10ED12;
 Thu, 11 Jun 2026 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781162589; x=1812698589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aOOC6jxz3YWHIrcQ93NdlVgLbP0lok3VYw/wv6N1wUo=;
 b=VdUSLnbljQ9+tgDtciZKYKa7s9n+hrowMl3Wqk7/tF+wNmw2VZMfTLYr
 R6olCAXT9uCll1nTrIPY/4MA7XQPyzfAXp9Un3464e6sDQa2QqXXQFCh4
 GaPUFOtf9PKchbDgWyMLuJY1j2obo7g2LXzEfCP7FIWfGVTzZv0ah/qQq
 hEp0NDjKF7GKb9qC4UqRJiefKpeqUpQTw6Gc8nNLaNg2l1e/WlnCjgITy
 yV0XgmjQmQ5iNlf9hbT0Pq1DzOqqODfyYJJjeX+AVu52UHwkZRYpIi/ru
 8u8w+I4RbRtwMHu7PdQi3NlA85sSGuFbTXla6eEIm68n+yNLaQN4dMxC9 w==;
X-CSE-ConnectionGUID: NgOUuS4rQt+2iqYg5oL7Jw==
X-CSE-MsgGUID: F+6iXOd8QUCQwh81GqAtoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92534419"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92534419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:23:08 -0700
X-CSE-ConnectionGUID: kUMg9+/xSG6Y1XuEvgMRvw==
X-CSE-MsgGUID: m97reF5ATfCvvcIeM4K4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251497801"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:23:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/14] drm/i915/cdclk: Do the DG2 CDCLK/pipe power well
 notify properly
In-Reply-To: <20260610170652.5320-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-4-ville.syrjala@linux.intel.com>
Date: Thu, 11 Jun 2026 10:23:04 +0300
Message-ID: <6e8c4c167a95ece9c5713285369f686d67813327@intel.com>
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
> The pcode post notufy needs to happen after the CDCLK has been

*notify

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> changed, not before. Also move the pre_notify call a bit for the
> sake of symmetry.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 9718062d8d6c..d60b3369b4d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2796,9 +2796,6 @@ intel_set_cdclk_pre_plane_update(struct intel_atomi=
c_state *state)
>  				 &new_cdclk_state->actual))
>  		return;
>=20=20
> -	if (display->platform.dg2)
> -		intel_cdclk_pcode_pre_notify(state);
> -
>  	if (new_cdclk_state->disable_pipes) {
>  		cdclk_config =3D new_cdclk_state->actual;
>  		pipe =3D INVALID_PIPE;
> @@ -2823,6 +2820,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomi=
c_state *state)
>=20=20
>  	drm_WARN_ON(display->drm, !new_cdclk_state->base.changed);
>=20=20
> +	if (display->platform.dg2)
> +		intel_cdclk_pcode_pre_notify(state);
> +
>  	intel_set_cdclk(display, &cdclk_config, pipe,
>  			"Pre changing CDCLK to");
>  }
> @@ -2851,9 +2851,6 @@ intel_set_cdclk_post_plane_update(struct intel_atom=
ic_state *state)
>  				 &new_cdclk_state->actual))
>  		return;
>=20=20
> -	if (display->platform.dg2)
> -		intel_cdclk_pcode_post_notify(state);
> -
>  	if (!new_cdclk_state->disable_pipes &&
>  	    new_cdclk_state->actual.cdclk < old_cdclk_state->actual.cdclk)
>  		pipe =3D new_cdclk_state->pipe;
> @@ -2864,6 +2861,9 @@ intel_set_cdclk_post_plane_update(struct intel_atom=
ic_state *state)
>=20=20
>  	intel_set_cdclk(display, &new_cdclk_state->actual, pipe,
>  			"Post changing CDCLK to");
> +
> +	if (display->platform.dg2)
> +		intel_cdclk_pcode_post_notify(state);
>  }
>=20=20
>  /* pixels per CDCLK */

--=20
Jani Nikula, Intel
