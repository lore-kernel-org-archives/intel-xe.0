Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C0606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEqQb/wO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9B9112AA4;
	Fri, 23 Oct 2026 10:01:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EFB112A9C;
 Fri, 23 Oct 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749667; x=1824285667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRH2YOcl8dZ9Aw+FYw0LDSxLqO0QetU23x/22CkwATQ=;
 b=iEqQb/wOwRwl7wFTFdHFU4PbTOsaCN4j4mYJfxg9lt+4NG8I99HxOV20
 igAZXQ/OVIQ3PtJSGROFm+I9KQoRlIS3j/IOde4zV7l5puGlcAxOkL+Mc
 m8prphKA8QCFritHRg2JsncI7Ii2i0er3ibJ1f71El74MEXgJsdjfzTxg
 ynR+pELTg4vkuexPgWB3NYKdMABhVTCIChxtqAfeKsgsf94WRdnwjUP1n
 udoQC+CtZF0QuLCPgQn9NreIFB6P4DqcaYeFJJVRGdw69Re5rWsqHD7im
 bdgvoTJA808nWbCQdMLOHXE1lMzsD13orCJruuUPtN4yqH4aG6nReRTqx w==;
X-CSE-ConnectionGUID: AtsF51KbRD2VGhz2w1Q+PQ==
X-CSE-MsgGUID: l/550KSjR56E7zShO07/vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384275"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:05 -0700
X-CSE-ConnectionGUID: M+MMvzhuRrG7p9+a3R6BlA==
X-CSE-MsgGUID: DzcDZZ1zQMel29aqpHjxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932728"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:03 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 6/9] drm/i915/psr: Merge the selective fetch area across
 joined pipes
Date: Fri, 23 Oct 2026 10:00:49 +0000
Message-ID: <20261023100052.683192-7-mika.kahola@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSR2_MAN_TRK_CTL is per transcoder and a joined config has only one
transcoder, so both joined pipes would program it and the primary
would win. Merge the per-pipe areas, hand the result back to every
joined pipe before the plane areas are set and write the transcoder
register from the primary only. The joiner splits the image
horizontally, so the pipes share the Y coordinate space and all of
them have to fetch the merged range.

A joined pipe can legitimately have no damage of its own, plane
visibility is computed per pipe against the translated pipe_src, so a
plane confined to one half is not visible on the other pipe. Keep such
a pipe out of the merge instead of treating it as a failed area
calculation, and only fall back to a full update when no joined pipe
has any damage.

Merging only ever grows the area, so a cursor that did not intersect
the area of its own pipe can end up partially covered by the merged
one. Run the alignment on the merged area and merge again as long as
that keeps growing it.

The SU area WAs clamp the region that ends up in the per transcoder
PSR2_MAN_TRK_CTL, so they have to run on the merged area. Applying them
per pipe before the merge evaluated them against a partial area, and
Wa 14019834836 was skipped altogether when only a secondary pipe had
damage, as it looks at uapi.encoder_mask and that is zero for the
joiner secondary. Apply them once on the merged area from the primary
and hand the result back to every joined pipe.

On full update assign the whole display area rather than clipping into
the existing one. A pipe whose damage calculation was skipped, because
another joined pipe already forced the full update, has no area to clip
into.

v2: Do not force a full update when a joined pipe has no damage of its
    own, skip the empty pipes in the merge (Jouni)
    Redo the early transport alignment on the merged area, a cursor can
    end up partially covered once the area grows (Jouni)
    Break out of the compute loop on the first full update (Jouni)
v3: Follow the pipe_src change in the previous patch (Jouni)
    Apply the SU area WAs on the merged area instead of per pipe,
    the joiner secondary has no encoders for them to look at (Jouni)
    Split the helper extraction and the alignment loop condition into
    their own patches, this one now only adds the joiner handling

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 183 ++++++++++++++++++-----
 1 file changed, 145 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 102133e80abc5..ffbb1e55c2b5a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2661,9 +2661,11 @@ void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 		break;
 	}
 
