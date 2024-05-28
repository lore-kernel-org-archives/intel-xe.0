Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08407C25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694510E829;
	Tue, 28 May 2024 09:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOffRoUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21B310E758
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890115; x=1748426115;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MrlTFaUKD9oPYPNW55sW3gLBR3qWwC63ss+95qAXt0o=;
 b=SOffRoUIdf0Ge/hJWfQiisNHL13E0TUSszj2lGsccaWXZnO+MCXgtC0g
 2/3M9OE0PYbmYkJo+B79KvtCOQOvGPakNw51Aywo7Uyst5wWTxGJtnVJx
 VnzRw0hbFm8+7rEAM8THib2V38JvJDUmpi16a+x7C+6CBl1QH6wvQITm6
 lvmmNVuiDNJg4cX+6mFDjMsd17e3FUfBHLdkslhdxuG+3RFapex8kLhNm
 s6QHFXDDoe8jgMMHI/7a5eecRCLlZCf1iTYsgrUNsmU7W1Oj5MN/6FptP
 nLIHG9p67gz2baZ9Pd69gI315KfmVSYU46RiJJhcH4+6iVMpeMj3YkUpo w==;
X-CSE-ConnectionGUID: rt0xWobZRGWcsyPtS5tEVQ==
X-CSE-MsgGUID: DMTN/ihPRhalj4fjTmMQhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345530"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:15 -0700
X-CSE-ConnectionGUID: kHruCQhrQCustNf6gpo5kQ==
X-CSE-MsgGUID: bc1of8BKRi6Wgt1oJ/bGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932064"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 02/20] drm/ttm: Slightly clean up LRU list iteration
Date: Tue, 28 May 2024 11:54:44 +0200
Message-ID: <20240528095503.90177-3-thomas.hellstrom@linux.intel.com>
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

To make the transition to using lru hitches easier,
simplify the ttm_resource_manager_next() interface to only take
the cursor and reuse ttm_resource_manager_next() functionality
from ttm_resource_manager_first().

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++-----------------
 include/drm/ttm/ttm_resource.h     | 10 ++++---
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index db9a7a3717c4..8bfbddddc0e8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -496,50 +496,44 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru;
-
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				return ttm_lru_item_to_res(lru);
-		}
-
-	return NULL;
+	cursor->priority = 0;
+	cursor->man = man;
+	cursor->cur = &man->lru[cursor->priority];
+	return ttm_resource_manager_next(cursor);
 }
 
 /**
  * ttm_resource_manager_next
  *
- * @man: resource manager to iterate over
  * @cursor: cursor to record the position
- * @res: the current resource pointer
  *
- * Returns the next resource from the resource manager.
+ * Return: the next resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res)
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru = &res->lru;
+	struct ttm_resource_manager *man = cursor->man;
+	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
-		if (ttm_lru_item_is_res(lru))
-			return ttm_lru_item_to_res(lru);
-	}
-
-	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				ttm_lru_item_to_res(lru);
+	for (;;) {
+		lru = list_entry(cursor->cur, typeof(*lru), link);
+		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru)) {
+				cursor->cur = &lru->link;
+				return ttm_lru_item_to_res(lru);
+			}
 		}
 
+		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
+			break;
+
+		cursor->cur = &man->lru[cursor->priority];
+	}
+
 	return NULL;
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 1511d91e290d..7d81fd5b5b83 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -272,11 +272,15 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 /**
  * struct ttm_resource_cursor
  *
+ * @man: The resource manager currently being iterated over.
+ * @cur: The list head the cursor currently points to.
  * @priority: the current priority
  *
  * Cursor to iterate over the resources in a manager.
  */
 struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct list_head *cur;
 	unsigned int priority;
 };
 
@@ -438,9 +442,7 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor);
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res);
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
 struct ttm_resource *
 ttm_lru_first_res_or_null(struct list_head *head);
@@ -455,7 +457,7 @@ ttm_lru_first_res_or_null(struct list_head *head);
  */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
-	     res = ttm_resource_manager_next(man, cursor, res))
+	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
-- 
2.44.0

