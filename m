Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EB2EED61C
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7B310E660;
	Fri, 15 Sep 2023 17:36:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16B10E660
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 17:36:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 19:36:46 +0200
Message-Id: <20230915173646.116724-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915173646.116724-1-maarten.lankhorst@linux.intel.com>
References: <20230915173646.116724-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/i915: Block in cleanup for legacy cursor
 updates
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 18 ++++++++++
 .../gpu/drm/i915/display/intel_atomic_plane.h |  2 ++
 drivers/gpu/drm/i915/display/intel_crtc.c     | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_crtc.h     |  6 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |  4 +--
 .../drm/i915/display/intel_display_types.h    |  5 +++
 6 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index cb60165bc4156..ba9e6c7809bee 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1167,6 +1167,9 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	intel_display_rps_mark_interactive(dev_priv, state, false);
 
 	/* Should only be called after a successful intel_prepare_plane_fb()! */
+	if (old_plane_state->unpin_work.vblank)
+		drm_vblank_work_flush(&old_plane_state->unpin_work);
+
 	intel_plane_unpin_fb(old_plane_state);
 }
 
@@ -1179,3 +1182,18 @@ void intel_plane_helper_add(struct intel_plane *plane)
 {
 	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
 }
+
+/* Completion is enough */
+static void intel_plane_cursor_vblank_work(struct kthread_work *base)
+{ }
+
+void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
+					 struct intel_plane_state *new_plane_state)
+{
+	if (!old_plane_state->ggtt_vma ||
+	    old_plane_state->ggtt_vma == new_plane_state->ggtt_vma)
+		return;
+
+	drm_vblank_work_init(&old_plane_state->unpin_work, old_plane_state->uapi.crtc,
+			     intel_plane_cursor_vblank_work);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index 191dad0efc8e6..5a897cf6fa021 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -66,5 +66,7 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state);
 void intel_plane_set_invisible(struct intel_crtc_state *crtc_state,
 			       struct intel_plane_state *plane_state);
 void intel_plane_helper_add(struct intel_plane *plane);
+void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
+					 struct intel_plane_state *new_plane_state);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index f06b987f55582..e3b8ce6072284 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -470,6 +470,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
 
 /**
  * intel_pipe_update_start() - start update of a set of display registers
+ * @state: the intel atomic state
  * @new_crtc_state: the new crtc state
  *
  * Mark the start of an update to pipe registers that should be updated
@@ -480,7 +481,8 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
  * until a subsequent call to intel_pipe_update_end(). That is done to
  * avoid random delays.
  */
-void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
+void intel_pipe_update_start(struct intel_atomic_state *state,
+			     struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
@@ -500,6 +502,19 @@ void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
 	if (intel_crtc_needs_vblank_work(new_crtc_state))
 		intel_crtc_vblank_work_init(new_crtc_state);
 
+	if (state->base.legacy_cursor_update) {
+		struct intel_plane *plane;
+		struct intel_plane_state *old_plane_state, *new_plane_state;
+		int i;
+
+		for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
+						     new_plane_state, i) {
+			if (old_plane_state->uapi.crtc == &crtc->base)
+				intel_plane_init_cursor_vblank_work(old_plane_state,
+								    new_plane_state);
+		}
+	}
+
 	if (new_crtc_state->vrr.enable) {
 		if (intel_vrr_is_push_sent(new_crtc_state))
 			vblank_start = intel_vrr_vmin_vblank_start(new_crtc_state);
@@ -635,13 +650,15 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
 
 /**
  * intel_pipe_update_end() - end update of a set of display registers
+ * @state: the intel atomic state
  * @new_crtc_state: the new crtc state
  *
  * Mark the end of an update started with intel_pipe_update_start(). This
  * re-enables interrupts and verifies the update was actually completed
  * before a vblank.
  */
-void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
+void intel_pipe_update_end(struct intel_atomic_state *state,
+			   struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
@@ -687,6 +704,21 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 		new_crtc_state->uapi.event = NULL;
 	}
 
+	if (state->base.legacy_cursor_update) {
+		struct intel_plane *plane;
+		struct intel_plane_state *old_plane_state;
+		int i;
+
+		for_each_old_intel_plane_in_state(state, plane, old_plane_state, i) {
+			if (old_plane_state->uapi.crtc == &crtc->base &&
+			    old_plane_state->unpin_work.vblank) {
+				drm_vblank_work_schedule(&old_plane_state->unpin_work,
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+							 false);
+			}
+		}
+	}
+
 	/*
 	 * Send VRR Push to terminate Vblank. If we are already in vblank
 	 * this has to be done _after_ sampling the frame counter, as
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 51a4c8df9e657..ca7f45a454a0a 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -36,8 +36,10 @@ void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc);
 void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state);
 void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state);
-void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state);
-void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state);
+void intel_pipe_update_start(struct intel_atomic_state *state,
+			     struct intel_crtc_state *new_crtc_state);
+void intel_pipe_update_end(struct intel_atomic_state *state,
+			   struct intel_crtc_state *new_crtc_state);
 void intel_wait_for_vblank_workers(struct intel_atomic_state *state);
 struct intel_crtc *intel_first_crtc(struct drm_i915_private *i915);
 struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9df8081f78d97..ce493ebbd9b93 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6610,7 +6610,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	intel_crtc_planes_update_noarm(state, crtc);
 
 	/* Perform vblank evasion around commit operation */
-	intel_pipe_update_start(new_crtc_state);
+	intel_pipe_update_start(state, new_crtc_state);
 
 	commit_pipe_pre_planes(state, crtc);
 
@@ -6618,7 +6618,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 
 	commit_pipe_post_planes(state, crtc);
 
-	intel_pipe_update_end(new_crtc_state);
+	intel_pipe_update_end(state, new_crtc_state);
 
 	/*
 	 * We usually enable FIFO underrun interrupts as part of the
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c0931d89d0dd9..20620ae074069 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -769,6 +769,11 @@ struct intel_plane_state {
 
 	struct drm_rect psr2_sel_fetch_area;
 
+	/*
+	 * Unpin work for cursor fb updates.
+	 */
+	struct drm_vblank_work unpin_work;
+
 	/* Clear Color Value */
 	u64 ccval;
 
-- 
2.39.2

