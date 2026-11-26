Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175B606A32D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FtlFc39t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34010E660;
	Thu, 26 Nov 2026 08:59:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09BE10E660;
 Thu, 26 Nov 2026 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795683541; x=1827219541;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hoWCo7MXFQMYFnde3RkGAF1NvnuzLjm4odFRfrY5O6Y=;
 b=FtlFc39ttdwtzTF1OxSkiTGHfMTbUp8VlhJxTSQxEClPJ+XPJsqXZ798
 wsnUKVsbnv8HO94/TaZoK/cia/zdSOR8zMH/FGanlP0AFFmfjmYLw8tel
 ZYY78Uvh+HvL3RXG/5uvrjsVypQGCB8kszYQbI9YaHk+qKebsiXlwtJE5
 c979YM7/7GTPuBnJw+a+A/9Sn1Qzh6uIJnLSOb+z/hePmRI8klwfFU/76
 rBS5P7P9GJ3MVt8JvV2+Mo1lp17GngcS6FMvzftrSMgjy2EBAmNwa2Ls7
 afo+TkVLSoEwOS3UL7fFTblJwc8VWiMDCLqWlKBtNSsVrA+kayqo2LVNi A==;
X-CSE-ConnectionGUID: Jvg6mocmQxumQfrfVUEyTQ==
X-CSE-MsgGUID: Bd1ajNiVQHeVXRsfCO7YnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4471870"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4471870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:56:15 -0800
X-CSE-ConnectionGUID: t6QZeOkoRqSxU2NufIIIew==
X-CSE-MsgGUID: MrCgjHFKTvuCqhuOs+mEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12540145"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:56:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 09/15] drm/i915/pipelock: Compute pipelock groups for DP
 tiled displays
In-Reply-To: <20261126063459.863698-10-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-10-suraj.kandpal@intel.com>
Date: Thu, 26 Nov 2026 10:56:10 +0200
Message-ID: <a7978ac0dc0b9405d91729e5352b07e79bf7c2d5@intel.com>
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

