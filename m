Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1ADE9D40D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 16:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E4A10E0B5;
	Wed,  4 Feb 2026 16:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZWkLSkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36910E6CF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223620; x=1801759620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xxa750uXVkbsuVKJEga9iSN/EKeR5dTkwxOXo1lrnME=;
 b=KZWkLSkCYZsAz3WpYE+xZku4i9KMKBFqT56ROYq7GHPB58p/rH0wGvcY
 sTGDKVFm0DD+l1gpj58PNjpk4+cVdQsFAeScRl41QOxO+YpeOe7HamDuc
 JLHQz0+O37HWH8Hgghav8+cQxJhaPu9e1WThPlIS+xJ8m5DrA0tBW4VB+
 do4yNksB1g8TVBZWhY645vKgzcLRNgOEA8k/sakm023JheEj6/Mn2C8y8
 gbT8dLLcTRSUsQkUWMjzupAiqPE0E+pw/rjrpYKKVXUq0Jtpcw+mCb/Kt
 6yyCpmYBWb3t7lY0jdgonCCjWDvVbxF3HGtM3EdPo4Yi6w4YLwzkqLY+2 Q==;
X-CSE-ConnectionGUID: cd7YUxQ9QzyEiyqLFwUAmg==
X-CSE-MsgGUID: iDT6eUesQOCZFN+7zihCcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70433620"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70433620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:47:00 -0800
X-CSE-ConnectionGUID: UWTRl7NtSBOtn4RSOwYy4g==
X-CSE-MsgGUID: g08MyaY1Q2SVR4Pddgs3Og==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 08:46:58 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
Date: Wed,  4 Feb 2026 16:46:44 +0000
Message-ID: <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
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

drm_suballoc_new() currently both allocates the SA object using kmalloc()
and searches for a suitable hole in the sub-allocator for the requested
size. Since kmalloc() may take internal locks, performing memory
allocation while holding the sub-allocator mutex can trigger lockdep
deadlock warnings.

Fix this by splitting SA allocation from drm_suballoc_new(), separating
object allocation from sub-allocator initialization and hole selection.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V1 -> V2:
- Splitted drm_suballoc_new() into drm_suballoc_alloc() and
drm_suballoc_init() (Thomas).
---
 drivers/gpu/drm/drm_suballoc.c | 135 +++++++++++++++++++++++++--------
 include/drm/drm_suballoc.h     |   8 ++
 2 files changed, 112 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index 879ea33dbbc4..6f21f9e048d6 100644
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
 	list_del_init(&sa->olist);
 	list_del_init(&sa->flist);
 	dma_fence_put(sa->fence);
-	kfree(sa);
+	drm_suballoc_release(sa);
 }
 
 static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
@@ -293,45 +293,75 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
 }
 
 /**
- * drm_suballoc_new() - Make a suballocation.
+ * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
+ * @gfp: gfp flags used for memory allocation.
+ *
+ * Allocate memory for an uninitialized suballoc object. Intended usage is
+ * allocate memory for suballoc object outside of a reclaim tainted context
+ * and then be initialized at a later time in a reclaim tainted context.
+ *
+ * @drm_suballoc_release should be used to release the memory if returned
+ * suballoc object is in uninitialized state.
+ *
+ * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+ */
+struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
+{
+	struct drm_suballoc *sa;
+
+	sa = kmalloc(sizeof(*sa), gfp);
+	if (!sa)
+		return ERR_PTR(-ENOMEM);
+
+	return sa;
+}
+EXPORT_SYMBOL(drm_suballoc_alloc);
+
+/**
+ * drm_suballoc_release() - Release memory for suballocation.
+ * @sa: The struct drm_suballoc.
+ */
+void drm_suballoc_release(struct drm_suballoc *sa)
+{
+	kfree(sa);
+}
+EXPORT_SYMBOL(drm_suballoc_release);
+
+/**
+ * drm_suballoc_init() - Initialize a suballocation.
  * @sa_manager: pointer to the sa_manager
+ * @sa: The struct drm_suballoc.
  * @size: number of bytes we want to suballocate.
- * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
- *       the argument is provided for suballocations from reclaim context or
- *       where the caller wants to avoid pipelining rather than wait for
- *       reclaim.
  * @intr: Whether to perform waits interruptible. This should typically
  *        always be true, unless the caller needs to propagate a
  *        non-interruptible context from above layers.
  * @align: Alignment. Must not exceed the default manager alignment.
  *         If @align is zero, then the manager alignment is used.
+ * @timeout: Time to a wait suballocation to become available.
  *
- * Try to make a suballocation of size @size, which will be rounded
- * up to the alignment specified in specified in drm_suballoc_manager_init().
+ * Try to make a suballocation on a pre-allocated suballoc object of size @size,
+ * which will be rounded up to the alignment specified in specified in
+ * drm_suballoc_manager_init().
  *
- * Return: a new suballocated bo, or an ERR_PTR.
+ * Return: zero on success, errno on failure.
  */
