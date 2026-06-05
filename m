Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F9BCD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3866D10E490;
	Fri,  5 Jun 2026 11:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Enz4aRth";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D49E10E488
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780658848; x=1812194848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cp6wbFLA50qtMmPVV9PmYSxFiaYUBgbo60IypJUhB+o=;
 b=Enz4aRthbEiWlADpIk4adscJl46YZiyJhsgC8U4q5KK+hMewCOoeQgCX
 6DrjialeoqRI/WrlGIl+1BJaEuorK9jA0kyXgFCDmOsNnSz/pLNdk/Erl
 k2//5a3QHYVVn05Df8Rct4pdVSTc088sfVR5JzcuD6XnTEqbLSL9CvXGa
 YoqA5THAkJYGIHJPBHhSrgfC7rh+wr5i+L1T31VoOOjS5l2/q7AL23OmH
 K6B+YEtiDU65uwAIiZhDmwmnbm+alIgL8XqAoPNt0ucpyPZlLKJb7tTr0
 2JLXCAwSgo8aLeACghAOTTyqVnFnIrezFtZtckokkZ8I6pQrXpjrdslh9 A==;
X-CSE-ConnectionGUID: zu/ATk3nQ0Si6IbGiCFx3w==
X-CSE-MsgGUID: D+9JASP2Rc+Nko+2YHl5cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69025035"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="69025035"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:28 -0700
X-CSE-ConnectionGUID: qm8f/d1IROKkt7Ljmanbqw==
X-CSE-MsgGUID: zcgD6oYgQaaMGtzjqz6TXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249748592"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH] drm/exec: Rebuild drm_exec on top of dma_resv_txn
Date: Fri,  5 Jun 2026 13:26:59 +0200
Message-ID: <20260605112700.181040-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
References: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
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

Replace the standalone drm_exec wound-wait implementation with a thin
wrapper around the generic dma_resv_txn layer.

drm_exec retains its full public API; existing callers need no changes.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c | 203 ++++---------------------------------
 include/drm/drm_exec.h     | 161 +++++++++--------------------
 2 files changed, 70 insertions(+), 294 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 7988f5e7d56a..0dddcb76cd88 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -26,7 +26,7 @@
  *	struct drm_exec exec;
  *	int ret;
  *
- *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+ *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
  *	drm_exec_until_all_locked(&exec) {
  *		ret = drm_exec_prepare_obj(&exec, boA, 1);
  *		drm_exec_retry_on_contention(&exec);
@@ -44,152 +44,41 @@
  *		...
  *	}
  *	drm_exec_fini(&exec);
- *
- * See struct dma_exec for more details.
  */
 
-/* Unlock all objects and drop references */
-static void drm_exec_unlock_all(struct drm_exec *exec)
+static struct dma_resv *drm_exec_obj_resv(struct dma_resv_txn_obj *txn_obj)
 {
-	struct drm_gem_object *obj;
-
-	drm_exec_for_each_locked_object_reverse(exec, obj) {
-		dma_resv_unlock(obj->resv);
-		drm_gem_object_put(obj);
-	}
+	return ((struct drm_gem_object *)txn_obj->object)->resv;
+}
 
-	drm_gem_object_put(exec->prelocked);
-	exec->prelocked = NULL;
+static void drm_exec_obj_put(struct dma_resv_txn_obj *txn_obj)
+{
+	drm_gem_object_put(txn_obj->object);
 }
 
+const struct dma_resv_txn_obj_ops drm_exec_obj_ops = {
+	.resv = drm_exec_obj_resv,
+	.put  = drm_exec_obj_put,
+};
+EXPORT_SYMBOL(drm_exec_obj_ops);
+
 /**
  * drm_exec_init - initialize a drm_exec object
  * @exec: the drm_exec object to initialize
  * @flags: controls locking behavior, see DRM_EXEC_* defines
- * @nr: the initial # of objects
+ * @nr: the initial # of objects; 0 means use a default
  *
  * Initialize the object and make sure that we can track locked objects.
  *
  * If nr is non-zero then it is used as the initial objects table size.
  * In either case, the table will grow (be re-allocated) on demand.
  */
-void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned int nr)
 {
-	if (!nr)
-		nr = PAGE_SIZE / sizeof(void *);
-
-	exec->flags = flags;
-	exec->objects = kvmalloc_array(nr, sizeof(void *), GFP_KERNEL);
-
-	/* If allocation here fails, just delay that till the first use */
-	exec->max_objects = exec->objects ? nr : 0;
-	exec->num_objects = 0;
-	exec->contended = DRM_EXEC_DUMMY;
-	exec->prelocked = NULL;
+	dma_resv_txn_init(&exec->txn, flags, nr);
 }
 EXPORT_SYMBOL(drm_exec_init);
 
