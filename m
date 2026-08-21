Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E84C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22510F217;
	Fri, 21 Aug 2026 04:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHOxry97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF8510F209;
 Fri, 21 Aug 2026 04:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787287871; x=1818823871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADKGZD2LylMtrLErIhVB2jmS5THy5y1fBsvGD0sqhGs=;
 b=aHOxry97gB0DyHU8kMgP4wqBj2N+CwBt2WL6kMDac24Ve+z4T3yuBGOP
 oXStCw8FI/r2s5Zf+CDGMUjKAoE3gx2X/+6CjqvhkvQ0b6Klz7ipQ48G8
 Jw5LZmPhCYLJzc+pJljM+dHEyQVtc4R1knQ3o0Z2c7X6T459i5i0MOPwg
 0Z1WTJA79TEwtk7LxXVpyn5sFCjrnKY19ADL+OCdeD5vxyTOYTxtsAGHy
 CIi8Yn/Uwxpqws4odQ61n/NdVO+jT5NsZ3Fn3ybrYmnqCMYTs9OCFHjTT
 tGuqHzOYxhpDLxIh18MjsvooDE39OTPdzRpyZZBVvNoD0M6xlg/vfNrJJ g==;
X-CSE-ConnectionGUID: cQgLd7fPTfWaAASHmv3t4w==
X-CSE-MsgGUID: SLC02C5TQWmja1hNWZ+/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87893836"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87893836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:51:10 -0700
X-CSE-ConnectionGUID: x0TxXDi/RyeW3hRflhU8XQ==
X-CSE-MsgGUID: rhlPNZhyRIuUwe3hegmSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266291119"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:51:09 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Schedule cursor unpin per joined pipe
Date: Fri, 21 Aug 2026 10:17:54 +0530
Message-Id: <20260821044755.2234490-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821044755.2234490-1-nemesa.garg@intel.com>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
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

Convert the primary-only vblank unpin block into a loop over the
joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for
unpin (or unpinned inline when unchanged) independently. All unpin
work is armed on the primary crtc's vblank (&crtc->base), consistent
with the single primary vblank evasion used above.

v4: Split from the update_arm loop conversion. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index f5625dabc8f6..dedb6f87359c 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -894,7 +894,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_plane_state *new_plane_state = NULL;
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_vblank_evade_ctx evade;
@@ -993,7 +992,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		num_pipes++;
 	}
 
-	new_plane_state = joined_pipe_state[0].new_plane_state;
 	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
 
@@ -1078,17 +1076,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * Schedule or immediately unpin old framebuffers.
 	 * Protect against concurrent access.
 	 */
-	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
-		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
-				     intel_cursor_unpin_work);
-
-		drm_vblank_work_schedule(&old_plane_state->unpin_work,
-					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
-					 false);
-
-		joined_pipe_state[0].old_plane_state = NULL;
-	} else {
-		intel_plane_unpin_fb(old_plane_state);
+	for (int i = 0; i < num_pipes; i++) {
+		struct intel_plane_state *old = joined_pipe_state[i].old_plane_state;
+
+		if (old->ggtt_vma != joined_pipe_state[i].new_plane_state->ggtt_vma) {
+			drm_vblank_work_init(&old->unpin_work, &crtc->base,
+					     intel_cursor_unpin_work);
+			drm_vblank_work_schedule(&old->unpin_work,
+						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+						 false);
+			joined_pipe_state[i].old_plane_state = NULL;
+		} else {
+			intel_plane_unpin_fb(old);
+		}
 	}
 
 out_free:
-- 
2.25.1

