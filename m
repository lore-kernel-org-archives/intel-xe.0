Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF5C4829A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 12:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29383112B4C;
	Tue,  6 Feb 2024 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZpsADpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC75112B43;
 Tue,  6 Feb 2024 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707222282; x=1738758282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8NCwhokv6Smwi0xazE++MyQ9gwnsL2mNNS2V89JOsZ8=;
 b=kZpsADpdwU5tTFGQA987XZOSi7QX7YnM3nStVvA2CREDcazqL/9oQjN3
 sKsya7QykXjSMT4EVGKapVvGf+oEXOUQvSTAg6m1FsLe90hfm/rCtCkLW
 swQ1QSKrWzGdhooTMC1o9QNvj/jkdl40g7cv0bnoua9pSgaIKLPSGeKSV
 2Wxv9d2E8nhra8iW9wNVz8hBmAawayqblcEuodf6XewmUl8r+ZFRq4U0q
 0P5HfoQEhQ6cY/i2AvaiHylRSfo2sZ7HDA0hafv+dDAXLgYejCTTy4wIH
 6XR1tbr1jqijjhAWyoLOBhOdXezc0wd/42Q6JCJWqTyJFj8UlFmZUiG2P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="629245"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="629245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5619338"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.52])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:17:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI 2/3] drm/ttm: Use LRU hitches
Date: Tue,  6 Feb 2024 13:17:15 +0100
Message-ID: <20240206121716.13365-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206121716.13365-1-thomas.hellstrom@linux.intel.com>
References: <20240206121716.13365-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Have iterators insert themselves into the list they are iterating
over using hitch list nodes. Since only the iterator owner
can remove these list nodes from the list, it's safe to unlock
the list and when continuing, use them as a starting point. Due to
the way LRU bumping works in TTM, newly added items will not be
missed an bumped items will be iterated over a second time before
reaching the end of the list.

The exception is list with bulk move sublists. When bumping a
sublist, a hitch that is part of that sublist will also be moved
and we might miss items if restarting from it. This will be
addressed in a later patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
 drivers/gpu/drm/ttm/ttm_device.c   |  9 +++-
 drivers/gpu/drm/ttm/ttm_resource.c | 71 ++++++++++++++++++------------
 include/drm/ttm/ttm_resource.h     | 12 +++--
 4 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ba3f09e2d7e6..457a2303fbf8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -622,6 +622,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		if (locked)
 			dma_resv_unlock(res->bo->base.resv);
 	}
+	ttm_resource_cursor_fini_locked(&cursor);
 
 	if (!bo) {
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f27406e851e5..e8a6a1dab669 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret)
+			if (!ret) {
+				ttm_resource_cursor_fini(&cursor);
 				return num_pages;
-			if (ret != -EBUSY)
+			}
+			if (ret != -EBUSY) {
+				ttm_resource_cursor_fini(&cursor);
 				return ret;
+			}
 		}
 	}
+	ttm_resource_cursor_fini_locked(&cursor);
 	spin_unlock(&bdev->lru_lock);
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index a347130570ee..f45b8bd5e7c4 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -32,6 +32,21 @@
 
 #include <drm/drm_util.h>
 
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
+{
+	lockdep_assert_held(&cursor->man->bdev->lru_lock);
+	list_del(&cursor->hitch.link);
+}
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
+{
+	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
+
+	spin_lock(lru_lock);
+	ttm_resource_cursor_fini_locked(cursor);
+	spin_unlock(lru_lock);
+}
+
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
  * @bulk: the structure to init
@@ -473,62 +488,62 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
 /**
- * ttm_resource_manager_first
+ * ttm_resource_manager_next
  *
  * @man: resource manager to iterate over
  * @cursor: cursor to record the position
+ * @res: the current resource pointer
  *
- * Returns the first resource from the resource manager.
+ * Returns the next resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 {
+	struct ttm_resource_manager *man = cursor->man;
 	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
+	do {
+		lru = &cursor->hitch;
+		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru)) {
+				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
+			}
 		}
 
+		if (cursor->priority++ >= TTM_MAX_BO_PRIORITY)
+			break;
+
+		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+	} while (true);
+
+	list_del_init(&cursor->hitch.link);
+
 	return NULL;
 }
 
 /**
- * ttm_resource_manager_next
+ * ttm_resource_manager_first
  *
  * @man: resource manager to iterate over
  * @cursor: cursor to record the position
- * @res: the current resource pointer
  *
- * Returns the next resource from the resource manager.
+ * Returns the first resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res)
+ttm_resource_manager_first(struct ttm_resource_manager *man,
+			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru = &res->lru;
-
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
-		if (ttm_lru_item_is_res(lru))
-			return ttm_lru_item_to_res(lru);
-	}
+	cursor->priority = 0;
+	cursor->man = man;
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
-	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				ttm_lru_item_to_res(lru);
-		}
-
-	return NULL;
+	return ttm_resource_manager_next(cursor);
 }
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index eee6c20c3d1c..5becd784ba25 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -256,9 +256,15 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
  * Cursor to iterate over the resources in a manager.
  */
 struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
 	unsigned int priority;
 };
 
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -413,9 +419,7 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor);
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res);
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
@@ -427,7 +431,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
  */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
-	     res = ttm_resource_manager_next(man, cursor, res))
+	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
-- 
2.43.0

