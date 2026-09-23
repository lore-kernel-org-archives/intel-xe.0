Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B5CC9830E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402710F00C;
	Wed, 23 Sep 2026 12:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlQSOQiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C348010F008;
 Wed, 23 Sep 2026 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164829; x=1821700829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pmZK4Sk/KrASe6vemqcESyHEXZ/rWbA80Fusk6OYzOU=;
 b=SlQSOQiSrDQHnGk45EI9AiGTahsYpu3trBSFcOtiWt50mleJU5s93s3o
 dEHwROEagHjd+FsBojGBloWaIPg+zmaLhdnZ8ZrO1pOXaNLHW3qNUqDE1
 jFI6BNmFVSgvtvhGkTY3KlHnQ3wIf0rhWGiprhwZljfaM46rUHkNNgNB7
 jAW6HcLKpqpXwc8S+NoH0G0VnmyuM7WPz877m7k8zHgwgTH6XPJB9+cZF
 GaEUz4SH5NM4sCnHLBKchPO6CenBFQqeifBUE9FUUZE3UyP5tTjZ6MCyd
 tLEmyOyBEFsS7PK4Lh+2okMhKuZAfRKZA3k6XdiJXuYM1jad9QP1Qc7LY w==;
X-CSE-ConnectionGUID: 4TpYPAfDSrSVIkvMk9chiw==
X-CSE-MsgGUID: Rj6uhM5YR8W7k62SLTZTkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965144"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965144"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:48 -0700
X-CSE-ConnectionGUID: y4K2VxriRFS8/KAi7eOiPQ==
X-CSE-MsgGUID: nN42MQHHR/6KSKTvsPMFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665830"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:47 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Merge the selective fetch area across joined
 pipes
Date: Wed, 23 Sep 2026 11:59:39 +0000
Message-ID: <20260923115941.746934-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
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

The plane support check has to run before the merge, so it now covers
every visible plane instead of only the ones intersecting the area.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c  | 184 +++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_vdsc.c |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h |   2 +-
 3 files changed, 145 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c1994da38567..4743b5b91743 100644
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
 
@@ -2900,12 +2902,11 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 		intel_psr_apply_pr_link_on_su_wa(crtc_state);
 }
 
-int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
-				struct intel_crtc *crtc)
+static int psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
+					  struct intel_crtc *crtc,
+					  bool *full_update)
 {
 	struct intel_display *display = to_intel_display(state);
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
@@ -2915,28 +2916,14 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		.x2 = drm_rect_width(&crtc_state->pipe_src),
 		.y2 = drm_rect_height(&crtc_state->pipe_src),
 	};
-	bool full_update = false, su_area_changed;
+	bool su_area_changed;
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
@@ -2963,7 +2950,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			continue;
 
 		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
-			full_update = true;
+			*full_update = true;
 			break;
 		}
 
@@ -3023,11 +3010,11 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		drm_info_once(display->drm,
 			      "Selective fetch area calculation failed in pipe %c\n",
 			      pipe_name(crtc->pipe));
-		full_update = true;
+		*full_update = true;
 	}
 
-	if (full_update)
-		goto skip_sel_fetch_set_loop;
+	if (*full_update)
+		return 0;
 
 	intel_psr_apply_su_area_workarounds(crtc_state);
 
@@ -3035,6 +3022,21 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
+	/*
+	 * The loop above never saw the planes pulled in just now, and the area
+	 * has to be final before the joined pipes merge it.
+	 */
+	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
+		if (new_plane_state->hw.crtc != crtc_state->uapi.crtc ||
+		    !new_plane_state->uapi.visible)
+			continue;
+
+		if (!psr2_sel_fetch_plane_state_supported(new_plane_state)) {
+			*full_update = true;
+			return 0;
+		}
+	}
+
 	do {
 		bool cursor_in_su_area = false;
 
@@ -3063,6 +3065,58 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			break;
 	} while (su_area_changed);
 
+	return 0;
+}
+
+/*
+ * The joined pipes share one transcoder, and thus one SU region describing the
+ * whole joined frame. Joining splits the image horizontally, so the pipes share
+ * the Y coordinate space and each of them has to fetch the merged range.
+ */
+static void psr2_sel_fetch_merge_su_area(struct intel_atomic_state *state,
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
+		y1 = min(y1, crtc_state->psr2_su_area.y1);
+		y2 = max(y2, crtc_state->psr2_su_area.y2);
+	}
+
+	for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
+		crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+
+		crtc_state->psr2_su_area.y1 = y1;
+		crtc_state->psr2_su_area.y2 = y2;
+	}
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
+		.x2 = drm_rect_width(&crtc_state->pipe_src),
+		.y2 = drm_rect_height(&crtc_state->pipe_src),
+	};
+	int i;
+
+	if (full_update) {
+		clip_area_update(&crtc_state->psr2_su_area, &display_area,
+				 &display_area);
+		goto out;
+	}
+
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
 	 * every plane, if it does set the plane selective fetch area.
@@ -3091,12 +3145,6 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
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
@@ -3120,14 +3168,68 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
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
+		bool pipe_full_update;
+
+		ret = psr2_sel_fetch_compute_su_area(state, joined_crtc,
+						     &pipe_full_update);
+		if (ret)
+			return ret;
+
+		full_update |= pipe_full_update;
+	}
+
+	if (!full_update)
+		psr2_sel_fetch_merge_su_area(state, joined_pipes);
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
