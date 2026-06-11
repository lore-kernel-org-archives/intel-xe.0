Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C47CCD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA510ED30;
	Thu, 11 Jun 2026 07:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+ijWLne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467BA10ED44;
 Thu, 11 Jun 2026 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781163077; x=1812699077;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4NWAuzzNKDxar22TDAFGod8yzOr6C7LgdHcPhpwV7cw=;
 b=E+ijWLnewF56E8gmM0HIXl9EK8Ox+Qmp51iaEX7s0QFnJr0mWWi1bK4K
 RJrd9BC5aDXGd9XN0ShL7NhGpkIOatGBkmj29kdIM0LbO+nLxtD8jDmvB
 WYIyF0sWPkmXaw6SfIS5DfuYiVpP/DY6NqrfYlrmpH2kxvIqbhmJjhwE3
 I+J9gnsnOPjC0LyqjO7nSoAkE9PqHRvBIzMSUN54aRoYBr0yfmNu903d0
 tE6/HWE/PeYiR6OruXxt95H+wLLDAONEOSNPfZDCr6yQch1fJyAn5OsYm
 5JQMWtJEBMOt8SNglSF1tjZfjtB7+rKjmsFrvt5h6NH8MVsT5Gj3oP7cM g==;
X-CSE-ConnectionGUID: y1cxrff3SpuxU+I53dhDHQ==
X-CSE-MsgGUID: /z/x9yHkQ/mnnm6DIwgPDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85598090"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85598090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:31:17 -0700
X-CSE-ConnectionGUID: /VWgOp+7Q6OIU64uMxxhlw==
X-CSE-MsgGUID: v6TGclp/RwyobhVoIKOZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250685164"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:31:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/14] drm/i915/cdclk: Notify DG2 pcode about pipe power
 wells regardless of CDCLK
In-Reply-To: <20260610170652.5320-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-5-ville.syrjala@linux.intel.com>
Date: Thu, 11 Jun 2026 10:31:12 +0300
Message-ID: <b17d1e14e4439c5695faef2e1eaebba5d72c0221@intel.com>
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
> We're currently skipping the pcode notifies on DG2 if the CDCLK isn't
> changing while the power well counts would still need updating.
> Do the pcode notifications also for pure pipe power well changes.

This kind of does more than just change the pcode stuff, since the
conditions are higher up. Might mention something about that here.

Anyway,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index d60b3369b4d2..7259048361a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2793,7 +2793,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomi=
c_state *state)
>  		return;
>=20=20
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
> -				 &new_cdclk_state->actual))
> +				 &new_cdclk_state->actual) &&
> +	    dg2_power_well_count(display, old_cdclk_state) =3D=3D
> +	    dg2_power_well_count(display, new_cdclk_state))
>  		return;
>=20=20
>  	if (new_cdclk_state->disable_pipes) {
> @@ -2848,7 +2850,9 @@ intel_set_cdclk_post_plane_update(struct intel_atom=
ic_state *state)
>  		return;
>=20=20
>  	if (!intel_cdclk_changed(&old_cdclk_state->actual,
> -				 &new_cdclk_state->actual))
> +				 &new_cdclk_state->actual) &&
> +	    dg2_power_well_count(display, old_cdclk_state) =3D=3D
> +	    dg2_power_well_count(display, new_cdclk_state))
>  		return;
>=20=20
>  	if (!new_cdclk_state->disable_pipes &&

--=20
Jani Nikula, Intel
