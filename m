Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C1DC5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19DB10EA73;
	Tue, 18 Aug 2026 08:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9NXN+Ui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6628010EA6F;
 Tue, 18 Aug 2026 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787042861; x=1818578861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSOfTBs1Nwfhg0sj0iyVsAxqkJtSHhCMgt2QD8mBFws=;
 b=F9NXN+UirTD9bfrMs+aGIow0WXj27s3xe2VyCc5qJ8xBmAnL3Nvxiy1N
 QWt+jKXrbnPUMwPdNqbqmoiEH1A14WAD0sdnFcIzGvFddu705TgYgPJeO
 XTZw1VnX17io/uAM/pwaYfiQBHYfJduzxq/+EGsOmBOKcOftnPtUaQA2P
 TtWKhG7WjFnrSnaaGXZ0KYGnJQNvInYD3vj6wKc6mYrh1LZ1GiGss4I52
 3h7mG9wb+uCGwbAYFzvWIlc+xe8YcP5G3eKB4UN3wshDXTI2g5nMFDLYE
 VDCj7ksVhk9ORrg29jXKMo97QCCa32LivXBHpbzeUjSRU49wS+Fks5knE A==;
X-CSE-ConnectionGUID: hOzRUx7kRQuyUhOGtYsnAg==
X-CSE-MsgGUID: 01AoO7FzQtapGmH4yOA5Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87403791"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87403791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:47:40 -0700
X-CSE-ConnectionGUID: jsAGxEAFRyOvDDzs++f+5Q==
X-CSE-MsgGUID: wKxWUCesRCmX3sFQg7mQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267136687"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 01:47:39 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Schedule cursor unpin per joined pipe
Date: Tue, 18 Aug 2026 14:12:35 +0530
Message-Id: <20260818084236.2168580-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260818084236.2168580-1-nemesa.garg@intel.com>
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
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
index be32fb6dbc6b..8599b39b033e 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -887,7 +887,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_plane_state *new_plane_state = NULL;
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_vblank_evade_ctx evade;
@@ -987,7 +986,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		num_pipes++;
 	}
 
-	new_plane_state = joined_pipe_state[0].new_plane_state;
 	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
 
@@ -1072,17 +1070,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
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

