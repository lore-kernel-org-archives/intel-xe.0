Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8532606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dG+fJpJ1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12AE10E245;
	Wed,  4 Nov 2026 13:38:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDEB10E245;
 Wed,  4 Nov 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793799482; x=1825335482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+p2pLzspwvTHPVE9f8FEclpCV8tCWakVxeTa+Jv+3k=;
 b=dG+fJpJ1wWoxvOIAtpj4GCFmkfPhaNGtfG+1siJvNYxGB+g+ZfiuP1c+
 P8E/Veo6x8VwxUhk8lJ8OXDiNdt2u4nmIz63pN0t1gsvd8VIta8Jbekzf
 l4EfywZgX81Z4zMj2jIMY9LqU+UkEqp9Q7b6D3kbXEwGm/4egWTznntOR
 g6Tb7bSOCsPSKZ2zR8sUsxhuBU9CexUq9zCyDkRtt/nkyJ6D0UJ/csBke
 bsAM3YAdv71FrSJUBXC4C34nYUYrPhMbw6gIsqDAbEYNKfPeFHWNq5wwh
 NW+a5V7IaPlKMOSNnOtPYAlxjMmqaHIQkhrSmu5fKRgFh+l8i36wM8B2C w==;
X-CSE-ConnectionGUID: A4To+oJkSNiS+MD7kPdimA==
X-CSE-MsgGUID: mt5xZxJdRdOfKPV1SDzLiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2428001"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2428001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:38:02 -0800
X-CSE-ConnectionGUID: 8bih+4tLR3qTTeRU3CZbzw==
X-CSE-MsgGUID: t95Qh8UXR8yLrTSfNIs7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6585182"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:38:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/display: add and use INTEL_REG_INVALID macro
Date: Wed,  4 Nov 2026 15:37:57 +0200
Message-ID: <20261104133757.168881-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the future, the register typedefs and macros will be completely
separated between i915 and display. Add a display INTEL_REG_INVALID
macro to ease the transition away from INVALID_MMIO_REG.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 4 +++-
 drivers/gpu/drm/i915/display/intel_dmc.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c           | 4 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_encoder.c          | 4 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c             | 2 +-
 drivers/gpu/drm/i915/display/intel_pps.c              | 2 +-
 8 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 45cfc2758881..e21c237b39f4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4988,7 +4988,7 @@ static int intel_ddi_init_hdmi_connector(struct intel_digital_port *dig_port)
 		 * pins or not having enough lanes. Handle them gracefully, but
 		 * don't fail the entire DDI init.
 		 */
-		dig_port->hdmi.hdmi_reg = INVALID_MMIO_REG;
+		dig_port->hdmi.hdmi_reg = INTEL_REG_INVALID;
 		kfree(connector);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index 9220fcbfcb24..d50bcebd58e5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -10,6 +10,8 @@
 
 typedef i915_reg_t intel_reg_t;
 
+#define INTEL_REG_INVALID _MMIO(0)
+
 static inline u32 intel_reg_offset(intel_reg_t r)
 {
 	return r.reg;
@@ -22,7 +24,7 @@ static inline bool intel_reg_equal(intel_reg_t a, intel_reg_t b)
 
 static inline bool intel_reg_valid(intel_reg_t r)
 {
-	return !intel_reg_equal(r, INVALID_MMIO_REG);
+	return !intel_reg_equal(r, INTEL_REG_INVALID);
 }
 
 /* A triplet for IMR/IER/IIR registers. */
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 56e831b2a826..4f07201fc334 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1689,7 +1689,7 @@ static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
 	struct intel_display *display = m->private;
 	struct intel_dmc *dmc = display_to_dmc(display);
 	struct ref_tracker *wakeref;
-	intel_reg_t dc5_reg, dc6_reg = INVALID_MMIO_REG;
+	intel_reg_t dc5_reg, dc6_reg = INTEL_REG_INVALID;
 	u32 dc6_allowed_count;
 
 	if (!HAS_DMC(display))
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index ab4e0e9573df..c181c1a7ba08 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -504,10 +504,10 @@ void intel_dmc_wl_put(struct intel_display *display, intel_reg_t reg)
 
 void intel_dmc_wl_get_noreg(struct intel_display *display)
 {
-	intel_dmc_wl_get(display, INVALID_MMIO_REG);
+	intel_dmc_wl_get(display, INTEL_REG_INVALID);
 }
 
 void intel_dmc_wl_put_noreg(struct intel_display *display)
 {
-	intel_dmc_wl_put(display, INVALID_MMIO_REG);
+	intel_dmc_wl_put(display, INTEL_REG_INVALID);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index df0c258f53f1..b28fa4785c60 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -3815,7 +3815,7 @@ static void icl_dpll_write(struct intel_display *display,
 			   const struct icl_dpll_hw_state *hw_state)
 {
 	const enum intel_dpll_id id = pll->info->id;
-	intel_reg_t cfgcr0_reg, cfgcr1_reg, div0_reg = INVALID_MMIO_REG;
+	intel_reg_t cfgcr0_reg, cfgcr1_reg, div0_reg = INTEL_REG_INVALID;
 
 	if (display->platform.alderlake_s) {
 		cfgcr0_reg = ADLS_DPLL_CFGCR0(id);
diff --git a/drivers/gpu/drm/i915/display/intel_encoder.c b/drivers/gpu/drm/i915/display/intel_encoder.c
index d01b081a6074..86edcc62914e 100644
--- a/drivers/gpu/drm/i915/display/intel_encoder.c
+++ b/drivers/gpu/drm/i915/display/intel_encoder.c
@@ -112,8 +112,8 @@ struct intel_digital_port *intel_dig_port_alloc(void)
 	if (!dig_port)
 		return NULL;
 
-	dig_port->hdmi.hdmi_reg = INVALID_MMIO_REG;
-	dig_port->dp.output_reg = INVALID_MMIO_REG;
+	dig_port->hdmi.hdmi_reg = INTEL_REG_INVALID;
+	dig_port->dp.output_reg = INTEL_REG_INVALID;
 	dig_port->aux_ch = AUX_CH_NONE;
 	dig_port->max_lanes = 4;
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..4ec0db8d93fb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -198,7 +198,7 @@ hsw_dip_data_reg(struct intel_display *display,
 		return GLK_TVIDEO_DIP_DRM_DATA(display, cpu_transcoder, i);
 	default:
 		MISSING_CASE(type);
-		return INVALID_MMIO_REG;
+		return INTEL_REG_INVALID;
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 8f1bfe434097..442b00491a88 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -519,7 +519,7 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
 	/* Cycle delay moved from PP_DIVISOR to PP_CONTROL */
 	if (display->platform.geminilake || display->platform.broxton ||
 	    INTEL_PCH_TYPE(display) >= PCH_CNP)
-		regs->pp_div = INVALID_MMIO_REG;
+		regs->pp_div = INTEL_REG_INVALID;
 	else
 		regs->pp_div = PP_DIVISOR(display, pps_idx);
 }
-- 
2.47.3

