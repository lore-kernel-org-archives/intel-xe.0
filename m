Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B79606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PT+vSf+V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4FF10E2FD;
	Thu, 26 Nov 2026 08:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0CE10E2FD;
 Thu, 26 Nov 2026 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795683501; x=1827219501;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Hbv+sCDzCE7wuC09VZwCiWaJttjMm0jnvkJbvqxU/FE=;
 b=PT+vSf+V33qtaOZE7yASsjAYIBcleQT/fSx4Hg+bviJZrzkSDuKWiyoS
 omcsqK0WyCHsJPMZScaGxCbdMc744Q9vy1aJ3deGhuWliqv86deOYuV1t
 CeRj35bpR0y1wKbny+Tp8Ty8ZW7JGPo/BgD23mItXwec3aT1BydRjgGW1
 fwHAcNhCkfnaTaSsY4J1zOykttzxHPkjsaeD3NxKXpSmb5FJRJ8bTp38J
 YV3syx8sM2G5oc5exFcXGf/bLSq1EXG1Q9DJ6MrSiWwY9zn4BbM9LMd5x
 jfM/52U+VIitLoQvzrcBRxXWRMSuRK7GYA7/D2sqA7RaX1XTcLQ4uPQIT A==;
X-CSE-ConnectionGUID: Z17UuluESuyh+P5E1Tjo2w==
X-CSE-MsgGUID: 0g51FnoUQaiKEL284WMuwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4602605"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4602605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:52:29 -0800
X-CSE-ConnectionGUID: CKA+94yaSbKu1YslSP0VdQ==
X-CSE-MsgGUID: yGXwk3VtRLCCo7hctPvMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12005036"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:52:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 08/15] drm/i915/pipelock: Keep SSC, PSR and CMRR off on
 pipelock tiles
