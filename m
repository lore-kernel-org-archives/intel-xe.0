Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE5606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APEzf/Fy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0441123E3;
	Thu, 26 Nov 2026 13:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D81123F7;
 Thu, 26 Nov 2026 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699553; x=1827235553;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=HQomLUyOjzobaNwZ216abVYh66BrMdgL/aiNmJGH/4A=;
 b=APEzf/FyrhymCrw6U3hwPt+4QXIrOHlAQGTzstbjwlHRBHN9IlpueBvr
 LKY9dp/K2hkYDmHppP7zVLf+3b9+A5qfnAq78bw/VRrsF/T9MRfbwRSdz
 0IWCIqa4r68HQ68WSLwytNekbC0yDTdFknSH6+0ImECn9crqygJs92TIe
 nLu0Ix7wLWqRKaHueXFVmQEtgp/1uwAPYQsHFsLeERSvqy+p6wvEZvAEU
 vaLZkHHddUSbm9WYnFgjOJBkCge4cf5IpYrCdySSfZ/dLWR3f1b+QSEp2
 HK/B1zDwx26SO9LScRSLq0fEyaE9GtxImAVK9Y2il7VCXwUMmW4vSfrhj w==;
X-CSE-ConnectionGUID: z9PLxBQrTE+qeoM8FamMMw==
X-CSE-MsgGUID: mqc3o+ITTAOOckT/tf9MJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4564501"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4564501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:25:52 -0800
X-CSE-ConnectionGUID: aBal8JBORi23Nz4XE6P3ig==
X-CSE-MsgGUID: kwCCb1d/TSCxS2fAuOKT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12399092"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:25:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 12/13] drm/i915/ddi_mgr: Handle DDI pool system suspend
 and resume
