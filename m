Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71937FD5F88
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3205410E592;
	Wed,  8 Apr 2026 08:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwMPWalB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5443210E58D;
 Wed,  8 Apr 2026 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775637814; x=1807173814;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Tr59nATJOHGJtliI+w8K6EcnUdb1jwxVbtBUgSeMYVA=;
 b=dwMPWalBJGRU7clmlQtqge7dZQx/TteIrGhi2KyAU5vrYgrFIqiuBKoM
 VYbYbacd4qJm7EKx9+IIPwnjLIBsTP2++U+9v7M5Wwwfr0qLL+7B9StBd
 fhPWeiXggM2vNqTeT1oUKXa2KGPJtC4yQC3srA6fvJOKiX7r+n21b+pvf
 dXCLg55OSNbqHOeQdHpiSbI/9R4XfDnl8ArkeaYqpFyFVMtjM6nFk9AEm
 OJTkfjSzkuvaXw0Sgp2BywU6FjGl2H1qS8yuajLoeYIo1PFG5nER5SZju
 GsGuAA4sz3c1etGN12/Tcg/HA1P45vcMZb6JZ0MHzdiuj93ENFCdSSH1V A==;
X-CSE-ConnectionGUID: rbacWsP3TIiX4CzGc7xhzg==
X-CSE-MsgGUID: b+UCCWouTmOOXKkf5EV9Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76515143"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76515143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:43:34 -0700
X-CSE-ConnectionGUID: L5UO1VwITzaeWwj5oa66jg==
X-CSE-MsgGUID: RXKaFJVrRFmiUIhCCcHi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233361935"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:43:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/12] drm/i915/fb: Reject per-plane remapping with DPT
In-Reply-To: <20260407155053.32156-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-4-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 11:43:29 +0300
Message-ID: <9c424207a639b8ec4d88dbe21edd38f086c8c55d@intel.com>
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

On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We currently create a single DPT for the entire FB, so we can't
> actually do the per-plane remap. Reject it for now.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 4b0afea1c456..52a619088e8e 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1252,6 +1252,10 @@ static bool intel_plane_can_remap(const struct int=
el_plane_state *plane_state)
>  	if (intel_fb_is_ccs_modifier(fb->modifier))
>  		return false;
>=20=20
> +	/* TODO implement remapping with DPT */
> +	if (intel_fb_uses_dpt(fb))
> +		return false;
> +
>  	/* Linear needs a page aligned stride for remapping */
>  	if (fb->modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
>  		unsigned int alignment =3D intel_tile_size(display) - 1;

--=20
Jani Nikula, Intel
