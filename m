Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2713CCF2E8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214110ED45;
	Mon, 19 Oct 2026 13:53:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3510E779;
 Mon, 19 Oct 2026 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418001; x=1823954001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOo2VZvQLgwQgMnqbVQ8e5aTvLk4P+QXHey2Yn2zEZg=;
 b=bUk2Wh5Bvx1g1SwKAsC+DkWvmh+qQU/Cyf9PiFLwAT/hC8hU45W6P+eS
 dsGk/CkOPe3T8mmFYzjB1l8lK0iGNy2WGFztI66cSPDExD4Ka5HmTFry5
 YSoZk9c2ChDC33EoY+w67riFBPi8T3JHkeYN5knm42ffiT4Ztp+ZQdSom
 Cnn9qgvTn/ppC8PhgwtLFLbEvKf3zsTiECjkVDQxLy/GYVCzfA51D38wN
 aNyGsd6yT960MSdE98VIH1rh9l8Wj/dQ3jqsXPmI2wvf1garyE9EpaM3R
 uTLnIySkgqeCoUnLqY0Nt0KZUqzk0k4LahzeBLl1FZtrYjIyZPbvxluhg A==;
X-CSE-ConnectionGUID: Uk+ZwM8JT/G8fDBingn3tQ==
X-CSE-MsgGUID: qBTrLelzRfe0lm7YdjBCyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979681"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979681"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:20 -0700
X-CSE-ConnectionGUID: YIR47sSrRC2zXDRJA7QDhA==
X-CSE-MsgGUID: PNEyuhujTjidUMVDmywP/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418413"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/15] drm/i915/pfit: s/intel_pch_pfit/ilk_pfit/
Date: Mon, 19 Oct 2026 16:52:56 +0300
Message-ID: <20261019135309.23578-3-ville.syrjala@linux.intel.com>
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

The intel_pch_pfit_*() have nothing to do with PCH. Rename
them to just ilk_pfit_*() to better reflect their meaning.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_pfit.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 3e3c69233e58..aa4a4d10d124 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -16,7 +16,7 @@
 #include "intel_pfit_regs.h"
 #include "skl_scaler.h"
 
-static int intel_pch_pfit_check_dst_window(const struct intel_crtc_state *crtc_state)
+static int ilk_pfit_check_dst_window(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -67,7 +67,7 @@ static int intel_pch_pfit_check_dst_window(const struct intel_crtc_state *crtc_s
 	return 0;
 }
 
-static int intel_pch_pfit_check_src_size(const struct intel_crtc_state *crtc_state)
+static int ilk_pfit_check_src_size(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -105,7 +105,7 @@ static int intel_pch_pfit_check_src_size(const struct intel_crtc_state *crtc_sta
 	return 0;
 }
 
-static int intel_pch_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
+static int ilk_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -140,7 +140,7 @@ static int intel_pch_pfit_check_scaling(const struct intel_crtc_state *crtc_stat
 	return 0;
 }
 
-static int intel_pch_pfit_check_timings(const struct intel_crtc_state *crtc_state)
+static int ilk_pfit_check_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -158,7 +158,7 @@ static int intel_pch_pfit_check_timings(const struct intel_crtc_state *crtc_stat
 	return 0;
 }
 
-static int intel_pch_pfit_check_cloning(const struct intel_crtc_state *crtc_state)
+static int ilk_pfit_check_cloning(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -182,7 +182,7 @@ static int intel_pch_pfit_check_cloning(const struct intel_crtc_state *crtc_stat
 }
 
 /* adjusted_mode has been preset to be the panel's fixed mode */
-static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
+static int ilk_panel_fitting(struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -282,23 +282,23 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 	if (DISPLAY_VER(display) >= 9)
 		return 0;
 
-	ret = intel_pch_pfit_check_dst_window(crtc_state);
+	ret = ilk_pfit_check_dst_window(crtc_state);
 	if (ret)
 		return ret;
 
-	ret = intel_pch_pfit_check_src_size(crtc_state);
+	ret = ilk_pfit_check_src_size(crtc_state);
 	if (ret)
 		return ret;
 
-	ret = intel_pch_pfit_check_scaling(crtc_state);
+	ret = ilk_pfit_check_scaling(crtc_state);
 	if (ret)
 		return ret;
 
-	ret = intel_pch_pfit_check_timings(crtc_state);
+	ret = ilk_pfit_check_timings(crtc_state);
 	if (ret)
 		return ret;
 
-	ret = intel_pch_pfit_check_cloning(crtc_state);
+	ret = ilk_pfit_check_cloning(crtc_state);
 	if (ret)
 		return ret;
 
@@ -587,7 +587,7 @@ int intel_pfit_compute_config(struct intel_crtc_state *crtc_state,
 	if (HAS_GMCH(display))
 		return gmch_panel_fitting(crtc_state, conn_state);
 	else
-		return pch_panel_fitting(crtc_state, conn_state);
+		return ilk_panel_fitting(crtc_state, conn_state);
 }
 
 void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
-- 
2.55.0