-/**
- * drm_exec_fini - finalize a drm_exec object
- * @exec: the drm_exec object to finalize
- *
- * Unlock all locked objects, drop the references to objects and free all memory
- * used for tracking the state.
- */
-void drm_exec_fini(struct drm_exec *exec)
-{
-	drm_exec_unlock_all(exec);
-	kvfree(exec->objects);
-	if (exec->contended != DRM_EXEC_DUMMY) {
-		drm_gem_object_put(exec->contended);
-		ww_acquire_fini(&exec->ticket);
-	}
-}
-EXPORT_SYMBOL(drm_exec_fini);
-
-/**
- * drm_exec_cleanup - cleanup when contention is detected
- * @exec: the drm_exec object to cleanup
- *
- * Cleanup the current state and return true if we should stay inside the retry
- * loop, false if there wasn't any contention detected and we can keep the
- * objects locked.
- */
-bool drm_exec_cleanup(struct drm_exec *exec)
-{
-	if (likely(!exec->contended)) {
-		ww_acquire_done(&exec->ticket);
-		return false;
-	}
-
-	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
-		exec->contended = NULL;
-		ww_acquire_init(&exec->ticket, &reservation_ww_class);
-		return true;
-	}
-
-	drm_exec_unlock_all(exec);
-	exec->num_objects = 0;
-	return true;
-}
-EXPORT_SYMBOL(drm_exec_cleanup);
-
-/* Track the locked object in the array */
-static int drm_exec_obj_locked(struct drm_exec *exec,
-			       struct drm_gem_object *obj)
-{
-	if (unlikely(exec->num_objects == exec->max_objects)) {
-		size_t size = exec->max_objects * sizeof(void *);
-		void *tmp;
-
-		tmp = kvrealloc(exec->objects, size + PAGE_SIZE, GFP_KERNEL);
-		if (!tmp)
-			return -ENOMEM;
-
-		exec->objects = tmp;
-		exec->max_objects += PAGE_SIZE / sizeof(void *);
-	}
-	drm_gem_object_get(obj);
-	exec->objects[exec->num_objects++] = obj;
-
-	return 0;
-}
-
-/* Make sure the contended object is locked first */
-static int drm_exec_lock_contended(struct drm_exec *exec)
-{
-	struct drm_gem_object *obj = exec->contended;
-	int ret;
-
-	if (likely(!obj))
-		return 0;
-
-	/* Always cleanup the contention so that error handling can kick in */
-	exec->contended = NULL;
-	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
-		ret = dma_resv_lock_slow_interruptible(obj->resv,
-						       &exec->ticket);
-		if (unlikely(ret))
-			goto error_dropref;
-	} else {
-		dma_resv_lock_slow(obj->resv, &exec->ticket);
-	}
-
-	ret = drm_exec_obj_locked(exec, obj);
-	if (unlikely(ret))
-		goto error_unlock;
-
-	exec->prelocked = obj;
-	return 0;
-
-error_unlock:
-	dma_resv_unlock(obj->resv);
-
-error_dropref:
-	drm_gem_object_put(obj);
-	return ret;
-}
-
 /**
  * drm_exec_lock_obj - lock a GEM object for use
  * @exec: the drm_exec object with the state
@@ -203,45 +92,8 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
  */
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 {
-	int ret;
-
-	ret = drm_exec_lock_contended(exec);
-	if (unlikely(ret))
-		return ret;
-
-	if (exec->prelocked == obj) {
-		drm_gem_object_put(exec->prelocked);
-		exec->prelocked = NULL;
-		return 0;
-	}
-
-	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT)
-		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
-	else
-		ret = dma_resv_lock(obj->resv, &exec->ticket);
-
-	if (unlikely(ret == -EDEADLK)) {
-		drm_gem_object_get(obj);
-		exec->contended = obj;
-		return -EDEADLK;
-	}
-
-	if (unlikely(ret == -EALREADY) &&
-	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
-		return 0;
-
-	if (unlikely(ret))
-		return ret;
-
-	ret = drm_exec_obj_locked(exec, obj);
-	if (ret)
-		goto error_unlock;
-
-	return 0;
-
-error_unlock:
-	dma_resv_unlock(obj->resv);
-	return ret;
+	drm_gem_object_get(obj);
+	return dma_resv_txn_lock(&exec->txn, obj, &drm_exec_obj_ops);
 }
 EXPORT_SYMBOL(drm_exec_lock_obj);
 
