Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12411606A335
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NDefxWy9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA30210F701;
	Tue, 27 Oct 2026 16:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C6D10E443;
 Tue, 27 Oct 2026 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793117084; x=1824653084;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=E17rDRpemwE0pwkgxrdTqZW6dJck+1yrSNqBwMignYw=;
 b=NDefxWy9XIdVWE0H+iKHQMr30/Sj6F2krIWPiKPIj1sgHXoPRdvsl6Ou
 T5IYuoXQNO2fgW8VjKhnjC1WWlbQH+8+o6UJm4oUw7DtOV3ZtRUdpqmyi
 vnV7p4P9t/TOoEgFASajAfDHqWb2HU1NnkVbjwMyuMbk2v+AmZD5fa2qC
 kBFVtdKJsgcNq7NDzsjiMOrlQCg2q7yM1MYu4+M70xr5U7CuRDGzIxDuR
 f9RkAhaVgqf1DGwFOmHIVcooeFIGuO1aIEFZVSAbVxqFUljQEKXqtibi1
 Ou8VxmhxCUSms/GpCHe74WaC0tmXGw//z30oKDZ+QtW9/Lq1sqyWzTbSi Q==;
X-CSE-ConnectionGUID: pBRIYXTARj+lXS6lYN7z8g==
X-CSE-MsgGUID: mCySRIh8RLiTongJPvZ3FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1830934"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1830934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:04:43 -0700
X-CSE-ConnectionGUID: f4gYiu7WQwevUfAeIPJcZw==
X-CSE-MsgGUID: tDldDrB5QB+4CJE7egdoAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4720089"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:04:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/13] drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
In-Reply-To: <20261023165803.31016-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-2-ville.syrjala@linux.intel.com>
Date: Tue, 27 Oct 2026 18:04:39 +0200
Message-ID: <956f60a3c6194f7ab12f8cb44d413c0bb58ec541@intel.com>
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_vrr_dcb_vmin_vblank_start() may evaluate
> intel_vrr_dcb_vmin_vblank_start_next() twice, and given that
> this is doing hardware access under the hood isn't really
> desired.

Feels like there's a word missing there. This? It?

> Even worse, the double evaluation might even cause
> intel_vrr_dcb_vmin_vblank_start() itself to finally
> return -EINVAL (if we race against the DMC hard enough),
> which we definitely never want to do.
>
> Eliminate the double evaluation, guaranteeing a sane
> final return value at the same time.

I think a Fixes: would be in order.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index b14750692ae0..e59345bd1d33 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1202,9 +1202,13 @@ int intel_vrr_safe_window_start(const struct intel=
_crtc_state *crtc_state)
>  static int
>  intel_vrr_dcb_vmin_vblank_start(const struct intel_crtc_state *crtc_stat=
e)
>  {
> -	return (intel_vrr_dcb_vmin_vblank_start_next(crtc_state) < 0) ?
> -		intel_vrr_dcb_vmin_vblank_start_final(crtc_state) :
> -		intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> +	int vblank_start;
> +
> +	vblank_start =3D intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
> +	if (vblank_start < 0)
> +		vblank_start =3D intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
> +
> +	return vblank_start;
>  }
>=20=20
>  int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_s=
tate)

--=20
Jani Nikula, Intel
