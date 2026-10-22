Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8859606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Niq5fBeW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93810E3F0;
	Thu, 22 Oct 2026 12:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75EF10E3F0;
 Thu, 22 Oct 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792671019; x=1824207019;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y0ZP4eC2bvY5eCdcRj/DAVPLU0cbxq2zTFXt/QcSMos=;
 b=Niq5fBeWcy8VE8YfcxXuyNALg6ssaSCVaBxp7gBAHG5y+OH5niCVHM0b
 P7RYbxVP3XVCE1Zfy2tGg9eMeHDadjBowFMFp127a81uT3XX1lKNlCkOE
 TmMXf5d0UO2OJDHJeqcpgfhHEE3Snc7UgjfoUufXW3arXz5/8SpY84s/x
 e7LcYj8PcNDqh5PPYufCKX+wOgGfjuUFBY7P8+mbhFX1e/HAmQgeJWMCR
 dEpIfUfexBUNL4v5IWYqLxFlzEtgf3ppkE88gw6iAgpG0p95Etn3+gyPe
 Plrp7FulWVtIYvNWev20jaMWe0suO+Tz63o9+NgW99B2uNVgYzuJedLva g==;
X-CSE-ConnectionGUID: td4s+53uS/+nqDcMuVWV5g==
X-CSE-MsgGUID: dZzoMlpwTcKO54dUZOB06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1293757"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1293757"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:10:19 -0700
X-CSE-ConnectionGUID: jeNoOcOJR2OSm9XGotlR/g==
X-CSE-MsgGUID: FpGhbiz7RdOgNvx1QrdSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5192635"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:10:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915: Use intel_de_read64_2x32_volatile_fw()
 for IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP query
In-Reply-To: <20261022115548.32678-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
 <20261022115548.32678-2-ville.syrjala@linux.intel.com>
Date: Thu, 22 Oct 2026 15:10:12 +0300
Message-ID: <81225a55c325cee43a4e8de745276317873ea8f1@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Switch the combined IVB_TIMESTAMP_CTR+PIPE_FRMTMSTMP read to
> use intel_de_read64_2x32_volatile_fw(). It basically does the
> same thing that we were doing by hand, and both are already
> using the intel_de_read_fw().
>
> This has a few functional changes:
> - intel_de_read64_2x32_volatile_fw() has a retry limit, the
>   old code did not

This change is probably a good thing?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> - when retrying intel_de_read64_2x32_volatile_fw() reads each
>   register once, the old code always read PIPE_FRMTMSTMP twice
>   and IVB_TIMESTAMP_CTR once
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 34 +++++++--------------
>  1 file changed, 11 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 99cb648cab73..1d4753605675 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -142,34 +142,22 @@ static u32 intel_crtc_scanlines_since_frame_timesta=
mp(struct intel_crtc *crtc)
>  	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	u32 htotal =3D mode->crtc_htotal;
>  	u32 clock =3D mode->crtc_clock;
> -	u32 scan_prev_time, scan_curr_time, scan_post_time;
> +	u32 curr_time, frame_time;
> +	u64 result;
>=20=20
>  	/*
> -	 * To avoid the race condition where we might cross into the
> -	 * next vblank just between the PIPE_FRMTMSTMP and TIMESTAMP_CTR
> -	 * reads. We make sure we read PIPE_FRMTMSTMP and TIMESTAMP_CTR
> -	 * during the same frame.
> +	 * IVB_TIMESTAMP_CTR is the current timestamp, PIPE_FRMTMSTMP
> +	 * is the sampled timestamp at the start of the previous
> +	 * delayed vblank. intel_de_read64_2x32_volatile_fw() gives
> +	 * a race free snapshot of both registers.
>  	 */
> -	do {
> -		/*
> -		 * This field provides read back of the display
> -		 * pipe frame time stamp. The time stamp value
> -		 * is sampled at every start of vertical blank.
> -		 */
> -		scan_prev_time =3D intel_de_read_fw(display,
> +	result =3D intel_de_read64_2x32_volatile_fw(display,
> +						  IVB_TIMESTAMP_CTR,
>  						  PIPE_FRMTMSTMP(crtc->pipe));
> +	curr_time =3D lower_32_bits(result);
> +	frame_time =3D upper_32_bits(result);
>=20=20
> -		/*
> -		 * The TIMESTAMP_CTR register has the current
> -		 * time stamp value.
> -		 */
> -		scan_curr_time =3D intel_de_read_fw(display, IVB_TIMESTAMP_CTR);
> -
> -		scan_post_time =3D intel_de_read_fw(display,
> -						  PIPE_FRMTMSTMP(crtc->pipe));
> -	} while (scan_post_time !=3D scan_prev_time);
> -
> -	return div_u64(mul_u32_u32(scan_curr_time - scan_prev_time,
> +	return div_u64(mul_u32_u32(curr_time - frame_time,
>  				   clock), 1000 * htotal);
>  }

--=20
Jani Nikula, Intel
