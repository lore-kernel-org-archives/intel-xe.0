Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2B606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OVi6JaON
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1782910EE81;
	Mon,  2 Nov 2026 14:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37C810EEA8;
 Mon,  2 Nov 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793628112; x=1825164112;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1C3NeEbnLeNoetHm4kEvjgLx4e2i2/MV5zocFYjmq0k=;
 b=OVi6JaONcRi+XWNSJhNLKvJuggGzytWOl8GpDzmrGuwIfwpt4RQFexAk
 gqEXRzW6fdN+g9dgQPNi39/aXzexzE0etSxwUqJHkczWl2IzizFH9zY+K
 IXhC6Yh5kr0T+EknZzvBx4hZ/t/q5/TcVVntN8m3ywHPS/tnV1chYH45+
 GW+WzrxjnSiUZBlKyTgCwUdjMiRdylLih1qxS0MWjZh10fqL2hIjWTtEc
 JH8D3rxj6zD1T+IeZIC1lq0kzLqrPYlsijFpaMxZAjl3xQSqrAfMk6eEJ
 GfAcqZ7yNSynVJOx7VMGSBwawJt9wmAIeYzlewSTSjyqGoCSf0efIZTLO A==;
X-CSE-ConnectionGUID: x9FRZuvhSZmcEyThGymQJw==
X-CSE-MsgGUID: nx9a8MTbTZif+vLQJtOkyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425237"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2425237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 06:01:52 -0800
X-CSE-ConnectionGUID: aRadQRF5Tpm0cbZJRR9xhA==
X-CSE-MsgGUID: Bsa9GjNwTYWLPeBZCGdPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6108735"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 06:01:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Reject < 10 MHz dotclocks early
In-Reply-To: <20261102130319.2747-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261102130319.2747-1-ville.syrjala@linux.intel.com>
Date: Mon, 02 Nov 2026 16:01:47 +0200
Message-ID: <526b5a7c6e8ba282daa16fb681eef2a173c4ad23@intel.com>
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

On Mon, 02 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We don't want bogus modes with an unreasonably low dotclock
> to reach the rest of the code so filter them out early.
> Super low dotclocks could lead to overflow etc. issues
> in various timing related calculations.
>
> The actual PLL low limit for our hardware is platform
> specific, and at least for the older platforms it's
> generally around 20 MHz. Not sure about the more recent
> platforms.
>
> The lowest dotclock one can find in the drm_edid.c mode lists
> is 13.5 MHz. Those are actually the modes that require
> double clocking to reach above the DVI/HDMI specified minimum
> of 25 MHz for the TMDS clock.
>
> Our connector mode validation currently rejects:
> - VGA/HDMI: < 25 MHz
> - DP SST/MST: < 10 MHz
> - SDVO: limits queried from SDVO device
> - others: currently no limit
>
> But do note that the user supplied mode during actual
> modesets will not be checked against the connector
> mode validation limits. HDMI does have somewhat reasonable
> checks also for modeset time, but others perhaps do not.
>
> Given all that let's choose a somewhat arbitrary 10 MHz
> as our overall driver wide dotclock limit. This will now be
> enforced not only during connector mode validation but also
> as a hard limit for actual modesets.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 5e40487e9ab0..b777d9c4dd4f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8395,6 +8395,13 @@ enum drm_mode_status intel_mode_valid(struct drm_d=
evice *dev,
>  	if (mode->clock > max_dotclock(display))
>  		return MODE_CLOCK_HIGH;
>=20=20
> +	/*
> +	 * Somewhat arbitrary low limit of 10 MHz to
> +	 * reject completely bogus modes early on.
> +	 */
> +	if (mode->clock < 10000)
> +		return MODE_CLOCK_LOW;
> +
>  	/* Transcoder timing limits */
>  	if (DISPLAY_VER(display) >=3D 11) {
>  		hdisplay_max =3D 16384;

--=20
Jani Nikula, Intel
