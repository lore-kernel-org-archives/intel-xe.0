Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F7FC25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 12:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8790D10E7CE;
	Thu, 26 Oct 2023 12:33:49 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731410E7C8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 12:33:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 14:33:19 +0200
Message-Id: <20231026123326.56044-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/15] drm/atomic: Add
 drm_atomic_helper_set_fence_deadline() function
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

i915 has an i915 specific boost. Use set_fence_deadline instead.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 15 +++++++++++----
 include/drm/drm_atomic_helper.h     |  3 ++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 71d399397107..47ccbe119265 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1520,12 +1520,16 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
-/*
+/**
+ * drm_atomic_helper_set_fence_deadline - update fence deadlines.
+ * @dev: DRM device
+ * @state: atomic state object with new state structures
+ *
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
  */
-static void set_fence_deadline(struct drm_device *dev,
-			       struct drm_atomic_state *state)
+void drm_atomic_helper_set_fence_deadline(struct drm_device *dev,
+					  struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
@@ -1560,6 +1564,7 @@ static void set_fence_deadline(struct drm_device *dev,
 		dma_fence_set_deadline(new_plane_state->fence, vbltime);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_set_fence_deadline);
 
 /**
  * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
@@ -1580,6 +1585,8 @@ static void set_fence_deadline(struct drm_device *dev,
  * to wait **before** we do anything that can't be easily rolled back. That is
  * before we call drm_atomic_helper_swap_state().
  *
+ * Calls drm_atomic_helper_set_fence_deadline().
+ *
  * Returns zero if success or < 0 if dma_fence_wait() fails.
  */
 int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
@@ -1590,7 +1597,7 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
-	set_fence_deadline(dev, state);
+	drm_atomic_helper_set_fence_deadline(dev, state);
 
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..37c6df1db5e0 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -72,7 +72,8 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
 				  struct drm_atomic_state *state);
 void drm_atomic_helper_async_commit(struct drm_device *dev,
 				    struct drm_atomic_state *state);
-
+void drm_atomic_helper_set_fence_deadline(struct drm_device *dev,
+					  struct drm_atomic_state *state);
 int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 					struct drm_atomic_state *state,
 					bool pre_swap);
-- 
2.40.1

