Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EBE606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ih6FcK4V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFB9112A9C;
	Fri, 23 Oct 2026 10:01:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08814112A6F;
 Fri, 23 Oct 2026 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749664; x=1824285664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nms8xIHY05OndGyTleJRF9fkLD9fznh45/XCRIxf2nU=;
 b=ih6FcK4VGUueJwbIX3v18cMODNHxJSwMrazUDU1Yney7e6EBC6E7xAM4
 AT31ZenM8GI6FiRRyQpwuALgWxVNSSu7sRTkWLrojJa+NIMYpsnM/HjPk
 kfejvpoqUrnujit7ghy2/azQ1Xv4VHlGCejXqHCduc6D/v9FGcTAlHAxq
 e6PQZEfSy4OjUdOAyoG6paGJXslwbgLZDZTzgoiwOeFoG0K3rhpla8RjH
 ISJAoiZhJkVrBZ3Aqpm6ti7hEcdTwjcn1ixfX00GVQ8skuR0obXq8r6Fx
 IOz0qjx4MCFkkdF7rj7wtdNvCNh24tq0ClUdIShCoynnJR/d7DBPNAXCt A==;
X-CSE-ConnectionGUID: +g5FPDYiTkm2i1RqmD+6xg==
X-CSE-MsgGUID: 75LlcHyaSYK/Cq9OdWUEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384264"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384264"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:03 -0700
X-CSE-ConnectionGUID: ps7yfaJITQuttyDRz34ZXg==
X-CSE-MsgGUID: p6zwyxFJSmiYNj4WOfwLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932716"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:01 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 5/9] drm/i915/psr: Derive the alignment loop condition from
 the SU area
Date: Fri, 23 Oct 2026 10:00:48 +0000
Message-ID: <20261023100052.683192-6-mika.kahola@intel.com>
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

The loop aligning the selective update area decides whether to run
again from two partial signals, the return value of
intel_psr2_sel_fetch_pipe_alignment() and the cursor_in_su_area out
parameter of intel_psr2_sel_fetch_et_alignment(). Neither answers what
the loop actually asks, which is whether the area changed at all, and
neither survives a step that grows the area between rounds.

Compare the area against a snapshot taken at the top of the loop
instead. Both alignment steps only ever expand the area, so this still
converges. A cursor already inside the area when alignment moves it
now takes one extra round, which changes nothing and exits.

The return value and the out parameter are now unused, drop them.

Split out of the joiner selective fetch merge patch, where Sashiko
suggested removing cursor_in_su_area.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 37 ++++++------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9db064fb39afd..102133e80abc5 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2748,12 +2748,11 @@ static void clip_area_update(struct drm_rect *overlap_damage_area,
 		overlap_damage_area->y2 = inter.y2;
 }
 
-static bool intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_state)
+static void intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	u16 y_alignment;
-	bool su_area_changed = false;
 
 	/* ADLP aligns the SU region to vdsc slice height in case dsc is enabled */
 	if (crtc_state->dsc.compression_enable &&
@@ -2762,18 +2761,12 @@ static bool intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_st
 	else
 		y_alignment = crtc_state->su_y_granularity;
 
-	if (crtc_state->psr2_su_area.y1 % y_alignment) {
+	if (crtc_state->psr2_su_area.y1 % y_alignment)
 		crtc_state->psr2_su_area.y1 -= crtc_state->psr2_su_area.y1 % y_alignment;
-		su_area_changed = true;
-	}
 
-	if (crtc_state->psr2_su_area.y2 % y_alignment) {
+	if (crtc_state->psr2_su_area.y2 % y_alignment)
 		crtc_state->psr2_su_area.y2 = ((crtc_state->psr2_su_area.y2 /
 						y_alignment) + 1) * y_alignment;
-		su_area_changed = true;
-	}
-
-	return su_area_changed;
 }
 
 /*
@@ -2783,8 +2776,7 @@ static bool intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_st
 static void
 intel_psr2_sel_fetch_et_alignment(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc,
-				  struct drm_rect *display_area,
-				  bool *cursor_in_su_area)
+				  struct drm_rect *display_area)
 {
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state;
@@ -2812,7 +2804,6 @@ intel_psr2_sel_fetch_et_alignment(struct intel_atomic_state *state,
 
 		clip_area_update(&crtc_state->psr2_su_area, &new_plane_state->uapi.dst,
 				 display_area);
-		*cursor_in_su_area = true;
 	}
 }
 
@@ -3123,7 +3114,7 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		intel_psr_apply_su_area_workarounds(crtc_state);
 
 		do {
-			bool cursor_in_su_area = false;
+			struct drm_rect old_su_area = crtc_state->psr2_su_area;
 
 			/*
 			 * Adjust su area to cover cursor fully as necessary
@@ -3132,22 +3123,12 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			 * of the pipe are added into the state before the plane
 			 * checks when selective fetch is enabled.
 			 */
-			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
-							  &cursor_in_su_area);
+			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area);
 
-			su_area_changed = intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+			intel_psr2_sel_fetch_pipe_alignment(crtc_state);
 
-			/*
-			 * If the cursor was outside the SU area before
-			 * alignment, the alignment step (which only expands
-			 * SU) may pull the cursor partially inside, so we
-			 * must run ET alignment again to fully cover it. But
-			 * if the cursor was already fully inside before
-			 * alignment, expanding the SU area won't change that,
-			 * so no further work is needed.
-			 */
-			if (cursor_in_su_area)
-				break;
+			su_area_changed = !drm_rect_equals(&crtc_state->psr2_su_area,
+							   &old_su_area);
 		} while (su_area_changed);
 	}
 
-- 
2.43.0

