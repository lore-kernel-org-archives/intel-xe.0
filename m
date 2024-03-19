Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2A1C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA50A10FBFB;
	Tue, 19 Mar 2024 17:07:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024910FBF3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:07:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/3] drm/xe: Drop ggtt invalidate from display code
Date: Tue, 19 Mar 2024 18:07:54 +0100
Message-ID: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Matthew Brost <matthew.brost@intel.com>

Only buffers mapped in the GGTT used by the GuC require an invalidation.
Display buffers do not require an invalidation. Delete the invalidatio
from display code and make invalidation a static function in xe_ggtt.c.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-3-matthew.brost@intel.com
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
 drivers/gpu/drm/xe/xe_ggtt.c           | 4 +++-
 drivers/gpu/drm/xe/xe_ggtt.h           | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2eb622510186..311ffad6e2c0 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -241,7 +241,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(ggtt);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
@@ -384,4 +383,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 325337c38961..cc60ea08fc84 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -200,6 +200,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 
+static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
 	struct drm_mm_node *hole;
@@ -261,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 }
 
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
 	/* Each GT in a tile has its own TLB to cache GGTT lookups */
 	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 42705e1338e1..dc9631d20720 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -11,7 +11,6 @@
 struct drm_printer;
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
-- 
2.43.0

