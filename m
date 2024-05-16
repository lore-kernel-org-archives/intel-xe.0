Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575F9C25B7B
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076010ED7E;
	Thu, 16 May 2024 18:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFZ7N1xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060DD10E39A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883834; x=1747419834;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JUUJ6lKLMprNCYMxmgB9gpLSJ+1NJOtgFobq81brjSg=;
 b=BFZ7N1xerBf1Hcqq5zCVhkkLcNOMyFxrnGSRRwemlkGg49DbscryZ7vk
 BKCE/9zrd2+WcTzNTs7qP6uct/i5WfZ5AO1IkOMe9BzZHJNdc/X4DcqQ0
 pDBAvfUIT8BCJbglDGc991TkTeMOrtVjuAmncejeIvc83XvHu3BKX3JFL
 489oHl8Lk36gUWRBJlcax5AnMm5hNo47FrKoJW6JGc6f9ThjfSM5Ti0GL
 BkEMdwbADwQhSNz6cOONAXkIulLGPh+xvnrFMrN3XbOPoWgqHsaWP5xlc
 +IjxwbWIe9b/yQLORtvV8ks2aVPA4y6NTR7jMoOBZanwMtzHDvcyahwC0 g==;
X-CSE-ConnectionGUID: mhOyhxUqTl+x0PKcchylgA==
X-CSE-MsgGUID: UWUQ9m7YQZ+6mvaaHhgPsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159882"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:23:54 -0700
X-CSE-ConnectionGUID: 7ByGWT3ETCufy4GWLQjJpg==
X-CSE-MsgGUID: syLIMMyHQAGKVKLYSAmslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065225"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:23:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 03/21] drm/ttm: Use LRU hitches
Date: Thu, 16 May 2024 20:23:21 +0200
Message-ID: <20240516182339.3482-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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
missed, and bumped items will be iterated over a second time before
reaching the end of the list.

The exception is list with bulk move sublists. When bumping a
sublist, a hitch that is part of that sublist will also be moved
and we might miss items if restarting from it. This will be
addressed in a later patch.

Changes in previous series:
- Updated ttm_resource_cursor_fini() documentation.
v2:
- Don't reorder ttm_resource_manager_first() and _next().
  (Christian König).
- Use list_add instead of list_move
  (Christian König)
v3:
- Split into two patches, one cleanup, one new functionality
  (Christian König)
- use ttm_resource_cursor_fini_locked() instead of open-coding
  (Matthew Brost)

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
 drivers/gpu/drm/ttm/ttm_device.c   |  9 +++--
 drivers/gpu/drm/ttm/ttm_resource.c | 56 +++++++++++++++++++++++++-----
 include/drm/ttm/ttm_resource.h     |  9 +++--
 4 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6396dece0db1..43eda720657f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -621,6 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		if (locked)
 			dma_resv_unlock(res->bo->base.resv);
 	}
+	ttm_resource_cursor_fini_locked(&cursor);
 
 	if (!bo) {
 		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 09411978a13a..f9e9b1ec8c8a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -170,12 +170,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
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
index 8bfbddddc0e8..9c8b6499edfb 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -33,6 +33,37 @@
 
 #include <drm/drm_util.h>
 
+/**
+ * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
+ * @cursor: The struct ttm_resource_cursor to finalize.
+ *
+ * The function pulls the LRU list cursor off any lists it was previusly
+ * attached to. Needs to be called with the LRU lock held. The function
+ * can be called multiple times after eachother.
+ */
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
+{
+	lockdep_assert_held(&cursor->man->bdev->lru_lock);
+	list_del_init(&cursor->hitch.link);
+}
+
+/**
+ * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
+ * @cursor: The struct ttm_resource_cursor to finalize.
+ *
+ * The function pulls the LRU list cursor off any lists it was previusly
+ * attached to. Needs to be called without the LRU list lock held. The
+ * function can be called multiple times after eachother.
+ */
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
@@ -485,12 +516,15 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
 /**
- * ttm_resource_manager_first
- *
+ * ttm_resource_manager_first() - Start iterating over the resources
+ * of a resource manager
  * @man: resource manager to iterate over
  * @cursor: cursor to record the position
  *
- * Returns the first resource from the resource manager.
+ * Initializes the cursor and starts iterating. When done iterating,
+ * the caller must explicitly call ttm_resource_cursor_fini().
+ *
+ * Return: The first resource from the resource manager.
  */
 struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
@@ -500,13 +534,15 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 
 	cursor->priority = 0;
 	cursor->man = man;
-	cursor->cur = &man->lru[cursor->priority];
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
+
 	return ttm_resource_manager_next(cursor);
 }
 
 /**
- * ttm_resource_manager_next
- *
+ * ttm_resource_manager_next() - Continue iterating over the resource manager
+ * resources
  * @cursor: cursor to record the position
  *
  * Return: the next resource from the resource manager.
@@ -520,10 +556,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 	lockdep_assert_held(&man->bdev->lru_lock);
 
 	for (;;) {
-		lru = list_entry(cursor->cur, typeof(*lru), link);
+		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
-				cursor->cur = &lru->link;
+				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
 		}
@@ -531,9 +567,11 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
 			break;
 
-		cursor->cur = &man->lru[cursor->priority];
+		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 	}
 
+	ttm_resource_cursor_fini_locked(cursor);
+
 	return NULL;
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 7d81fd5b5b83..8fac781f641e 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -273,17 +273,22 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
  * struct ttm_resource_cursor
  *
  * @man: The resource manager currently being iterated over.
- * @cur: The list head the cursor currently points to.
+ * @hitch: A hitch list node inserted before the next resource
+ * to iterate over.
  * @priority: the current priority
  *
  * Cursor to iterate over the resources in a manager.
  */
 struct ttm_resource_cursor {
 	struct ttm_resource_manager *man;
-	struct list_head *cur;
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
-- 
2.44.0

