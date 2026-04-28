Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CD3FF8877
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D850C10EC7F;
	Tue, 28 Apr 2026 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWu5Lu09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1410EBB7;
 Tue, 28 Apr 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386069; x=1808922069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRsEnqwpEFQkVkbk15wsYFQqQ8s0gWZb8lsJ+NGFl+w=;
 b=PWu5Lu09kDPaEaL42EeuD3/es026fjilhfChGzKMziOa1YVwLnAo5+z8
 r2ikELKbuz372i10rtVmFAqbqSul43vTVYdYgk3hKLt/IDNtethHbfNZG
 I4JP8v0XhtUea/uK7PnumfqexuoeAp/Tyu/nXHhDPbyKpPaf0dAPjEDgN
 ZtOixRY2P2zr3MBTjBggzmWkBRXGZqNSee84v3w2XLsNZWelCi/KDIhn+
 Gch5oSLc5xFfL+iepHtQOMU/c31zETi6K2h3+gtCTPjkLm/KVJ3PuYXuQ
 1zFyBgLKaKULl3xQYdtxfCR8KuD3uVQmGVzZ4CdIYBx+pU/+tz/uwfHP7 w==;
X-CSE-ConnectionGUID: hgTLjDJtSFe6bszet6UUCA==
X-CSE-MsgGUID: MBjLSWLCQMiD/c4yySEAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756387"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:08 -0700
X-CSE-ConnectionGUID: jcX/JxXATPSW+Haaw0of/A==
X-CSE-MsgGUID: 31zhK7C2Teuhhep7ypuJ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445428"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:06 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
Date: Tue, 28 Apr 2026 19:46:36 +0530
Message-Id: <20260428141639.2373678-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428141639.2373678-1-nemesa.garg@intel.com>
References: <20260428141639.2373678-1-nemesa.garg@intel.com>
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

In joiner mode the fast path cursor update must
handle secondary pipes. Add intel_cursor_lock_joined_pipes()
to acquire modeset locks for secondary pipes, then iterate
over all joined pipes uniformly to duplicate state, update
and pin fb for each secondary cursor plane.
Add per-primary-pipe mutex locking to serialize multi-pipe
cursor fastpath updates and avoid races while accessing
secondary cursor plane state.

v2: Use intel_crtc_joined_pipe_mask(). [Ville] 
    Add locking mechanism. [Ville]   
 
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 155 +++++++++++++++++---
 1 file changed, 135 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 5871881d93b4..b4d17aabe203 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -30,6 +30,9 @@
 #include "intel_vblank.h"
 #include "skl_watermark.h"
 
+static struct mutex cursor_fastpath_locks[I915_MAX_PIPES];
+static bool cursor_locks_initialized;
+
 /* Cursor formats */
 static const u32 intel_cursor_formats[] = {
 	DRM_FORMAT_ARGB8888,
@@ -844,6 +847,15 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, hw_crtc);
 }
 
