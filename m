Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B4C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5113810EB75;
	Tue,  1 Sep 2026 07:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irxNig48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2510EB80;
 Tue,  1 Sep 2026 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788247864; x=1819783864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcV0YM0wKXASK3wt1gFpNgXUUmeMKNyFcS7cjw/N2Yc=;
 b=irxNig48yDIimy0G2S++D9QwrxEx7kO5yzCH+feyi3hN46FKvXFdItR6
 DJTSSWZuusXytH8qXwpKjMGt0ojEuJ2R6zmovgVA19g1H5fifNQhP97HQ
 KvgsVrxPocozKOcfp4Ut//BshsBAxUrmmtLa0YjuG/ydQI0rTEx/qlpw4
 +mHTFfbqY19+GCWygYTrxPnvwBaRTC9SyJcmCcvl1JgkoH58B0ZG+NER3
 mQgtOBk1RVkrJ5CeN4F1vHGSAFWu3vOIYvD427cquxhMe+Tpx5c3GXRJR
 4HPUOyBmh31XBpvEY4jDn1HzKwniD+uYywg0Xc8NUXiUV1PtKy04QV0If A==;
X-CSE-ConnectionGUID: QNR5KClRQxaCMDiDXN6myw==
X-CSE-MsgGUID: u38wSpXnRlKyACRAj3/pRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88692031"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88692031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:31:04 -0700
X-CSE-ConnectionGUID: Itfdh3KPRKiguN6jTr67FQ==
X-CSE-MsgGUID: I/7cRwJSSiipUiv6LXT6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272803115"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 01 Sep 2026 00:31:02 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 4/5] drm/i915/cursor: Program secondary cursor planes
Date: Tue,  1 Sep 2026 12:58:12 +0530
Message-Id: <20260901072813.2596383-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901072813.2596383-1-nemesa.garg@intel.com>
References: <20260901072813.2596383-1-nemesa.garg@intel.com>
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

Iterate over all joined pipes when arming/disabling the cursor plane so
secondary pipes are updated together with the primary. The pin, check
and state duplication for secondary pipes was already prepared in the
previous commit; this converts the update_arm pass to a loop over the
joined_pipe_state[] array.

Because the whole loop runs inside a single primary vblank-evade,
sample intel_crtc_get_vblank_counter() per pipe around each arm and
emit a drm_err() if the counter ticks during that pipe's own
programming.

v2: Check primary and secondary pipe together. [Ville]
v3: Use struct intel_cursor_joiner_state. [Ville]
v4: Add per-pipe vblank straddle detection around the arm loop. [Chaitanya]
v5: Move straddle check outside the loop to cover all pipes together.
    Sample vblank counter from primary pipe only.
    Move drm_err() after local_irq_enable(). [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 36 +++++++++++++++++----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b4f0f70eaa1a..894bd1df5f42 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -13,6 +13,7 @@
 #include <drm/drm_vblank.h>
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_cursor_regs.h"
 #include "intel_de.h"
@@ -904,6 +905,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
 	struct intel_crtc *pipe_crtc;
 	int num_pipes = 0;
+	u32 start_vbl_count, end_vbl_count;
 	int ret;
 
 	/*
@@ -1049,17 +1051,37 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (joined_pipe_state[0].new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state,
-					 joined_pipe_state[0].new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state,
-				       joined_pipe_state[0].new_plane_state);
-	} else {
-		intel_plane_disable_arm(NULL, plane, crtc_state);
+	/*
+	 * Joiner pipes are vblank-synchronized, so sampling only the primary
+	 * pipe is sufficient to detect a straddle across all joined pipes.
+	 * The vblank evasion above also operates on the primary pipe only.
+	 */
+	start_vbl_count = intel_crtc_get_vblank_counter(joined_pipe_state[0].crtc);
+
+	for (int i = 0; i < num_pipes; i++) {
+		if (joined_pipe_state[i].new_plane_state->uapi.visible) {
+			intel_plane_update_noarm(NULL, joined_pipe_state[i].plane,
+						 joined_pipe_state[i].crtc_state,
+						 joined_pipe_state[i].new_plane_state);
+			intel_plane_update_arm(NULL, joined_pipe_state[i].plane,
+					       joined_pipe_state[i].crtc_state,
+					       joined_pipe_state[i].new_plane_state);
+		} else {
+			intel_plane_disable_arm(NULL, joined_pipe_state[i].plane,
+						joined_pipe_state[i].crtc_state);
+		}
 	}
 
+	end_vbl_count = intel_crtc_get_vblank_counter(joined_pipe_state[0].crtc);
+
 	local_irq_enable();
 
+	if (start_vbl_count != end_vbl_count)
+		drm_err(display->drm,
+			"Atomic update failure on pipe %c (start=%u end=%u)\n",
+			pipe_name(joined_pipe_state[0].crtc->pipe),
+			start_vbl_count, end_vbl_count);
+
 	intel_psr_unlock(crtc_state);
 
 	/*
-- 
2.25.1

