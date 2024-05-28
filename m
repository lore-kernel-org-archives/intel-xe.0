Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5D1C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E197310FE03;
	Tue, 28 May 2024 09:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGK3v2wH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C694F10E73E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890115; x=1748426115;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qBbccwff97CV0NmuYiT39l7J1HIT2EGRk1G9jxWfE6k=;
 b=JGK3v2wH8l900Zuk2+gcblRpzbAy4STNB5UB462j2MCxjhRx05s/BWJ2
 oVpYyuw5//qDF8WXOHemyOh1r6WYf0PcKUx50rg5frW3DX7oPw0Vrnacp
 vU/MEePQOK1TplWFkoOPkh28r41V9SuENSLP1UAlBPjYks3BDdf52MwdY
 W3gDGiA56+UTCauHlJsS2thgZk3omjZzkDJc505/wMjKdbmL7vpFPjU+3
 vCkwzpOEEaYZrGLK7b1WYDyWX8mdaS4ULAl0uA2hVkeoOdDyzyLgvN0HZ
 vYYMDD+VC0dEW/E3190L2aafNevY42mVG11HK2yYs674fM9/Oo+ScCvjA A==;
X-CSE-ConnectionGUID: VsWuwBaHQ8O4xojjqmKqDg==
X-CSE-MsgGUID: E0A8MdjqTRCxecfI9N7ljA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345529"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:14 -0700
X-CSE-ConnectionGUID: gEwwc01VSOGI3B/DrXUW2A==
X-CSE-MsgGUID: 6/LR16EvTlCU/2+9I7t6Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932062"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 01/20] drm/ttm: Allow TTM LRU list nodes of different types
Date: Tue, 28 May 2024 11:54:43 +0200
Message-ID: <20240528095503.90177-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
References: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
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

To be able to handle list unlocking while traversing the LRU
list, we want the iterators not only to point to the next
position of the list traversal, but to insert themselves as
list nodes at that point to work around the fact that the
next node might otherwise disappear from the list while
the iterator is pointing to it.

These list nodes need to be easily distinguishable from other
list nodes so that others traversing the list can skip
over them.

So declare a struct ttm_lru_item, with a struct list_head member
and a type enum. This will slightly increase the size of a
struct ttm_resource.

Changes in previous series:
- Update enum ttm_lru_item_type documentation.
v3:
- Introduce ttm_lru_first_res_or_null()
  (Christian König, Thomas Hellström)

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c   |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c | 89 +++++++++++++++++++++++-------
 include/drm/ttm/ttm_resource.h     | 54 +++++++++++++++++-
 3 files changed, 125 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 434cf0258000..09411978a13a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -274,14 +274,14 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 	struct ttm_resource *res;
 
 	spin_lock(&bdev->lru_lock);
-	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
+	while ((res = ttm_lru_first_res_or_null(list))) {
 		struct ttm_buffer_object *bo = res->bo;
 
 		/* Take ref against racing releases once lru_lock is unlocked */
 		if (!ttm_bo_get_unless_zero(bo))
 			continue;
 
-		list_del_init(&res->lru);
+		list_del_init(&bo->resource->lru.link);
 		spin_unlock(&bdev->lru_lock);
 
 		if (bo->ttm)
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..db9a7a3717c4 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -70,8 +70,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 			dma_resv_assert_held(pos->last->bo->base.resv);
 
 			man = ttm_manager_type(pos->first->bo->bdev, i);
-			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
-					    &pos->last->lru);
+			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
+					    &pos->last->lru.link);
 		}
 	}
 }
@@ -84,14 +84,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
 	return &bulk->pos[res->mem_type][res->bo->priority];
 }
 
+/* Return the previous resource on the list (skip over non-resource list items) */
+static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
+{
+	struct ttm_lru_item *lru = &cur->lru;
+
+	do {
+		lru = list_prev_entry(lru, link);
+	} while (!ttm_lru_item_is_res(lru));
+
+	return ttm_lru_item_to_res(lru);
+}
+
+/* Return the next resource on the list (skip over non-resource list items) */
+static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
+{
+	struct ttm_lru_item *lru = &cur->lru;
+
+	do {
+		lru = list_next_entry(lru, link);
+	} while (!ttm_lru_item_is_res(lru));
+
+	return ttm_lru_item_to_res(lru);
+}
+
 /* Move the resource to the tail of the bulk move range */
 static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 				       struct ttm_resource *res)
 {
 	if (pos->last != res) {
 		if (pos->first == res)
-			pos->first = list_next_entry(res, lru);
-		list_move(&res->lru, &pos->last->lru);
+			pos->first = ttm_lru_next_res(res);
+		list_move(&res->lru.link, &pos->last->lru.link);
 		pos->last = res;
 	}
 }
