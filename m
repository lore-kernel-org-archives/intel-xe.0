Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96413C43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 11:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5918010E912;
	Mon,  6 Jul 2026 11:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eacRnM/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC8A10E910;
 Mon,  6 Jul 2026 11:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783339189; x=1814875189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rRY5NwLcEo3Gq1wRCQxlJPfHK1qWou08BO+gDxPKyQ=;
 b=eacRnM/XA4ZtBQ9pZ8eQsd1lXtiZIjjHuUw5RnzPPZLSacwr159RvSb0
 MRIOfKswRBAigH10AdDuDka6PrA4KhFKsIzt5Tw4GdlsgKF5VugxInZux
 stafUVCc1dhiYAnMnYrO/qhqYh+znltSsVIp/MJ2HI3mtggL3OoGyotvO
 bB2rpY0FFw+KGztkvDV+BcWgFjwtCzVwdPVZ9I7+Lq0Gt5OiByXAAWC9T
 5Mi/FTtmBIqKhPCIH4kpUSCRa3J+i5T4EAfzPHNBgK08cI0kIdXjYB16h
 fgVaSFHs5E+8WmS/0DYgvJZBD2iSw9loOk8nPxpjzhEX91lY7eGzaZkVR A==;
X-CSE-ConnectionGUID: oUJmjNGsRe+s99p5ErdRUg==
X-CSE-MsgGUID: N00pk/jbRWapNePptfdawQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95481112"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95481112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:59:48 -0700
X-CSE-ConnectionGUID: s6oCjneNQVabSjn6midADg==
X-CSE-MsgGUID: PB7AjScwS4urvNDJcL7ICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253797501"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 04:59:47 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
Date: Mon,  6 Jul 2026 17:26:24 +0530
Message-Id: <20260706115629.2984258-2-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706115629.2984258-1-nemesa.garg@intel.com>
References: <20260706115629.2984258-1-nemesa.garg@intel.com>
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

In joiner mode, secondary cursor commits may still be running
even when the primary cursor commit is done. Walking the secondary
pipes also requires holding the secondary planes modeset locks.
Add intel_cursor_lock_joined_planes() to acquire modeset locks
for all secondary cursor planes. Check all joined cursor commit
status before taking the fast path. If any commit is still pending,
fallback to slow path.

v2: Use intel_crtc_joined_pipe_mask(). [Ville]
v3: Lock secondary cursor CRTCs and planes. [sashiko]
v4: Iterate the full joined mask uniformly in both helpers, no
    primary special-case.
    Move the parameter-change check above the lock acquisition so
    we don't grab secondary locks just to fall to slow path. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 69 ++++++++++++++++++---
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 88384dea868b..af7fc1f888c4 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -13,6 +13,7 @@
 #include <drm/drm_vblank.h>
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_cursor_regs.h"
 #include "intel_de.h"
@@ -796,6 +797,50 @@ void intel_cursor_unpin_work(struct kthread_work *base)
 	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
 }
 
+static int intel_cursor_lock_joined_planes(struct intel_display *display,
+					   const struct intel_crtc_state *crtc_state,
+					   struct drm_modeset_acquire_ctx *ctx)
+{
+	struct intel_crtc *pipe_crtc;
+	int ret;
+
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane =
+			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+
+		ret = drm_modeset_lock(&pipe_crtc->base.mutex, ctx);
+		if (ret)
+			return ret;
+
+		ret = drm_modeset_lock(&pipe_plane->base.mutex, ctx);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static bool
+intel_cursor_joiner_commits_idle(struct intel_display *display,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *pipe_crtc;
+
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane =
+			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+		struct intel_plane_state *pipe_plane_state =
+			to_intel_plane_state(pipe_plane->base.state);
+
+		if (pipe_plane_state->uapi.commit &&
+		    !try_wait_for_completion(&pipe_plane_state->uapi.commit->hw_done))
+			return false;
+	}
+
+	return true;
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -833,15 +878,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    crtc_state->joiner_pipes)
 		goto slow;
 
-	/*
-	 * Don't do an async update if there is an outstanding commit modifying
-	 * the plane.  This prevents our async update's changes from getting
-	 * overridden by a previous synchronous update's state.
-	 */
-	if (old_plane_state->uapi.commit &&
-	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
-		goto slow;
-
 	/*
 	 * If any parameters change that may affect watermarks,
 	 * take the slowpath. Only changing fb or position should be
@@ -855,6 +891,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    !old_plane_state->uapi.fb != !fb)
 		goto slow;
 
+	ret = intel_cursor_lock_joined_planes(display, crtc_state, ctx);
+	if (ret == -EDEADLK)
+		return ret;
+	if (ret)
+		goto slow;
+
+	/*
+	 * Don't do an async update if there is an outstanding commit modifying
+	 * any of the joined cursor planes. This prevents our async update's
+	 * changes from getting overridden by a previous synchronous update's
+	 * state.
+	 */
+	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
+		goto slow;
+
 	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
 	if (!new_plane_state)
 		return -ENOMEM;
-- 
2.25.1

