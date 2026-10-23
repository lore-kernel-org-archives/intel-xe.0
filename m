Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EF606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvPbMPxs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59D112C49;
	Fri, 23 Oct 2026 16:58:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050D10E6D4;
 Fri, 23 Oct 2026 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774702; x=1824310702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TrxBgaM/YQqmapIEJi10okWj32i2um5LiV0VFiRXGUE=;
 b=DvPbMPxsdlFzc+h3UWlzaX9Lgnt39vKX3nmwhgq3KCWZglhebpSMNlj8
 MTqY/vy7MIPhS/8+CzKoPUj9IauckfTIJ9PKGwDBwKXZQKwSBFveIKDgX
 LzGmidGus5SmetUhDyoS2ZuRffl6tJfX0+Voje+yXdY9FktcK1gH9gqV9
 f4XUsLLvvxn3T0m6AjbzjySK4h31qoja1noqn1HFeqFiIye4sfz/fDaa9
 7g/iUs2JnkXpOhjpXCxP8G3Ia2w1cx29DHU85BQh2B2XpQ1eCvDN8jYir
 E52/oUlxVEfvJBWG6JOQcf59DbasKdY6XGQVYtx6L30rE8ZrpeyZ16Q/x A==;
X-CSE-ConnectionGUID: XJFV/pkwQqSHYt593nB5uQ==
X-CSE-MsgGUID: XXbYpyLsT72A1mzYIN80KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1433843"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1433843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:22 -0700
X-CSE-ConnectionGUID: bbiYAQXgQVucF7pxTzhenw==
X-CSE-MsgGUID: 5PcmGfZeSte8+ddWYUncYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3571437"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:21 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/13] drm/i915/vrr: Reuse vrr_vblank_start() in more places
Date: Fri, 23 Oct 2026 19:57:54 +0300
Message-ID: <20261023165803.31016-5-ville.syrjala@linux.intel.com>
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

Currently we do the vtotal->vblank_start conversion by hand
in several places. Replace all of the with vrr_vblank_start().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b62148f29503..b1721b0bedff 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -182,14 +182,20 @@ int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state)
 	return crtc_state->vrr.vmax;
 }
 
+static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
+			    int vtotal)
+{
+	return vtotal - crtc_state->vrr.guardband;
+}
+
 int intel_vrr_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
 {
-	return intel_vrr_vmin_vtotal(crtc_state) - crtc_state->vrr.guardband;
+	return vrr_vblank_start(crtc_state, intel_vrr_vmin_vtotal(crtc_state));
 }
 
 int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 {
-	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
+	return vrr_vblank_start(crtc_state, intel_vrr_vmax_vtotal(crtc_state));
 }
 
 static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
@@ -311,12 +317,6 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
 		return value - crtc_state->set_context_latency;
 }
 
-static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
-			    int vtotal)
-{
-	return vtotal - crtc_state->vrr.guardband;
-}
-
 /*
  * For fixed refresh rate mode Vmin, Vmax and Flipline all are set to
  * Vtotal value.
@@ -634,8 +634,8 @@ void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
 	crtc_state->vrr.guardband = min(guardband, intel_vrr_max_guardband(crtc_state));
 
 	if (intel_vrr_always_use_vrr_tg(display)) {
-		adjusted_mode->crtc_vblank_start  =
-			adjusted_mode->crtc_vtotal - crtc_state->vrr.guardband;
+		adjusted_mode->crtc_vblank_start =
+			vrr_vblank_start(crtc_state, adjusted_mode->crtc_vtotal);
 		/*
 		 * pipe_mode has already been derived from the
 		 * original adjusted_mode, keep the two in sync.
@@ -1184,8 +1184,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	 */
 	if (intel_vrr_always_use_vrr_tg(display))
 		crtc_state->hw.adjusted_mode.crtc_vblank_start =
-			crtc_state->hw.adjusted_mode.crtc_vtotal -
-			crtc_state->vrr.guardband;
+			vrr_vblank_start(crtc_state, crtc_state->hw.adjusted_mode.crtc_vtotal);
 }
 
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
-- 
2.55.0

