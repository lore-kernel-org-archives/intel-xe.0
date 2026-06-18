Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457D7CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 14:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302210E3E1;
	Thu, 18 Jun 2026 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHalZeqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1110E3E1;
 Thu, 18 Jun 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781794654; x=1813330654;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZFTGpat0Sy5HaxBwd2Chgnur0Vft/874r36EjVBOitI=;
 b=gHalZeqjUAJ/s/MbscrwC+DeKu2TaEfgFI4pRO1VMTTE9oLDu2pVuoi1
 v98rMVSEuva7+Pn8lFawLnAb8b2yihodMjFJ89yFCI3+ZFS1OT6PBI0hF
 FKubt24Fq60mOIdiFT6LKI02vIaoXWO1idK7P/hXUeDhfD50qyMCgXovj
 jIuMOn/aZRs9rSYBKx1y+4ygOQiGCJoctm0ls6gF9V8QnLOr0AGbDIt9W
 pvls22Y6klzPb5pXE0BHysRQ0D4M0yhuddGVYr9l64o/GN2zogW2DXr/q
 boe/yIvKkwoH6GUPteS5fMuXaMUA8AKmsceN3EXkXZlx1s967nPWHtcXk g==;
X-CSE-ConnectionGUID: 078SDg0fTdiMK7mrDSJvCA==
X-CSE-MsgGUID: v+sEznmJQzOnw8ABsCzXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100044791"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="100044791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:57:33 -0700
X-CSE-ConnectionGUID: VJlIeHSLTY+ME0i39De8+g==
X-CSE-MsgGUID: BS3a/Z7bQYe0O9A+84066g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="242008081"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:57:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915/scaler: remove unused plane_state argument
In-Reply-To: <20260615190839.1219417-2-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615190839.1219417-1-michal.grzelak@intel.com>
 <20260615190839.1219417-2-michal.grzelak@intel.com>
Date: Thu, 18 Jun 2026 17:57:28 +0300
Message-ID: <d6d73f9dd4e17f6cf7e1c4dc59b3f27e3836801a@intel.com>
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

On Mon, 15 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> intel_allocate_scaler() no longer uses plane_state since condition
> containing it has been removed while adding scaler_has_casf(). Remove
> plane_state as well.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Fixes: 17d70a0760f2 ("drm/i915/casf: Extract scaler_has_casf()")

The Fixes: trailer basically means there's an actual bug in that commit
that needs fixing, and the fix needs to go where that commit goes,
including stable backports, etc.

This is not the case here. This is an improvement, but there's no bug
that gets fixed.

(The trailer can be removed while applying.)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_scaler.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 7994b983d509d..4b456924fdef3 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -334,7 +334,6 @@ static bool scaler_has_casf(struct intel_display *dis=
play, int scaler_id)
>=20=20
>  static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_=
state,
>  				 struct intel_crtc *crtc,
> -				 struct intel_plane_state *plane_state,
>  				 bool casf_scaler)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc);
> @@ -406,7 +405,7 @@ static int intel_atomic_setup_scaler(struct intel_crt=
c_state *crtc_state,
>  	int vscale =3D 0;
>=20=20
>  	if (*scaler_id < 0)
> -		*scaler_id =3D intel_allocate_scaler(scaler_state, crtc, plane_state, =
casf_scaler);
> +		*scaler_id =3D intel_allocate_scaler(scaler_state, crtc, casf_scaler);
>=20=20
>  	if (drm_WARN(display->drm, *scaler_id < 0,
>  		     "Cannot find scaler for %s:%d\n", name, idx))

--=20
Jani Nikula, Intel
