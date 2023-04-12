Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE6C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B210E835;
	Wed, 12 Apr 2023 14:21:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BE810E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309261; x=1712845261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xT5h1D6d/V7QprHL4FPu22wwjt0Ss1Y7H38Phg5Nd2Y=;
 b=WaBTYKJN8ISLBEWBNhaphK1Ikboo1lKY+INTCe4x2dtCHN/R2D1+90fQ
 s3DpheKRjkjjPvk9RkQpsR/QwFGBqUOP/Etk9gbcgt6I72qQcsaeQQQXe
 vsU9Wj0ZqCN5VRQmn7sxfim5qTOG4EzY+RO5bo1jmkocxWFJIeiFY0H0o
 GZy4LfehBUdmNTvGGlFX/VehJJ/l1Y1j/XDYHcBkBwnQMeMrVCRPbqsoj
 HEtHOZE/qelhICnZm1t24ngLoA2wWTpmv1zxiYDAEjPexhCFkA+SH7R2q
 dzKi0mAEdJBlCM1ZmhsjO9o0i3ezoW++7eH5+5unxwLBGfdCLIik0Axj5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409048322"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="409048322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721584373"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721584373"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:28 +0300
Message-Id: <20230412142006.877109-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/41] drm/i915/display: add I915 conditional
 build to intel_dpio_phy.h
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpio_phy.h | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
index 855d96d670cd..882bf1bc6b6e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
@@ -27,6 +27,7 @@ enum dpio_phy {
 	DPIO_PHY2,
 };
 
+#ifdef I915
 void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 			     enum dpio_phy *phy, enum dpio_channel *ch);
 void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
@@ -71,5 +72,100 @@ void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state);
 void vlv_phy_reset_lanes(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *old_crtc_state);
+#else
+static inline void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
+					   enum dpio_phy *phy, enum dpio_channel *ch)
+{
+}
+static inline void bxt_ddi_phy_set_signal_levels(struct intel_encoder *encoder,
+						 const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void bxt_ddi_phy_init(struct drm_i915_private *dev_priv, enum dpio_phy phy)
+{
+}
+static inline void bxt_ddi_phy_uninit(struct drm_i915_private *dev_priv, enum dpio_phy phy)
+{
+}
+static inline bool bxt_ddi_phy_is_enabled(struct drm_i915_private *dev_priv,
+					  enum dpio_phy phy)
+{
+	return false;
+}
+static inline bool bxt_ddi_phy_verify_state(struct drm_i915_private *dev_priv,
+					    enum dpio_phy phy)
+{
+	return true;
+}
+static inline u8 bxt_ddi_phy_calc_lane_lat_optim_mask(u8 lane_count)
+{
+	return 0;
+}
+static inline void bxt_ddi_phy_set_lane_optim_mask(struct intel_encoder *encoder,
+						   u8 lane_lat_optim_mask)
+{
+}
+static inline u8 bxt_ddi_phy_get_lane_lat_optim_mask(struct intel_encoder *encoder)
+{
+	return 0;
+}
+static inline enum dpio_channel vlv_dig_port_to_channel(struct intel_digital_port *dig_port)
+{
+	return DPIO_CH0;
+}
+static inline enum dpio_phy vlv_dig_port_to_phy(struct intel_digital_port *dig_port)
+{
+	return DPIO_PHY0;
+}
+static inline enum dpio_channel vlv_pipe_to_channel(enum pipe pipe)
+{
+	return DPIO_CH0;
+}
+static inline void chv_set_phy_signal_level(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    u32 deemph_reg_value, u32 margin_reg_value,
+					    bool uniq_trans_scale)
+{
+}
+static inline void chv_data_lane_soft_reset(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    bool reset)
+{
+}
+static inline void chv_phy_pre_pll_enable(struct intel_encoder *encoder,
+					  const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void chv_phy_pre_encoder_enable(struct intel_encoder *encoder,
+					      const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void chv_phy_release_cl2_override(struct intel_encoder *encoder)
+{
+}
+static inline void chv_phy_post_pll_disable(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *old_crtc_state)
+{
+}
+
+static inline void vlv_set_phy_signal_level(struct intel_encoder *encoder,
+					    const struct intel_crtc_state *crtc_state,
+					    u32 demph_reg_value, u32 preemph_reg_value,
+					    u32 uniqtranscale_reg_value, u32 tx3_demph)
+{
+}
+static inline void vlv_phy_pre_pll_enable(struct intel_encoder *encoder,
+					  const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void vlv_phy_pre_encoder_enable(struct intel_encoder *encoder,
+					      const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void vlv_phy_reset_lanes(struct intel_encoder *encoder,
+				       const struct intel_crtc_state *old_crtc_state)
+{
+}
+#endif
 
 #endif /* __INTEL_DPIO_PHY_H__ */
-- 
2.39.2