@@ -122,11 +146,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 		pos->first = NULL;
 		pos->last = NULL;
 	} else if (pos->first == res) {
-		pos->first = list_next_entry(res, lru);
+		pos->first = ttm_lru_next_res(res);
 	} else if (pos->last == res) {
-		pos->last = list_prev_entry(res, lru);
+		pos->last = ttm_lru_prev_res(res);
 	} else {
-		list_move(&res->lru, &pos->last->lru);
+		list_move(&res->lru.link, &pos->last->lru.link);
 	}
 }
 
@@ -155,7 +179,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
 	if (bo->pin_count) {
-		list_move_tail(&res->lru, &bdev->pinned);
+		list_move_tail(&res->lru.link, &bdev->pinned);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -166,7 +190,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 		struct ttm_resource_manager *man;
 
 		man = ttm_manager_type(bdev, res->mem_type);
-		list_move_tail(&res->lru, &man->lru[bo->priority]);
+		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
 	}
 }
 
@@ -197,9 +221,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->pin_count)
-		list_add_tail(&res->lru, &bo->bdev->pinned);
+		list_add_tail(&res->lru.link, &bo->bdev->pinned);
 	else
-		list_add_tail(&res->lru, &man->lru[bo->priority]);
+		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
 	man->usage += res->size;
 	spin_unlock(&bo->bdev->lru_lock);
 }
@@ -221,7 +245,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
 	struct ttm_device *bdev = man->bdev;
 
 	spin_lock(&bdev->lru_lock);
-	list_del_init(&res->lru);
+	list_del_init(&res->lru.link);
 	man->usage -= res->size;
 	spin_unlock(&bdev->lru_lock);
 }
@@ -472,14 +496,16 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_resource *res;
+	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
 	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
+		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru))
+				return ttm_lru_item_to_res(lru);
+		}
 
 	return NULL;
 }
@@ -498,15 +524,40 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res)
 {
+	struct ttm_lru_item *lru = &res->lru;
+
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
-		return res;
+	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+		if (ttm_lru_item_is_res(lru))
+			return ttm_lru_item_to_res(lru);
+	}
 
 	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
 	     ++cursor->priority)
-		list_for_each_entry(res, &man->lru[cursor->priority], lru)
-			return res;
+		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru))
+				ttm_lru_item_to_res(lru);
+		}
+
+	return NULL;
+}
+
+/**
+ * ttm_lru_first_res_or_null() - Return the first resource on an lru list
+ * @head: The list head of the lru list.
+ *
+ * Return: Pointer to the first resource on the lru list or NULL if
+ * there is none.
+ */
+struct ttm_resource *ttm_lru_first_res_or_null(struct list_head *head)
+{
+	struct ttm_lru_item *lru;
+
+	list_for_each_entry(lru, head, link) {
+		if (ttm_lru_item_is_res(lru))
+			return ttm_lru_item_to_res(lru);
+	}
 
 	return NULL;
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69769355139f..1511d91e290d 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -49,6 +49,43 @@ struct io_mapping;
 struct sg_table;
 struct scatterlist;
 
+/**
+ * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
+ */
+enum ttm_lru_item_type {
+	/** @TTM_LRU_RESOURCE: The resource subclass */
+	TTM_LRU_RESOURCE,
+	/** @TTM_LRU_HITCH: The iterator hitch subclass */
+	TTM_LRU_HITCH
+};
+
+/**
+ * struct ttm_lru_item - The TTM lru list node base class
+ * @link: The list link
+ * @type: The subclass type
+ */
+struct ttm_lru_item {
+	struct list_head link;
+	enum ttm_lru_item_type type;
+};
+
+/**
+ * ttm_lru_item_init() - initialize a struct ttm_lru_item
+ * @item: The item to initialize
+ * @type: The subclass type
+ */
+static inline void ttm_lru_item_init(struct ttm_lru_item *item,
+				     enum ttm_lru_item_type type)
+{
+	item->type = type;
+	INIT_LIST_HEAD(&item->link);
+}
+
+static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
+{
+	return item->type == TTM_LRU_RESOURCE;
+}
+
 struct ttm_resource_manager_func {
 	/**
 	 * struct ttm_resource_manager_func member alloc
@@ -217,9 +254,21 @@ struct ttm_resource {
 	/**
 	 * @lru: Least recently used list, see &ttm_resource_manager.lru
 	 */
-	struct list_head lru;
+	struct ttm_lru_item lru;
 };
 
+/**
+ * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
+ * @item: The struct ttm_lru_item to downcast
+ *
+ * Return: Pointer to the embedding struct ttm_resource
+ */
+static inline struct ttm_resource *
+ttm_lru_item_to_res(struct ttm_lru_item *item)
+{
+	return container_of(item, struct ttm_resource, lru);
+}
+
 /**
  * struct ttm_resource_cursor
  *
@@ -393,6 +442,9 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 			  struct ttm_resource_cursor *cursor,
 			  struct ttm_resource *res);
 
+struct ttm_resource *
+ttm_lru_first_res_or_null(struct list_head *head);
+
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
  * @man: the resource manager
-- 
2.44.0

