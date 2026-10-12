Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03607CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FF010F06F;
	Mon, 12 Oct 2026 12:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683410F06F;
 Mon, 12 Oct 2026 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808916; x=1823344916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4fcV+xcyPC5NlWarsk0eKBoT8QYe93Y6KuBQpnE5No=;
 b=WFhAHh1uRd6sWZ3yIXRDT/fpD6jRqzxz1rVCrFvt4+PGOEeNZglaj95+
 dcHq7YDlcdb7C7vKM622AaVLm9jmLw5SNrc+fYTjfjGKvM+DAMt0pakOt
 eUhRmPMUsdMLyAA5c8WDx7xpL/p4gwQ7dzpYXrGev32iR3/T8IjoLmsWb
 w4MnZs7OzAXIsSmHoocrq0NGE7xFSs3hj+W90qHOftyLwQQEYhePrKPEx
 5H/V4zyVwMdiuCGPMif+xXkiGsqekdzss70PQsHrczakLABmo3P/H4xva
 1fhKsYrMZz672jFIhFMZtQYoj/hDTlwpzlIf2Z/lSJpU2P/YY+1Db9M8k g==;
X-CSE-ConnectionGUID: IOxnhORkTaemWjoculT0iw==
X-CSE-MsgGUID: Crc741onQkqL7mxk+tubaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506213"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:55 -0700
X-CSE-ConnectionGUID: K3OC+QkbRIiH8pxKUTLPVw==
X-CSE-MsgGUID: 8CipHeILR4WwQpx0L4F1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808177"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:54 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 4/6] drm/i915/psr: Merge the selective fetch area across
 joined pipes
Date: Mon, 12 Oct 2026 12:41:43 +0000
Message-ID: <20261012124145.1960050-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
MIME-Version: 1.0
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
one. Run the early transport and granularity alignment on the merged
area and merge again as long as that keeps growing it.

The plane support check has to run before the merge, so it now covers
every visible plane instead of only the ones intersecting the area.

v2: Do not force a full update when a joined pipe has no damage of its
    own, skip the empty pipes in the merge (Jouni)
    Redo the early transport alignment on the merged area, a cursor can
    end up partially covered once the area grows (Jouni)
    Break out of the compute loop on the first full update (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c  | 274 ++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_vdsc.c |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h |   2 +-
 3 files changed, 198 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 6ec13737e248..c256d3c87626 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2657,9 +2657,11 @@ void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
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
@@ -2670,7 +2672,7 @@ void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 	if (!crtc_state->dsc.compression_enable)
 		return;
 
-	intel_dsc_su_et_parameters_configure(dsb, encoder, crtc_state,
+	intel_dsc_su_et_parameters_configure(dsb, crtc_state,
 					     drm_rect_height(&crtc_state->psr2_su_area));
 }
 
@@ -2900,12 +2902,10 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 		intel_psr_apply_pr_link_on_su_wa(crtc_state);
 }
 
-int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
-				struct intel_crtc *crtc)
+static int psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
+					  struct intel_crtc *crtc,
+					  bool *full_update)
 {
-	struct intel_display *display = to_intel_display(state);
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
@@ -2915,28 +2915,13 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		.x2 = crtc_state->hw.pipe_mode.crtc_hdisplay,
 		.y2 = crtc_state->hw.pipe_mode.crtc_vdisplay,
 	};
-	bool full_update = false, su_area_changed;
 	int i, ret;
 
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
 
 	if (!psr2_sel_fetch_pipe_state_supported(crtc_state)) {
-		full_update = true;
-		goto skip_sel_fetch_set_loop;
+		*full_update = true;
+		return 0;
 	}
 
 	crtc_state->psr2_su_area.x1 = 0;
@@ -2963,7 +2948,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			continue;
 
 		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
-			full_update = true;
+			*full_update = true;
 			break;
 		}
 
@@ -3013,55 +2998,128 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		clip_area_update(&crtc_state->psr2_su_area, &damaged_area, &display_area);
 	}
 
-	/*
-	 * TODO: For now we are just using full update in case
-	 * selective fetch area calculation fails. To optimize this we
-	 * should identify cases where this happens and fix the area
-	 * calculation for those.
-	 */
-	if (crtc_state->psr2_su_area.y1 == -1) {
-		drm_info_once(display->drm,
-			      "Selective fetch area calculation failed in pipe %c\n",
-			      pipe_name(crtc->pipe));
-		full_update = true;
-	}
-
-	if (full_update)
-		goto skip_sel_fetch_set_loop;
+	if (*full_update)
+		return 0;
 
-	intel_psr_apply_su_area_workarounds(crtc_state);
+	/* The W/As below would turn an empty area into a bogus one. */
+	if (crtc_state->psr2_su_area.y1 != -1)
+		intel_psr_apply_su_area_workarounds(crtc_state);
 
 	ret = drm_atomic_add_affected_planes(&state->base, &crtc->base);
 	if (ret)
 		return ret;
 
