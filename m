Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E3C369A3
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4910E3FA;
	Mon,  7 Apr 2025 13:05:02 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B5610E3FA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 13:05:00 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 01/14] drm/xe: Use xe_ggtt_map_bo_unlocked for resume
Date: Mon,  7 Apr 2025 15:04:36 +0200
Message-ID: <20250407130449.1010470-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407130449.1010470-1-dev@lankhorst.se>
References: <20250407130449.1010470-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This is the first step to hide the details of struct xe_ggtt.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c |  4 +---
 drivers/gpu/drm/xe/xe_ggtt.c     | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_ggtt.h     |  2 +-
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index a1f0661e7b0c8..b72d87d969930 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -129,9 +129,7 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 			if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
 				continue;
 
-			mutex_lock(&tile->mem.ggtt->lock);
-			xe_ggtt_map_bo(tile->mem.ggtt, bo);
-			mutex_unlock(&tile->mem.ggtt->lock);
+			xe_ggtt_map_bo_unlocked(tile->mem.ggtt, bo);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c139..62025d9cb7380 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -591,7 +591,7 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
  * @ggtt: the &xe_ggtt where node will be mapped
  * @bo: the &xe_bo to be mapped
  */
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
+static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
@@ -609,6 +609,20 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	}
 }
 
+/**
+ * xe_ggtt_map_bo_unlocked - Restore a mapping of a BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ *
+ * This is used to restore a GGTT mapping after suspend.
+ */
+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
+{
+	mutex_lock(&ggtt->lock);
+	xe_ggtt_map_bo(ggtt, bo);
+	mutex_unlock(&ggtt->lock);
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de0047..bdf6d0733e2ca 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,7 +24,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
-- 
2.45.2

