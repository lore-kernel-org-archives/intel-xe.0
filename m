Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A10CCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923EF10ED47;
	Mon, 19 Oct 2026 13:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3610ED4F;
 Mon, 19 Oct 2026 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418015; x=1823954015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zbTA46Vs62LQJKZVjsTA3pQ+zrqprNH2pfrpzoAF2fU=;
 b=XPA0ebADCiiz+i5YcDfhYoyXHkCSxfwMau3zpeB9lXq1kkDdqUtkjxJE
 Is3OqejoX+A8NfQzQhwlYuaPWVET/ZfE/b3ryvKTU4OTtgQpAk5yUsfdI
 cC7lPU+mPmPecyJGhx6Mjn4nIBABZ6QTTyYSinG8gvYCEw7vksu1bt6R1
 FAvX7Wa1RfhrYKI19iJ6Re6a9jVy8MTBBjDQOjQmNdG60f70s8583FkY6
 WkbKwQ61wN+Cs/N3CIplCe97CCAw/k2X3d4fttZWVwRkapIGvptJGo+eX
 QEDGYEy9yw42xYJ8e3ClAFgN4kXtUcrmCk/wFbCb6JChYcw5poK3xULhk w==;
X-CSE-ConnectionGUID: WzAxZBBAT5KnbLSSqEvouw==
X-CSE-MsgGUID: Z/co1iy2Qz+TXWvctEP+AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979709"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:35 -0700
X-CSE-ConnectionGUID: 37yUDlV0RcSU0mlCziy5KQ==
X-CSE-MsgGUID: uVcdKrhZQuq4KlKlDvgoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418532"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
Date: Mon, 19 Oct 2026 16:53:00 +0300
Message-ID: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
unconfuse things a bit.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 66 ++++++++++++++---------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 972218346362..82804159d0a1 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -720,39 +720,52 @@ void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 	intel_de_write(display, PFIT_CONTROL(display), 0);
 }
 
-static bool i9xx_has_pfit(struct intel_display *display)
-{
-	if (display->platform.i830)
-		return false;
-
-	return DISPLAY_VER(display) >= 4 ||
-		display->platform.pineview || display->platform.mobile;
-}
-
-static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
+static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe;
 	u32 tmp;
 
-	if (!i9xx_has_pfit(display))
-		return;
-
 	tmp = intel_de_read(display, PFIT_CONTROL(display));
 	if (!(tmp & PFIT_ENABLE))
 		return;
 
 	/* Check whether the pfit is attached to our pipe. */
-	if (DISPLAY_VER(display) >= 4)
-		pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
-	else
-		pipe = PIPE_B;
-
+	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
 	if (pipe != crtc->pipe)
 		return;
 
 	crtc_state->gmch_pfit.control = tmp;
+}
+
+static bool i9xx_has_pfit(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	if (crtc->pipe != PIPE_B)
+		return false;
+
+	if (display->platform.i830)
+		return false;
+
+	return display->platform.pineview || display->platform.mobile;
+}
+
+static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 tmp;
+
+	if (!i9xx_has_pfit(crtc))
+		return;
+
+	tmp = intel_de_read(display, PFIT_CONTROL(display));
+	if (!(tmp & PFIT_ENABLE))
+		return;
+
+	crtc_state->gmch_pfit.control = tmp;
 	crtc_state->gmch_pfit.pgm_ratios =
 		intel_de_read(display, PFIT_PGM_RATIOS(display));
 }
@@ -761,10 +774,15 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	if (HAS_GMCH(display))
-		i9xx_pfit_get_config(crtc_state);
-	else if (DISPLAY_VER(display) >= 9)
-		skl_scaler_get_config(crtc_state);
-	else
-		ilk_pfit_get_config(crtc_state);
+	if (HAS_GMCH(display)) {
+		if (DISPLAY_VER(display) >= 4)
+			i965_pfit_get_config(crtc_state);
+		else
+			i9xx_pfit_get_config(crtc_state);
+	} else {
+		if (DISPLAY_VER(display) >= 9)
+			skl_scaler_get_config(crtc_state);
+		else
+			ilk_pfit_get_config(crtc_state);
+	}
 }
-- 
2.55.0

