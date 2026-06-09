Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A060CD8CBD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984F10E2C8;
	Tue,  9 Jun 2026 12:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKzzHGZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDF810E2AF;
 Tue,  9 Jun 2026 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006623; x=1812542623;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jq2bt+iH8U+K/wuhR1EpYfftdPHHfc4VZEfDf7pP7VI=;
 b=iKzzHGZs67PJs/a8s2s4TRT1cidgdO8vIQWHtUiBeBBQh1VpGCii2kFw
 tKw5GHDYm7PiIF9LTbvSQBUFYYHnmd8eVUO+uWLinyjlOwJpW1ak3uv7W
 2PHbjVlNKjUpbPgWiztm6HptkxVfLFMDJP35Yo8D6pzBH/hANQQBdCmVC
 wg+NNWHEFEWa0pwjStHRyxQyIdujwf9xyojL9wx+CtNV/T2l0UKg3Evxd
 onCH+rCAS98rUyn6xf1XWxvqsU7bfRnyjyRCGLxZOCDyltSt9LX0AMML1
 fXdwhut1Zdrz+PxXucYQsf178SBEGoltxdR4BodVFUBPdCEwv4sNCdhkG g==;
X-CSE-ConnectionGUID: vD4QgwGDSCiYsRnw8zgFLw==
X-CSE-MsgGUID: MPsTJzCuRW+t1dlVMYQOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340299"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:43 -0700
X-CSE-ConnectionGUID: xATU3b9BRPS1R8sH2+CGtw==
X-CSE-MsgGUID: N8bZLensSxWwS0NDCrHleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988234"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:42 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 02/36] drm/i915/cmtg: Set CMTG clock select
Date: Tue,  9 Jun 2026 17:32:16 +0530
Message-ID: <20260609120250.867750-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

Program the CMTG Clock Select register based on the transcoder used.

v2:
- Correct mask for PHY B. [Jani]
- Use REG_FIELD_PREP() for enable value. [Dibin]
- Extend cmtg clock select for xe3plpd. [Dibin]

v3:
- CMTG support removed for old platform.

v4:
- Optimize further with else-if. [Uma]
- Correct CMTG_CLK_SEL_B_MASK. [Uma]

v5:
- Add transcoder-port compatibility check. [Dibin]

Bspec: 69103
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 22 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  1 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 11 ++++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index a279f3dcd1ec..fbc8a4f2b9cb 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -197,3 +197,25 @@ bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
 
 	return false;
 }
+
+void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 clk_sel_clr = 0;
+	u32 clk_sel_set = 0;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	if (cpu_transcoder == TRANSCODER_A) {
+		clk_sel_clr = CMTG_CLK_SEL_A_MASK;
+		clk_sel_set = CMTG_CLK_SELECT_PHYA_ENABLE;
+	} else if (cpu_transcoder == TRANSCODER_B) {
+		clk_sel_clr = CMTG_CLK_SEL_B_MASK;
+		clk_sel_set = CMTG_CLK_SELECT_PHYB_ENABLE;
+	}
+
+	if (clk_sel_set)
+		intel_de_rmw(display, CMTG_CLK_SEL, clk_sel_clr, clk_sel_set);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index ed540581738f..87092ce6d67b 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index 945a35578284..4a80b88d88fd 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -10,8 +10,10 @@
 
 #define CMTG_CLK_SEL			_MMIO(0x46160)
 #define CMTG_CLK_SEL_A_MASK		REG_GENMASK(31, 29)
+#define CMTG_CLK_SELECT_PHYA_ENABLE	REG_FIELD_PREP(CMTG_CLK_SEL_A_MASK, 0x4)
 #define CMTG_CLK_SEL_A_DISABLED		REG_FIELD_PREP(CMTG_CLK_SEL_A_MASK, 0)
 #define CMTG_CLK_SEL_B_MASK		REG_GENMASK(15, 13)
+#define CMTG_CLK_SELECT_PHYB_ENABLE	REG_FIELD_PREP(CMTG_CLK_SEL_B_MASK, 0x6)
 #define CMTG_CLK_SEL_B_DISABLED		REG_FIELD_PREP(CMTG_CLK_SEL_B_MASK, 0)
 
 #define TRANS_CMTG_CTL_A		_MMIO(0x6fa88)
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 24a51ab21b55..452062417ce9 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -9,6 +9,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_alpm.h"
+#include "intel_cmtg.h"
 #include "intel_cx0_phy.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_display_regs.h"
@@ -3418,10 +3419,20 @@ void intel_mtl_pll_enable(struct intel_encoder *encoder,
 void intel_mtl_pll_enable_clock(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 
 	if (intel_tc_port_in_tbt_alt_mode(dig_port))
 		intel_mtl_tbt_pll_enable_clock(encoder, crtc_state->port_clock);
+
+	/*
+	 * CMTG can be enabled only when the transcoder and port are compatible
+	 * (transcoder A with port A, transcoder B with port B).
+	 */
+	if (HAS_LT_PHY(display) &&
+	    ((crtc_state->cpu_transcoder == TRANSCODER_A && encoder->port == PORT_A) ||
+	     (crtc_state->cpu_transcoder == TRANSCODER_B && encoder->port == PORT_B)))
+		intel_cmtg_set_clk_select(crtc_state);
 }
 
 /*
-- 
2.43.0

