Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED84AC982D2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99610E659;
	Thu, 17 Sep 2026 05:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4rLm1Yd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A710E386;
 Thu, 17 Sep 2026 05:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789621669; x=1821157669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lqjTAwwGTYbbKjsOZHdcMZXd6QDabSxLxK0wGvh+zXQ=;
 b=G4rLm1YdHtt591purUeACm+lZjmn+DeJ3dS8RxtNRnJvi8sXB0xofIH9
 96hHenDBthswGKmgzEZ1nMZXxL08CD7GnxmWlle6Wj6C/tQIHI0Yu1yI0
 qSJJQss7XmPTwddcxjDPm6j88IWKreOsrfvsmFkkJoZAb9cLaKZULxqtY
 We2qmTWkPDDycD4hCjbApjtmTk8hS3NlRs7Xsxf8zQy7veabqG3ZyIrAN
 kokBU1+ifmF7J13gVXP+n3JKqQOIVWd2HzbN+QPezUnx2V/3FptLLRbkL
 z+MGn0N9du2aV/5LLp22Ek0vxXcHecv5cUOWV+rDUGhdik9Ouv3J7F6Zn w==;
X-CSE-ConnectionGUID: JRKrUZb0T/KfGNt8hBT/TA==
X-CSE-MsgGUID: cRuFacWmTEGmvpca1jgs4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77569711"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77569711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:07:48 -0700
X-CSE-ConnectionGUID: oZ9Ekf6eSb24SZz4uiu/PA==
X-CSE-MsgGUID: Dm1SR1kURC21Jj/L0ABJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278799077"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 22:07:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792 for
 linkm/n ratio > 10
Date: Thu, 17 Sep 2026 10:36:46 +0530
Message-Id: <20260917050649.871960-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

To support a Link M/N ratio between 10.0 and 15.0, for some BMG
ultrajoiner cases we need Wa_14021768792.

To bypass the hardware limitation within the Timing Generator DDA
(TGDDA), we need to program the LINKM and LINKN registers as defined in
the WA. Along with this we also need the relevant bits in HDMI_EMP_DATA
and CHICKEN_TRANS.

Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to
track if we need to bypass the Link M/N ratio limit in the
intel_link_m_n structure.

Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold
INT(Link M / Link N) and bits 31:28 hold CEIL(Link M / Link N).

CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N, since
writing LINK_N arms the double buffered update of the M/N registers, and
all of the programming has to be done before the transcoder is enabled.
Both are also explicitly cleared when the mechanism is not in use, so
that state cannot leak from a previous modeset.

Only bypass_m_n_ratio_limit is compared by the state checker, not the
ratio integer and fraction themselves. That is deliberate: both are
derived from Link M and Link N, which are compared already, so the thing
worth verifying is whether the workaround ended up being applied or not.

Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
are not double buffered, so the flag has to be compared outside the
fastset exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
Otherwise a seamless M/N update could switch the DDA out of the
workaround on a live transcoder, with the Link M/N values only following
at the next MSA.

v2:
-Drop the drm_WARN_ON() on the extended LINK_N field in intel_get_m_n():
it is derived from Link M and Link N, so the state checker comparison of
those and of bypass_m_n_ratio_limit already covers it. (Sashiko)
-Compare bypass_m_n_ratio_limit unconditionally, so that a change to it
forces a full modeset instead of being applied during a seamless M/N
fastset. (Sashiko)

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 93 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |  2 +
 .../gpu/drm/i915/display/intel_display_regs.h | 10 ++
 .../drm/i915/display/intel_display_types.h    |  2 +
 4 files changed, 102 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6d2025e10995..1e9d8943626a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2706,6 +2706,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
 	m_n->tu = 1;
 }
 
+static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n)
+{
+	if (!m_n->link_n)
+		return 0;
+
+	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
+		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m, m_n->link_n));
+}
+
 void intel_set_m_n(struct intel_display *display,
 		   const struct intel_link_m_n *m_n,
 		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
@@ -2717,7 +2726,9 @@ void intel_set_m_n(struct intel_display *display,
 	intel_de_write(display, data_n_reg, m_n->data_n);
 	intel_de_write(display, link_m_reg, m_n->link_m);
 
-	if (DISPLAY_VER(display) >= 14)
+	if (DISPLAY_VER(display) >= 14 && m_n->bypass_m_n_ratio_limit)
+		link_n |= PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
+	else if (DISPLAY_VER(display) >= 14)
 		link_n &= ~PIPE_LINK_N1_EXTENDED_MASK;
 	else
 		link_n &= DATA_LINK_M_N_MASK;
@@ -2738,6 +2749,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display,
 	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
 }
 
+static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
+				     enum transcoder transcoder,
+				     const struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	bool enable = m_n->bypass_m_n_ratio_limit && m_n->link_n;
+	u32 link_m_frac = enable ? m_n->link_m % m_n->link_n : 0;
+
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
+		return;
+
+	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
+		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
+		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK, link_m_frac));
+
+	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
+		     DP_ENHANCED_TGDDA_ENABLE,
+		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0);
+}
+
 void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
@@ -2745,6 +2776,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 	struct intel_display *display = to_intel_display(crtc);
 	enum pipe pipe = crtc->pipe;
 
