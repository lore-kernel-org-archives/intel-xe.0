Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A18FF512E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 17:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D148E10E48B;
	Tue,  7 Apr 2026 17:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEcDwy2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2180B10E48B;
 Tue,  7 Apr 2026 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775584396; x=1807120396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/cMk89PfhdA8wzD1NokWjQ+0n8GqAg7b/+fZ1gR9faQ=;
 b=jEcDwy2kWLSRR7ZDK5Yys0XVWaGGgS7YVc4pM/icjIlh+8x9BdDHPDtk
 n2tD61BJnBvNEtEo0OvceRetY2X4eKw52dCHBWFP7Ndg09qH0rAbhMrVw
 1274tMu0oWGxjDoONEngYdx+tdN+ZPCsFtTYPRlYPAvXbDkvvBozhWCQ6
 GuSWVcuBHUz0WLbZMIsPABlfhViny/EwaSW8OVWsAgQ/vam/XdnEbY13W
 p2mcd7zzkUlgnxHt7PMmPVjIa5NH0Nn8PIeoptio4LbJYTN3GicMCFcRE
 21EcCB24BOAOZFjgdfZLvyAJdc+iLTSKvWq0Ck94ftY6xWFLzGSsVVz4Q g==;
X-CSE-ConnectionGUID: E1R0V42JSJ225k/tBKAGAg==
X-CSE-MsgGUID: 1pM0STvMQnuWk6U+2ddIjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76449534"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76449534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:16 -0700
X-CSE-ConnectionGUID: t1+TGgx5QmWyNNrtLyjisA==
X-CSE-MsgGUID: QWTmsQa1QQ+F85ItDcf4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="223936106"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 6/9] drm/i915/casf: Constify crtc_state
Date: Tue,  7 Apr 2026 20:52:40 +0300
Message-ID: <20260407175244.19654-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
References: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
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

Make the crtc_state const everywhere in the sharpness filter
code where it doesn't need to be mutated.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 8 ++++----
 drivers/gpu/drm/i915/display/intel_casf.h | 4 ++--
 drivers/gpu/drm/i915/display/skl_scaler.c | 8 ++++----
 drivers/gpu/drm/i915/display/skl_scaler.h | 2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 5a8ffb40d30d..f777aae3fc57 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -75,7 +75,7 @@ static void intel_casf_filter_lut_load(struct intel_crtc *crtc,
 			       sharpness_lut[i]);
 }
 
-void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
+void intel_casf_update_strength(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -174,7 +174,7 @@ static int casf_coeff_tap(int i)
 	return i % SCALER_FILTER_NUM_TAPS;
 }
 
-static u32 casf_coeff(struct intel_crtc_state *crtc_state, int t)
+static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int t)
 {
 	struct scaler_filter_coeff value;
 	u32 coeff;
@@ -192,7 +192,7 @@ static u32 casf_coeff(struct intel_crtc_state *crtc_state, int t)
  * that are calculated and stored in pch_pfit.casf.coeff as per
  * SCALER_COEFFICIENT_FORMAT
  */
-static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
+static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -264,7 +264,7 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 	}
 }
 
-void intel_casf_enable(struct intel_crtc_state *crtc_state)
+void intel_casf_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index b3fb0bcb3f5b..c4f984b73348 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -11,9 +11,9 @@
 struct intel_crtc_state;
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
-void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
+void intel_casf_update_strength(const struct intel_crtc_state *new_crtc_state);
 void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
-void intel_casf_enable(struct intel_crtc_state *crtc_state);
+void intel_casf_enable(const struct intel_crtc_state *crtc_state);
 void intel_casf_disable(const struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index d8bf65c6b4a7..762f4bb46c2d 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -757,13 +757,13 @@ static void skl_scaler_setup_filter(struct intel_display *display,
 	}
 }
 
-void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
+void skl_scaler_setup_casf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_display *display = to_intel_display(crtc);
-	struct drm_display_mode *adjusted_mode =
-	&crtc_state->hw.adjusted_mode;
-	struct intel_crtc_scaler_state *scaler_state =
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 	struct drm_rect src, dest;
 	int id, width, height;
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h b/drivers/gpu/drm/i915/display/skl_scaler.h
index 7e8d819c019d..20ecf373eb19 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.h
+++ b/drivers/gpu/drm/i915/display/skl_scaler.h
@@ -36,7 +36,7 @@ void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
 
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
 
-void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
+void skl_scaler_setup_casf(const struct intel_crtc_state *crtc_state);
 
 enum drm_mode_status
 skl_scaler_mode_valid(struct intel_display *display,
-- 
2.52.0

