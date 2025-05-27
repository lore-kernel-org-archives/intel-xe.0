Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75D6C5B549
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC910E541;
	Tue, 27 May 2025 16:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkzzkXp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECCF10E169
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362518; x=1779898518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BWDwGVY11jJPGvGPlN8nDjrhoFOqNKcjEHWyrqH8UvI=;
 b=dkzzkXp3rhGRzvuMAXKp+DN55QT2X4gDUgluY/e8OQhyi0bd7p9+YU7y
 0/gdHIowRlQ8iSWqnnbvvrgkl448Mji83T51GwY+lnh6p/ArQanZ/vj2B
 BKLqcbQOzN63eSR8ca++2ixgmhOznkHyRmyvk8uqWsamYW8piKG6ZplCu
 TdBK0+2YeMOleydjGeZaah4bvgPZq7XQHZnZuEzPY7Lb7V/DKgYHOO3m6
 GIUNDUCXmQjh2+u2sr7BJzgpPfgSqOYPeKmW4OqLZyIt2yYKeqU40ZMYQ
 F0znrH4sDRFfAVaYMQ5+8M9wznSV8wO6mXmQr3dXWlOZztxLQ+l7ove+4 A==;
X-CSE-ConnectionGUID: BM0eadf8Ra2UuRYnwr+Rhg==
X-CSE-MsgGUID: zITw7urVSSWqqhtpVfuXNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471865"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:30 -0700
X-CSE-ConnectionGUID: wAJivjClTm+ZQVdCko/NNg==
X-CSE-MsgGUID: 2EwEs84oRE+PtSBbyyhd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646010"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 06/19] drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Date: Tue, 27 May 2025 22:09:50 +0530
Message-Id: <20250527164003.1068118-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

The drm_gpusvm_for_each_notifier, drm_gpusvm_for_each_notifier_safe and
drm_gpusvm_for_each_range_safe macros are useful for locating notifiers
and ranges within a user-specified range. By making these macros public,
we enable broader access and utility for developers who need to leverage
them in their implementations.

v2 (Matthew Brost)
- drop inline __drm_gpusvm_range_find
- /s/notifier_iter_first/drm_gpusvm_notifier_find

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 122 +++++++----------------------------
 include/drm/drm_gpusvm.h     |  70 ++++++++++++++++++++
 2 files changed, 95 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 7bb9eb71c9aa..e50a25fe1079 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -380,107 +380,50 @@ static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
 }
 
 /**
- * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
- * @notifier: Pointer to the GPU SVM notifier structure.
- * @start: Start address of the range
- * @end: End address of the range
+ * drm_gpusvm_notifier_find() - Find GPU SVM notifier from GPU SVM
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @start: Start address of the notifier
+ * @end: End address of the notifier
  *
- * Return: A pointer to the drm_gpusvm_range if found or NULL
+ * Return: A pointer to the drm_gpusvm_notifier if found or NULL
  */
-struct drm_gpusvm_range *
-drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
-		      unsigned long end)
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+	itree = interval_tree_iter_first(&gpusvm->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_range, itree);
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
 	else
 		return NULL;
 }
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
+EXPORT_SYMBOL_GPL(drm_gpusvm_notifier_find);
 
 /**
- * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
- * @range__: Iterator variable for the ranges
- * @next__: Iterator variable for the ranges temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the range
- * @end__: End address of the range
- *
- * This macro is used to iterate over GPU SVM ranges in a notifier while
- * removing ranges from it.
- */
-#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
-	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
-	     (next__) = __drm_gpusvm_range_next(range__);				\
-	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
-	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
-
-/**
- * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
- * @notifier: a pointer to the current drm_gpusvm_notifier
+ * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
+ * @notifier: Pointer to the GPU SVM notifier structure.
+ * @start: Start address of the range
+ * @end: End address of the range
  *
- * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
- *         the current notifier is the last one or if the input notifier is
- *         NULL.
+ * Return: A pointer to the drm_gpusvm_range if found or NULL
  */
-static struct drm_gpusvm_notifier *
-__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
-{
-	if (notifier && !list_is_last(&notifier->entry,
-				      &notifier->gpusvm->notifier_list))
-		return list_next_entry(notifier, entry);
-
-	return NULL;
-}
-
-static struct drm_gpusvm_notifier *
-notifier_iter_first(struct rb_root_cached *root, unsigned long start,
-		    unsigned long last)
+struct drm_gpusvm_range *
+drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
+		      unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(root, start, last);
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_notifier, itree);
+		return container_of(itree, struct drm_gpusvm_range, itree);
 	else
 		return NULL;
 }
-
-/**
- * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
- */
-#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
-
-/**
- * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @next__: Iterator variable for the notifiers temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
- * removing notifiers from it.
- */
-#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
-	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
 /**
  * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
@@ -581,22 +524,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_init);
 
-/**
- * drm_gpusvm_notifier_find() - Find GPU SVM notifier
- * @gpusvm: Pointer to the GPU SVM structure
- * @fault_addr: Fault address
- *
- * This function finds the GPU SVM notifier associated with the fault address.
- *
- * Return: Pointer to the GPU SVM notifier on success, NULL otherwise.
- */
-static struct drm_gpusvm_notifier *
-drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
-			 unsigned long fault_addr)
-{
-	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
-}
-
 /**
  * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
  * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
@@ -1052,7 +979,7 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	if (!mmget_not_zero(mm))
 		return ERR_PTR(-EFAULT);
 
-	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
+	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr, fault_addr + 1);
 	if (!notifier) {
 		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
 		if (IS_ERR(notifier)) {
@@ -1216,7 +1143,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 	drm_gpusvm_driver_lock_held(gpusvm);
 
 	notifier = drm_gpusvm_notifier_find(gpusvm,
-					    drm_gpusvm_range_start(range));
+					    drm_gpusvm_range_start(range),
+					    drm_gpusvm_range_start(range) + 1);
 	if (WARN_ON_ONCE(!notifier))
 		return;
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 6a5156476bf4..cdd89e5af4f8 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -373,6 +373,10 @@ const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end);
@@ -530,4 +534,70 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
 	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
 	     (range__) = __drm_gpusvm_range_next(range__))
 
+/**
+ * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
+ * @range__: Iterator variable for the ranges
+ * @next__: Iterator variable for the ranges temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the range
+ * @end__: End address of the range
+ *
+ * This macro is used to iterate over GPU SVM ranges in a notifier while
+ * removing ranges from it.
+ */
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
+
+/**
+ * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
+ * @notifier: a pointer to the current drm_gpusvm_notifier
+ *
+ * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
+ *         the current notifier is the last one or if the input notifier is
+ *         NULL.
+ */
+static inline struct drm_gpusvm_notifier *
+__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
+{
+	if (notifier && !list_is_last(&notifier->entry,
+				      &notifier->gpusvm->notifier_list))
+		return list_next_entry(notifier, entry);
+
+	return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
 #endif /* __DRM_GPUSVM_H__ */
-- 
2.34.1

