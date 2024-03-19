Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C11AC54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A0810FBFF;
	Tue, 19 Mar 2024 17:07:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A1C10FBF5
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 17:07:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/3] drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
Date: Tue, 19 Mar 2024 18:07:56 +0100
Message-ID: <20240319170756.14020-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
References: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
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

Considering the caller of the GGTT functions should keep the
backing storage alive before the function completes, it's not
necessary to invalidate with the GGTT lock held. This just adds
latency for every user of the GGTT.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-5-matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_ggtt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 42e92011dd69..dc5a6994f1be 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -389,9 +389,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
-
-	if (bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
-		xe_ggtt_invalidate(ggtt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -420,6 +417,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
+
+	if (!err && bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
+		xe_ggtt_invalidate(ggtt);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -440,16 +440,16 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
-	mutex_lock(&ggtt->lock);
 
+	mutex_lock(&ggtt->lock);
 	xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
+	mutex_unlock(&ggtt->lock);
 
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
-- 
2.43.0

