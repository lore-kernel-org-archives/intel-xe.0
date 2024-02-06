Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53333C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 12:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17937112B4B;
	Tue,  6 Feb 2024 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ekois3ty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B781121B8;
 Tue,  6 Feb 2024 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707222282; x=1738758282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/LY/Tg/NQY7bNpgHnxNms6MzjaXcJiPkcHtcxpZa5I=;
 b=Ekois3tyTSu2P0rtV/sqM5CpV+mNXOZkBMg3yiGI19WTWximVNHA7nv0
 ENxa/iZ0z24wOibXf14SKkAPZ4xO+3fGjwbY+JMdz1cfCW1xA7+a4w7Ei
 YmNlKtZkhtgdBCB3ss5SpjhiG3PWx319kHuYWnRpQngoGtW+XvOnff6gi
 cH9TRVRdpgxX4iplTICoRW8g6ayIvMOlBca2KHRjsIkS1bYQbYhflkJxC
 UtmXq7747r+iFfzWqYInw0SE0wd+mTow0qVXs3oZJGdbvTwPP8E1Bpoc3
 sSt1hJ7+ftMKE5jho4NqLxS0kFyXeLVJlZMXoZicLNtmjLqLsjFHX+Aw0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="629247"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="629247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5619341"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.52])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:17:36 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI 3/3] drm/ttm: Consider hitch moves within bulk sublist moves
Date: Tue,  6 Feb 2024 13:17:16 +0100
Message-ID: <20240206121716.13365-3-thomas.hellstrom@linux.intel.com>
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

To work around the problem with hitches moving when bulk move
sublists are bumped, keep a second hitch when traversing a bulk
move sublist, which is attached to the list *after* the bulk
move sublist. If we detect a sublist bump, we use that second
hitch as the continuation point of list traversal.

Sublist bumps are detected by checking the sublist age which is
increased by 1 each time it was bumped. The age is then compared
to that of the last iteration returning an item within the sublist.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 65 ++++++++++++++++++++++++++++--
 include/drm/ttm/ttm_resource.h     | 38 +++++++++--------
 2 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index f45b8bd5e7c4..f299152b38a8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -32,10 +32,18 @@
 
 #include <drm/drm_util.h>
 
+static void
+ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
+{
+	cursor->bulk = NULL;
+	list_del_init(&cursor->bulk_hitch.link);
+}
+
 void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
 {
 	lockdep_assert_held(&cursor->man->bdev->lru_lock);
-	list_del(&cursor->hitch.link);
+	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
 }
 
 void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
@@ -88,6 +96,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 					    &pos->last->lru.link);
 		}
 	}
+	atomic64_inc(&bulk->age);
 }
 EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
 
@@ -487,6 +496,52 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 }
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
+static bool
+ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
+			       struct ttm_lru_item *next_lru)
+{
+	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
+	struct ttm_lru_bulk_move *bulk = NULL;
+	struct ttm_buffer_object *bo = next->bo;
+
+	if (bo && bo->resource == next)
+		bulk = bo->bulk_move;
+
+	if (!bulk) {
+		ttm_resource_cursor_clear_bulk(cursor);
+		return false;
+	}
+
+	/*
+	 * We encountered a bulk sublist. Record its age and
+	 * set a hitch after the sublist.
+	 */
+	if (cursor->bulk != bulk) {
+		struct ttm_lru_bulk_move_pos *pos =
+			ttm_lru_bulk_move_pos(bulk, next);
+
+		cursor->bulk = bulk;
+		cursor->bulk_age = atomic64_read(&bulk->age);
+		list_move(&cursor->bulk_hitch.link, &pos->last->lru.link);
+		return false;
+	}
+
+	/* Continue iterating down the bulk sublist */
+	if (cursor->bulk_age == atomic64_read(&bulk->age))
+		return false;
+
+	/*
+	 * The bulk sublist in which we had a hitch has moved and the
+	 * hitch moved with it. Restart iteration from a previously
+	 * set hitch after the bulk_move, and remove that backup
+	 * hitch.
+	 */
+	list_move(&cursor->hitch.link, &cursor->bulk_hitch.link);
+	ttm_resource_cursor_clear_bulk(cursor);
+
+	return true;
+}
+
 /**
  * ttm_resource_manager_next
  *
@@ -508,18 +563,21 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		lru = &cursor->hitch;
 		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
 			if (ttm_lru_item_is_res(lru)) {
+				if (ttm_resource_cursor_check_bulk(cursor, lru))
+					continue;
 				list_move(&cursor->hitch.link, &lru->link);
 				return ttm_lru_item_to_res(lru);
 			}
 		}
 
-		if (cursor->priority++ >= TTM_MAX_BO_PRIORITY)
+		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
 			break;
 
 		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
+		ttm_resource_cursor_clear_bulk(cursor);
 	} while (true);
 
-	list_del_init(&cursor->hitch.link);
+	ttm_resource_cursor_fini_locked(cursor);
 
 	return NULL;
 }
@@ -541,6 +599,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 	cursor->priority = 0;
 	cursor->man = man;
 	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	ttm_lru_item_init(&cursor->bulk_hitch, TTM_LRU_HITCH);
 	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 
 	return ttm_resource_manager_next(cursor);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 5becd784ba25..3e969b6b90b5 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -248,23 +248,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 	return container_of(item, struct ttm_resource, lru);
 }
 
-/**
- * struct ttm_resource_cursor
- *
- * @priority: the current priority
- *
- * Cursor to iterate over the resources in a manager.
- */
-struct ttm_resource_cursor {
-	struct ttm_resource_manager *man;
-	struct ttm_lru_item hitch;
-	unsigned int priority;
-};
-
-void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
-
-void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
-
 /**
  * struct ttm_lru_bulk_move_pos
  *
@@ -288,8 +271,29 @@ struct ttm_lru_bulk_move_pos {
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
+	atomic64_t age;
 };
 
+/**
+ * struct ttm_resource_cursor
+ *
+ * @priority: the current priority
+ *
+ * Cursor to iterate over the resources in a manager.
+ */
+struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct ttm_lru_item hitch;
+	struct ttm_lru_item bulk_hitch;
+	struct ttm_lru_bulk_move *bulk;
+	u64 bulk_age;
+	unsigned int priority;
+};
+
+void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
+
+void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
+
 /**
  * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
  * struct sg_table backed struct ttm_resource.
-- 
2.43.0

