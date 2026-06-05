Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E6CD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB3A10E48F;
	Fri,  5 Jun 2026 11:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLwYF0fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761110E488
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780658847; x=1812194847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4iP1zepTCwEOLKk+lSPUJ4/B/oFm9bJUBf2OuHddOo=;
 b=fLwYF0fxvUSLevfX7lnlgjFSSTNcVGQI4JDkrZo61p2+wzueA4ih6etz
 FmtgKZgjZy+9ahF6ptRIsZEoXYA+kumZAL9cKDhN3xj6uCZW2ebV/tAlU
 NLvEgPP4M5TpbNyLzaiuuqCQdE+PwmsvOX4APiVWiu1nwrDaIIIZ0zDQF
 lwYzh2CE+05bViLYkibWnZ65b5J6UNlhSp9b0wPvgScPKUNpomDAD5O50
 2SWNZf8m4BB1e/LdJtmldUxpLIPWTVG6bauKxxqv2nTkOAT+cEREDTTSA
 Hg6DVaAqllbm3ozRogTKcFNutmp0/Opad3bXMiu/EVZq+i6JJrSJi8Lsf g==;
X-CSE-ConnectionGUID: vFX2eBXXSsqUm6dvBVQl0g==
X-CSE-MsgGUID: MhrxewM7TpaBMApr57b+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69025034"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="69025034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:27 -0700
X-CSE-ConnectionGUID: PIgjRsg0Sg+9F/4RP2dOkQ==
X-CSE-MsgGUID: 7iIvB825QfGSBpEwJIabnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249748591"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH] dma-buf: Add generic dma_resv wound-wait transaction API
Date: Fri,  5 Jun 2026 13:26:58 +0200
Message-ID: <20260605112700.181040-2-thomas.hellstrom@linux.intel.com>
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

Introduce dma_resv_txn, a subsystem-agnostic wound-wait locking
protocol for sets of dma_resv objects.  It is a lower-level analogue
of drm_exec, usable with any object that embeds or references a
dma_resv — not just GEM buffers.

Each participant type provides an ops vtable with callbacks to retrieve
the associated dma_resv and release the object reference.

dma_resv_txn_force_retry() allows callers to trigger an unconditional
retry to recover from non-ww errors such as memory pressure.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/Makefile       |   2 +-
 drivers/dma-buf/dma-resv-txn.c | 300 +++++++++++++++++++++++++++++++++
 include/linux/dma-resv-txn.h   | 223 ++++++++++++++++++++++++
 3 files changed, 524 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/dma-resv-txn.c
 create mode 100644 include/linux/dma-resv-txn.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index b25d7550bacf..6ea13c4bc896 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
+obj-y := dma-resv-txn.o dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
 	 dma-fence-unwrap.o dma-resv.o dma-buf-mapping.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