On Thu, 26 Nov 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Port sync has been off on NVL since it was defeatured, so the tiles of
> a tiled DP display run unsynchronized there. Use pipelock to sync them
> instead.
>
> On top of the port sync checks, pipelock needs the tiles to have the
> same PLL, bpp, set context latency, VRR timings and guardband, and the
> same SDPs. DP to HDMI protocol converters can't be locked, as they
> retime the signal. The timing generator start delay is computed from
> the link M/N ratio, plus the MTP slots left unused for 128b/132b. If
> the delay doesn't fit in a line, fall back to syncing just once, which
> is only allowed when the refresh rate can't change.
>
> Also make sure a CRTC only computes a sync group it's part of, so that
> a tile that can't be locked doesn't end up as a secondary.
>
> Bspec: 68938, 73521
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 15 ++-
>  drivers/gpu/drm/i915/display/intel_pipelock.c | 91 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_pipelock.h |  6 ++
>  3 files changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 54c4f90cdfea..f6352e9ece6e 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -79,6 +79,7 @@
>  #include "intel_modeset_lock.h"
>  #include "intel_panel.h"
>  #include "intel_pfit.h"
> +#include "intel_pipelock.h"
>  #include "intel_pps.h"
>  #include "intel_psr.h"
>  #include "intel_quirks.h"
> @@ -4670,7 +4671,7 @@ intel_ddi_port_sync_transcoders(const struct intel_=
crtc_state *ref_crtc_state,
>  	 * From, xe3lpd onwards we have defeatured this with reference to
>  	 * Wa_16024710867
>  	 */
> -	if (!IS_DISPLAY_VER(display, 9, 30))
> +	if (!IS_DISPLAY_VER(display, 9, 30) && !HAS_PIPELOCK(display))

Smells like the first one should be HAS_PORT_SYNC(). The above mixture
isn't great.

>  		return 0;
>=20=20
>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
> @@ -4692,9 +4693,18 @@ intel_ddi_port_sync_transcoders(const struct intel=
_crtc_state *ref_crtc_state,
>  		if (!crtcs_port_sync_compatible(ref_crtc_state,
>  						crtc_state))
>  			continue;
> +
> +		if (HAS_PIPELOCK(display) &&
> +		    (!intel_pipelock_possible(crtc_state, to_intel_connector(connector=
)) ||
> +		     !intel_pipelock_compatible(ref_crtc_state, crtc_state)))
> +			continue;
> +
>  		transcoders |=3D BIT(crtc_state->cpu_transcoder);
>  	}
>=20=20
> +	if (!(transcoders & BIT(ref_crtc_state->cpu_transcoder)))
> +		return 0;
> +
>  	return transcoders;

Commenting on existing code like Sashiko, I think "something-plural"
like transcoders is not a great name for a bit mask. Probably the
function and the variable name should be transcoder_mask.

>  }
>=20=20
> @@ -4737,6 +4747,9 @@ static int intel_ddi_compute_config_late(struct int=
el_atomic_state *state,
>  			~REG_BIT(crtc_state->cpu_transcoder);
>  	}
>=20=20
> +	if (HAS_PIPELOCK(display))
> +		intel_pipelock_compute_config(crtc_state);
> +
>  	return 0;
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/=
drm/i915/display/intel_pipelock.c
> index 67c643b6626c..23b6db074385 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipelock.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
> @@ -3,9 +3,20 @@
>   * Copyright =C2=A9 2026 Intel Corporation
>   */
>=20=20
> +#include <linux/math64.h>
> +
> +#include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_print.h>
> +
>  #include "intel_display_core.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
> +#include "intel_dpll_mgr.h"
>  #include "intel_pipelock.h"
> +#include "intel_vrr.h"
> +
> +#define PIPELOCK_CLOCK_CROSSING_DELAY	8
> +#define MTP_TIME_SLOTS			64
>=20=20
>  bool intel_pipelock_connector_possible(const struct intel_connector *con=
nector)
>  {
> @@ -15,3 +26,83 @@ bool intel_pipelock_connector_possible(const struct in=
tel_connector *connector)
>  		connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
>  		!connector->mst.dp;
>  }
> +
> +static int pipelock_tg_start_delay(const struct intel_crtc_state *crtc_s=
tate)
> +{
> +	const struct intel_link_m_n *m_n =3D &crtc_state->dp_m_n;
> +	int delay =3D PIPELOCK_CLOCK_CROSSING_DELAY;
> +
> +	delay +=3D DIV_ROUND_UP(m_n->link_n, m_n->link_m);
> +
> +	if (intel_dp_is_uhbr(crtc_state))
> +		delay +=3D MTP_TIME_SLOTS - m_n->tu;
> +
> +	return delay;
> +}
> +
> +static int pipelock_line_time(const struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.adjust=
ed_mode;
> +	int symbol_clock =3D intel_dp_link_symbol_clock(crtc_state->port_clock);
> +
> +	return div_u64(mul_u32_u32(adjusted_mode->crtc_htotal, symbol_clock),
> +		       adjusted_mode->crtc_clock);
> +}
> +
> +static bool pipelock_per_frame_sync(const struct intel_crtc_state *crtc_=
state)
> +{
> +	return pipelock_tg_start_delay(crtc_state) < pipelock_line_time(crtc_st=
ate);
> +}
> +
> +bool intel_pipelock_possible(const struct intel_crtc_state *crtc_state,
> +			     struct intel_connector *connector)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +
> +	if (!intel_pipelock_connector_possible(connector))
> +		return false;
> +
> +	if (drm_dp_is_branch(intel_dp->dpcd) && intel_dp_has_hdmi_sink(intel_dp=
)) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] No pipelock behind an HDMI converter\n",
> +			    connector->base.base.id, connector->base.name);
> +		return false;
> +	}
> +
> +	if (!pipelock_per_frame_sync(crtc_state) &&
> +	    (!intel_vrr_is_fixed_rr(crtc_state) || crtc_state->vrr.in_range)) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] No pipelock, start delay too long for VRR\n",
> +			    connector->base.base.id, connector->base.name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state=
1,
> +			       const struct intel_crtc_state *crtc_state2)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state1);
> +
> +	return crtc_state1->pipe_bpp =3D=3D crtc_state2->pipe_bpp &&
> +		crtc_state1->set_context_latency =3D=3D crtc_state2->set_context_laten=
cy &&
> +		crtc_state1->vrr.enable =3D=3D crtc_state2->vrr.enable &&
> +		crtc_state1->vrr.vmin =3D=3D crtc_state2->vrr.vmin &&
> +		crtc_state1->vrr.vmax =3D=3D crtc_state2->vrr.vmax &&
> +		crtc_state1->vrr.flipline =3D=3D crtc_state2->vrr.flipline &&
> +		crtc_state1->vrr.guardband =3D=3D crtc_state2->vrr.guardband &&
> +		crtc_state1->infoframes.enable =3D=3D crtc_state2->infoframes.enable &&
> +		intel_dpll_compare_hw_state(display, &crtc_state1->dpll_hw_state,
> +					    &crtc_state2->dpll_hw_state);
> +}
> +
> +void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->sync_primary_transcoder =3D=3D INVALID_TRANSCODER)
> +		return;
> +
> +	crtc_state->pipelock.tg_start_delay =3D pipelock_tg_start_delay(crtc_st=
ate);
> +	crtc_state->pipelock.per_frame_sync =3D pipelock_per_frame_sync(crtc_st=
ate);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/=
drm/i915/display/intel_pipelock.h
> index b08b10f8da34..b75efa71a831 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipelock.h
> +++ b/drivers/gpu/drm/i915/display/intel_pipelock.h
> @@ -9,7 +9,13 @@
>  #include <linux/types.h>
>=20=20
>  struct intel_connector;
> +struct intel_crtc_state;
>=20=20
>  bool intel_pipelock_connector_possible(const struct intel_connector *con=
nector);
> +bool intel_pipelock_possible(const struct intel_crtc_state *crtc_state,
> +			     struct intel_connector *connector);
> +bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state=
1,
> +			       const struct intel_crtc_state *crtc_state2);
> +void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state);
>=20=20
>  #endif /* __INTEL_PIPELOCK_H__ */

--=20
Jani Nikula, Intel