@@ -256,19 +108,7 @@ EXPORT_SYMBOL(drm_exec_lock_obj);
  */
 void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 {
-	unsigned int i;
-
-	for (i = exec->num_objects; i--;) {
-		if (exec->objects[i] == obj) {
-			dma_resv_unlock(obj->resv);
-			for (++i; i < exec->num_objects; ++i)
-				exec->objects[i - 1] = exec->objects[i];
-			--exec->num_objects;
-			drm_gem_object_put(obj);
-			return;
-		}
-
-	}
+	dma_resv_txn_unlock(&exec->txn, obj);
 }
 EXPORT_SYMBOL(drm_exec_unlock_obj);
 
@@ -320,10 +160,9 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   unsigned int num_objects,
 			   unsigned int num_fences)
 {
-	int ret;
-
 	for (unsigned int i = 0; i < num_objects; ++i) {
-		ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
+		int ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
+
 		if (unlikely(ret))
 			return ret;
 	}
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 8725ba92ff91..91e1377d2ea4 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -4,113 +4,70 @@
 #define __DRM_EXEC_H__
 
 #include <linux/compiler.h>
-#include <linux/ww_mutex.h>
+#include <linux/dma-resv-txn.h>
 
-#define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
-#define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
-
-/*
- * Dummy value used to initially enter the retry loop.
- * internal use only.
- */
-#define DRM_EXEC_DUMMY ((void *)~0)
+#define DRM_EXEC_INTERRUPTIBLE_WAIT	DMA_RESV_TXN_INTERRUPTIBLE
+#define DRM_EXEC_IGNORE_DUPLICATES	DMA_RESV_TXN_IGNORE_DUPLICATES
 
 struct drm_gem_object;
 
 /**
  * struct drm_exec - Execution context
+ *
+ * Manages locking of a set of GEM objects via the wound-wait protocol.
+ * Built on top of &dma_resv_txn.  All fields are private; use the API.
  */
 struct drm_exec {
-	/**
-	 * @flags: Flags to control locking behavior
-	 */
-	u32                     flags;
-
-	/**
-	 * @ticket: WW ticket used for acquiring locks
-	 */
-	struct ww_acquire_ctx	ticket;
-
-	/**
-	 * @num_objects: number of objects locked
-	 */
-	unsigned int		num_objects;
-
-	/**
-	 * @max_objects: maximum objects in array
-	 */
-	unsigned int		max_objects;
-
-	/**
-	 * @objects: array of the locked objects
-	 */
-	struct drm_gem_object	**objects;
-
-	/**
-	 * @contended: contended GEM object we backed off for
-	 */
-	struct drm_gem_object	*contended;
-
-	/**
-	 * @prelocked: already locked GEM object due to contention
-	 */
-	struct drm_gem_object *prelocked;
+	/** @txn: underlying wound-wait transaction */
+	struct dma_resv_txn txn;
 };
 
+extern const struct dma_resv_txn_obj_ops drm_exec_obj_ops;
+
 /**
- * drm_exec_obj() - Return the object for a give drm_exec index
- * @exec: Pointer to the drm_exec context
- * @index: The index.
+ * drm_exec_ticket() - return the ww_acquire_ctx for this execution context
+ * @exec: the drm_exec object
  *
- * Return: Pointer to the locked object corresponding to @index if
- * index is within the number of locked objects. NULL otherwise.
+ * Return: Pointer to the &ww_acquire_ctx used by this execution context.
  */
-static inline struct drm_gem_object *
-drm_exec_obj(struct drm_exec *exec, unsigned long index)
+static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
 {
-	return index < exec->num_objects ? exec->objects[index] : NULL;
+	return &exec->txn.ctx;
 }
 
-/* Helper for drm_exec_for_each_locked_object(). Internal use only. */
-#define __drm_exec_for_each_locked_object(exec, obj, __index)		\
-	for (unsigned long __index = 0; ((obj) = drm_exec_obj(exec, __index)); ++__index)
 /**
- * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * drm_exec_is_contended() - check for contention
  * @exec: drm_exec object
- * @obj: the current GEM object
  *
- * Iterate over all the locked GEM objects inside the drm_exec object.
+ * Return: true if a lock attempt detected contention and the retry loop
+ * must restart.
  */
-#define drm_exec_for_each_locked_object(exec, obj)			\
-	__drm_exec_for_each_locked_object(exec, obj, __UNIQUE_ID(drm_exec))
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return dma_resv_txn_is_contended(&exec->txn);
+}
 
