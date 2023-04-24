Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE2C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7707310E1BA;
	Mon, 24 Apr 2023 16:52:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B7B10E12B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355119; x=1713891119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HP0t7yeF6IIn67DFkNY8FPOWCq5i8oZNJgMzwCXAjA4=;
 b=mmdta60sbuQQcG3vW4fTkvyQ/R+pA/BTCK2HKiaYRYSqbWsEaQCv6eUL
 yFo95V4IV4NMAs8WqeQqFzmaHRSfmaAw/jPKOWjQLRXPp4/r/i1qcUnas
 IMkx/77M1bBHbOQ7Qc0aFtBEmV8R+BCm6yoB7xC6G1Y0pU5S0o2bYnL+r
 AaxpWlKa3RfKHYOpWVuNUjBJcfK5rYnox+pDF42PlxWx+Bg9fawTO72hW
 tJyXAm9c3JYP53hg+bdl1pN3irZSqDb3dTVff5sdHjLMGDjEIIeXvNxlp
 P3zVoXrZQGUaeEPlSePVW6Lsnzy+qlSJ9khSkSvoAEJa4GUlkN2iVi8XD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704272"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704272"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785488"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785488"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:57 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:29 -0700
Message-Id: <20230424165135.132494-10-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/15] drm/i915/display: rename
 intel_display_driver_suspend/resume functions
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Follow the usual naming conventions. Switch to i915 arguments and naming
while at it.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/cdd4228337678609967ed176dcfc9690de5d490b.1681465222.git.jani.nikula@intel.com
(cherry picked from commit cde4bd87863124fb6feee35b7f73552f5e75ea61)
---
 .../drm/i915/display/intel_display_driver.c   | 24 +++++++++----------
 .../drm/i915/display/intel_display_driver.h   | 11 ++++-----
 .../drm/i915/display/intel_display_reset.c    |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  6 ++---
 4 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index db7e5ecd1b9e9..0e391066d6d3b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -473,29 +473,28 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
  * turn all crtc's off, but do not adjust state
  * This has to be paired with a call to intel_modeset_setup_hw_state.
  */
-int intel_display_suspend(struct drm_device *dev)
+int intel_display_driver_suspend(struct drm_i915_private *i915)
 {
-	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_atomic_state *state;
 	int ret;
 
-	if (!HAS_DISPLAY(dev_priv))
+	if (!HAS_DISPLAY(i915))
 		return 0;
 
-	state = drm_atomic_helper_suspend(dev);
+	state = drm_atomic_helper_suspend(&i915->drm);
 	ret = PTR_ERR_OR_ZERO(state);
 	if (ret)
-		drm_err(&dev_priv->drm, "Suspending crtc's failed with %i\n",
+		drm_err(&i915->drm, "Suspending crtc's failed with %i\n",
 			ret);
 	else
-		dev_priv->display.restore.modeset_state = state;
+		i915->display.restore.modeset_state = state;
 	return ret;
 }
 
 int
-__intel_display_resume(struct drm_i915_private *i915,
-		       struct drm_atomic_state *state,
-		       struct drm_modeset_acquire_ctx *ctx)
+__intel_display_driver_resume(struct drm_i915_private *i915,
+			      struct drm_atomic_state *state,
+			      struct drm_modeset_acquire_ctx *ctx)
 {
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
@@ -532,9 +531,8 @@ __intel_display_resume(struct drm_i915_private *i915,
 	return ret;
 }
 
-void intel_display_resume(struct drm_device *dev)
+void intel_display_driver_resume(struct drm_i915_private *i915)
 {
-	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_atomic_state *state = i915->display.restore.modeset_state;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
@@ -549,7 +547,7 @@ void intel_display_resume(struct drm_device *dev)
 	drm_modeset_acquire_init(&ctx, 0);
 
 	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
+		ret = drm_modeset_lock_all_ctx(&i915->drm, &ctx);
 		if (ret != -EDEADLK)
 			break;
 
@@ -557,7 +555,7 @@ void intel_display_resume(struct drm_device *dev)
 	}
 
 	if (!ret)
-		ret = __intel_display_resume(i915, state, &ctx);
+		ret = __intel_display_driver_resume(i915, state, &ctx);
 
 	skl_watermark_ipc_update(i915);
 	drm_modeset_drop_locks(&ctx);
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 7b5ff4309dec7..84e7977f265ac 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -9,7 +9,6 @@
 #include <linux/types.h>
 
 struct drm_atomic_state;
-struct drm_device;
 struct drm_i915_private;
 struct drm_modeset_acquire_ctx;
 struct pci_dev;
@@ -24,13 +23,13 @@ void intel_display_driver_remove(struct drm_i915_private *i915);
 void intel_display_driver_remove_noirq(struct drm_i915_private *i915);
 void intel_display_driver_remove_nogem(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
-int intel_display_suspend(struct drm_device *dev);
-void intel_display_resume(struct drm_device *dev);
+int intel_display_driver_suspend(struct drm_i915_private *i915);
+void intel_display_driver_resume(struct drm_i915_private *i915);
 
 /* interface for intel_display_reset.c */
-int __intel_display_resume(struct drm_i915_private *i915,
-			   struct drm_atomic_state *state,
-			   struct drm_modeset_acquire_ctx *ctx);
+int __intel_display_driver_resume(struct drm_i915_private *i915,
+				  struct drm_atomic_state *state,
+				  struct drm_modeset_acquire_ctx *ctx);
 
 #endif /* __INTEL_DISPLAY_DRIVER_H__ */
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 166aa0cab1fc6..17178d5d7788a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -117,7 +117,7 @@ void intel_display_reset_finish(struct drm_i915_private *i915)
 		intel_clock_gating_init(i915);
 		intel_hpd_init(i915);
 
-		ret = __intel_display_resume(i915, state, ctx);
+		ret = __intel_display_driver_resume(i915, state, ctx);
 		if (ret)
 			drm_err(&i915->drm,
 				"Restoring old state failed with %i\n", ret);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f6aa48d92e050..da3bcd9d7a0d0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1055,7 +1055,7 @@ static int i915_drm_prepare(struct drm_device *dev)
 	intel_pxp_suspend_prepare(i915->pxp);
 
 	/*
-	 * NB intel_display_suspend() may issue new requests after we've
+	 * NB intel_display_driver_suspend() may issue new requests after we've
 	 * ostensibly marked the GPU as ready-to-sleep here. We need to
 	 * split out that work and pull it forward so that after point,
 	 * the GPU is not woken again.
@@ -1079,7 +1079,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	pci_save_state(pdev);
 
-	intel_display_suspend(dev);
+	intel_display_driver_suspend(dev_priv);
 
 	intel_dp_mst_suspend(dev_priv);
 
@@ -1241,7 +1241,7 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(dev_priv);
-	intel_display_resume(dev);
+	intel_display_driver_resume(dev_priv);
 
 	intel_hpd_poll_disable(dev_priv);
 	if (HAS_DISPLAY(dev_priv))
-- 
2.40.0