+static void intel_cursor_init_locks(void)
+{
+	if (!cursor_locks_initialized) {
+		for (int i = 0; i < I915_MAX_PIPES; i++)
+			mutex_init(&cursor_fastpath_locks[i]);
+		cursor_locks_initialized = true;
+	}
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -864,6 +876,12 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_crtc_state *new_crtc_state;
 	struct intel_vblank_evade_ctx evade;
+	struct intel_plane_state *old_pipe_states[4] = {};
+	struct intel_plane_state *new_pipe_states[4] = {};
+	struct intel_plane *pipe_planes[4] = {};
+	struct intel_crtc *pipe_crtcs[4] = {};
+	struct intel_crtc *pipe_crtc;
+	int num_pipes = 0;
 	int ret;
 
 	/*
@@ -907,9 +925,18 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    !old_plane_state->uapi.fb != !fb)
 		goto slow;
 
+	/* Ensure cursor fastpath locks are initialized */
+	intel_cursor_init_locks();
+
+	/* Lock primary CRTC to protect multi-pipe cursor fastpath update */
+	if (intel_crtc_joiner_secondary_pipes(crtc_state))
+		mutex_lock(&cursor_fastpath_locks[crtc->pipe]);
+
 	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
-	if (!new_plane_state)
-		return -ENOMEM;
+	if (!new_plane_state) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
 
 	new_crtc_state = to_intel_crtc_state(intel_crtc_duplicate_state(&crtc->base));
 	if (!new_crtc_state) {
@@ -931,11 +958,73 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	if (ret)
 		goto out_free;
 
+	/*
+	 * Iterate over all joined pipes (primary and secondary) uniformly.
+	 * The joined pipe mask includes both the primary pipe and all
+	 * secondary joiner pipes, allowing us to handle them all the same way.
+	 */
+	for_each_intel_crtc_in_pipe_mask(display->drm, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane;
+		struct intel_crtc_state *pipe_crtc_state;
+		struct intel_plane_state *old_pipe_plane_state;
+		struct intel_plane_state *new_pipe_plane_state;
+
+		if (pipe_crtc == crtc) {
+			pipe_plane = plane;
+			pipe_crtc_state = new_crtc_state;
+			old_pipe_plane_state = old_plane_state;
+			new_pipe_plane_state = new_plane_state;
+		} else {
+			pipe_plane = intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+			pipe_crtc_state = to_intel_crtc_state(pipe_crtc->base.state);
+			old_pipe_plane_state = to_intel_plane_state(pipe_plane->base.state);
+
+			new_pipe_plane_state =
+				to_intel_plane_state(intel_plane_duplicate_state(&pipe_plane->base));
+
+			if (!new_pipe_plane_state) {
+				ret = -ENOMEM;
+				goto out_free;
+			}
+
+			intel_cursor_fastpath_update_plane_state(new_pipe_plane_state, fb,
+								 &pipe_crtc->base,
+								 pipe_crtc,
+								 crtc_x, crtc_y,
+								 crtc_w, crtc_h,
+								 src_x, src_y,
+								 src_w, src_h);
+
+			ret = pipe_plane->check_plane(pipe_crtc_state, new_pipe_plane_state);
+			if (ret) {
+				intel_plane_destroy_state(&pipe_plane->base,
+							  &new_pipe_plane_state->uapi);
+				goto out_free;
+			}
+
+			ret = intel_plane_pin_fb(new_pipe_plane_state, old_pipe_plane_state);
+			if (ret) {
+				intel_plane_destroy_state(&pipe_plane->base,
+							  &new_pipe_plane_state->uapi);
+				goto out_free;
+			}
+		}
+
+		pipe_planes[num_pipes] = pipe_plane;
+		pipe_crtcs[num_pipes] = pipe_crtc;
+		old_pipe_states[num_pipes] = old_pipe_plane_state;
+		new_pipe_states[num_pipes] = new_pipe_plane_state;
+		num_pipes++;
+	}
+
 	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
-	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
-				to_intel_frontbuffer(new_plane_state->hw.fb),
-				plane->frontbuffer_bit);
+
+	for (int i = 0; i < num_pipes; i++)
+		intel_frontbuffer_track(to_intel_frontbuffer(old_pipe_states[i]->hw.fb),
+					to_intel_frontbuffer(new_pipe_states[i]->hw.fb),
+					pipe_planes[i]->frontbuffer_bit);
 
 	/* Swap plane state */
 	plane->base.state = &new_plane_state->uapi;
@@ -983,26 +1072,52 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	intel_psr_unlock(crtc_state);
 
-	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
-		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
-				     intel_cursor_unpin_work);
-
-		drm_vblank_work_schedule(&old_plane_state->unpin_work,
-					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
-					 false);
-
-		old_plane_state = NULL;
-	} else {
-		intel_plane_unpin_fb(old_plane_state);
+	/*
+	 * Schedule or immediately unpin old framebuffers.
+	 * Protect against concurrent access.
+	 */
+	for (int i = 0; i < num_pipes; i++) {
+		struct intel_plane_state *old_pipe = old_pipe_states[i];
+		struct intel_crtc *owner_crtc = pipe_crtcs[i];
+
+		if (old_pipe->ggtt_vma != new_pipe_states[i]->ggtt_vma) {
+			drm_vblank_work_init(&old_pipe->unpin_work,
+					     &owner_crtc->base,
+					     intel_cursor_unpin_work);
+			drm_vblank_work_schedule(&old_pipe->unpin_work,
+						 drm_crtc_accurate_vblank_count(&owner_crtc->base) + 1,
+						 false);
+			old_pipe_states[i] = NULL;
+		} else {
+			intel_plane_unpin_fb(old_pipe);
+		}
 	}
 
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
-	if (ret)
-		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
-	else if (old_plane_state)
-		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
+	if (ret) {
+		for (int i = 0; i < num_pipes; i++) {
+			intel_plane_unpin_fb(new_pipe_states[i]);
+			intel_plane_destroy_state(new_pipe_states[i]->uapi.plane,
+						  &new_pipe_states[i]->uapi);
+		}
+
+		if (!num_pipes)
+			intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
+	} else {
+		for (int i = 0; i < num_pipes; i++) {
+			if (old_pipe_states[i])
+				intel_plane_destroy_state(old_pipe_states[i]->uapi.plane,
+							  &old_pipe_states[i]->uapi);
+		}
+	}
+
+out_unlock:
+	/* Unlock primary CRTC cursor fastpath lock */
+	if (intel_crtc_joiner_secondary_pipes(crtc_state))
+		mutex_unlock(&cursor_fastpath_locks[crtc->pipe]);
+
 	return ret;
 
 slow:
-- 
2.25.1

