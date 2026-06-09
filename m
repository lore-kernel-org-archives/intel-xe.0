Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D295CD98C4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021410E2DD;
	Tue,  9 Jun 2026 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNv+hQ6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6986010E2AF;
 Tue,  9 Jun 2026 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006636; x=1812542636;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OYYWi8zkSHVH2m8bG/UqYqnpjcB6nadmNNvjvaG6T2A=;
 b=iNv+hQ6wDW4QTghZpxI/NxmP2QDsiYvZwib72ynlrXmT0oyD0cF0pgTs
 fQyldBlFnJedVUPzxB+Zau76QKEMhPv3jlL18/HDZ1RzyUZs2lFs5Iyt3
 v/lQkgyZcMfguvgbZI7UHAd4f7udan/wQEj6HlEw2TwmaSarF3gIemRpw
 cX+Z+02s3G/DgIEZqsXOemMm72QihHVnSa7i+jI1AR7+JD1c+3lUpSGEc
 qw7sDsSd06w8j28yG+LqToowmGO5nSZxsP6fbbZq4ZfBWkLhdQ01rp9iz
 buwSfxki+c69kTc1Aa59JvaIKghAsdyLNXewXs2MV/Lx3zUFRFqVGmiSd A==;
X-CSE-ConnectionGUID: CFaVGs06S3eafyFTYoBBaA==
X-CSE-MsgGUID: 8O0g7/4VTeKUpoYAP7yb5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340378"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:56 -0700
X-CSE-ConnectionGUID: yuLA4K/lRMCipf91GtdYuA==
X-CSE-MsgGUID: JN9Obg9qQDSEazQVXLivBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988279"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:55 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 12/36] drm/i915/cmtg: Add hook to enable CMTG with sync to port
Date: Tue,  9 Jun 2026 17:32:26 +0530
Message-ID: <20260609120250.867750-13-dibin.moolakadan.subrahmanian@intel.com>
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

Add a hook to enable CMTG by programming CMTG CTL with Sync to Port.
When CMTG starts running, the Sync to Port bit will be cleared. Add
a wait to check its running status and trigger WARN_ON() on timeout.

Bspec: 69088
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 27 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  1 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  7 +++--
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 94215f455471..5780a48363e4 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -105,11 +105,11 @@ static void intel_cmtg_get_config(struct intel_display *display,
 {
 	u32 val;
 
-	val = intel_de_read(display, TRANS_CMTG_CTL_A);
+	val = intel_de_read(display, TRANS_CMTG_CTL(TRANSCODER_A));
 	cmtg_config->cmtg_a_enable = val & CMTG_ENABLE;
 
 	if (intel_cmtg_has_cmtg_b(display)) {
-		val = intel_de_read(display, TRANS_CMTG_CTL_B);
+		val = intel_de_read(display, TRANS_CMTG_CTL(TRANSCODER_B));
 		cmtg_config->cmtg_b_enable = val & CMTG_ENABLE;
 	}
 
@@ -142,14 +142,14 @@ static void intel_cmtg_disable(struct intel_display *display,
 
 	if (cmtg_config->cmtg_a_enable) {
 		drm_dbg_kms(display->drm, "Disabling CMTG A\n");
-		intel_de_rmw(display, TRANS_CMTG_CTL_A, CMTG_ENABLE, 0);
+		intel_de_rmw(display, TRANS_CMTG_CTL(TRANSCODER_A), CMTG_ENABLE, 0);
 		clk_sel_clr |= CMTG_CLK_SEL_A_MASK;
 		clk_sel_set |= CMTG_CLK_SEL_A_DISABLED;
 	}
 
 	if (cmtg_config->cmtg_b_enable) {
 		drm_dbg_kms(display->drm, "Disabling CMTG B\n");
-		intel_de_rmw(display, TRANS_CMTG_CTL_B, CMTG_ENABLE, 0);
+		intel_de_rmw(display, TRANS_CMTG_CTL(TRANSCODER_B), CMTG_ENABLE, 0);
 		clk_sel_clr |= CMTG_CLK_SEL_B_MASK;
 		clk_sel_set |= CMTG_CLK_SEL_B_DISABLED;
 	}
@@ -288,3 +288,22 @@ void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state)
 	intel_de_write(display, PIPE_LINK_M1(display, cmtg_transcoder), m_n->link_m);
 	intel_de_write(display, PIPE_LINK_N1(display, cmtg_transcoder), m_n->link_n);
 }
+
+void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 cmtg_ctl;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	cmtg_ctl = CMTG_SYNC_TO_PORT | CMTG_ENABLE;
+
+	intel_de_rmw(display, TRANS_CMTG_CTL(cpu_transcoder), 0, cmtg_ctl);
+	if (intel_de_wait_for_clear_ms(display, TRANS_CMTG_CTL(cpu_transcoder),
+				       CMTG_SYNC_TO_PORT, 50)) {
+		drm_WARN(display->drm, 1, "CMTG: %s enable timeout\n",
+			 transcoder_name(cpu_transcoder));
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 6796eb727eef..64ff6a19948a 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index 4a80b88d88fd..a93236bf7b75 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -16,8 +16,11 @@
 #define CMTG_CLK_SELECT_PHYB_ENABLE	REG_FIELD_PREP(CMTG_CLK_SEL_B_MASK, 0x6)
 #define CMTG_CLK_SEL_B_DISABLED		REG_FIELD_PREP(CMTG_CLK_SEL_B_MASK, 0)
 
-#define TRANS_CMTG_CTL_A		_MMIO(0x6fa88)
-#define TRANS_CMTG_CTL_B		_MMIO(0x6fb88)
+#define _TRANS_CMTG_CTL_A		0x6fa88
+#define _TRANS_CMTG_CTL_B		0x6fb88
+#define TRANS_CMTG_CTL(trans)		_MMIO_TRANS((trans), \
+						    _TRANS_CMTG_CTL_A, _TRANS_CMTG_CTL_B)
 #define  CMTG_ENABLE			REG_BIT(31)
+#define  CMTG_SYNC_TO_PORT		REG_BIT(29)
 
 #endif /* __INTEL_CMTG_REGS_H__ */
-- 
2.43.0

