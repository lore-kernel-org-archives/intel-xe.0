Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68063C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0310E3EE;
	Mon,  7 Apr 2025 09:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiAYpvDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D910E3FA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019602; x=1775555602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4mlsR5/SkdGkm7l/7ngISjOFnDr5VYtClB//3RDMb7Q=;
 b=WiAYpvDxYFvW/SI6tHhmWdckZlPF1vTQLbGxA9yhA9xGrbupvCDBmThp
 VcEEjcIt4CUe/5pVLugTOollC5lMpEyojkXCIbd6SaG9zgqs3r5kUbPTg
 rNGVra/NPiJKH7QUHG8Ii+xSqkfS0cHdxtC3FQ9/9UvHn0CoPzrdvpwnJ
 LRDLMlfNqzysK0V6oWZCjqjsr28jbouAigC3W/a5/saVJGUcPt4vygYJa
 1bkNwnMQa+9s9cthOY0Htltjou3elgxqgl8TjLUb/os78jEdJN3IS6j6G
 gcFC7O6qhkWRsht+YOh+8Zs2TwLFFfkqo2f4nQ8UT93QAG2t7uC4Qdjjw w==;
X-CSE-ConnectionGUID: EbwXsFq5QwS934rLvIsL/w==
X-CSE-MsgGUID: dazos7WHSh+7LaVDJtsK9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029446"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:22 -0700
X-CSE-ConnectionGUID: 8RSiOoWiSWyeEj4VwU2DaA==
X-CSE-MsgGUID: qTC5SvGQSBm6Vp5TwbWQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778841"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 21/32] drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Date: Mon,  7 Apr 2025 15:47:08 +0530
Message-Id: <20250407101719.3350996-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 89 +--------------------------------
 include/drm/drm_gpusvm.h     | 96 +++++++++++++++++++++++++++++++++++-
 2 files changed, 96 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 149ac56eff70..09708eef1c86 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -391,97 +391,10 @@ struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end)
 {
-	struct interval_tree_node *itree;
-
-	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
-
-	if (itree)
-		return container_of(itree, struct drm_gpusvm_range, itree);
-	else
-		return NULL;
+	return __drm_gpusvm_range_find(notifier, start, end);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
-/**
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
- *
- * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
- *         the current notifier is the last one or if the input notifier is
- *         NULL.
- */
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
-{
-	struct interval_tree_node *itree;
-
-	itree = interval_tree_iter_first(root, start, last);
-
-	if (itree)
-		return container_of(itree, struct drm_gpusvm_notifier, itree);
-	else
-		return NULL;
-}
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
-
 /**
  * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
  * @mni: Pointer to the mmu_interval_notifier structure.
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8093cc6ab1f4..8b70361db351 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -491,6 +491,20 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
 	return NULL;
 }
 
+static inline struct drm_gpusvm_range *
+__drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
+			unsigned long start, unsigned long end)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_range, itree);
+	else
+		return NULL;
+}
+
 /**
  * drm_gpusvm_for_each_range() - Iterate over GPU SVM ranges in a notifier
  * @range__: Iterator variable for the ranges. If set, it indicates the start of
@@ -504,8 +518,88 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
  */
 #define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
 	for ((range__) = (range__) ?:					\
-	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     __drm_gpusvm_range_find((notifier__), (start__), (end__));	\
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
+	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
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
+static inline struct drm_gpusvm_notifier *
+notifier_iter_first(struct rb_root_cached *root, unsigned long start,
+		    unsigned long last)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(root, start, last);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
+	else
+		return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
 #endif /* __DRM_GPUSVM_H__ */
-- 
2.34.1

