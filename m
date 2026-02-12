Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23578ECD6FA
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BE110E743;
	Thu, 12 Feb 2026 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFWFmqWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EE010E743;
 Thu, 12 Feb 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901376; x=1802437376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tv+nHLBUQqAXAucY0DM+2a0GT4aMqQVpCl5PpRGkQbg=;
 b=fFWFmqWMimbYW5ziBw+gZ9sboUTpMf6t8NcxBIMT4aIfFq1aKxa3yw+e
 6Je2QBOwlzF6INM4sYl+untc/xy3F5pj5eOn1tiXKwxpNaJ0ctx8+2z7v
 1rcYPbyEezTAtayZioiSECU/yrCNLo8/RxcYqCyTAfVrBypXupXLdfYcy
 1m1GdnFSA4opsG+ffUyGOXomowPorVrwsNY73X91vTJ9eNK4XzSo9ke9j
 UUnI2damWX4Z+biLkPCEjcRSH3QIpUsbWX8NBW7RuF71n7Zrb9awbWtNF
 fAftfj+tnC7GRzEwHN9pdV9Ksk/y+5kYiafEt2RU/C+/vHkmfUN+5w1tb w==;
X-CSE-ConnectionGUID: q9zRbf0zTG6YJ7OPD9ED3A==
X-CSE-MsgGUID: Dpfa3icWQPm31BNX6owoaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89479425"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89479425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:02:56 -0800
X-CSE-ConnectionGUID: o2Sa1KMYQH2zKZ16HQq46A==
X-CSE-MsgGUID: fphQ7p/wSQ+U9zf8u2qE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212423914"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 05:02:53 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
Date: Thu, 12 Feb 2026 13:02:45 +0000
Message-ID: <20260212130243.399353-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212130243.399353-5-satyanarayana.k.v.p@intel.com>
References: <20260212130243.399353-5-satyanarayana.k.v.p@intel.com>
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
size. If SA allocation is done by holding sub-allocator mutex, this design
can lead to reclaim safety issues.

By splitting the kmalloc() step outside of the critical section, we allow
the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
the initialization step that holds reclaim-tainted locks (sub-allocator
mutex) operates in a reclaim-unsafe context with pre-allocated memory.

This separation prevents potential deadlocks where memory reclaim could
attempt to acquire locks that are already held during the sub-allocator
operations.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_suballoc.c | 110 ++++++++++++++++++++++++++-------
 include/drm/drm_suballoc.h     |   8 +++
 2 files changed, 97 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index 879ea33dbbc4..b97ffcd98d45 100644
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
@@ -293,45 +293,74 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
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
+		      bool intr, size_t align)
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
@@ -348,7 +377,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 			if (drm_suballoc_try_alloc(sa_manager, sa,
 						   size, align)) {
 				spin_unlock(&sa_manager->wq.lock);
-				return sa;
+				return 0;
 			}
 
 			/* see if we can skip over some allocations */
@@ -385,8 +414,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
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
+	err = drm_suballoc_init(sa_manager, sa, size, intr, align);
+	if (err) {
+		drm_suballoc_release(sa);
+		return ERR_PTR(err);
+	}
+
+	return sa;
 }
 EXPORT_SYMBOL(drm_suballoc_new);
 
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
index 7ba72a81a808..b8d1d5449fd8 100644
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
+		      size_t align);
+
 struct drm_suballoc *
 drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
 		 gfp_t gfp, bool intr, size_t align);
-- 
2.43.0

