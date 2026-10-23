Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4C606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kb9a0v2/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F4112C55;
	Fri, 23 Oct 2026 16:59:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3539D112C3E;
 Fri, 23 Oct 2026 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774707; x=1824310707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KazxgaCMsmLxInUkO50TRpRCI8bFgHX9Gd2akRMrlEU=;
 b=Kb9a0v2/QEDZF0+oyV4NJLhjqOVWb/DnY8xYCNyKhI/JZa5iezNRWQ8A
 nvDjldYbhN+0D25KhmC4ylUWOxBRDbJN+ccFKWWFvrawgdDN8tXSMkkve
 MDtG0fM1swJhZOfv3DRXPlbgQZ4v/m964MVi0bRIaMknIky45OowLhZSq
 H+Oe5GjoZ2NTNTZUI/ekOuMbWt789qbgLxfFiPnaXpkuQqpnQtd70zR+n
 ipE4pzU/GQQhkq5UvlL4zuILYmwaNA6hqSwY0tzyFrh/NdOurUuDX8li/
 QxIYC8A7GVA7VDOWrhJ4DwBi42AcTIvM/7NEk0TUS6axR36e1kUmuLITT A==;
X-CSE-ConnectionGUID: Vz2m5ikkTBCTVQXxCRBLiQ==
X-CSE-MsgGUID: 4oU+TwNbT+elXffElkJbrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1435240"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1435240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:26 -0700
X-CSE-ConnectionGUID: 8bXMpHcjTBqEbATawyjKLw==
X-CSE-MsgGUID: Ai5+DgCkRqOy84DNqNsGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3570316"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:24 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/13] drm/i915/vrr: Add a local 'adjusted_mode' variable to
 intel_vrr_get_config()
Date: Fri, 23 Oct 2026 19:57:55 +0300
Message-ID: <20261023165803.31016-6-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a local 'adjusted_mode' variable to intel_vrr_get_config()
to reduce the noise a bit. This also makes the vblank_start adjustment
visually similar to its compute counterpart in
intel_vrr_compute_guardband() (which already has the local variable).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b1721b0bedff..9ab62423a1a6 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1099,6 +1099,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	u32 trans_vrr_ctl, trans_vrr_vsync;
 	bool vrr_enable;
 
@@ -1148,7 +1149,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
 		if (display->platform.novalake &&
 		    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
-			crtc_state->hw.adjusted_mode.crtc_vtotal =
+			adjusted_mode->crtc_vtotal =
 				intel_vrr_vmin_vtotal(crtc_state);
 
 		if (HAS_AS_SDP(display)) {
@@ -1183,8 +1184,8 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	 * paths as needed.
 	 */
 	if (intel_vrr_always_use_vrr_tg(display))
-		crtc_state->hw.adjusted_mode.crtc_vblank_start =
-			vrr_vblank_start(crtc_state, crtc_state->hw.adjusted_mode.crtc_vtotal);
+		adjusted_mode->crtc_vblank_start =
+			vrr_vblank_start(crtc_state, adjusted_mode->crtc_vtotal);
 }
 
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
-- 
2.55.0

