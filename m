Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BCC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767A710E514;
	Tue, 25 Apr 2023 19:26:52 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC03410E137
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450809; x=1713986809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8nntgo6QIkYVw2sVGH87HS3JDnENevfiKk86DdjzeU=;
 b=BwEKtY1ibK4aFEg+KBAziys21ewORkS5fWeLgtYLyyYThRQ5F6yK+wj8
 H5nxrXZswQjPTw+bYNmdVtbTObG4p8bYvc/U68KQZDj7mAE7UOgH+iMMZ
 vrjy7qlt4QVOITmX/WhWFVz7DxhgdL0puUU2sk0AO9tgv/2gUkYm8UO/g
 +lNHH+fGNtApvs2R5OT+x2InUPOIfdmgo+ohLMNXjJyHubUw4bOpOy47R
 eKKPNzPt/PrDgu3WYfKRjDJj2QNgE/MXgIDJkYBSlAmheVk7b6tByuip3
 PIpst5Tjb0+iNAYHNgrRfs8bQsdFjRSDLEZ4Laos1QUjkLiSyaBWMlBqg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100841"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100841"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990480"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990480"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:41 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:17 -0700
Message-Id: <20230425192624.168640-9-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/15] drm/i915/display: move display
 suspend/resume to intel_display_driver.[ch]
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

High level display functionality only called from driver top level code.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/11fdd82437370d8f341cd546d546de5e934c000f.1681465222.git.jani.nikula@intel.com
(cherry picked from commit 3183b9ebad7d3f1d711f152222577116ca08b299)
---
 drivers/gpu/drm/i915/display/intel_display.c  | 102 ------------------
 drivers/gpu/drm/i915/display/intel_display.h  |   8 --
 .../drm/i915/display/intel_display_driver.c   | 101 +++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  10 ++
 4 files changed, 111 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 246cd9b02a739..f227244b0811f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -694,46 +694,6 @@ intel_plane_fence_y_offset(const struct intel_plane_state *plane_state)
 	return y;
 }
 
-int
-__intel_display_resume(struct drm_i915_private *i915,
-		       struct drm_atomic_state *state,
-		       struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc;
-	int ret, i;
-
-	intel_modeset_setup_hw_state(i915, ctx);
-	intel_vga_redisable(i915);
-
-	if (!state)
-		return 0;
-
-	/*
-	 * We've duplicated the state, pointers to the old state are invalid.
-	 *
-	 * Don't attempt to use the old state until we commit the duplicated state.
-	 */
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		/*
-		 * Force recalculation even if we restore
-		 * current state. With fast modeset this may not result
-		 * in a modeset when the state is compatible.
-		 */
-		crtc_state->mode_changed = true;
-	}
-
-	/* ignore any reset values/BIOS leftovers in the WM registers */
-	if (!HAS_GMCH(i915))
-		to_intel_atomic_state(state)->skip_intermediate_wm = true;
-
-	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
-
-	drm_WARN_ON(&i915->drm, ret == -EDEADLK);
-
-	return ret;
-}
-
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -2148,30 +2108,6 @@ static void i9xx_crtc_disable(struct intel_atomic_state *state,
 		i830_enable_pipe(dev_priv, pipe);
 }
 
-
-/*
- * turn all crtc's off, but do not adjust state
- * This has to be paired with a call to intel_modeset_setup_hw_state.
- */
-int intel_display_suspend(struct drm_device *dev)
-{
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct drm_atomic_state *state;
-	int ret;
-
-	if (!HAS_DISPLAY(dev_priv))
-		return 0;
-
-	state = drm_atomic_helper_suspend(dev);
-	ret = PTR_ERR_OR_ZERO(state);
-	if (ret)
-		drm_err(&dev_priv->drm, "Suspending crtc's failed with %i\n",
-			ret);
-	else
-		dev_priv->display.restore.modeset_state = state;
-	return ret;
-}
-
 void intel_encoder_destroy(struct drm_encoder *encoder)
 {
 	struct intel_encoder *intel_encoder = to_intel_encoder(encoder);
@@ -8353,44 +8289,6 @@ void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	intel_de_posting_read(dev_priv, DPLL(pipe));
 }
 
