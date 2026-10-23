Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF22606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIfcuRqH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037B9112A6F;
	Fri, 23 Oct 2026 10:01:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98F1112A8E;
 Fri, 23 Oct 2026 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749663; x=1824285663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nA4QOurbyUVjASiW3nX060gbvY7L5pjMir5U15Lh5co=;
 b=eIfcuRqHl2fvCA6KZhWWrqpRp/Lp4i3Lq0lBVKoADxlOKEXCV75SOsIE
 1QEI90MFRBXaD3AMzbBtjoY8dWTndo5Cs6ssXyi5YoF4tfdRDMIYbw//G
 LisWNLvch7n+VE9Vl2pNz1wJlWBdq96xs0gncyzPG7cDmdEklnr5WPFKK
 JRWQqGrBO5pvcNOaG6/CLKHpWcNtbkG8ZrzXwcm3YNRt5B5l9q5MqcJOH
 3/AvLqrRJwsHE5AwKphWx4qn4rmzVxT27BOKLSJhhuBIuhrmFnVd/7qzh
 rhaiOI7dgEt98eem1nRZD7veTqTWgqBjAf9FjdKJ7P9SvyngzVHmZWlgw Q==;
X-CSE-ConnectionGUID: K4nwdrknRI6MRdPtYJ2euA==
X-CSE-MsgGUID: oJWnXO05Ro6rBB9F5r/YVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384260"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:01 -0700
X-CSE-ConnectionGUID: n9LdqfBeQmOLzgPO+lfgcA==
X-CSE-MsgGUID: OO9QpMNVQcOFU/nWoo/kiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932707"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:00 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 4/9] drm/i915/psr: Split the selective fetch calculation
 into helpers
Date: Fri, 23 Oct 2026 10:00:47 +0000
Message-ID: <20261023100052.683192-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The joiner needs every joined pipe to have its selective update area
calculated before any of them sets the plane areas, but
intel_psr2_sel_fetch_update() does both in one go. Move the two halves
into psr2_sel_fetch_compute_su_area() and
psr2_sel_fetch_apply_su_area() and call them in turn.

No functional change.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 147 ++++++++++++++---------
 1 file changed, 90 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 2a4d6681d50e3..9db064fb39afd 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2906,11 +2906,10 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 		intel_psr_apply_pr_link_on_su_wa(crtc_state);
 }
 
-int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
-				struct intel_crtc *crtc)
+static void psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
+					   struct intel_crtc *crtc,
+					   bool *full_update)
 {
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
@@ -2920,24 +2919,9 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		.x2 = drm_rect_width(&crtc_state->pipe_src),
 		.y2 = drm_rect_height(&crtc_state->pipe_src),
 	};
-	bool full_update = false, su_area_changed;
 	int i;
 
-	/*
-	 * Selective fetch is not always usable, for instance it is dropped
-	 * while pipe CRC is active. The planes keep their selective fetch
-	 * enable bit set in hardware over that, and a plane disabled while
-	 * selective fetch is off never gets the bit cleared. Once selective
-	 * fetch comes back the hardware would resume fetching for a plane that
-	 * is no longer enabled and keep its DDB range reserved, so have the
-	 * plane update drop the bit for every plane of the pipe as selective
-	 * fetch is turned off.
-	 */
-	crtc_state->clear_psr2_sel_fetch = old_crtc_state->enable_psr2_sel_fetch &&
-		!crtc_state->enable_psr2_sel_fetch;
-
-	if (!crtc_state->enable_psr2_sel_fetch)
-		return 0;
+	*full_update = false;
 
 	crtc_state->psr2_su_area.x1 = 0;
 	crtc_state->psr2_su_area.y1 = -1;
@@ -2945,8 +2929,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	crtc_state->psr2_su_area.y2 = -1;
 
 	if (!psr2_sel_fetch_pipe_state_supported(crtc_state)) {
-		full_update = true;
-		goto skip_su_area_calc;
+		*full_update = true;
+		return;
 	}
 
 	/*
@@ -2969,7 +2953,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 
 		if (new_plane_state->uapi.visible &&
 		    !psr2_sel_fetch_plane_state_supported(new_plane_state)) {
-			full_update = true;
+			*full_update = true;
 			break;
 		}
 
@@ -3026,42 +3010,24 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	 * calculation for those.
 	 */
 	if (crtc_state->psr2_su_area.y1 == -1)
