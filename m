Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63F2606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AQIqBi0r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60176112C44;
	Fri, 23 Oct 2026 16:58:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740C0112C3E;
 Fri, 23 Oct 2026 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774714; x=1824310714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ni2xQK2AQD67SfgER1lDYYHHKCdO6nveOGGmdnTL5LM=;
 b=AQIqBi0rnFZoDY6DR/3ZvZ4NFFztbFG8L+NEsgpgnDAZ7FzYo0eDyfeb
 JAnR+FGiYDdIcCbO2/GzCGkPsx86I2ftfOTK6qclfns29zWt3zGDSIW0K
 T6V+AGL28ExJd9lacanqsxtj4+wwriN3q/rUQxTsmenVetFVLftgvInB9
 tG2BCBkPMUz9fRWfk2DJspI9M4TvHcks4LMnKrR0OHIKqVe32GXYtvTqq
 pcKCWd/MsJ5TRW5LB3nFpsGhapRQBNhJPPyqGhfQ6P+FZJWFYgDP0zzgz
 3vpldjckMxC6NfBGsjLY6qaoVHUSnxrc0LV7vOnsXP2kukIFO9OO6kzsd A==;
X-CSE-ConnectionGUID: xR2GiOueTHyEOvLnGhpn6Q==
X-CSE-MsgGUID: S68hnj3JTI+F+viO2MO8sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428536"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:34 -0700
X-CSE-ConnectionGUID: Nptb8qu/RyG71NSl05W2uA==
X-CSE-MsgGUID: l7i/AkYsQba/rYfMG8ZKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3798536"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:32 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/13] drm/i915/vrr: Annotate live functions
Date: Fri, 23 Oct 2026 19:57:57 +0300
Message-ID: <20261023165803.31016-8-ville.syrjala@linux.intel.com>
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

Due to DC balancing various VRR functions are now accessing
the hardware, which might surprise the casual reader.
Annotate all such functions with _live which hopefully
provides enough of a hint that special things are happening
under the hood.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c    | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_vblank.c |  8 ++++----
 drivers/gpu/drm/i915/display/intel_vrr.c    | 18 +++++++++---------
 drivers/gpu/drm/i915/display/intel_vrr.h    | 10 +++++-----
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 299d778520a2..e055e4ef9311 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -776,7 +776,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 		int vblank_delay = crtc_state->set_context_latency;
 		int vmin_vblank_start, vmax_vblank_start;
 
-		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
+		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
 
 		if (vmin_vblank_start >= 0) {
 			end = vmin_vblank_start;
@@ -784,7 +784,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 			intel_dsb_wait_scanline_out(state, dsb, start, end);
 		}
 
-		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_next(crtc_state);
+		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
 
 		if (vmax_vblank_start >= 0) {
 			end = vmax_vblank_start;
@@ -792,12 +792,12 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 			intel_dsb_wait_scanline_out(state, dsb, start, end);
 		}
 
-		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
+		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
 		end = vmin_vblank_start;
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
 
-		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_final(crtc_state);
+		vmax_vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
 		end = vmax_vblank_start;
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
@@ -932,7 +932,7 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
 		 */
 		intel_dsb_wait_scanline_out(state, dsb,
 					    intel_vrr_safe_window_start(crtc_state) - 1,
-					    intel_vrr_vmin_safe_window_end(crtc_state));
+					    intel_vrr_vmin_safe_window_end_live(crtc_state));
 		/*
 		 * When the push is sent during vblank it will trigger
 		 * on the next scanline, hence we have up to one extra
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 99cb648cab73..aa108ed27de7 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -667,17 +667,17 @@ static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
 	}
 
 	if (is_push_sent)
-		vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
+		vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
 	else
-		vblank_start = intel_vrr_dcb_vmax_vblank_start_next(crtc_state);
+		vblank_start = intel_vrr_dcb_vmax_vblank_start_next_live(crtc_state);
 
 	if (vblank_start >= 0)
 		return vblank_start;
 
 	if (is_push_sent)
-		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
+		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
 	else
-		vblank_start = intel_vrr_dcb_vmax_vblank_start_final(crtc_state);
+		vblank_start = intel_vrr_dcb_vmax_vblank_start_final_live(crtc_state);
 
 	return vblank_start;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6aa99bcec448..1042d00d1732 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1200,27 +1200,27 @@ int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
 }
 
 static int
-intel_vrr_dcb_vmin_vblank_start(const struct intel_crtc_state *crtc_state)
+intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
 {
 	int vblank_start;
 
-	vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
+	vblank_start = intel_vrr_dcb_vmin_vblank_start_next_live(crtc_state);
 	if (vblank_start < 0)
-		vblank_start = intel_vrr_dcb_vmin_vblank_start_final(crtc_state);
+		vblank_start = intel_vrr_dcb_vmin_vblank_start_final_live(crtc_state);
 
 	return vblank_start;
 }
 
-int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
+int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
 {
 	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
-			intel_vrr_dcb_vmin_vblank_start(crtc_state) :
+			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
 			intel_vrr_vmin_vblank_start(crtc_state);
 
 	return vmin_vblank_start - crtc_state->set_context_latency;
 }
 
-int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_state)
+int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -1234,7 +1234,7 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
 	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
 }
 
-int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state)
+int intel_vrr_dcb_vmax_vblank_start_next_live(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -1248,7 +1248,7 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
 	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
 }
 
-int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state)
+int intel_vrr_dcb_vmin_vblank_start_final_live(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
@@ -1259,7 +1259,7 @@ int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_st
 	return vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
 }
 
-int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state)
+int intel_vrr_dcb_vmax_vblank_start_final_live(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 19c7990be1b2..3928554c0424 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -49,12 +49,12 @@ void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
 			 struct intel_crtc *crtc);
 bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state);
-int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state);
+int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state);
 
-int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_state);
-int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state);
-int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
-int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
+int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
+int intel_vrr_dcb_vmax_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
+int intel_vrr_dcb_vmin_vblank_start_final_live(const struct intel_crtc_state *crtc_state);
+int intel_vrr_dcb_vmax_vblank_start_final_live(const struct intel_crtc_state *crtc_state);
 
 void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
 
-- 
2.55.0

