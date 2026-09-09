Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E214C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216BF10F0D0;
	Wed,  9 Sep 2026 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TykTrpYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3EB10F0C6;
 Wed,  9 Sep 2026 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788951971; x=1820487971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jd3Vib+GWtxZpE9Ct39PejRJrliPkIBRQeqymlv2cbQ=;
 b=TykTrpYNCSis8cD6Ribr/G+5wGABTkUw3jAABAV5PE0SfNE8VD1BSdaC
 c0VlVTnpT6NeFv0fOtBYpjOYj0/aXOLLJki6apEMGJiwlyvzxqL/dlsLi
 WEl2Mb8k+xaCNkMjR1/DOeNLb2XUfCYcg2MYRblegij04LmRMsyCeOA8U
 bEh3k/1bY3P+FdPio6KQ/tjmlUS95wRA67P0Ng0ZRSmEoNbsjJejpEoNY
 OVVlv9M9lXCTMaU6MK1jFuT/y5MGC459tM2ZB4ZFUSvqGcahi1aCJNWQz
 1j2fEwlN6zvS7zu4wh70XTYuigztdfIz0JBurzHLN3U8CLoHlJ3cV6/K7 g==;
X-CSE-ConnectionGUID: zkl1Icj6TeGofsIX2i9f7Q==
X-CSE-MsgGUID: +rOTy5APR5e1E+yXYWjO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91888660"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91888660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:06:11 -0700
X-CSE-ConnectionGUID: PZtWGkfwR4OT0hRWbp6fcA==
X-CSE-MsgGUID: eOYmeCFjS+mWRlvdZUz7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275425339"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa005.jf.intel.com with ESMTP; 09 Sep 2026 04:06:10 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on sel
 fetch disable
Date: Wed,  9 Sep 2026 16:33:32 +0530
Message-Id: <20260909110332.3528029-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909110332.3528029-1-nemesa.garg@intel.com>
References: <20260909110332.3528029-1-nemesa.garg@intel.com>
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

Selective fetch is dropped while pipe CRC is active, and the planes keep
their SEL_FETCH_PLANE_CTL / SEL_FETCH_CUR_CTL enable bit set in hardware
over that. A plane disabled while selective fetch is off never gets the
bit cleared, as the disable path is guarded by enable_psr2_sel_fetch.
Once selective fetch comes back the hardware resumes fetching for a
plane that is no longer enabled and keeps its DDB range reserved.

Clear the bits as selective fetch is turned off instead. Atomic check
has both the old and the new crtc state, so record the transition there
and let the plane and cursor arm paths write the registers to 0 for that
commit.

v2: Drop the old_crtc_state->hw.active check. [Jouni]

Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch configuration into plane source files")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739
Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c       |  7 +++++--
 .../gpu/drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c          | 15 +++++++++++++++
 .../gpu/drm/i915/display/skl_universal_plane.c    |  9 ++++-----
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 90173040d825..4afd275de86e 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -537,7 +537,8 @@ static void i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
+	if (!crtc_state->enable_psr2_sel_fetch &&
+	    !crtc_state->clear_psr2_sel_fetch)
 		return;
 
 	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);
@@ -570,8 +571,10 @@ static void i9xx_cursor_update_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
+	if (!crtc_state->enable_psr2_sel_fetch) {
+		i9xx_cursor_disable_sel_fetch_arm(dsb, plane, crtc_state);
 		return;
+	}
 
 	if (drm_rect_height(&plane_state->psr2_sel_fetch_area) > 0) {
 		if (crtc_state->enable_psr2_su_region_et) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9016be52c7ea..ec99ff10391c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1190,6 +1190,8 @@ struct intel_crtc_state {
 	bool has_sel_update;
 	bool enable_psr2_sel_fetch;
 	bool enable_psr2_su_region_et;
+	/* Drop the stale selective fetch enable bits as selective fetch is turned off */
+	bool clear_psr2_sel_fetch;
 	bool req_psr2_sdp_prior_scanline;
 	bool has_panel_replay;
 	bool link_off_after_as_sdp_when_pr_active;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f490beb66629..872e253db178 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2889,6 +2889,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
@@ -2901,6 +2903,19 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	bool full_update = false, su_area_changed;
 	int i, ret;
 
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
 	if (!crtc_state->enable_psr2_sel_fetch)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 07a683293352..eb5ed981b40f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -885,7 +885,8 @@ static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
+	if (!crtc_state->enable_psr2_sel_fetch &&
+	    !crtc_state->clear_psr2_sel_fetch)
 		return;
 
 	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);
@@ -1634,10 +1635,8 @@ static void icl_plane_update_sel_fetch_arm(struct intel_dsb *dsb,
 	struct intel_display *display = to_intel_display(plane);
 	enum pipe pipe = plane->pipe;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
-		return;
-
-	if (drm_rect_height(&plane_state->psr2_sel_fetch_area) > 0)
+	if (crtc_state->enable_psr2_sel_fetch &&
+	    drm_rect_height(&plane_state->psr2_sel_fetch_area) > 0)
 		intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id),
 				   SEL_FETCH_PLANE_CTL_ENABLE);
 	else
-- 
2.25.1

