Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0DCC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 07:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6BC10E3AA;
	Tue,  8 Aug 2023 07:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EA110E3AA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691480823; x=1723016823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IoyF+moFDTOuaOvtGqEieiANWRCkEmHTlT2uS/epL3A=;
 b=gQx//oGfvFtVydmayeWaK7J2VwqpApteZdrxudFuEMJKPBvAwmbR+IsP
 Pl6l9Y9sWbB9IXzmbzhciDYME8mp9NUefyzjnyDfK+x3H85h7w+uTDTHZ
 8xMYWW6/r1GJ39/x2QNDmqFTPY30R33j+lbUsY28uAZMzNWIiMOL4UEWz
 uWvAB0bgEHvtdv0NfALLMTQ4Q0DT5y5bNFroWgjwa17jcAPX4hXg/UsSW
 VN6Z/wCJsKiCjrKnrDe5Xn6rebp5CLyhfFFaoQtYmVtN0pVbOzo2YWjVL
 gvAl8Y+rGX58K3GzwZra54DaS9c/NioAwrnVS9VvjhLRCvr+OYbtP2dEZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457132265"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="457132265"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 00:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734398574"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="734398574"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 00:47:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZNFrijjUJNUJOWzw@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230803105352.789000-1-jani.nikula@intel.com>
 <ZNFrijjUJNUJOWzw@intel.com>
