Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB002C5DF8F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880F10F215;
	Fri, 21 Aug 2026 04:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iULid19z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61F110F209;
 Fri, 21 Aug 2026 04:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787287869; x=1818823869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L3WW4vepZvydCMNHOaQVOP7sTmE7IuyNQOiKH6i02n0=;
 b=iULid19zHeWaI9KjiozGkh2+2PEZiZH0lkCUWxAiLsp/lPa+/GWQiFpY
 UDeCcTt4UOBRjZ3+j2Zcd0jS5JQCOU5dTxTuE8lKKNTSbmIZprt3sdgOM
 AwEC7NV6VupYBkLi5Om6n5mKa7t44BwI2JzAgTp9AvXKhQfbMN/wL9c1v
 w5VWaX32VI5frR14Rnka3KlMb+P/jhjgNkyO0LItXO2r6Os2rky/5Jr9s
 WUTeWCGuPoLhQ53V6+YhfE7ZQunkApKV7utrNoRtfNmj0seD6a73onW9y
 kNCNvzLOWfs729qoci5/aKW708AXCnLfO+KMbEwK9rHWGee6z8dNO0Cy1 w==;
X-CSE-ConnectionGUID: dNIhVbv1S5yDNuympNN6zA==
X-CSE-MsgGUID: TuzbMUiPT2GMM2t/ZWUSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87893833"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87893833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:51:09 -0700
X-CSE-ConnectionGUID: 1GeSozfzQC2MSVSpJzmThQ==
X-CSE-MsgGUID: H4Bd/wFMT8y2bONpxAzocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266291112"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:51:07 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/6] drm/i915/cursor: Program secondary cursor planes
Date: Fri, 21 Aug 2026 10:17:53 +0530
Message-Id: <20260821044755.2234490-5-nemesa.garg@intel.com>
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
    Move drm_err() after local_irq_enable(). [Chaitnaya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 33 +++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 9cb8b0a8537c..f5625dabc8f6 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -13,6 +13,7 @@
 #include <drm/drm_vblank.h>
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_cursor_regs.h"
 #include "intel_de.h"
@@ -900,6 +901,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
 	struct intel_crtc *pipe_crtc;
 	int num_pipes = 0;
+	u32 start_vbl_count, end_vbl_count;
 	int ret;
 
 	/*
@@ -1040,15 +1042,36 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
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
+			intel_plane_disable_arm(NULL, joined_pipe_state[i].plane, joined_pipe_state[i].crtc_state);
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

