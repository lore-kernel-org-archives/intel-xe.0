Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AC606A325
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T3/XIvWs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555DC10EEDF;
	Mon, 19 Oct 2026 16:06:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F210E9C4;
 Mon, 19 Oct 2026 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792425960; x=1823961960;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xOjMmI9z0vfEzrBQk4+sBg8SeXsAg+wqEDpZc+QODKc=;
 b=T3/XIvWsqxGtXDpXRiWuNv8ajrpVkIqOaQ5I3oHHaefQx0Sqyura2VNC
 ElvBGvzq5R9ZQ1vwUqzLfzLl9ogmO69uwk4++Xo7NOevJXrks8vwTHCaU
 3Hf0h9R1+MUS8CQS4HZaTdDVyoEmRqs85/gT5AVfKHURGq+Ul/GK5X0gr
 NKbBrUEd1VhaDa4CciIUqBGyXPVjdephjoE0xASt5vH2W061KLEv8iwN9
 mEdZxje5o8XbWa0uVZ4ZREF2EzSw/rSCWTVPA2UjrIrBkyKO+OwRkhTlW
 cPDtGujZD8KHqKzVLnHVddfgE+edCRrfIrI2NoRs298FOUKxXAwZbwpaj A==;
X-CSE-ConnectionGUID: 51/sLQdvQuSmdl/gnfILOA==
X-CSE-MsgGUID: tgEMHhxmQMeS2b1xlDyslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1007033"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1007033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:05:59 -0700
X-CSE-ConnectionGUID: sSiN3T04RuKaoZB59ZX7QA==
X-CSE-MsgGUID: jM4C3I36Sg6BrTgqKL0Yyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="3040258"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:05:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/15] drm/i915/pfit: Drop platform check for
 gmch_pfit.pgm_ratios
In-Reply-To: <20261019135309.23578-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-8-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 19:05:55 +0300
Message-ID: <c250c15ea1676a3c4ac75f7f199839311ece0e74@intel.com>
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
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The platform check in the state checker for gmch_pfit.pgm_ratios
> is now pointless. gmch_pfit.pgm_ratios will always be 0 on i965+.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 79c4aff1c633..200426bf0c59 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5462,9 +5462,7 @@ intel_pipe_config_compare(const struct intel_crtc_s=
tate *current_config,
>  	}
>=20=20
>  	PIPE_CONF_CHECK_X(gmch_pfit.control);
> -	/* pfit ratios are autocomputed by the hw on gen4+ */
> -	if (DISPLAY_VER(display) < 4)
> -		PIPE_CONF_CHECK_X(gmch_pfit.pgm_ratios);
> +	PIPE_CONF_CHECK_X(gmch_pfit.pgm_ratios);
>  	PIPE_CONF_CHECK_X(gmch_pfit.lvds_border_bits);
>=20=20
>  	/*

--=20
Jani Nikula, Intel
