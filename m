Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BF2C35FF6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF7410E988;
	Fri, 14 Mar 2025 07:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4QP7B8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F0C10E985
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937928; x=1773473928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q6LqacUl/vhqy8hp5FlU6GUKnBFOuM5X7x2ZhX8bCqI=;
 b=O4QP7B8dP+nPBCCFtHXRRaOFL6owDQ/aQpI7D+qCeVY50MkKTUq/CScL
 m8lcRpfCgHyHVnlXwxbDWZ/4HsAhFnd+phTlWi9tK8iPiaPii2p5GjEvC
 h89IFXSIZN943GBlHZa7aokDhZD0tfniMS8YRZ3z+Tl48lgSfdMK9kSmy
 56PmBMvVKUdk+/IP+NTkUZ51KYuzJjFygKZZys6rmOE6oz+s+glXskVuN
 ZTCT8CJmfSz3MzRELEAaS3s2ajFlfLJVkiyqmedbBPguRgD7EogGkAqGr
 KRvjgXvgacIeJSg4wENJLq1+0WxCm1rdk2tFQZPMP879j0Haly5H2E/9t g==;
X-CSE-ConnectionGUID: qZwTCtncTSup0v+cknSUXw==
X-CSE-MsgGUID: NUF9rulhQsGIutgEnw+7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446061"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:48 -0700
X-CSE-ConnectionGUID: AOclBvxmQii0W/9Q7jmQmQ==
X-CSE-MsgGUID: TWGEtR/NQpqg3ucAwW8u0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043832"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 18/29] drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Date: Fri, 14 Mar 2025 13:32:15 +0530
Message-Id: <20250314080226.2059819-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
index 2451c816edd5..d338f2ed62b3 100644
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
index df120b4d1f83..9bd03cb67d0e 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -489,6 +489,20 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
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
@@ -502,8 +516,88 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
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

