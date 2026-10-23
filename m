Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B8606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TMk/ojEr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC510112C5C;
	Fri, 23 Oct 2026 16:59:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE721112C48;
 Fri, 23 Oct 2026 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774728; x=1824310728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P03YsOmiOIMOgb55qyojdLrSx7v9Xmhb/QrnRZBvr1U=;
 b=TMk/ojEr96eloWZ2lpYV29k0cZmrQLNVouaaqDExS/c3C6wTYYy5gD1m
 mUwkmjj5X5IZbf+pWDtxBAk0IuE+P6HbR9ijR1+Nj4oy3Qiwv76OZNcwB
 8EwVituRBmxt+Qgu9ebfn3VpUWY1gy4PtAj9/46iNGm5Lukg2+tSRA/NS
 KmLyJYXeoN2BTheimrYq1pou6ynRTG5iLY4auBdKzcF2506eF381g5wF+
 0TwDDEOhwJ33q5yPiY0VmtlovMpAOWHssP3JbFX9fHJgI+R/5pFKrSLz3
 NAm2ueMThJvgfyHIXWjPZKXH68cfO3HJVYXhoJ2qbKsBzoq4M65OxQ0r8 A==;
X-CSE-ConnectionGUID: wHUduAvFStW7T05/jPeGzQ==
X-CSE-MsgGUID: tGL3sYRCRQWp3CfUUbfzaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428604"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428604"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:48 -0700
X-CSE-ConnectionGUID: fgpifViNSoeSJN1o4EpS1A==
X-CSE-MsgGUID: DTlW7+WzTMOnSRyAMaea0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4033965"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/13] drm/i915/vrr: Introduce intel_vrr_vblank_start_live()
 and use it for MMIO vblank evasion
Date: Fri, 23 Oct 2026 19:58:01 +0300
Message-ID: <20261023165803.31016-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

vrr_vblank_start() in the MMIO vblank evasion code is duplicating
a lot of stuff that is now implemented in the VRR code in the
form of various _live() functions.

All we need is intel_vrr_dcb_vmax_vblank_start_live() and
intel_vrr_vmax_vblank_start_live() (we already have the vmin
counterparts) to finish the puzzle.

This lets us hide most of the VRR details from the vblank
evasion code itself. All the vblank evasion code is concerned
with the is the location of the next start of vblank.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 30 +--------------------
 drivers/gpu/drm/i915/display/intel_vrr.c    | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h    |  1 +
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index aa108ed27de7..084f6aaea61d 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -654,34 +654,6 @@ intel_pre_commit_crtc_state(struct intel_atomic_state *state,
 	return pre_commit_crtc_state(old_crtc_state, new_crtc_state);
 }
 
-static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
-{
-	bool is_push_sent = intel_vrr_is_push_sent(crtc_state);
-	int vblank_start;
-
-	if (!crtc_state->vrr.dc_balance.enable) {
-		if (is_push_sent)
-			return intel_vrr_vmin_vblank_start(crtc_state);
-		else
-			return intel_vrr_vmax_vblank_start(crtc_state);
-	}
-
-	if (is_push_sent)
-		vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
-	else
-		vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
-
-	if (vblank_start >= 0)
-		return vblank_start;
-
-	if (is_push_sent)
-		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
-	else
-		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
-
-	return vblank_start;
-}
-
 void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 			     const struct intel_crtc_state *new_crtc_state,
 			     struct intel_vblank_evade_ctx *evade)
@@ -708,7 +680,7 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		drm_WARN_ON(crtc->base.dev, intel_crtc_needs_modeset(new_crtc_state) ||
 			    new_crtc_state->update_m_n || new_crtc_state->update_lrr);
 
-		evade->vblank_start = vrr_vblank_start(crtc_state);
+		evade->vblank_start = intel_vrr_vblank_start_live(crtc_state);
 
 		vblank_delay = crtc_state->set_context_latency;
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index a549807586f8..3d31d37af4e2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1250,6 +1250,18 @@ intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
 	return vblank_start;
 }
 
+static int
+intel_vrr_dcb_vmax_vblank_start_live(const struct intel_crtc_state *crtc_state)
+{
+	int vblank_start;
+
+	vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
+	if (vblank_start < 0)
+		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
+
+	return vblank_start;
+}
+
 static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
 {
 	if (crtc_state->vrr.dc_balance.enable)
@@ -1258,6 +1270,22 @@ static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_
 		return intel_vrr_vmin_vblank_start(crtc_state);
 }
 
+static int intel_vrr_vmax_vblank_start_live(const struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->vrr.dc_balance.enable)
+		return intel_vrr_dcb_vmax_vblank_start_live(crtc_state);
+	else
+		return intel_vrr_vmax_vblank_start(crtc_state);
+}
+
+int intel_vrr_vblank_start_live(const struct intel_crtc_state *crtc_state)
+{
+	if (intel_vrr_is_push_sent(crtc_state))
+		return intel_vrr_vmin_vblank_start_live(crtc_state);
+	else
+		return intel_vrr_vmax_vblank_start_live(crtc_state);
+}
+
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 3928554c0424..332f9b4a57cc 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -40,6 +40,7 @@ int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_vtotal(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_state);
+int intel_vrr_vblank_start_live(const struct intel_crtc_state *crtc_state);
 bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state);
 void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state);
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *crtc_state);
-- 
2.55.0