-		full_update = true;
-
-	if (full_update)
-		goto skip_su_area_calc;
-
-	intel_psr_apply_su_area_workarounds(crtc_state);
-
-	do {
-		bool cursor_in_su_area = false;
-
-		/*
-		 * Adjust su area to cover cursor fully as necessary
-		 * (early transport). A visible cursor is in the state
-		 * even when it is not updated by itself as all planes
-		 * of the pipe are added into the state before the plane
-		 * checks when selective fetch is enabled.
-		 */
-		intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
-						  &cursor_in_su_area);
-
-		su_area_changed = intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+		*full_update = true;
+}
 
-		/*
-		 * If the cursor was outside the SU area before
-		 * alignment, the alignment step (which only expands
-		 * SU) may pull the cursor partially inside, so we
-		 * must run ET alignment again to fully cover it. But
-		 * if the cursor was already fully inside before
-		 * alignment, expanding the SU area won't change that,
-		 * so no further work is needed.
-		 */
-		if (cursor_in_su_area)
-			break;
-	} while (su_area_changed);
+static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
+					struct intel_crtc *crtc,
+					bool full_update)
+{
+	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_plane_state *new_plane_state, *old_plane_state;
+	struct intel_plane *plane;
+	struct drm_rect display_area = {
+		.x1 = 0,
+		.y1 = 0,
+		.x2 = drm_rect_width(&crtc_state->pipe_src),
+		.y2 = drm_rect_height(&crtc_state->pipe_src),
+	};
+	int i;
 
-skip_su_area_calc:
 	if (full_update)
 		clip_area_update(&crtc_state->psr2_su_area, &display_area,
 				 &display_area);
@@ -3121,6 +3087,73 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	return 0;
 }
 
+int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
+				struct intel_crtc *crtc)
+{
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+	struct drm_rect display_area = {
+		.x1 = 0,
+		.y1 = 0,
+		.x2 = drm_rect_width(&crtc_state->pipe_src),
+		.y2 = drm_rect_height(&crtc_state->pipe_src),
+	};
+	bool full_update, su_area_changed;
+
+	/*
+	 * Selective fetch is not always usable, for instance it is dropped
+	 * while pipe CRC is active. The planes keep their selective fetch
+	 * enable bit set in hardware over that, and a plane disabled while
+	 * selective fetch is off never gets the bit cleared. Once selective
+	 * fetch comes back the hardware would resume fetching for a plane that
+	 * is no longer enabled and keep its DDB range reserved, so have the
+	 * plane update drop the bit for every plane of the pipe as selective
+	 * fetch is turned off.
+	 */
+	crtc_state->clear_psr2_sel_fetch = old_crtc_state->enable_psr2_sel_fetch &&
+		!crtc_state->enable_psr2_sel_fetch;
+
+	if (!crtc_state->enable_psr2_sel_fetch)
+		return 0;
+
+	psr2_sel_fetch_compute_su_area(state, crtc, &full_update);
+
+	if (!full_update) {
+		intel_psr_apply_su_area_workarounds(crtc_state);
+
+		do {
+			bool cursor_in_su_area = false;
+
+			/*
+			 * Adjust su area to cover cursor fully as necessary
+			 * (early transport). A visible cursor is in the state
+			 * even when it is not updated by itself as all planes
+			 * of the pipe are added into the state before the plane
+			 * checks when selective fetch is enabled.
+			 */
+			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
+							  &cursor_in_su_area);
+
+			su_area_changed = intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+
+			/*
+			 * If the cursor was outside the SU area before
+			 * alignment, the alignment step (which only expands
+			 * SU) may pull the cursor partially inside, so we
+			 * must run ET alignment again to fully cover it. But
+			 * if the cursor was already fully inside before
+			 * alignment, expanding the SU area won't change that,
+			 * so no further work is needed.
+			 */
+			if (cursor_in_su_area)
+				break;
+		} while (su_area_changed);
+	}
+
+	return psr2_sel_fetch_apply_su_area(state, crtc, full_update);
+}
+
 void intel_psr2_panic_force_full_update(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
-- 
2.43.0