-	do {
-		bool cursor_in_su_area = false;
+	/* The loop above never saw the planes pulled in just now. */
+	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
+		if (new_plane_state->hw.crtc != crtc_state->uapi.crtc ||
+		    !new_plane_state->uapi.visible)
+			continue;
 
-		/*
-		 * Adjust su area to cover cursor fully as necessary
-		 * (early transport). This needs to be done after
-		 * drm_atomic_add_affected_planes to ensure visible
-		 * cursor is added into affected planes even when
-		 * cursor is not updated by itself.
-		 */
-		intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
-						  &cursor_in_su_area);
+		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
+			*full_update = true;
+			return 0;
+		}
+	}
 
-		su_area_changed = intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+	return 0;
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
+	for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
+		crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+
+		crtc_state->psr2_su_area.y1 = y1;
+		crtc_state->psr2_su_area.y2 = y2;
+	}
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
+				.x2 = crtc_state->hw.pipe_mode.crtc_hdisplay,
+				.y2 = crtc_state->hw.pipe_mode.crtc_vdisplay,
+			};
+			struct drm_rect old_su_area = crtc_state->psr2_su_area;
+			bool cursor_in_su_area = false;
+
+			/* Needs the planes already pulled into the state. */
+			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
+							  &cursor_in_su_area);
+
+			intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+
+			su_area_changed |= !drm_rect_equals(&crtc_state->psr2_su_area,
+							    &old_su_area);
+		}
+
+		if (su_area_changed)
+			psr2_sel_fetch_merge_su_area(state, joined_pipes);
 	} while (su_area_changed);
+}
+
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
+		.x2 = crtc_state->hw.pipe_mode.crtc_hdisplay,
+		.y2 = crtc_state->hw.pipe_mode.crtc_vdisplay,
+	};
+	int i;
+
+	if (full_update) {
+		crtc_state->psr2_su_area = display_area;
+		goto out;
+	}
 
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
@@ -3091,12 +3149,6 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			continue;
 		}
 
-		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
-			full_update = true;
-			break;
-		}
-
-		sel_fetch_area = &new_plane_state->psr2_sel_fetch_area;
 		sel_fetch_area->y1 = inter.y1 - new_plane_state->uapi.dst.y1;
 		sel_fetch_area->y2 = inter.y2 - new_plane_state->uapi.dst.y1;
 		crtc_state->update_planes |= BIT(plane->id);
@@ -3120,14 +3172,80 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		}
 	}
 
-skip_sel_fetch_set_loop:
-	if (full_update)
-		clip_area_update(&crtc_state->psr2_su_area, &display_area,
-				 &display_area);
-
+out:
 	psr2_man_trk_ctl_calc(crtc_state, full_update);
 	crtc_state->pipe_srcsz_early_tpt =
 		psr2_pipe_srcsz_early_tpt_calc(crtc_state, full_update);
+
+	return 0;
+}
+
+int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
+				struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
+	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+	struct intel_crtc *joined_crtc;
+	bool full_update = false;
+	u8 joined_pipes;
+	int ret;
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
+	/* The joined pipes are handled in one go from the primary. */
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return 0;
+
+	joined_pipes = intel_crtc_joined_pipe_mask(crtc_state);
+
+	for_each_intel_crtc_in_pipe_mask(display, joined_crtc, joined_pipes) {
+		ret = psr2_sel_fetch_compute_su_area(state, joined_crtc,
+						     &full_update);
+		if (ret)
+			return ret;
+
+		/* One pipe falling back takes all of them with it. */
+		if (full_update)
+			break;
+	}
+
+	/*
+	 * TODO: For now we are just using full update in case selective fetch
+	 * area calculation fails. To optimize this we should identify cases
+	 * where this happens and fix the area calculation for those.
+	 */
+	if (!full_update && !psr2_sel_fetch_merge_su_area(state, joined_pipes)) {
+		drm_info_once(display->drm,
+			      "Selective fetch area calculation failed in pipe %c\n",
+			      pipe_name(crtc->pipe));
+		full_update = true;
+	}
+
+	if (!full_update)
+		psr2_sel_fetch_align_su_area(state, joined_pipes);
+
+	for_each_intel_crtc_in_pipe_mask(display, joined_crtc, joined_pipes) {
+		ret = psr2_sel_fetch_apply_su_area(state, joined_crtc, full_update);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8f06c3a4d56d..29eec44ca3b0 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -820,7 +820,7 @@ void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
 				  sizeof(dp_dsc_pps_sdp));
 }
 
-void intel_dsc_su_et_parameters_configure(struct intel_dsb *dsb, struct intel_encoder *encoder,
+void intel_dsc_su_et_parameters_configure(struct intel_dsb *dsb,
 					  const struct intel_crtc_state *crtc_state, int su_lines)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
index 3372f8694054..08a3ffedb8ec 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -38,7 +38,7 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
 			     const struct intel_crtc_state *crtc_state);
 void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
 			    const struct intel_crtc_state *crtc_state);
-void intel_dsc_su_et_parameters_configure(struct intel_dsb *dsb, struct intel_encoder *encoder,
+void intel_dsc_su_et_parameters_configure(struct intel_dsb *dsb,
 					  const struct intel_crtc_state *crtc_state, int su_lines);
 void intel_vdsc_state_dump(struct drm_printer *p, int indent,
 			   const struct intel_crtc_state *crtc_state);
-- 
2.43.0