-	intel_de_write_dsb(display, dsb,
-			   PSR2_MAN_TRK_CTL(display, cpu_transcoder),
-			   crtc_state->psr2_man_track_ctl);
+	/* The joined pipes drive one transcoder, so program it once. */
+	if (!intel_crtc_is_joiner_secondary(crtc_state))
+		intel_de_write_dsb(display, dsb,
+				   PSR2_MAN_TRK_CTL(display, cpu_transcoder),
+				   crtc_state->psr2_man_track_ctl);
 
 	if (!crtc_state->enable_psr2_su_region_et)
 		return;
@@ -2880,6 +2882,11 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
+	/*
+	 * Called on the merged area, with the joiner primary crtc_state. The
+	 * secondary has no encoders of its own and the WAs below have to see
+	 * the whole SU region that goes into PSR2_MAN_TRK_CTL.
+	 */
 	/* Wa_14014971492 */
 	if (!crtc_state->has_panel_replay &&
 	    ((IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_B0) ||
@@ -2993,15 +3000,91 @@ static void psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
 
 		clip_area_update(&crtc_state->psr2_su_area, &damaged_area, &display_area);
 	}
+}
 
-	/*
-	 * TODO: For now we are just using full update in case
-	 * selective fetch area calculation fails. To optimize this we
-	 * should identify cases where this happens and fix the area
-	 * calculation for those.
-	 */
-	if (crtc_state->psr2_su_area.y1 == -1)
-		*full_update = true;
+static void psr2_sel_fetch_set_su_area(struct intel_atomic_state *state,
+				       u8 joined_pipes, int y1, int y2)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc *crtc;
+
+	for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
+		struct intel_crtc_state *crtc_state =
+			intel_atomic_get_new_crtc_state(state, crtc);
+
+		crtc_state->psr2_su_area.y1 = y1;
+		crtc_state->psr2_su_area.y2 = y2;
+	}
+}
+
+/*
+ * One transcoder means one SU region. Joining splits the image horizontally, so
+ * the pipes share the Y range. Returns false if no joined pipe has any damage.
+ */
+static bool psr2_sel_fetch_merge_su_area(struct intel_atomic_state *state,
+					 u8 joined_pipes)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc_state *crtc_state;
+	struct intel_crtc *crtc;
+	int y1 = INT_MAX, y2 = INT_MIN;
+
+	for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
+		crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+
+		/* An empty area must not drag the merged one down. */
+		if (crtc_state->psr2_su_area.y1 == -1)
+			continue;
+
+		y1 = min(y1, crtc_state->psr2_su_area.y1);
+		y2 = max(y2, crtc_state->psr2_su_area.y2);
+	}
+
+	if (y1 == INT_MAX)
+		return false;
+
+	psr2_sel_fetch_set_su_area(state, joined_pipes, y1, y2);
+
+	return true;
+}
+
+/*
+ * Merging only grows the area, so a cursor that missed its own pipe's area can
+ * end up partially covered. Realign on the merged area until it stops growing.
+ */
+static void psr2_sel_fetch_align_su_area(struct intel_atomic_state *state,
+					 u8 joined_pipes)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc *crtc;
+	bool su_area_changed;
+
+	do {
+		su_area_changed = false;
+
+		for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
+			struct intel_crtc_state *crtc_state =
+				intel_atomic_get_new_crtc_state(state, crtc);
+			struct drm_rect display_area = {
+				.x1 = 0,
+				.y1 = 0,
+				.x2 = drm_rect_width(&crtc_state->pipe_src),
+				.y2 = drm_rect_height(&crtc_state->pipe_src),
+			};
+			struct drm_rect old_su_area = crtc_state->psr2_su_area;
+
+			/* Needs the planes already pulled into the state. */
+			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area);
+
+			intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+
+			su_area_changed |= !drm_rect_equals(&crtc_state->psr2_su_area,
+							    &old_su_area);
+		}
+
+		if (su_area_changed)
+			psr2_sel_fetch_merge_su_area(state, joined_pipes);
+	} while (su_area_changed);
 }
 
 static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