+	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
+
 	if (DISPLAY_VER(display) >= 5)
 		intel_set_m_n(display, m_n,
 			      PIPE_DATA_M1(display, transcoder),
@@ -3495,6 +3528,49 @@ void intel_get_m_n(struct intel_display *display,
 	m_n->tu = REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_reg)) + 1;
 }
 
+bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
+					int m_n_ratio,
+					enum pipe pipe)
+{
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
+		return false;
+
+	if (m_n_ratio > 15)
+		return false;
+
+	if (pipe != PIPE_A)
+		return false;
+
+	return true;
+}
+
+static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
+				    enum transcoder transcoder,
+				    struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	u32 link_m_frac;
+	int m_n_ratio;
+
+	if (!m_n->link_n)
+		return;
+
+	m_n_ratio = DIV_ROUND_UP(m_n->link_m, m_n->link_n);
+
+	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc->pipe))
+		return;
+
+	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
+	      DP_ENHANCED_TGDDA_ENABLE))
+		return;
+
+	link_m_frac = REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
+				    intel_de_read(display, HDMI_EMP_DATA(display, transcoder)));
+
+	if (link_m_frac == m_n->link_m % m_n->link_n)
+		m_n->bypass_m_n_ratio_limit = true;
+}
+
 void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
@@ -3512,6 +3588,8 @@ void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 		intel_get_m_n(display, m_n,
 			      PIPE_DATA_M_G4X(pipe), PIPE_DATA_N_G4X(pipe),
 			      PIPE_LINK_M_G4X(pipe), PIPE_LINK_N_G4X(pipe));
+
+	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
 }
 
 void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
@@ -5002,7 +5080,8 @@ intel_compare_link_m_n(const struct intel_link_m_n *m_n,
 		m_n->data_m == m2_n2->data_m &&
 		m_n->data_n == m2_n2->data_n &&
 		m_n->link_m == m2_n2->link_m &&
-		m_n->link_n == m2_n2->link_n;
+		m_n->link_n == m2_n2->link_n &&
+		m_n->bypass_m_n_ratio_limit == m2_n2->bypass_m_n_ratio_limit;
 }
 
 static bool
@@ -5277,18 +5356,20 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	if (!intel_compare_link_m_n(&current_config->name, \
 				    &pipe_config->name)) { \
 		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
-				     "(expected tu %i data %i/%i link %i/%i, " \
-				     "found tu %i, data %i/%i link %i/%i)", \
+				     "(expected tu %i data %i/%i link %i/%i m_n_bypass %s, " \
+				     "found tu %i, data %i/%i link %i/%i m_n_bypass %s)", \
 				     current_config->name.tu, \
 				     current_config->name.data_m, \
 				     current_config->name.data_n, \
 				     current_config->name.link_m, \
 				     current_config->name.link_n, \
+				     str_yes_no(current_config->name.bypass_m_n_ratio_limit), \
 				     pipe_config->name.tu, \
 				     pipe_config->name.data_m, \
 				     pipe_config->name.data_n, \
 				     pipe_config->name.link_m, \
-				     pipe_config->name.link_n); \
+				     pipe_config->name.link_n, \
+				     str_yes_no(pipe_config->name.bypass_m_n_ratio_limit)); \
 		ret = false; \
 	} \
 } while (0)
@@ -5436,6 +5517,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_M_N(dp_m2_n2);
 	}
 
+	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
+
 	PIPE_CONF_CHECK_X(output_types);
 
 	PIPE_CONF_CHECK_I(framestart_delay);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 404168f4213b..55e676655120 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct intel_display *display);
 int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
 void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
 				    int pixel_clock, int link_symbol_clock);
+bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
+					int m_n_ratio, enum pipe pipe);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 57f388c958b4..81f9661357b6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -550,6 +550,11 @@
 #define _TRANS_MULT_B		0x6102c
 #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans), _TRANS_MULT_A)
 
+#define _HDMI_EMP_DATA_A	0x600d8
+#define _HDMI_EMP_DATA_B	0x610d8
+#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
+#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display), (trans), _HDMI_EMP_DATA_A)
+
 /* Hotplug control (945+ only) */
 #define PORT_HOTPLUG_EN(dev_priv)		_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
 #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
@@ -1192,6 +1197,10 @@
 #define _PIPEB_LINK_N1		0x61044
 #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
 #define  PIPE_LINK_N1_EXTENDED(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
+#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
+#define  PIPE_LINK_N1_EXT_CEIL(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
+#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
+#define  PIPE_LINK_N1_EXT_INT(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))
 #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran, _PIPEA_LINK_N1)
 
 #define _PIPEA_LINK_M2		0x60048
@@ -1710,6 +1719,7 @@
 #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
 #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
 #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
+#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
 #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
 #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index a5f18ac8a7d0..7a5286db977e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -985,6 +985,8 @@ struct intel_link_m_n {
 	u32 data_n;
 	u32 link_m;
 	u32 link_n;
+	/* Wa_14021768792 for linkm/n ratio > 10 */
+	bool bypass_m_n_ratio_limit;
 };
 
 struct intel_csc_matrix {
-- 
2.34.1

