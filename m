Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E6606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OI5dy9nD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC38D10EFAF;
	Mon, 19 Oct 2026 16:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF3510EF9F;
 Mon, 19 Oct 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792426508; x=1823962508;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OvIPlNQuBfZg+gMhZMi+116RKRgW6HZIGndOST41y7M=;
 b=OI5dy9nDdg+6Y5dGF03KYWtqlkNOiMOrJgjvbq6b+7QUMSQ642IsyiPk
 GhLbv9kP/4neEzzkTfszw/qKxrR2kAi5rKmuxD+ayR0Vhg+N9SOpYCJyL
 iblxtYb558h1qBCUrDryrQ6HZFKc6AmpNj7XETm0GjlnjyQXGzMZ11csP
 OSuWPpJYzVZqQe8r1kipOxmqlp/qc5qrQ6HUV3LexSq+oZgY1fOWHLTrE
 CT9v1VnvvEMpfcGADxEZQGxL9cA6L3FkeQ+N6v1f7oH4N1S2feEZZ9avP
 7nDJbHhWseBeYzd7QVWI1EnJP5eoqmIF1I01YqJ4MLjlsukWVdadHXyF6 A==;
X-CSE-ConnectionGUID: P1o1h9Y6Q4yVJU9/dUNtTg==
X-CSE-MsgGUID: 6OejdcE5RBqcgUmA8Ebn1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1019484"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1019484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:15:08 -0700
X-CSE-ConnectionGUID: TSvwJMVITpa/goIWPpmhqA==
X-CSE-MsgGUID: 6cwZ7rZKQRqXXrvgpSc4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2517971"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:15:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 08/15] drm/i915/pfit: Unconfuse panel_fitter_scaling()
In-Reply-To: <20261019135309.23578-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-9-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 19:15:04 +0300
Message-ID: <cdb763182c382c80aebbb65110aa5e8840eb75c9@intel.com>
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
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> panel_fitter_scaling() apparently tries to implemnt

*implement

> DIV_ROUND_CLOSEST() by hand, but in a somewhat weird way
> where the division and rounding are done as separate steps.
> Just use the real DIV_ROUND_CLOSEST() instead.
>
> This does in fact match how the i965+ hardware calculates
> the automagic scaling factors, which will be important
> for upcoming readout support.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 82804159d0a1..5d519f45adbe 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -350,15 +350,7 @@ centre_vertically(struct drm_display_mode *adjusted_=
mode,
>=20=20
>  static u32 panel_fitter_scaling(u32 source, u32 target)
>  {
> -	/*
> -	 * Floating point operation is not supported. So the FACTOR
> -	 * is defined, which can avoid the floating point computation
> -	 * when calculating the panel ratio.
> -	 */
> -#define ACCURACY 12
> -#define FACTOR (1 << ACCURACY)
> -	u32 ratio =3D source * FACTOR / target;
> -	return (FACTOR * ratio + FACTOR/2) / FACTOR;
> +	return DIV_ROUND_CLOSEST(source << 12, target);
>  }
>=20=20
>  static void i965_scale_aspect(struct intel_crtc_state *crtc_state,

--=20
Jani Nikula, Intel