Date: Tue, 08 Aug 2023 10:46:59 +0300
Message-ID: <87o7jit1qk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 07 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Aug 03, 2023 at 01:53:52PM +0300, Jani Nikula wrote:
>> Remove some changes completely unrelated to building for xe.
>> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, pushed.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_color.c             | 1 -
>>  drivers/gpu/drm/i915/display/intel_display.c           | 6 +++---
>>  drivers/gpu/drm/i915/display/intel_display.h           | 1 -
>>  drivers/gpu/drm/i915/display/intel_display_power_map.c | 1 +
>>  drivers/gpu/drm/i915/display/intel_display_rps.c       | 1 -
>>  drivers/gpu/drm/i915/display/intel_dp.c                | 2 +-
>>  drivers/gpu/drm/i915/display/intel_dpio_phy.h          | 1 -
>>  drivers/gpu/drm/i915/display/intel_dpll.c              | 1 +
>>  drivers/gpu/drm/i915/display/intel_dsb.c               | 1 -
>>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c           | 6 ++++--
>>  drivers/gpu/drm/i915/display/intel_pipe_crc.c          | 1 -
>>  drivers/gpu/drm/i915/display/intel_pps.c               | 1 -
>>  drivers/gpu/drm/i915/display/intel_sprite.c            | 2 --
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c     | 2 +-
>>  14 files changed, 11 insertions(+), 16 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>> index ccc4b636c2b8..8966e6560516 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -26,7 +26,6 @@
>>  #include "intel_color.h"
>>  #include "intel_de.h"
>>  #include "intel_display_types.h"
>> -#include "intel_dpll.h"
>>  #include "intel_dsb.h"
>>  
>>  struct intel_color_funcs {
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 45a932c9b1b3..f9eda7ad892e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -7423,7 +7423,7 @@ static u32 intel_encoder_possible_crtcs(struct intel_encoder *encoder)
>>  	return possible_crtcs;
>>  }
>>  
>> -static inline bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
>> +static bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
>>  {
>>  	if (!IS_MOBILE(dev_priv))
>>  		return false;
>> @@ -7437,7 +7437,7 @@ static inline bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
>>  	return true;
>>  }
>>  
>> -static inline bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
>> +static bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
>>  {
>>  	if (DISPLAY_VER(dev_priv) >= 9)
>>  		return false;
>> @@ -7468,6 +7468,7 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port)
>>  void intel_setup_outputs(struct drm_i915_private *dev_priv)
>>  {
>>  	struct intel_encoder *encoder;
>> +	bool dpd_is_edp = false;
>>  
>>  	intel_pps_unlock_regs_wa(dev_priv);
>>  
>> @@ -7491,7 +7492,6 @@ void intel_setup_outputs(struct drm_i915_private *dev_priv)
>>  		if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>>  			vlv_dsi_init(dev_priv);
>>  	} else if (HAS_PCH_SPLIT(dev_priv)) {
>> -		bool dpd_is_edp = false;
>>  		int found;
>>  
>>  		/*
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
>> index 8b8ea8a4a7b0..991461d9c221 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display.h
>> @@ -429,7 +429,6 @@ int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
>>  		      const char *name, u32 reg, int ref_freq);
>>  int vlv_get_cck_clock_hpll(struct drm_i915_private *dev_priv,
>>  			   const char *name, u32 reg);
>> -void intel_hpd_poll_fini(struct drm_i915_private *i915);
>>  void intel_init_display_hooks(struct drm_i915_private *dev_priv);
>>  unsigned int intel_fb_xy_to_linear(int x, int y,
>>  				   const struct intel_plane_state *state,
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> index be0c5a945669..5ad04cd42c15 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> @@ -5,6 +5,7 @@
>>  
>>  #include "i915_drv.h"
>>  #include "i915_reg.h"
>> +
>>  #include "vlv_sideband_reg.h"
>>  
>>  #include "intel_display_power_map.h"
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
>> index 8c81f542e5e8..918d0327169a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_rps.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
>> @@ -7,7 +7,6 @@
>>  #include <drm/drm_vblank.h>
>>  
>>  #include "gt/intel_rps.h"
>> -
>>  #include "i915_drv.h"
>>  #include "intel_display_rps.h"
>>  #include "intel_display_types.h"
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 5427ce10c06f..9f40da20e88d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -5416,8 +5416,8 @@ intel_edp_add_properties(struct intel_dp *intel_dp)
>>  static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
>>  				      struct intel_connector *connector)
>>  {
>> -	enum pipe pipe = INVALID_PIPE;
>>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>> +	enum pipe pipe = INVALID_PIPE;
>>  
>>  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>>  		/*
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
>> index 882bf1bc6b6e..4d43dbbdf81c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
>> @@ -7,7 +7,6 @@
>>  #define __INTEL_DPIO_PHY_H__
>>  
>>  #include <linux/types.h>
>> -#include "intel_display.h"
>>  
>>  enum pipe;
>>  enum port;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
>> index dab8dd915282..999badfe2906 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpll.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpll.c
>> @@ -2054,6 +2054,7 @@ void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
>>  	intel_de_posting_read(dev_priv, DPLL(pipe));
>>  }
>>  
>> +
>>  /**
>>   * vlv_force_pll_off - forcibly disable just the PLL
>>   * @dev_priv: i915 private structure
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
>> index 3830309aacf4..70d3a41e8b35 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
>> @@ -15,7 +15,6 @@
>>  #include "i915_drv.h"
>>  #include "i915_reg.h"
>>  #include "intel_de.h"
>> -#include "intel_dsb.h"
>>  #include "intel_display_types.h"
>>  #include "intel_dsb.h"
>>  #include "intel_dsb_regs.h"
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> index 173607ab8560..e56ec3f2d84a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -831,7 +831,9 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>>  	intel_dsi->eotp_pkt = mipi_config->eot_pkt_disabled ? 0 : 1;
>>  	intel_dsi->clock_stop = mipi_config->enable_clk_stop ? 1 : 0;
>>  	intel_dsi->lane_count = mipi_config->lane_cnt + 1;
>> -	intel_dsi->pixel_format = mipi_config->videomode_color_format << 7;
>> +	intel_dsi->pixel_format =
>> +			pixel_format_from_register_bits(
>> +				mipi_config->videomode_color_format << 7);
>>  
>>  	intel_dsi->dual_link = mipi_config->dual_link;
>>  	intel_dsi->pixel_overlap = mipi_config->pixel_overlap;
>> @@ -845,7 +847,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>>  	intel_dsi->init_count = mipi_config->master_init_timer;
>>  	intel_dsi->bw_timer = mipi_config->dbi_bw_timer;
>>  	intel_dsi->video_frmt_cfg_bits =
>> -		mipi_config->bta_enabled ? BIT(3) : 0;
>> +		mipi_config->bta_enabled ? DISABLE_VIDEO_BTA : 0;
>>  	intel_dsi->bgr_enabled = mipi_config->rgb_flip;
>>  
>>  	/* Starting point, adjusted depending on dual link and burst mode */
>> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
>> index 57a576097b47..5a468ed6e26c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
>> @@ -34,7 +34,6 @@
>>  #include "intel_de.h"
>>  #include "intel_display_types.h"
>>  #include "intel_pipe_crc.h"
>> -#include "i915_irq.h"
>>  
>>  static const char * const pipe_crc_sources[] = {
>>  	[INTEL_PIPE_CRC_SOURCE_NONE] = "none",
>> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
>> index 19558895c360..73f0f1714b37 100644
>> --- a/drivers/gpu/drm/i915/display/intel_pps.c
>> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
>> @@ -11,7 +11,6 @@
>>  #include "intel_display_types.h"
>>  #include "intel_dp.h"
>>  #include "intel_dpio_phy.h"
>> -#include "intel_dpio_phy.h"
>>  #include "intel_dpll.h"
>>  #include "intel_lvds.h"
>>  #include "intel_lvds_regs.h"
>> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
>> index d9713094735b..25034bbf1445 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
>> @@ -40,7 +40,6 @@
>>  
>>  #include "i915_drv.h"
>>  #include "i915_reg.h"
>> -#include "i915_vgpu.h"
>>  #include "i9xx_plane.h"
>>  #include "intel_atomic_plane.h"
>>  #include "intel_de.h"
>> @@ -1666,4 +1665,3 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
>>  
>>  	return ERR_PTR(ret);
>>  }
>> -
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index 1064af3c80d8..3c212d8401c8 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -1336,7 +1336,7 @@ skl_plane_async_flip(struct intel_plane *plane,
>>  			  skl_plane_surf(plane_state, 0));
>>  }
>>  
>> -static inline bool intel_format_is_p01x(u32 format)
>> +static bool intel_format_is_p01x(u32 format)
>>  {
>>  	switch (format) {
>>  	case DRM_FORMAT_P010:
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