In-Reply-To: <20261126063459.863698-9-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-9-suraj.kandpal@intel.com>
Date: Thu, 26 Nov 2026 10:52:23 +0200
Message-ID: <aba5a709dd47920e45389b62aa08212f96e605e8@intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> A few features can't be used on a pipelocked transcoder:
>
> - SSC, as every port has its own PLL and the PLLs have to match
> - PSR and panel replay, which pipelock doesn't support
> - CMRR and DC balance, which mess with the vtotal before the
>   secondary has locked
>
> The PLL and these features are computed before we know which tiles end
> up in a sync group, so keep them off for any DP SST tile on platforms
> with pipelock. Tiled monitors don't use them in practice anyway.
> Add intel_pipelock.[ch] for the pipelock specific code, starting with
> the check for such connectors.
>
> Bspec: 73521
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  drivers/gpu/drm/i915/display/intel_lt_phy.c   |  4 ++++
>  drivers/gpu/drm/i915/display/intel_pipelock.c | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_pipelock.h | 15 +++++++++++++++
>  drivers/gpu/drm/i915/display/intel_psr.c      |  7 +++++++
>  drivers/gpu/drm/i915/display/intel_vrr.c      |  8 ++++++--
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  7 files changed, 51 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_pipelock.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ba7eecfffdca..a61642c3e71b 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -305,6 +305,7 @@ i915-y +=3D \
>  	display/intel_pch.o \
>  	display/intel_pch_display.o \
>  	display/intel_pch_refclk.o \
> +	display/intel_pipelock.o \
>  	display/intel_plane.o \
>  	display/intel_pmdemand.o \
>  	display/intel_psr.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/dr=
m/i915/display/intel_lt_phy.c
> index 86492651b01d..35fa701eb9be 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -20,6 +20,7 @@
>  #include "intel_lt_phy.h"
>  #include "intel_lt_phy_regs.h"
>  #include "intel_panel.h"
> +#include "intel_pipelock.h"
>  #include "intel_psr.h"
>  #include "intel_tc.h"
>=20=20
> @@ -1338,6 +1339,9 @@ intel_lt_phy_pll_is_ssc_enabled(struct intel_crtc_s=
tate *crtc_state,
>  		if (intel_panel_use_ssc(display)) {
>  			struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>=20=20
> +			if (intel_pipelock_connector_possible(intel_dp->attached_connector))
> +				return false;
> +
>  			return (intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/=
drm/i915/display/intel_pipelock.c
> new file mode 100644
> index 000000000000..67c643b6626c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +

I would pretty much like to mandate that *every* file in display/ *must*
have a DOC: comment explaining what this stuff is about, what the
acronyms are, etc. Obviously not all the existing files have it, but all
new ones should.

You've basically written most of this already in the cover letter and
the commit messages. Add a bit of pixie dust on top and you're done.

> +#include "intel_display_core.h"
> +#include "intel_display_types.h"
> +#include "intel_pipelock.h"
> +
> +bool intel_pipelock_connector_possible(const struct intel_connector *con=
nector)
> +{
> +	struct intel_display *display =3D to_intel_display(connector);
> +
> +	return HAS_PIPELOCK(display) && connector->base.has_tile &&
> +		connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
> +		!connector->mst.dp;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/=
drm/i915/display/intel_pipelock.h
> new file mode 100644
> index 000000000000..b08b10f8da34
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_pipelock.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef __INTEL_PIPELOCK_H__
> +#define __INTEL_PIPELOCK_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_connector;
> +
> +bool intel_pipelock_connector_possible(const struct intel_connector *con=
nector);
> +
> +#endif /* __INTEL_PIPELOCK_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 438cb1502c26..a0e65b24b65a 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -51,6 +51,7 @@
>  #include "intel_dsb.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_pipelock.h"
>  #include "intel_psr.h"
>  #include "intel_psr_regs.h"
>  #include "intel_quirks.h"
> @@ -1897,6 +1898,12 @@ void intel_psr_compute_config(struct intel_dp *int=
el_dp,
>  		return;
>  	}
>=20=20
> +	if (intel_pipelock_connector_possible(connector)) {
> +		drm_dbg_kms(display->drm,
> +			    "PSR condition failed: Tiled display with pipelock\n");
> +		return;
> +	}
> +
>  	/* Only used for state verification. */
>  	crtc_state->panel_replay_dsc_support =3D connector->dp.panel_replay_cap=
s.dsc_support;
>  	crtc_state->has_panel_replay =3D _panel_replay_compute_config(crtc_stat=
e, conn_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index e59345bd1d33..47603c141298 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -25,6 +25,7 @@
>  #include "intel_dmc.h"
>  #include "intel_dmc_regs.h"
>  #include "intel_dp.h"
> +#include "intel_pipelock.h"
>  #include "intel_psr.h"
>  #include "intel_vrr.h"
>  #include "intel_vrr_regs.h"
> @@ -483,6 +484,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crt=
c_state,
>  	struct intel_connector *connector =3D
>  		to_intel_connector(conn_state->connector);
>  	struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.adjusted_mod=
e;
> +	bool pipelock =3D intel_pipelock_connector_possible(connector);
>  	int vmin, vmax;
>=20=20
>  	if (!HAS_VRR(display))
> @@ -523,7 +525,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crt=
c_state,
>  		 * the fixed refresh rate path. It is generic across transcoders
>  		 * and gated on platform support and a valid debugfs ratio.
>  		 */
> -		intel_vrr_cmrr_compute_config(crtc_state);
> +		if (!pipelock)
> +			intel_vrr_cmrr_compute_config(crtc_state);
>  		intel_vrr_compute_fixed_rr_timings(crtc_state);
>  	}
>=20=20
> @@ -536,7 +539,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crt=
c_state,
>  			 crtc_state->hw.adjusted_mode.crtc_vsync_end);
>  	}
>=20=20
> -	intel_vrr_dc_balance_compute_config(crtc_state);
> +	if (!pipelock)
> +		intel_vrr_dc_balance_compute_config(crtc_state);
>  }
>=20=20
>  static int
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 52f0d5dd5468..15154987d6a0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -329,6 +329,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_parent.o \
>  	i915-display/intel_pch.o \
>  	i915-display/intel_pfit.o \
> +	i915-display/intel_pipelock.o \
>  	i915-display/intel_plane.o \
>  	i915-display/intel_pmdemand.o \
>  	i915-display/intel_pps.o \

--=20
Jani Nikula, Intel