diff --git a/drivers/dma-buf/dma-resv-txn.c b/drivers/dma-buf/dma-resv-txn.c
new file mode 100644
index 000000000000..3f86add4f700
--- /dev/null
+++ b/drivers/dma-buf/dma-resv-txn.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 Christian König <christian.koenig@amd.com>
+ * Copyright (C) 2023 Rob Clark <robdclark@chromium.org>
+ * Copyright (C) 2023-2026 Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ * Copyright (C) 2024 Danilo Krummrich <dakr@kernel.org>
+ * Copyright (C) 2025 Thomas Zimmermann <tzimmermann@suse.de>
+ *
+ * Based on drivers/gpu/drm/drm_exec.c
+ */
+
+#include <linux/dma-resv-txn.h>
+#include <linux/dma-resv.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+/**
+ * DOC: Overview
+ *
+ * dma_resv_txn provides a generic wound-wait locking protocol for sets of
+ * dma_resv objects.  It is a lower-level, subsystem-agnostic analogue of
+ * drm_exec, usable with any object that embeds or references a dma_resv —
+ * not just GEM buffers.
+ *
+ * The caller must take a reference to each owning object before calling
+ * dma_resv_txn_lock(); that reference is unconditionally consumed by the
+ * call regardless of the return value:
+ *
+ * * On success the reference is stored in the array slot; the transaction
+ *   releases it via @ops->put when the slot is removed.
+ * * On -EDEADLK the reference is transferred to @txn->contended and held
+ *   across the unlock/retry cycle.
+ * * On all other returns the reference is released immediately via @ops->put.
+ */
+
+static void txn_obj_put(struct dma_resv_txn_obj *obj)
+{
+	if (obj->ops && obj->ops->put)
+		obj->ops->put(obj);
+}
+
+static void txn_unlock_all(struct dma_resv_txn *txn)
+{
+	while (txn->num_objects) {
+		struct dma_resv_txn_obj *obj = &txn->objects[--txn->num_objects];
+
+		dma_resv_unlock(obj->ops->resv(obj));
+		txn_obj_put(obj);
+	}
+
+	if (txn->prelocked.ops) {
+		dma_resv_unlock(txn->prelocked.ops->resv(&txn->prelocked));
+		txn_obj_put(&txn->prelocked);
+		txn->prelocked.ops = NULL;
+	}
+}
+
+static int txn_obj_append(struct dma_resv_txn *txn, void *object,
+			  const struct dma_resv_txn_obj_ops *ops)
+{
+	if (unlikely(txn->num_objects == txn->max_objects)) {
+		size_t old_size = txn->max_objects * sizeof(*txn->objects);
+		void *tmp;
+
+		tmp = kvrealloc(txn->objects, old_size + PAGE_SIZE, GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		txn->objects = tmp;
+		txn->max_objects += PAGE_SIZE / sizeof(*txn->objects);
+	}
+
+	txn->objects[txn->num_objects++] = (struct dma_resv_txn_obj){
+		.ops    = ops,
+		.object = object,
+	};
+	return 0;
+}
+
+/**
+ * dma_resv_txn_init() - initialize a transaction
+ * @txn: the transaction to initialize
+ * @flags: DMA_RESV_TXN_* control flags
+ * @nr: initial capacity hint; 0 means use a default
+ *
+ * Prepares the transaction for use.
+ */
+void dma_resv_txn_init(struct dma_resv_txn *txn, u32 flags, unsigned int nr)
+{
+	if (!nr)
+		nr = PAGE_SIZE / sizeof(*txn->objects);
+
+	txn->flags      = flags;
+	txn->started    = false;
+	txn->objects    = kvmalloc_array(nr, sizeof(*txn->objects), GFP_KERNEL);
+	txn->max_objects = txn->objects ? nr : 0;
+	txn->num_objects = 0;
+	txn->contended.ops  = NULL;
+	txn->prelocked.ops  = NULL;
+}
+EXPORT_SYMBOL_GPL(dma_resv_txn_init);
+
+/**
+ * dma_resv_txn_fini() - finalize a transaction
+ * @txn: the transaction to finalize
+ *
+ * Unlocks all held objects, releases all references, and frees resources.
+ * Safe to call at any point after dma_resv_txn_init().
+ */
+void dma_resv_txn_fini(struct dma_resv_txn *txn)
+{
+	txn_unlock_all(txn);
+	kvfree(txn->objects);
+
+	if (txn->contended.ops) {
+		txn_obj_put(&txn->contended);
+		txn->contended.ops = NULL;
+	}
+
+	if (txn->started)
+		ww_acquire_fini(&txn->ctx);
+}
+EXPORT_SYMBOL_GPL(dma_resv_txn_fini);
+
+/**
+ * dma_resv_txn_cleanup() - loop condition for dma_resv_txn_until_all_locked()
+ * @txn: the transaction
+ *
+ * Not intended for direct use; drive the retry loop with
+ * dma_resv_txn_until_all_locked() instead.
+ *
+ * Return: true if the loop body should run, false when all locks are held.
+ */
+bool dma_resv_txn_cleanup(struct dma_resv_txn *txn)
+{
+	if (!txn->started) {
+		ww_acquire_init(&txn->ctx, &reservation_ww_class);
+		txn->started = true;
+		return true;
+	}
+
+	if (likely(!txn->contended.ops)) {
+		ww_acquire_done(&txn->ctx);
+		return false;
+	}
+
+	txn_unlock_all(txn);
+	return true;
+}
+EXPORT_SYMBOL_GPL(dma_resv_txn_cleanup);
+
+static int txn_lock_contended(struct dma_resv_txn *txn)
+{
+	struct dma_resv_txn_obj *cont = &txn->contended;
+	struct dma_resv *resv;
+	int ret;
+
+	if (!cont->ops)
+		return 0;
+
+	resv = cont->ops->resv(cont);
+
+	if (txn->flags & DMA_RESV_TXN_INTERRUPTIBLE) {
+		ret = dma_resv_lock_slow_interruptible(resv, &txn->ctx);
+		if (unlikely(ret)) {
+			txn_obj_put(cont);
+			cont->ops = NULL;
+			return ret;
+		}
+	} else {
+		dma_resv_lock_slow(resv, &txn->ctx);
+	}
+
+	txn->prelocked = *cont;
+	cont->ops = NULL;
+	return 0;
+}
+
+/**
+ * dma_resv_txn_lock() - lock a dma_resv object under this transaction
+ * @txn: the transaction
+ * @object: opaque pointer to the owning object; stored for iteration
+ * @ops: operations for this object, including the @resv accessor
+ *
+ * The caller must hold one reference to the owning object before calling.
+ * That reference is always consumed, regardless of the return value:
+ *
+ * * 0 — success; reference stored in the locked-objects array.
+ * * -EDEADLK — contention detected; reference transferred to
+ *   @txn->contended.  Call dma_resv_txn_retry_on_contention().
+ * * -EALREADY — the resv returned by @ops->resv() is already locked by this
+ *   context; reference released via @ops->put.  Suppress with
+ *   DMA_RESV_TXN_IGNORE_DUPLICATES.
+ * * Other negative — interrupted or allocation failure; reference released
+ *   via @ops->put.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int dma_resv_txn_lock(struct dma_resv_txn *txn, void *object,
+		      const struct dma_resv_txn_obj_ops *ops)
+{
+	struct dma_resv_txn_obj caller = { .ops = ops, .object = object };
+	struct dma_resv *resv = ops->resv(&caller);
+	int ret;
+
+	ret = txn_lock_contended(txn);
+	if (unlikely(ret)) {
+		txn_obj_put(&caller);
+		return ret;
+	}
+
+	/*
+	 * If the prelocked resv matches, the lock is already held from the
+	 * slow path.  Consume the caller's ref into the array and release
+	 * the separate ref held by the prelocked slot.
+	 */
+	if (txn->prelocked.ops &&
+	    txn->prelocked.ops->resv(&txn->prelocked) == resv) {
+		ret = txn_obj_append(txn, object, ops);
+		if (unlikely(ret)) {
+			dma_resv_unlock(resv);
+			txn_obj_put(&txn->prelocked);
+			txn->prelocked.ops = NULL;
+			txn_obj_put(&caller);
+			return ret;
+		}
+		txn_obj_put(&txn->prelocked);
+		txn->prelocked.ops = NULL;
+		return 0;
+	}
+
+	if (txn->flags & DMA_RESV_TXN_INTERRUPTIBLE)
+		ret = dma_resv_lock_interruptible(resv, &txn->ctx);
+	else
+		ret = dma_resv_lock(resv, &txn->ctx);
+
+	if (unlikely(ret == -EDEADLK)) {
+		/* Transfer caller's ref to the contended slot. */
+		txn->contended = caller;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret)) {
+		if (ret == -EALREADY &&
+		    (txn->flags & DMA_RESV_TXN_IGNORE_DUPLICATES))
+			ret = 0;
+		txn_obj_put(&caller);
+		return ret;
+	}
+
+	ret = txn_obj_append(txn, object, ops);
+	if (unlikely(ret)) {
+		dma_resv_unlock(resv);
+		txn_obj_put(&caller);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_resv_txn_lock);
+
+/**
+ * dma_resv_txn_unlock() - unlock and remove a single object
+ * @txn: the transaction
+ * @object: opaque pointer identifying the object to unlock
+ *
+ * Scans the locked-objects array from the tail for an entry whose @object
+ * field matches @object, unlocks its resv, releases its reference via
+ * @ops->put, and compacts the array.  Scanning from the tail is efficient
+ * for the common case of unlocking the most recently locked objects.
+ */
+void dma_resv_txn_unlock(struct dma_resv_txn *txn, void *object)
+{
+	unsigned int i;
+
+	for (i = txn->num_objects; i--;) {
+		struct dma_resv_txn_obj *obj = &txn->objects[i];
+
+		if (obj->object != object)
+			continue;
+
+		dma_resv_unlock(obj->ops->resv(obj));
+		txn_obj_put(obj);
+
+		/* Compact: shift remaining entries down by one. */
+		for (++i; i < txn->num_objects; ++i)
+			txn->objects[i - 1] = txn->objects[i];
+		--txn->num_objects;
+		return;
+	}
+
+	WARN(1, "%s: object %p not found in transaction\n", __func__, object);
+}
+EXPORT_SYMBOL_GPL(dma_resv_txn_unlock);
+
+MODULE_DESCRIPTION("dma-resv transaction locking");
+MODULE_LICENSE("Dual MIT/GPL");
+
diff --git a/include/linux/dma-resv-txn.h b/include/linux/dma-resv-txn.h
new file mode 100644
index 000000000000..26be05db51eb
--- /dev/null
+++ b/include/linux/dma-resv-txn.h
@@ -0,0 +1,223 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 Christian König <christian.koenig@amd.com>
+ * Copyright (C) 2023 Rob Clark <robdclark@chromium.org>
+ * Copyright (C) 2023-2026 Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ *
+ * Based on include/drm/drm_exec.h
+ */
+
+#ifndef __LINUX_DMA_RESV_TXN_H
+#define __LINUX_DMA_RESV_TXN_H
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/ww_mutex.h>
+
+struct dma_resv;
+
+/**
+ * define DMA_RESV_TXN_INTERRUPTIBLE - use interruptible waits
+ *
+ * Use interruptible variants of the ww_mutex locking functions.
+ */
+#define DMA_RESV_TXN_INTERRUPTIBLE	BIT(0)
+
+/**
+ * define DMA_RESV_TXN_IGNORE_DUPLICATES - silently skip already-locked resvs
+ *
+ * When a dma_resv is already held by this transaction (e.g. because multiple
+ * objects share the same dma_resv), return 0 instead of -EALREADY.
+ */
+#define DMA_RESV_TXN_IGNORE_DUPLICATES	BIT(1)
+
+/**
+ * struct dma_resv_txn_obj - one participant in a transaction
+ *
+ * Represents an object registered with a transaction.  @object is opaque
+ * to the transaction and available to the @ops callbacks.
+ */
+struct dma_resv_txn_obj {
+	/** @ops: operations for this object; NULL marks an unoccupied slot */
+	const struct dma_resv_txn_obj_ops *ops;
+	/** @object: opaque pointer to the owning object */
+	void *object;
+};
+
+/**
+ * struct dma_resv_txn_obj_ops - per-participant operations
+ *
+ * @resv is mandatory; @put is optional.
+ */
+struct dma_resv_txn_obj_ops {
+	/**
+	 * @resv: return the &dma_resv associated with @obj.
+	 *
+	 * Must not return NULL.  Required.
+	 */
+	struct dma_resv *(*resv)(struct dma_resv_txn_obj *obj);
+	/**
+	 * @put: release the caller's reference to the owning object.
+	 *
+	 * Use @obj->object to identify the owner.  May be NULL.
+	 */
+	void (*put)(struct dma_resv_txn_obj *obj);
+};
+
+/**
+ * struct dma_resv_txn - wound-wait transaction over dma_resv objects
+ *
+ * Manages the wound-wait retry loop required to acquire multiple dma_resv
+ * locks without deadlock.  Drive with dma_resv_txn_until_all_locked().
+ *
+ * The caller must take a reference to each owning object before calling
+ * dma_resv_txn_lock(); that reference is unconditionally consumed by the
+ * call regardless of the return value.
+ */
+struct dma_resv_txn {
+	/** @flags: DMA_RESV_TXN_* control flags */
+	u32 flags;
+	/** @started: wound-wait context active */
+	bool started;
+	/** @ctx: wound-wait acquire context (ticket) */
+	struct ww_acquire_ctx ctx;
+	/**
+	 * @num_objects: number of objects currently in @objects
+	 */
+	unsigned int num_objects;
+	/**
+	 * @max_objects: allocated capacity of @objects
+	 */
+	unsigned int max_objects;
+	/**
+	 * @objects: array of locked object descriptors.
+	 */
+	struct dma_resv_txn_obj *objects;
+	/**
+	 * @contended: object whose resv caused -EDEADLK; held until the next retry.
+	 */
+	struct dma_resv_txn_obj contended;
+	/**
+	 * @prelocked: object acquired via the slow path, pending claim by the
+	 * next matching dma_resv_txn_lock() call.
+	 */
+	struct dma_resv_txn_obj prelocked;
+};
+
+void dma_resv_txn_init(struct dma_resv_txn *txn, u32 flags, unsigned int nr);
+void dma_resv_txn_fini(struct dma_resv_txn *txn);
+bool dma_resv_txn_cleanup(struct dma_resv_txn *txn);
+int dma_resv_txn_lock(struct dma_resv_txn *txn, void *object,
+		      const struct dma_resv_txn_obj_ops *ops);
+void dma_resv_txn_unlock(struct dma_resv_txn *txn, void *object);
+
+/* Internal helpers for the iteration macros; do not use directly. */
+#define __dma_resv_txn_for_each_obj_ops(txn, obj, __ops, __curs)	\
+	for (struct dma_resv_txn_obj *__curs = (txn)->objects;		\
+	     __curs < &(txn)->objects[(txn)->num_objects] &&		\
+		     ((obj) = __curs->object, true);			\
+	     ++__curs)							\
+		if (unlikely(__curs->ops != (__ops))) {} else
+
+#define __dma_resv_txn_for_each_obj_ops_reverse(txn, obj, __ops, __idx)	\
+	for (unsigned long __idx = (txn)->num_objects;			\
+	     __idx-- > 0 &&						\
+		     ((obj) = (txn)->objects[__idx].object, true);	\
+	     )								\
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else
+
+/**
+ * dma_resv_txn_for_each_obj_ops - iterate over locked objects with matching ops
+ * @txn: the transaction
+ * @obj: cursor (void *), set to the @object field of each matching slot
+ * @ops: pointer to the &dma_resv_txn_obj_ops to match against
+ *
+ * Iterate over all locked objects in @txn whose @ops pointer matches @ops.
+ * Useful for subsystems that share a transaction and need to visit only
+ * their own objects.
+ */
+#define dma_resv_txn_for_each_obj_ops(txn, obj, ops)			\
+	__dma_resv_txn_for_each_obj_ops(txn, obj, ops, __UNIQUE_ID(__drt_c))
+
+/**
+ * dma_resv_txn_for_each_obj_ops_reverse - iterate in reverse lock order
+ * @txn: the transaction
+ * @obj: cursor (void *), set to the @object field of each matching slot
+ * @ops: pointer to the &dma_resv_txn_obj_ops to match against
+ *
+ * Like dma_resv_txn_for_each_obj_ops() but in reverse acquisition order.
+ * Required when unlocking.
+ */
+#define dma_resv_txn_for_each_obj_ops_reverse(txn, obj, ops)		\
+	__dma_resv_txn_for_each_obj_ops_reverse(txn, obj, ops,		\
+						__UNIQUE_ID(__drt_c))
+
+/* Internal helper for dma_resv_txn_until_all_locked(). Do not use directly. */
+#define __dma_resv_txn_until_all_locked(txn, _label)			\
+_label:									\
+	for (void *const __maybe_unused __txn_retry_ptr = &&_label;	\
+	     dma_resv_txn_cleanup(txn);)
+
+/**
+ * dma_resv_txn_until_all_locked() - retry loop until all objects locked
+ * @txn: the transaction
+ *
+ * Drives the wound-wait retry loop.  The body is re-entered as long as
+ * contention is detected; at the start of each iteration no locks are held.
+ * Use dma_resv_txn_retry_on_contention() after each lock call.
+ *
+ * Example::
+ *
+ *   dma_resv_txn_until_all_locked(&txn) {
+ *       ret = dma_resv_txn_lock(&txn, obj_a, &my_ops);
+ *       dma_resv_txn_retry_on_contention(&txn);
+ *       if (ret) goto error;
+ *
+ *       ret = dma_resv_txn_lock(&txn, obj_b, &my_ops);
+ *       dma_resv_txn_retry_on_contention(&txn);
+ *       if (ret) goto error;
+ *   }
+ */
+#define dma_resv_txn_until_all_locked(txn)				\
+	__dma_resv_txn_until_all_locked(txn, __UNIQUE_ID(dma_resv_txn_l))
+
+/**
+ * dma_resv_txn_retry_on_contention() - restart loop if contention set
+ * @txn: the transaction
+ *
+ * Must be called after each dma_resv_txn_lock() inside the
+ * dma_resv_txn_until_all_locked() body.
+ */
+#define dma_resv_txn_retry_on_contention(txn)				\
+	do {								\
+		if (unlikely(dma_resv_txn_is_contended(txn)))		\
+			goto *__txn_retry_ptr;				\
+	} while (0)
+
+/**
+ * dma_resv_txn_force_retry() - unconditionally restart the retry loop
+ * @txn: the transaction
+ *
+ * Force a fresh retry iteration regardless of ww contention.  Use this to
+ * unwind the current locking round after a non-ww error (e.g. memory
+ * pressure).  Must be called inside dma_resv_txn_until_all_locked() and
+ * only when no contention is pending.
+ */
+#define dma_resv_txn_force_retry(txn)					\
+	do {								\
+		WARN_ON(dma_resv_txn_is_contended(txn));		\
+		goto *__txn_retry_ptr;					\
+	} while (0)
+
+/**
+ * dma_resv_txn_is_contended() - check whether contention was detected
+ * @txn: the transaction
+ *
+ * Return: true if contention was detected and the retry loop must restart.
+ */
+static inline bool dma_resv_txn_is_contended(struct dma_resv_txn *txn)
+{
+	return !!txn->contended.ops;
+}
+
+#endif /* __LINUX_DMA_RESV_TXN_H */
-- 
2.54.0

