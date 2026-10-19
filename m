Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0146CCF2E8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1E210ED63;
	Mon, 19 Oct 2026 13:53:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B9E10ED47;
 Mon, 19 Oct 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418012; x=1823954012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UK9gOBWEKBMdbtB2wRVhSE412Fxx4UG0iAT8usxC5ck=;
 b=UIA3bXvjxm+NoAUAD/mdO+f29vNeSVcVkUzBv20+ojGUmPNE27nm5rY4
 pFMbJW1Jaqvz1BavhcSUa1xS2s6cxvmLnM/JQWFRu69cmrdOi2jxh/NQu
 uSrPunKBN3EkuIBsEEFCGBtZguvyhvaRyTUqCkBxFlhIQ2IA0oaCdekAn
 NoHJrt6vrWGuuCfK1N9BZ2y9PL5O5UTopMUULSQ+1vtlnXZqAeQVCD4Oo
 XmQ/s8A7bG9/W9V0xfKXTZA608IrynGWFnt9lmc3UrHnPyVU5MZM9EcV8
 NIe5frFYfvL1bTv3MOWflNyuwWAJAaoccBz3cKC8tNrI298NU5s53p6cR Q==;
X-CSE-ConnectionGUID: EAC/6JyCSPWiKO+hWCWBLQ==
X-CSE-MsgGUID: wfzkmIZfQZOwmG9kWzv1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979702"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:31 -0700
X-CSE-ConnectionGUID: RBm5nW6eSRedO82aSKLLKA==
X-CSE-MsgGUID: er46S6EQQk6ZWa448EtJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418487"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:30 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/15] drm/i915/pfit: Rename some pfit functions
Date: Mon, 19 Oct 2026 16:52:59 +0300
Message-ID: <20261019135309.23578-6-ville.syrjala@linux.intel.com>
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

Most pfit functions are called {ilk,i9xx}_pfit_*(). Rename
{gmch,ilk}_panel_fitting() and intel_gmch_pfit_check_timings()
to match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index b4a201dc8f7b..972218346362 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -182,8 +182,8 @@ static int ilk_pfit_check_cloning(const struct intel_crtc_state *crtc_state)
 }
 
 /* adjusted_mode has been preset to be the panel's fixed mode */
-static int ilk_panel_fitting(struct intel_crtc_state *crtc_state,
-			     const struct drm_connector_state *conn_state)
+static int ilk_pfit_compute_config(struct intel_crtc_state *crtc_state,
+				   const struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -438,7 +438,7 @@ static void i9xx_scale_aspect(struct intel_crtc_state *crtc_state,
 	}
 }
 
-static int intel_gmch_pfit_check_timings(const struct intel_crtc_state *crtc_state)
+static int i9xx_pfit_check_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -470,8 +470,8 @@ static int intel_gmch_pfit_check_timings(const struct intel_crtc_state *crtc_sta
 	return 0;
 }
 
-static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
-			      const struct drm_connector_state *conn_state)
+static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
+				    const struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -479,6 +479,7 @@ static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
+	int ret;
 
 	/* Native modes don't need fitting */
 	if (adjusted_mode->crtc_hdisplay == pipe_src_w &&
@@ -566,7 +567,11 @@ static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
 	if ((pfit_control & PFIT_ENABLE) == 0)
 		return 0;
 
-	return intel_gmch_pfit_check_timings(crtc_state);
+	ret = i9xx_pfit_check_timings(crtc_state);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 enum drm_mode_status
@@ -585,9 +590,9 @@ int intel_pfit_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_display *display = to_intel_display(crtc_state);
 
 	if (HAS_GMCH(display))
-		return gmch_panel_fitting(crtc_state, conn_state);
+		return i9xx_pfit_compute_config(crtc_state, conn_state);
 	else
-		return ilk_panel_fitting(crtc_state, conn_state);
+		return ilk_pfit_compute_config(crtc_state, conn_state);
 }
 
 void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
-- 
2.55.0