-struct drm_suballoc *
-drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
-		 gfp_t gfp, bool intr, size_t align)
+int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
+		      struct drm_suballoc *sa, size_t size,
+		      bool intr, size_t align, signed long timeout)
 {
 	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
 	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
 	unsigned int count;
 	int i, r;
-	struct drm_suballoc *sa;
 
 	if (WARN_ON_ONCE(align > sa_manager->align))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	if (WARN_ON_ONCE(size > sa_manager->size || !size))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	if (!align)
 		align = sa_manager->align;
 
-	sa = kmalloc(sizeof(*sa), gfp);
-	if (!sa)
-		return ERR_PTR(-ENOMEM);
 	sa->manager = sa_manager;
 	sa->fence = NULL;
 	INIT_LIST_HEAD(&sa->olist);
@@ -339,6 +369,8 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 
 	spin_lock(&sa_manager->wq.lock);
 	do {
+		long t;
+
 		for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
 			tries[i] = 0;
 
@@ -348,7 +380,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 			if (drm_suballoc_try_alloc(sa_manager, sa,
 						   size, align)) {
 				spin_unlock(&sa_manager->wq.lock);
-				return sa;
+				return 0;
 			}
 
 			/* see if we can skip over some allocations */
@@ -359,34 +391,75 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 				fences[count++] = dma_fence_get(fences[i]);
 
 		if (count) {
-			long t;
-
 			spin_unlock(&sa_manager->wq.lock);
 			t = dma_fence_wait_any_timeout(fences, count, intr,
-						       MAX_SCHEDULE_TIMEOUT,
-						       NULL);
+						       timeout, NULL);
 			for (i = 0; i < count; ++i)
 				dma_fence_put(fences[i]);
 
-			r = (t > 0) ? 0 : t;
 			spin_lock(&sa_manager->wq.lock);
 		} else if (intr) {
+			spin_unlock(&sa_manager->wq.lock);
 			/* if we have nothing to wait for block */
-			r = wait_event_interruptible_locked
+			r = wait_event_interruptible_timeout
 				(sa_manager->wq,
-				 __drm_suballoc_event(sa_manager, size, align));
+				 __drm_suballoc_event(sa_manager, size, align),
+				 timeout);
+			spin_lock(&sa_manager->wq.lock);
 		} else {
 			spin_unlock(&sa_manager->wq.lock);
-			wait_event(sa_manager->wq,
-				   drm_suballoc_event(sa_manager, size, align));
-			r = 0;
+			t = wait_event_timeout
+				(sa_manager->wq,
+				 drm_suballoc_event(sa_manager, size, align),
+				 timeout);
 			spin_lock(&sa_manager->wq.lock);
 		}
+		r = (t > 0) ? 0 : !r ? -ETIME : t;
 	} while (!r);
 
 	spin_unlock(&sa_manager->wq.lock);
-	kfree(sa);
-	return ERR_PTR(r);
+	return r;
+}
+EXPORT_SYMBOL(drm_suballoc_init);
+
+/**
+ * drm_suballoc_new() - Make a suballocation.
+ * @sa_manager: pointer to the sa_manager
+ * @size: number of bytes we want to suballocate.
+ * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
+ *       the argument is provided for suballocations from reclaim context or
+ *       where the caller wants to avoid pipelining rather than wait for
+ *       reclaim.
+ * @intr: Whether to perform waits interruptible. This should typically
+ *        always be true, unless the caller needs to propagate a
+ *        non-interruptible context from above layers.
+ * @align: Alignment. Must not exceed the default manager alignment.
+ *         If @align is zero, then the manager alignment is used.
+ *
+ * Try to make a suballocation of size @size, which will be rounded
+ * up to the alignment specified in specified in drm_suballoc_manager_init().
+ *
+ * Return: a new suballocated bo, or an ERR_PTR.
+ */
+struct drm_suballoc *
+drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
+		 gfp_t gfp, bool intr, size_t align)
+{
+	struct drm_suballoc *sa;
+	int err;
+
+	sa = drm_suballoc_alloc(gfp);
+	if (IS_ERR(sa))
+		return sa;
+
+	err = drm_suballoc_init(sa_manager, sa, size, intr, align,
+				MAX_SCHEDULE_TIMEOUT);
+	if (err) {
+		drm_suballoc_release(sa);
+		return ERR_PTR(err);
+	}
+
+	return sa;
 }
 EXPORT_SYMBOL(drm_suballoc_new);
 
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
index 7ba72a81a808..cff0e14556d1 100644
--- a/include/drm/drm_suballoc.h
+++ b/include/drm/drm_suballoc.h
@@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
 
 void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
 
+struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
+
+void drm_suballoc_release(struct drm_suballoc *sa);
+
+int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
+		      struct drm_suballoc *sa, size_t size, bool intr,
+		      size_t align, signed long timeout);
+
 struct drm_suballoc *
 drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 		 gfp_t gfp, bool intr, size_t align);
-- 
2.43.0

