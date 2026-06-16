Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C220ECD98E8
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6724110EAD0;
	Tue, 16 Jun 2026 12:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N94s8Hij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDE910EAB6;
 Tue, 16 Jun 2026 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613921; x=1813149921;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bzq3qOizskgvqhOhUD8+rn56gc8qdAQcTyCzwi2Uafg=;
 b=N94s8HijoiyPgkxZ2IrIUVOs51H4rThuTud5qfemNY+FFDk9cQXYBhlj
 3weFuNAGZvVRf8MwhENkjIfYgKw7brfFhlXDGNlujcDfzKahCwAMpPSOU
 8raV7NMZDN1S/oqJYk7p57y8LnPdj3dvfajp9KJ+onMj7hRHhDhJLOb73
 I898p4Vmbnbp1YohARa6pmGN8lvxORhsfKxPhmNh0AgOggO0ImMOfFxZn
 0v/1l+IC74IW6PS9xnCVHWuWck2YiLl5Qg/5Oja54mlF+m/2uUwMDk309
 nNE44klEC1g5v8Bx4qULBNG+Lv/uM9KA1Bc+X3yRekdekWcF/OjcyW+KR w==;
X-CSE-ConnectionGUID: 2QG+WN9rTsCMrWNw651KRA==
X-CSE-MsgGUID: UM2qn/XWSpGH7gxGNoEzFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513226"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513226"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:21 -0700
X-CSE-ConnectionGUID: MEVJIrVGTm+ZTaCnYQ/hBw==
X-CSE-MsgGUID: CWTXM87tRfONlHBSLuMhlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876249"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:20 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 02/39] drm/i915/cmtg: Set CMTG clock select
Date: Tue, 16 Jun 2026 18:13:38 +0530
Message-ID: <20260616124416.2442161-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
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

