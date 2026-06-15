Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D71CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464810E660;
	Mon, 15 Jun 2026 20:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv2h1pbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D937A10E660;
 Mon, 15 Jun 2026 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555656; x=1813091656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ahwYYL3I2KAi6EDYvqRIaz26YYNhFACz5rbjaCVcUXw=;
 b=Lv2h1pbxVE9ZIdQOmzLM4nLCArYOOF3++guDXnuWu61DoDWX9VkQJBW4
 pMfnp/p3MBKwprEYGikunH/+ebEPkHijp+YciLULEroPv8GvaBzBkCoWZ
 yec9EVTtBzUDkpJsBhMg9CsD6r/piyZp/UNREQtavtQUw6596Ltnnlv/H
 w5Hu2sCPInbZNRPYer9hILX2y6tV24aahLjFibMOjdPKgRRaCTTaIwX37
 IKON8Ya1Y5n7xjHqyACmi/d71cyP5FVnmaz0/oiIyeU/94qWaPB01EKnE
 SR2NLOAm6sdM3mNiJFg2Tqjxntm/HErgvua8kDM/79XDFGj7qDxs04bCi g==;
X-CSE-ConnectionGUID: YmDUjseTQ0+U3onO1ffElw==
X-CSE-MsgGUID: Eb8RN+3RRJq9s22N6QNaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694569"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:16 -0700
X-CSE-ConnectionGUID: cBl9WWq6R/GB8OBuEm/Srw==
X-CSE-MsgGUID: dxMh6MvrQcmH2arM7xkemQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538463"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:14 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 2/7] drm/i915/pm_demand: introduce HAS_PMDEMAND macro
Date: Mon, 15 Jun 2026 23:33:50 +0300
Message-ID: <20260615203355.218578-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203355.218578-1-vinod.govindapillai@intel.com>
References: <20260615203355.218578-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

PM demand feature introduces a new way to set bw, power and
performance requirements to pcode from display version 14 onwards.
Use an identifiable name as a macro to distinguish the pm demand
specific changes in the code.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c             |  4 ++--
 drivers/gpu/drm/i915/display/intel_display_device.h |  1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c  |  4 ++--
 drivers/gpu/drm/i915/display/intel_pmdemand.c       | 12 ++++++------
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 41539fdfeac5..4557de85fade 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -184,7 +184,7 @@ static int icl_pcode_restrict_qgv_points(struct intel_display *display,
 {
 	int ret;
 
-	if (DISPLAY_VER(display) >= 14)
+	if (HAS_PMDEMAND(display))
 		return 0;
 
 	/* bspec says to keep retrying for at least 1 ms */
@@ -1238,7 +1238,7 @@ static int intel_bw_check_qgv_points(struct intel_display *display,
 
 	data_rate = DIV_ROUND_UP(data_rate, 1000);
 
-	if (DISPLAY_VER(display) >= 14)
+	if (HAS_PMDEMAND(display))
 		return mtl_find_qgv_points(display, data_rate, num_active_planes,
 					   new_bw_state);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 12e5a522a299..13e93a4b4f5f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -193,6 +193,7 @@ struct intel_display_platforms {
 #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
 #define HAS_PIPEDMC(__display)		(DISPLAY_VER(__display) >= 12)
 #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
+#define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
 #define HAS_PSR_HW_TRACKING(__display)	(DISPLAY_INFO(__display)->has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(__display)	(DISPLAY_VER(__display) >= 12)
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 4a821b0674fd..a58bd54e2dc3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1262,7 +1262,7 @@ gen8_de_misc_irq_handler(struct intel_display *display, u32 iir)
 		}
 	}
 
-	if (DISPLAY_VER(display) >= 14) {
+	if (HAS_PMDEMAND(display)) {
 		if (iir & (XELPDP_PMDEMAND_RSP |
 			   XELPDP_PMDEMAND_RSPTOUT_ERR)) {
 			if (iir & XELPDP_PMDEMAND_RSPTOUT_ERR)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2e51dfcd5dce..03f860313515 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1122,7 +1122,7 @@ static void gen9_dbuf_enable(struct intel_display *display)
 
 	slices_mask = BIT(DBUF_S1) | display->dbuf.enabled_slices;
 
-	if (DISPLAY_VER(display) >= 14)
+	if (HAS_PMDEMAND(display))
 		intel_pmdemand_program_dbuf(display, slices_mask);
 
 	/*
@@ -1136,7 +1136,7 @@ static void gen9_dbuf_disable(struct intel_display *display)
 {
 	gen9_dbuf_slices_update(display, 0);
 
-	if (DISPLAY_VER(display) >= 14)
+	if (HAS_PMDEMAND(display))
 		intel_pmdemand_program_dbuf(display, 0);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index 6d32c52269a6..f96545a5b881 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -152,7 +152,7 @@ intel_pmdemand_update_phys_mask(struct intel_display *display,
 {
 	enum phy phy;
 
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return;
 
 	if (!encoder)
@@ -174,7 +174,7 @@ intel_pmdemand_update_port_clock(struct intel_display *display,
 				 struct intel_pmdemand_state *pmdemand_state,
 				 enum pipe pipe, int port_clock)
 {
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return;
 
 	pmdemand_state->ddi_clocks[pipe] = port_clock;
@@ -324,7 +324,7 @@ int intel_pmdemand_atomic_check(struct intel_atomic_state *state)
 	const struct intel_dbuf_state *new_dbuf_state;
 	struct intel_pmdemand_state *new_pmdemand_state;
 
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return 0;
 
 	if (!intel_pmdemand_needs_update(state))
@@ -404,7 +404,7 @@ intel_pmdemand_init_pmdemand_params(struct intel_display *display,
 {
 	u32 reg1, reg2;
 
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return;
 
 	mutex_lock(&display->pmdemand.lock);
@@ -637,7 +637,7 @@ void intel_pmdemand_pre_plane_update(struct intel_atomic_state *state)
 	const struct intel_pmdemand_state *old_pmdemand_state =
 		intel_atomic_get_old_pmdemand_state(state);
 
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return;
 
 	if (!new_pmdemand_state ||
@@ -660,7 +660,7 @@ void intel_pmdemand_post_plane_update(struct intel_atomic_state *state)
 	const struct intel_pmdemand_state *old_pmdemand_state =
 		intel_atomic_get_old_pmdemand_state(state);
 
-	if (DISPLAY_VER(display) < 14)
+	if (!HAS_PMDEMAND(display))
 		return;
 
 	if (!new_pmdemand_state ||
-- 
2.43.0

