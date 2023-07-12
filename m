Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B37AC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 16:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5539D10E598;
	Wed, 12 Jul 2023 16:38:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269E510E595
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689179880; x=1720715880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDpU1gJ6/tBe9WACjuAsi1DXaYLDW8hS7P1A7oGYFU0=;
 b=j9eKYRRBnFv8932oSYGlex1qw/jXql7PNdtx65t5LQVIPVGjxTkGYm72
 moN9qm5aMpZDNbt/jyKn8BiXzJotcluiLQFcqO98MxnY8At7sg+qDfOIE
 jhJYQDQfQgpESWne2echl5A387gTyJ5a2X91GZ/ipY2ZYDb9X3VKaCicG
 dvakp2bqnM5rPNbGg+o1bMc4qFaT5L9EhNcllDZuqSrHStB5XiA/sM9Ww
 VSryqPgzhiyO/yWNdUMoUBwmJMjZyv+hpoKa09CA/pH2T8xYPp/e2TUfG
 ob2epy0FZBoQwbnxrrQZAisBax1mQFcD2q9AB88nnudwZZ/8pC/rddvG/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349792283"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="349792283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 09:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835215331"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="835215331"
Received: from rvuia-mobl.ger.corp.intel.com (HELO 4e597ddea7eb.intel.com)
 ([10.251.221.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 09:37:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jul 2023 16:37:39 +0000
Message-Id: <20230712163740.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712163740.7-1-francois.dugast@intel.com>
References: <20230712163740.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm: execution context for GEM buffers v5
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existing TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

v2: drop xarray and use dynamic resized array instead, the locking
    overhead is unecessary and measurable.
v3: drop duplicate tracking, radeon is really the only one needing that.
v4: fixes issues pointed out by Danilo, some typos in comments and a
    helper for lock arrays of GEM objects.
v5: some suggestions by Boris Brezillon, especially just use one retry
    macro, drop loop in prepare_array, use flags instead of bool

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   6 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 330 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 120 +++++++++++++
 5 files changed, 470 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index b21df6ce9fcb..3d5dc9dc1bfe 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -529,6 +529,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8eeaa202e8ac..6016987c6ab9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -194,6 +194,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 90ee955ef4d1..3032059bf8bf 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..285bf80740b5
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,330 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+ *	drm_exec_until_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_retry_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_prepare_obj(&exec, boB, 1);
+ *		drm_exec_retry_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	drm_gem_object_put(exec->prelocked);
+	exec->prelocked = NULL;
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @flags: controls locking behavior, see DRM_EXEC_* defines
+ *
+ * Initialize the object and make sure that we can track locked objects.
+ */
+void drm_exec_init(struct drm_exec *exec, uint32_t flags)
+{
+	exec->flags = flags;
+	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects = 0;
+	exec->contended = DRM_EXEC_DUMMY;
+	exec->prelocked = NULL;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finalize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the array */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects == exec->max_objects)) {
+		size_t size = exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects = tmp;
+		exec->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] = obj;
+
+	return 0;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret)) {
+		dma_resv_unlock(obj->resv);
+		goto error_dropref;
+	}
+
+	swap(exec->prelocked, obj);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended = NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_lock_obj - lock a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to lock
+ *
+ * Lock a GEM object for use and grab a reference to it.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked, -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+		return 0;
+	}
+
+	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret == -EALREADY) &&
+	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
+		return 0;
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_lock_obj);
+
+/**
+ * drm_exec_unlock_obj - unlock a GEM object in this exec context
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to unlock
+ *
+ * Unlock the GEM object and remove it from the collection of locked objects.
+ * Should only be used to unlock the most recently locked objects. It's not time
+ * efficient to unlock objects locked long ago.
+ */
+void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	unsigned int i;
+
+	for (i = exec->num_objects; i--;) {
+		if (exec->objects[i] == obj) {
+			dma_resv_unlock(obj->resv);
+			for (++i; i < exec->num_objects; ++i)
+				exec->objects[i - 1] = exec->objects[i];
+			--exec->num_objects;
+			drm_gem_object_put(obj);
+			return;
+		}
+
+	}
+}
+EXPORT_SYMBOL(drm_exec_unlock_obj);
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked, -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_obj(exec, obj);
+	if (ret)
+		return ret;
+
+	ret = dma_resv_reserve_fences(obj->resv, num_fences);
+	if (ret) {
+		drm_exec_unlock_obj(exec, obj);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+/**
+ * drm_exec_prepare_array - helper to prepare an array of objects
+ * @exec: the drm_exec object with the state
+ * @objects: array of GEM object to prepare
+ * @num_objects: number of GEM objects in the array
+ * @num_fences: number of fences to reserve on each GEM object
+ *
+ * Prepares all GEM objects in an array, handles contention but aports on first
+ * error otherwise. Reserves @num_fences on each GEM object after locking it.
+ *
+ * Returns: -EALREADY when object is already locked, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < num_objects; ++i) {
+		ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
+		if (unlikely(ret))
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_array);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..2a7b09d5101e
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+#define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
+#define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @flags: Flags to control locking behavior
+	 */
+	uint32_t		flags;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backed off for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object due to contention
+	 */
+	struct drm_gem_object *prelocked;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])
+
+/**
+ * drm_exec_until_all_locked - loop until all GEM objects are locked
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * locked and no more contention exists. At the beginning of the loop it is
+ * guaranteed that no GEM object is locked.
+ *
+ * Since labels can't be defined local to the loops body we use a jump pointer
+ * to make sure that the retry is only used from within the loops body.
+ */
+#define drm_exec_until_all_locked(exec)				\
+	for (void *__drm_exec_retry_ptr; ({			\
+		__label__ __drm_exec_retry;			\
+__drm_exec_retry:						\
+		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
+		drm_exec_cleanup(exec);				\
+	});)
+
+/**
+ * drm_exec_retry_on_contention - restart the loop to grap all locks
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_retry_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		goto *__drm_exec_retry_ptr
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+void drm_exec_init(struct drm_exec *exec, uint32_t flags);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences);
+
+#endif
-- 
2.34.1