-void intel_display_resume(struct drm_device *dev)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	struct drm_atomic_state *state = i915->display.restore.modeset_state;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
-
-	if (!HAS_DISPLAY(i915))
-		return;
-
-	i915->display.restore.modeset_state = NULL;
-	if (state)
-		state->acquire_ctx = &ctx;
-
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
-
-	if (!ret)
-		ret = __intel_display_resume(i915, state, &ctx);
-
-	skl_watermark_ipc_update(i915);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-
-	if (ret)
-		drm_err(&i915->drm,
-			"Restoring old state failed with %i\n", ret);
-	if (state)
-		drm_atomic_state_put(state);
-}
-
 void intel_hpd_poll_fini(struct drm_i915_private *i915)
 {
 	struct intel_connector *connector;
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 983cc2026405e..aa657f7a4be89 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -446,7 +446,6 @@ void intel_add_fb_offsets(int *x, int *y,
 unsigned int intel_rotation_info_size(const struct intel_rotation_info *rot_info);
 unsigned int intel_remapped_info_size(const struct intel_remapped_info *rem_info);
 bool intel_has_pending_fb_unpin(struct drm_i915_private *dev_priv);
-int intel_display_suspend(struct drm_device *dev);
 void intel_encoder_destroy(struct drm_encoder *encoder);
 struct drm_display_mode *
 intel_encoder_current_mode(struct intel_encoder *encoder);
@@ -528,7 +527,6 @@ void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state);
 void intel_update_watermarks(struct drm_i915_private *i915);
 
 /* modesetting */
-void intel_display_resume(struct drm_device *dev);
 int intel_modeset_all_pipes(struct intel_atomic_state *state,
 			    const char *reason);
 void intel_modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state,
@@ -549,12 +547,6 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 
 void intel_hpd_poll_fini(struct drm_i915_private *i915);
 
-/* interface for intel_display_reset.c */
-int
-__intel_display_resume(struct drm_i915_private *i915,
-		       struct drm_atomic_state *state,
-		       struct drm_modeset_acquire_ctx *ctx);
-
 /* modesetting asserts */
 void assert_transcoder(struct drm_i915_private *dev_priv,
 		       enum transcoder cpu_transcoder, bool state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index f357feaa00a8e..db7e5ecd1b9e9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -468,3 +468,104 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
 	acpi_video_unregister();
 	intel_opregion_unregister(i915);
 }
+
+/*
+ * turn all crtc's off, but do not adjust state
+ * This has to be paired with a call to intel_modeset_setup_hw_state.
+ */
+int intel_display_suspend(struct drm_device *dev)
+{
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_atomic_state *state;
+	int ret;
+
+	if (!HAS_DISPLAY(dev_priv))
+		return 0;
+
+	state = drm_atomic_helper_suspend(dev);
+	ret = PTR_ERR_OR_ZERO(state);
+	if (ret)
+		drm_err(&dev_priv->drm, "Suspending crtc's failed with %i\n",
+			ret);
+	else
+		dev_priv->display.restore.modeset_state = state;
+	return ret;
+}
+
+int
+__intel_display_resume(struct drm_i915_private *i915,
+		       struct drm_atomic_state *state,
+		       struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	int ret, i;
+
+	intel_modeset_setup_hw_state(i915, ctx);
+	intel_vga_redisable(i915);
+
+	if (!state)
+		return 0;
+
+	/*
+	 * We've duplicated the state, pointers to the old state are invalid.
+	 *
+	 * Don't attempt to use the old state until we commit the duplicated state.
+	 */
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		/*
+		 * Force recalculation even if we restore
+		 * current state. With fast modeset this may not result
+		 * in a modeset when the state is compatible.
+		 */
+		crtc_state->mode_changed = true;
+	}
+
+	/* ignore any reset values/BIOS leftovers in the WM registers */
+	if (!HAS_GMCH(i915))
+		to_intel_atomic_state(state)->skip_intermediate_wm = true;
+
+	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
+
+	drm_WARN_ON(&i915->drm, ret == -EDEADLK);
+
+	return ret;
+}
+
+void intel_display_resume(struct drm_device *dev)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_atomic_state *state = i915->display.restore.modeset_state;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
+	if (!HAS_DISPLAY(i915))
+		return;
+
+	i915->display.restore.modeset_state = NULL;
+	if (state)
+		state->acquire_ctx = &ctx;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (1) {
+		ret = drm_modeset_lock_all_ctx(dev, &ctx);
+		if (ret != -EDEADLK)
+			break;
+
+		drm_modeset_backoff(&ctx);
+	}
+
+	if (!ret)
+		ret = __intel_display_resume(i915, state, &ctx);
+
+	skl_watermark_ipc_update(i915);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	if (ret)
+		drm_err(&i915->drm,
+			"Restoring old state failed with %i\n", ret);
+	if (state)
+		drm_atomic_state_put(state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index aab498617b90e..7b5ff4309dec7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -8,7 +8,10 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
+struct drm_device;
 struct drm_i915_private;
+struct drm_modeset_acquire_ctx;
 struct pci_dev;
 
 bool intel_display_driver_probe_defer(struct pci_dev *pdev);
@@ -21,6 +24,13 @@ void intel_display_driver_remove(struct drm_i915_private *i915);
 void intel_display_driver_remove_noirq(struct drm_i915_private *i915);
 void intel_display_driver_remove_nogem(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
+int intel_display_suspend(struct drm_device *dev);
+void intel_display_resume(struct drm_device *dev);
+
+/* interface for intel_display_reset.c */
+int __intel_display_resume(struct drm_i915_private *i915,
+			   struct drm_atomic_state *state,
+			   struct drm_modeset_acquire_ctx *ctx);
 
 #endif /* __INTEL_DISPLAY_DRIVER_H__ */
 
-- 
2.40.0