-/* Helper for drm_exec_for_each_locked_object_reverse(). Internal use only. */
-#define __drm_exec_for_each_locked_object_reverse(exec, obj, __index)	\
-	for (unsigned long __index = (exec)->num_objects - 1;		\
-	     ((obj) = drm_exec_obj(exec, __index)); --__index)
 /**
- * drm_exec_for_each_locked_object_reverse - iterate over all the locked
- * objects in reverse locking order
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
  * @exec: drm_exec object
- * @obj: the current GEM object
+ * @obj: the current GEM object (struct drm_gem_object *)
  *
- * Iterate over all the locked GEM objects inside the drm_exec object in
- * reverse locking order. Note that the internal index may wrap around,
- * but that will be caught by drm_exec_obj(), returning a NULL object.
+ * Iterate over all GEM objects currently locked by @exec in acquisition order.
  */
-#define drm_exec_for_each_locked_object_reverse(exec, obj)		\
-	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
+#define drm_exec_for_each_locked_object(exec, obj)			\
+	dma_resv_txn_for_each_obj_ops(&(exec)->txn, obj, &drm_exec_obj_ops)
 
-/*
- * Helper to drm_exec_until_all_locked(). Don't use directly.
+/**
+ * drm_exec_for_each_locked_object_reverse - iterate in reverse locking order
+ * @exec: drm_exec object
+ * @obj: the current GEM object (struct drm_gem_object *)
  *
- * Since labels can't be defined local to the loop's body we use a jump pointer
- * to make sure that the retry is only used from within the loop's body.
+ * Iterate over all GEM objects currently locked by @exec in reverse
+ * acquisition order, as required when unlocking.
  */
-#define __drm_exec_until_all_locked(exec, _label)			 \
-_label:									 \
-	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
-	     drm_exec_cleanup(exec);)
+#define drm_exec_for_each_locked_object_reverse(exec, obj)		\
+	dma_resv_txn_for_each_obj_ops_reverse(&(exec)->txn, obj,	\
+					      &drm_exec_obj_ops)
 
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
@@ -120,33 +77,18 @@ _label:									 \
  * locked and no more contention exists. At the beginning of the loop it is
  * guaranteed that no GEM object is locked.
  */
-#define drm_exec_until_all_locked(exec)					\
-	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
+#define drm_exec_until_all_locked(exec) \
+	dma_resv_txn_until_all_locked(&(exec)->txn)
 
 /**
- * drm_exec_retry_on_contention - restart the loop to grap all locks
+ * drm_exec_retry_on_contention - restart the loop to grab all locks
  * @exec: drm_exec object
  *
  * Control flow helper to continue when a contention was detected and we need to
  * clean up and re-start the loop to prepare all GEM objects.
  */
-#define drm_exec_retry_on_contention(exec)			\
-	do {							\
-		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
-	} while (0)
-
-/**
- * drm_exec_is_contended - check for contention
- * @exec: drm_exec object
- *
- * Returns true if the drm_exec object has run into some contention while
- * locking a GEM object and needs to clean up.
- */
-static inline bool drm_exec_is_contended(struct drm_exec *exec)
-{
-	return !!exec->contended;
-}
+#define drm_exec_retry_on_contention(exec) \
+	dma_resv_txn_retry_on_contention(&(exec)->txn)
 
 /**
  * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
@@ -155,26 +97,21 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
  */
-#define drm_exec_retry(_exec)					\
-	do {							\
-		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
-		goto *__drm_exec_retry_ptr;			\
-	} while (0)
+#define drm_exec_retry(exec) dma_resv_txn_force_retry(&(exec)->txn)
 
 /**
- * drm_exec_ticket - return the ww_acquire_ctx for this exec context
- * @exec: drm_exec object
+ * drm_exec_fini() - finalize a drm_exec object
+ * @exec: the drm_exec object to finalize
  *
- * Return: Pointer to the ww_acquire_ctx embedded in @exec.
+ * Unlock all locked objects, drop references, and free resources.
+ * Safe to call at any point after drm_exec_init().
  */
-static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
+static inline void drm_exec_fini(struct drm_exec *exec)
 {
-	return &exec->ticket;
+	dma_resv_txn_fini(&exec->txn);
 }
 
-void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
-void drm_exec_fini(struct drm_exec *exec);
-bool drm_exec_cleanup(struct drm_exec *exec);
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned int nr);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
 int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
-- 
2.54.0

