Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB195EF8FE5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12FA10E9E1;
	Wed,  4 Mar 2026 13:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgIdmWjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5410EA04;
 Wed,  4 Mar 2026 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630087; x=1804166087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0e8cNA7Hgmzf8l2opjZsSZbg+d1CpLkOJnczJ4j8Xg=;
 b=XgIdmWjK+5vTfwlY5eh8TiP4T0seSX70kxzRc4grG/OA91RvLkUF6SKG
 /TfeLtoOFsvzPKpXSw7zYAPiuW7Wrq9pv+gqIMvL3u1Z+W8VEHrNF1HEr
 zwf5uMtRpJvkiDEGbu3X65Q7VuyQeyrhuzXW6uC3Uu7dLJAU6Yw+XYtFZ
 MFE68i9IXe23ca4Fyx2sbn+EGv9HLsMwYAbLM2jrClgnDs2raXNILFbOh
 x1W1n9QAbBrqa4nfWFcm7wXUEgv1G19LzQoygYGjN8VEfwVuWBQYPxBEB
 7QtP9hMbMVgiBfrO/Q5quVJ4hHLWfGFTbBv2PNj0iv6YEAIWTtHfZBL2I g==;
X-CSE-ConnectionGUID: z/QWLk3ARrqGCHphw9BbIQ==
X-CSE-MsgGUID: ILcekXUBRMCfySvXNMDRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293481"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:47 -0800
X-CSE-ConnectionGUID: 7Z8z9OlkShapf5T0X/6MUw==
X-CSE-MsgGUID: zEiQAzDDRFqOO0Kct9TUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350844"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:46 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 18/24] drm/i915/lt_phy: Add .disable_clock hook on DDI
Date: Wed,  4 Mar 2026 13:14:17 +0000
Message-ID: <20260304131423.1017821-19-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Disable PLL clock on DDI by moving part of the PLL disabling
sequence into a DDI clock disabling function.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  1 +
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 51403d09c477..191ae7cf81fb 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5299,7 +5299,7 @@ void intel_ddi_init(struct intel_display *display,
 
 	if (HAS_LT_PHY(display)) {
 		encoder->enable_clock = intel_xe3plpd_pll_enable_clock;
-		encoder->disable_clock = intel_xe3plpd_pll_disable;
+		encoder->disable_clock = intel_xe3plpd_pll_disable_clock;
 		encoder->port_pll_type = intel_mtl_port_pll_type;
 		encoder->get_config = xe3plpd_ddi_get_config;
 	} else if (DISPLAY_VER(display) >= 14) {
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 54c7a255b3a5..28c560417409 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4607,8 +4607,20 @@ static void xe3plpd_pll_enable(struct intel_display *display,
 	intel_xe3plpd_pll_enable(encoder, pll, dpll_hw_state);
 }
 
+static void xe3plpd_pll_disable(struct intel_display *display,
+				struct intel_dpll *pll)
+{
+	struct intel_encoder *encoder = get_intel_encoder(display, pll);
+
+	if (drm_WARN_ON(display->drm, !encoder))
+		return;
+
+	intel_xe3plpd_pll_disable(encoder);
+}
+
 static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
 	.enable = xe3plpd_pll_enable,
+	.disable = xe3plpd_pll_disable,
 	.get_hw_state = xe3plpd_pll_get_hw_state,
 	.get_freq = xe3plpd_pll_get_freq,
 };
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 6bc32d1734a7..3230d2e28d9c 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2309,6 +2309,17 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
 		intel_mtl_tbt_pll_disable_clock(encoder);
 	else
 		intel_lt_phy_pll_disable(encoder);
+}
+
+void intel_xe3plpd_pll_disable_clock(struct intel_encoder *encoder)
+{
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+
+	if (intel_tc_port_in_tbt_alt_mode(dig_port))
+		intel_mtl_tbt_pll_disable_clock(encoder);
+	else
+		/* TODO: remove when PLL mgr is in place. */
+		intel_xe3plpd_pll_disable(encoder);
 
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 9188ce980119..3838e9326773 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -49,5 +49,6 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
 void intel_lt_phy_verify_plls(struct intel_display *display);
 void intel_xe3plpd_pll_enable_clock(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *crtc_state);
+void intel_xe3plpd_pll_disable_clock(struct intel_encoder *encoder);
 
 #endif /* __INTEL_LT_PHY_H__ */
-- 
2.43.0