In-Reply-To: <20261126100755.1252635-13-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-13-imre.deak@intel.com>
Date: Thu, 26 Nov 2026 15:25:47 +0200
Message-ID: <8a94c7e3b2f58657a072ed654de3a031f2839fda@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 26 Nov 2026, Imre Deak <imre.deak@intel.com> wrote:
> Firmware may change DDI assignments during system suspend. Rebuild the
> legacy routes on normal resume after IRQ postinstall masks HPD, and
> refresh encoder VBT data, Type-C mode and lane reversal before hardware
> readout and modeset restore. Update the logical HPD pin to HW IRQ source
> mappings while keeping each encoder's logical pin fixed, so HPD block
> counts need not be moved between pins.
>
> Keep legacy assignments found in hardware. When a legacy PHY needs a
> new assignment, prefer its pre-suspend DDI before identity or other free
> DDIs, keeping the same DRM connector where possible.
>
> Rebuild source and common link limits when a route changes, resetting
> link-training/recovery state while retaining cached sink capabilities
> for normal resume and detection.
>
> Disable pool DDC adapters during suspend and restore their routes before
> the resume modeset. On failed xe suspend recovery, preserve cached
> allocations and HPD mappings because HW HPD IRQs stayed enabled
> throughout the sequence.
>
> When restoring the pre-suspend display configuration, reject modesets
> for HDMI connectors whose encoders no longer serve HDMI-capable legacy
> PHYs, or DP connectors whose encoders now serve legacy PHYs without DP
> support. If DDI configuration fails, switch the pool encoders to ALT-only
> operation, allowing DP restores while keeping HDMI unavailable.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 77 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |  2 +
>  .../drm/i915/display/intel_display_driver.c   |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |  9 +++
>  drivers/gpu/drm/i915/display/intel_dp.h       |  1 +
>  drivers/gpu/drm/i915/display/intel_tc.c       | 13 ++++
>  drivers/gpu/drm/i915/display/intel_tc.h       |  1 +
>  drivers/gpu/drm/i915/i915_driver.c            |  7 ++
>  drivers/gpu/drm/xe/display/xe_display.c       |  6 ++
>  9 files changed, 117 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> index 8f32e7c8dff27..a0157ff6afc04 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> @@ -840,6 +840,83 @@ static void update_hpd_sources(struct intel_display *display)
>  	}
>  }
>  
> +void intel_ddi_mgr_suspend(struct intel_display *display)
> +{
> +	if (!intel_ddi_mgr_is_enabled(display->ddi_mgr))
> +		return;
> +
> +	intel_gmbus_ddi_pool_update(display, false);
> +}
> +
> +static void resume_ddi_resource(struct intel_display *display,
> +				struct intel_encoder *encoder,
> +				const struct intel_ddi_route *old_route)
> +{
> +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> +	struct intel_digital_port *dig_port;
> +	const struct intel_ddi_route *route;
> +
> +	if (!encoder)
> +		return;
> +
> +	route = &mgr->route[encoder->port - PORT_TC1];
> +	dig_port = enc_to_dig_port(encoder);
> +	encoder->devdata = intel_ddi_mgr_get_devdata_for_ddi(display, encoder->port);
> +	intel_tc_port_set_legacy(dig_port, mgr->enabled &&
> +				route->mode == INTEL_DDI_ROUTE_LEGACY);
> +	dig_port->lane_reversal = intel_ddi_mgr_encoder_has_lane_reversal(encoder);
> +
> +	if (mgr->enabled && old_route->mode == route->mode &&
> +	    old_route->phy == route->phy)
> +		return;
> +
> +	intel_dp_update_source_caps(&dig_port->dp);
> +}
> +
> +static void resume_ddi_resources(struct intel_display *display)
> +{
> +	struct intel_ddi_mgr *mgr = display->ddi_mgr;
> +	struct intel_encoder *encoders[INTEL_DDI_MGR_NUM_PORTS] = {};
> +	struct intel_ddi_route old_route[INTEL_DDI_MGR_NUM_PORTS];
> +	struct intel_encoder *encoder;
> +	int ddi, err;
> +
> +	/* Only normal resume gets here, with HPD masked by IRQ postinstall. */
> +	memcpy(old_route, mgr->route, sizeof(old_route));
> +
> +	err = configure_ddi_resources(display, old_route);
> +	WRITE_ONCE(mgr->disabled_ddi_mask, 0);
> +	if (err)
> +		fallback_to_alt(mgr);
> +	else
> +		mgr->enabled = true;
> +
> +	update_hpd_sources(display);
> +
> +	if (err)
> +		drm_err(display->drm, "DDIMGR: Cannot restore DDI pool: %d; using ALT mode\n", err);
> +
> +	for_each_intel_encoder(display->drm, encoder)
> +		if (encoder->type == INTEL_OUTPUT_DDI &&
> +		    intel_ddi_mgr_is_pool_ddi(display, encoder->port))
> +			encoders[encoder->port - PORT_TC1] = encoder;
> +
> +	for (ddi = 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++)
> +		resume_ddi_resource(display, encoders[ddi], &old_route[ddi]);
> +}
> +
> +void intel_ddi_mgr_resume(struct intel_display *display, bool suspend_failed)
> +{
> +	if (!display->ddi_mgr)
> +		return;
> +
> +	/* Failed suspend leaves HPD IRQs enabled: preserve cached assignments. */
> +	if (!suspend_failed)
> +		resume_ddi_resources(display);
> +
> +	intel_gmbus_ddi_pool_update(display, true);
> +}
> +
>  static u8 legacy_ddi_mismatch_mask(const struct intel_ddi_mgr *mgr, u32 resources)
>  {
>  	u8 ddi_mask = 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> index fddd69564b84d..6ddb30e826d4c 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> @@ -14,6 +14,8 @@ struct intel_display;
>  struct intel_encoder;
>  
>  void intel_ddi_mgr_init(struct intel_display *display);
> +void intel_ddi_mgr_suspend(struct intel_display *display);
> +void intel_ddi_mgr_resume(struct intel_display *display, bool suspend_failed);
>  void intel_ddi_mgr_verify_state(struct intel_display *display);
>  
>  bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index b018608eae032..a9b03b4a1e76b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -780,6 +780,7 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
>  	intel_display_driver_suspend_access(display);
>  
>  	intel_encoder_suspend_all(display);
> +	intel_ddi_mgr_suspend(display);
>  
>  	intel_dmc_suspend(display);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6f03a169931eb..60f041bd62979 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -702,6 +702,15 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
>  	return params_changed;
>  }
>  
> +/* Rebuild source limits after selecting a different physical port's VBT data. */
> +void intel_dp_update_source_caps(struct intel_dp *intel_dp)
> +{
> +	intel_dp_set_source_rates(intel_dp);
> +	intel_dp->reset_link_params = true;
> +	intel_dp_set_common_link_params(intel_dp);
> +	intel_dp_reset_link_params(intel_dp);
> +}
> +
>  u32 intel_dp_mode_to_fec_clock(u32 mode_clock)
>  {
>  	return div_u64(mul_u32_u32(mode_clock, DP_DSC_FEC_OVERHEAD_FACTOR),
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 36cd340d809f2..072facf627eba 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -59,6 +59,7 @@ void intel_dp_connector_sync_state(struct intel_connector *connector,
>  void intel_dp_set_link_params(struct intel_dp *intel_dp,
>  			      int link_rate, int lane_count);
>  void intel_dp_set_source_rates(struct intel_dp *intel_dp);
> +void intel_dp_update_source_caps(struct intel_dp *intel_dp);
>  int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
>  			      struct drm_modeset_acquire_ctx *ctx,
>  			      u8 *pipe_mask);
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index e01f367007424..df591966e08ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -1595,6 +1595,19 @@ static bool tc_port_is_enabled(struct intel_tc_port *tc)
>  	       DDI_BUF_CTL_ENABLE;
>  }
>  
> +void intel_tc_port_set_legacy(struct intel_digital_port *dig_port, bool legacy)
> +{
> +	struct intel_display *display = to_intel_display(dig_port);
> +	struct intel_tc_port *tc = to_tc_port(dig_port);
> +
> +	mutex_lock(&tc->lock);
> +
> +	drm_WARN_ON(display->drm, tc->mode != TC_PORT_DISCONNECTED || tc->link_refcount);
> +	tc->legacy_port = legacy;
> +
> +	mutex_unlock(&tc->lock);
> +}
> +
>  /**
>   * intel_tc_port_init_mode: Read out HW state and init the given port's TypeC mode
>   * @dig_port: digital port
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm/i915/display/intel_tc.h
> index 6719aea5bd582..6d32eeb91d8da 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.h
> +++ b/drivers/gpu/drm/i915/display/intel_tc.h
> @@ -96,6 +96,7 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
>  				      int required_lanes);
>  
>  void intel_tc_port_init_mode(struct intel_digital_port *dig_port);
> +void intel_tc_port_set_legacy(struct intel_digital_port *dig_port, bool legacy);
>  void intel_tc_port_sanitize_mode(struct intel_digital_port *dig_port,
>  				 const struct intel_crtc_state *crtc_state);
>  void intel_tc_port_lock(struct intel_digital_port *dig_port);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 923b239714b7e..8f87ad87d45ac 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -54,6 +54,7 @@
>  #include "display/i9xx_display_sr.h"
>  #include "display/intel_cdclk.h"
>  #include "display/intel_crtc.h"
> +#include "display/intel_ddi_mgr.h"
>  #include "display/intel_display_device.h"
>  #include "display/intel_display_driver.h"
>  #include "display/intel_display_power.h"
> @@ -1237,6 +1238,12 @@ static int i915_drm_resume(struct drm_device *dev)
>  	 */
>  	intel_irq_resume(dev_priv);
>  
> +	/*
> +	 * TODO: Move this to display code, keeping it before
> +	 * drm_mode_config_reset().
> +	 */

Why not do it now?

> +	intel_ddi_mgr_resume(display, false);
> +
>  	if (intel_display_device_present(display))
>  		drm_mode_config_reset(dev);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index b36a7cc83420d..a267dc9ed93d4 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -301,6 +301,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed)
>  
>  	intel_dmc_resume(display);
>  
> +	/*
> +	 * TODO: Move this to display code, keeping it before
> +	 * drm_mode_config_reset().
> +	 */
> +	intel_ddi_mgr_resume(display, suspend_failed);
> +
>  	if (intel_display_device_present(display))
>  		drm_mode_config_reset(&xe->drm);

-- 
Jani Nikula, Intel
