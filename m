Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97448C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 12:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462810E7C8;
	Thu, 26 Oct 2023 12:33:44 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500310E7C7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 12:33:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 14:33:18 +0200
Message-Id: <20231026123326.56044-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/15] revert fixme in intel_atomic_plane.c
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

Revert the plane_fb changes, so we can fix it properly.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 62b6108c4380..dd65498166fb 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1033,11 +1033,10 @@ static int
 intel_prepare_plane_fb(struct drm_plane *_plane,
 		       struct drm_plane_state *_new_plane_state)
 {
-	struct intel_plane_state *new_plane_state =
-		to_intel_plane_state(_new_plane_state);
-#ifdef I915
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
 	struct intel_plane *plane = to_intel_plane(_plane);
+	struct intel_plane_state *new_plane_state =
+		to_intel_plane_state(_new_plane_state);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_plane_state->uapi.state);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
@@ -1133,22 +1132,6 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	intel_plane_unpin_fb(new_plane_state);
 
 	return ret;
-#else
-	int ret;
-
-	if (!intel_fb_obj(new_plane_state->hw.fb))
-		return 0;
-
-	ret = intel_plane_pin_fb(new_plane_state);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_plane_helper_prepare_fb(_plane, _new_plane_state);
-	if (ret)
-		intel_plane_unpin_fb(new_plane_state);
-
-	return ret;
-#endif
 }
 
 /**
@@ -1164,9 +1147,9 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 {
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(_old_plane_state);
-	__maybe_unused struct intel_atomic_state *state =
+	struct intel_atomic_state *state =
 		to_intel_atomic_state(old_plane_state->uapi.state);
-	__maybe_unused struct drm_i915_private *dev_priv = to_i915(plane->dev);
+	struct drm_i915_private *dev_priv = to_i915(plane->dev);
 	struct drm_i915_gem_object *obj = intel_fb_obj(old_plane_state->hw.fb);
 
 	if (!obj)
-- 
2.40.1