@@ -3019,9 +3102,14 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 	};
 	int i;
 
+	/*
+	 * On full update the whole pipe is fetched, the plane loop below then
+	 * gives every visible plane its full area. Plane states come out of
+	 * the duplicate with a zero sized area, so this has to run on full
+	 * update as well.
+	 */
 	if (full_update)
-		clip_area_update(&crtc_state->psr2_su_area, &display_area,
-				 &display_area);
+		crtc_state->psr2_su_area = display_area;
 
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
@@ -3075,22 +3163,21 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 	psr2_man_trk_ctl_calc(crtc_state, full_update);
 	crtc_state->pipe_srcsz_early_tpt =
 		psr2_pipe_srcsz_early_tpt_calc(crtc_state, full_update);
+
 	return 0;
 }
 
 int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
+	struct intel_display *display = to_intel_display(state);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_rect display_area = {
-		.x1 = 0,
-		.y1 = 0,
-		.x2 = drm_rect_width(&crtc_state->pipe_src),
-		.y2 = drm_rect_height(&crtc_state->pipe_src),
-	};
-	bool full_update, su_area_changed;
+	struct intel_crtc *joined_crtc;
+	bool full_update = false;
+	u8 joined_pipes;
+	int ret;
 
 	/*
 	 * Selective fetch is not always usable, for instance it is dropped
@@ -3108,31 +3195,51 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	if (!crtc_state->enable_psr2_sel_fetch)
 		return 0;
 
-	psr2_sel_fetch_compute_su_area(state, crtc, &full_update);
+	/* The joined pipes are handled in one go from the primary. */
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return 0;
 
-	if (!full_update) {
-		intel_psr_apply_su_area_workarounds(crtc_state);
+	joined_pipes = intel_crtc_joined_pipe_mask(crtc_state);
 
-		do {
-			struct drm_rect old_su_area = crtc_state->psr2_su_area;
+	for_each_intel_crtc_in_pipe_mask(display, joined_crtc, joined_pipes) {
+		psr2_sel_fetch_compute_su_area(state, joined_crtc, &full_update);
 
-			/*
-			 * Adjust su area to cover cursor fully as necessary
-			 * (early transport). A visible cursor is in the state
-			 * even when it is not updated by itself as all planes
-			 * of the pipe are added into the state before the plane
-			 * checks when selective fetch is enabled.
-			 */
-			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area);
+		/* One pipe falling back takes all of them with it. */
+		if (full_update)
+			break;
+	}
 
-			intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+	/*
+	 * TODO: For now we are just using full update in case selective fetch
+	 * area calculation fails. To optimize this we should identify cases
+	 * where this happens and fix the area calculation for those.
+	 */
+	if (!full_update && !psr2_sel_fetch_merge_su_area(state, joined_pipes))
+		full_update = true;
 
-			su_area_changed = !drm_rect_equals(&crtc_state->psr2_su_area,
-							   &old_su_area);
-		} while (su_area_changed);
+	if (!full_update) {
+		/*
+		 * The WAs clamp the SU region that ends up in the per
+		 * transcoder PSR2_MAN_TRK_CTL, so they have to run on the
+		 * merged area rather than on the per pipe ones. crtc_state is
+		 * the joiner primary, the only one carrying the encoders the
+		 * WAs look at, and the merge guarantees a non empty area.
+		 */
+		intel_psr_apply_su_area_workarounds(crtc_state);
+		psr2_sel_fetch_set_su_area(state, joined_pipes,
+					   crtc_state->psr2_su_area.y1,
+					   crtc_state->psr2_su_area.y2);
+
+		psr2_sel_fetch_align_su_area(state, joined_pipes);
 	}
 
-	return psr2_sel_fetch_apply_su_area(state, crtc, full_update);
+	for_each_intel_crtc_in_pipe_mask(display, joined_crtc, joined_pipes) {
+		ret = psr2_sel_fetch_apply_su_area(state, joined_crtc, full_update);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 void intel_psr2_panic_force_full_update(const struct intel_crtc_state *crtc_state)
-- 
2.43.0

