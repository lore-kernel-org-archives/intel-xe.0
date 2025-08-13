Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612B5CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DB10E6F2;
	Wed, 13 Aug 2025 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiC4kzp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80E10E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082320; x=1786618320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QngDbbzD06apjUqq2xRecXKrnvKtQHFgQBQ8z3f4YWw=;
 b=WiC4kzp6sMOzeTt2lj9uqcjAFN6TdxPMujn8gJXU0zAkkDD3+BtKz3Tw
 ePpbTkxxnDHh8tZL3WoGlMOedvOV0UndUKHpDJnQg1Ffy7Rqt+yK5SPI1
 pyokoealtnzuhc83M/zPu8zvzcoGMHfrGyKSwVDhETwuEEn3wTZ6BBJfU
 Oqbin834AIMZxdUIC0ZnrtimPjhNRgiPPj59RZ2NZItcgyK2bG3LVqhgL
 X6s/u8O/DqXXmnxhzoaFFy/rV6ICgVuDz8uxJOecxRnjMtibfo8sUngVF
 1Sg8KIPUNHsc9rvP9D47Ok7VE0fNpYQvU4gAR0OmvJpKkHpa090nkir06 Q==;
X-CSE-ConnectionGUID: aKr53yGuQ0OBRRUfVXc2rQ==
X-CSE-MsgGUID: aUVSuSjfT22eACIWVP2dEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57449998"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57449998"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:00 -0700
X-CSE-ConnectionGUID: YCP4l3UbRb6gEYcGVtPrJw==
X-CSE-MsgGUID: jIAlg9qqRA+KMlztVMBiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166068989"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:51:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
Date: Wed, 13 Aug 2025 12:51:11 +0200
Message-ID: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Introduce a validation wrapper xe_validation_guard() as a helper
intended to be used around drm_exec transactions what perform
validations. Once TTM can handle exhaustive eviction we could
remove this wrapper or make it mostly a NO-OP unless other
functionality is added to it.

Currently the wrapper takes a read lock upon entry and if the
transaction hits an OOM, all locks are released and the
transaction is retried with a write-lock. If all other
validations participate in this scheme, the transaction with
the write lock will be the only transaction validating and
should have access to all available non-pinned memory.

There is currently a problem in that TTM converts -EDEADLOCKS to
-ENOMEM, and with ww_mutex slowpath error injections, we can hit
-ENOMEMs without having actually ran out of memory. We abuse
ww_mutex internals to detect such situations until TTM is fixes
to not convert the error code. In the meantime, injecting
ww_mutex slowpath -EDEADLOCKs is a good way to test
the implementation in the absence of real OOMs.

Just introduce the wrapper in this commit. It will be hooked up
to the driver in following commits.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_validation.c | 199 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
 2 files changed, 306 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
index cc0684d24e02..cd1424f04237 100644
--- a/drivers/gpu/drm/xe/xe_validation.c
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -5,6 +5,7 @@
 #include "xe_bo.h"
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
 
 #include "xe_assert.h"
 #include "xe_validation.h"
@@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct xe_device *xe,
 	}
 }
 #endif
+
+static int xe_validation_lock(struct xe_validation_ctx *ctx)
+{
+	struct xe_validation_device *val = ctx->val;
+	int ret = 0;
+
+	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
+		if (ctx->request_exclusive)
+			ret = down_write_killable(&val->lock);
+		else
+			ret = down_read_interruptible(&val->lock);
+	} else {
+		if (ctx->request_exclusive)
+			down_write(&val->lock);
+		else
+			down_read(&val->lock);
+	}
+
+	if (!ret) {
+		ctx->lock_held = true;
+		ctx->lock_held_exclusive = ctx->request_exclusive;
+	}
+
+	return ret;
+}
+
+static void xe_validation_unlock(struct xe_validation_ctx *ctx)
+{
+	if (!ctx->lock_held)
+		return;
+
+	if (ctx->lock_held_exclusive)
+		up_write(&ctx->val->lock);
+	else
+		up_read(&ctx->val->lock);
+
+	ctx->lock_held = false;
+}
+
+/**
+ * xe_validation_ctx_init() - Initialize an xe_validation_ctx
+ * @ctx: The xe_validation_ctx to initialize.
+ * @val: The xe_validation_device representing the validation domain.
+ * @exec: The struct drm_exec to use for the transaction.
+ * @flags: The flags to use for drm_exec initialization.
+ * @nr: The number of anticipated buffer object locks. Forwarded to
+ * drm_exec initialization.
+ * @exclusive: Whether to use exclusive locking already on first validation.
+ *
+ * Initialize and lock a an xe_validation transaction using the validation domain
+ * represented by @val. Also initialize the drm_exec object forwarding
+ * @flags and @nr to the drm_exec initialization. The @exclusive parameter should
+ * typically be set to false to avoid locking out other validators from the
+ * domain until an OOM is hit. For testing- or final attempt purposes it can,
+ * however, be set to true.
+ *
+ * Return: %0 on success, %-EINTR if interruptible initial locking failed with a
+ * signal pending.
+ */
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive)
+{
+	int ret;
+
+	ctx->exec = exec;
+	ctx->val = val;
+	ctx->lock_held = false;
+	ctx->lock_held_exclusive = false;
+	ctx->request_exclusive = exclusive;
+	ctx->flags = flags;
+	ctx->nr = nr;
+
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	drm_exec_init(exec, flags, nr);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+/*
+ * This abuses both drm_exec and ww_mutex internals and should be
+ * replaced by checking for -EDEADLK when we can make TTM
+ * stop converting -EDEADLK to -ENOMEM.
+ * An alternative is to not have exhaustive eviction with
+ * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
+ */
+static bool xe_validation_contention_injected(struct drm_exec *exec)
+{
+	return !!exec->ticket.contending_lock;
+}
+
+#else
+
+static bool xe_validation_contention_injected(struct drm_exec *exec)
+{
+	return false;
+}
+
+#endif
+
+static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
+{
+	if (ret == -ENOMEM &&
+	    ((ctx->request_exclusive &&
+	      xe_validation_contention_injected(ctx->exec)) ||
+	     !ctx->request_exclusive)) {
+		ctx->request_exclusive = true;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within a validation
+ * transaction.
+ * @ctx: An uninitialized xe_validation_ctx.
+ * @vm_exec: An initialized struct vm_exec.
+ * @val: The validation domain.
+ *
+ * The drm_gpuvm_exec_lock() function internally initializes its drm_exec
+ * transaction and therefore doesn't lend itself very well to be using
+ * xe_validation_ctx_init(). Provide a helper that takes an uninitialized
+ * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM retry.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
+			    struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val)
+{
+	int ret;
+
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->exec = &vm_exec->exec;
+	ctx->flags = vm_exec->flags;
+	ctx->val = val;
+retry:
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_exec_lock(vm_exec);
+	if (ret) {
+		xe_validation_unlock(ctx);
+		if (__xe_validation_should_retry(ctx, ret))
+			goto retry;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_validation_ctx_fini() - Finalize a validation transaction
+ * @ctx: The Validation transaction to finalize.
+ *
+ * Finalize a validation transaction and its related drm_exec transaction.
+ */
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
+{
+	drm_exec_fini(ctx->exec);
+	xe_validation_unlock(ctx);
+}
+
+/**
+ * xe_validation_should_retry() - Determine if a validation transaction should retry
+ * @ctx: The validation transaction.
+ * @ret: Pointer to a return value variable.
+ *
+ * Determines whether a validation transaction should retry based on the
+ * internal transaction state and the return value pointed to by @ret.
+ * If a validation should be retried, the transaction is prepared for that,
+ * and the validation locked might be re-locked in exclusive mode, and *@ret
+ * is set to %0. If the re-locking errors, typically due to interruptible
+ * locking with signal pending, *@ret is instead set to -EINTR and the
+ * function returns %false.
+ *
+ * Return: %true if validation should be retried, %false otherwise.
+ */
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
+{
+	if (__xe_validation_should_retry(ctx, *ret)) {
+		drm_exec_fini(ctx->exec);
+		*ret = 0;
+		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
+			xe_validation_unlock(ctx);
+			*ret = xe_validation_lock(ctx);
+		}
+		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
+		return !*ret;
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
index db50feacad7a..a708c260cf18 100644
--- a/drivers/gpu/drm/xe/xe_validation.h
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -7,9 +7,11 @@
 
 #include <linux/dma-resv.h>
 #include <linux/types.h>
+#include <linux/rwsem.h>
 
 struct drm_exec;
 struct drm_gem_object;
+struct drm_gpuvm_exec;
 struct xe_device;
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec
 	} while (0)
 #endif
 
+/**
+ * struct xe_validation_device - The domain for exhaustive eviction
+ * @lock: The lock used to exclude other processes from allocating graphics memory
+ *
+ * The struct xe_validation_device represents the domain for which we want to use
+ * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
+ * but when graphics memory allocation fails, it is retried with the write mode held.
+ */
+struct xe_validation_device {
+	struct rw_semaphore lock;
+};
+
+/**
+ * struct xe_validation_ctx - A struct drm_exec subclass with support for
+ * exhaustive eviction
+ * @exec: The drm_exec object base class. Note that we use a pointer instead of
+ * embedding to avoid diamond inheritance.
+ * @val: The exhaustive eviction domain.
+ * @lock_held: Whether The domain lock is currently held.
+ * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
+ * @request_exclusive: Whether to lock exclusively (write mode) the next time
+ * the domain lock is locked.
+ * @flags: The drm_exec flags used for drm_exec (re-)initialization.
+ * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
+ */
+struct xe_validation_ctx {
+	struct drm_exec *exec;
+	struct xe_validation_device *val;
+	bool lock_held;
+	bool lock_held_exclusive;
+	bool request_exclusive;
+	u32 flags;
+	unsigned int nr;
+};
+
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive);
+
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val);
+
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
+
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
+
+/**
+ * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
+ * @_ctx: Pointer to the xe_validation_ctx
+ * @_ret: The current error value possibly holding -ENOMEM
+ *
+ * Use this in way similar to drm_exec_retry_on_contention().
+ * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
+ * blocks other transactions and allows exhastive eviction. If the transaction
+ * was already restarted once, Just return the -ENOMEM. May also set
+ * _ret to -EINTR if not retrying and waits are interruptible.
+ * May only be used within a drm_exec_until_all_locked() loop.
+ */
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while (0)
+
+/**
+ * xe_validation_device_init - Initialize a struct xe_validation_device
+ * @val: The xe_validation_device to init.
+ */
+static inline void
+xe_validation_device_init(struct xe_validation_device *val)
+{
+	init_rwsem(&val->lock);
+}
+
+/*
+ * Make guard() and scoped_guard() work with xe_validation_ctx
+ * so that we can exit transactions without caring about the
+ * cleanup.
+ */
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
+	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
+	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl);
+	       _ret ? NULL : _ctx; }),
+	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
+	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
+{return *_T; }
+#define class_xe_validation_is_conditional false
+
+/**
+ * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
+ * @_ctx: The xe_validation_ctx.
+ * @_val: The xe_validation_device.
+ * @_exec: The struct drm_exec object
+ * @_flags: Flags for the drm_exec transaction. See the struct drm_exec documention!
+ * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
+ * @_excl: Whether to start in exclusive mode already in the first iteration.
+ *
+ * This macro is will initiate a drm_exec transaction with additional support for
+ * exhaustive eviction.
+ */
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)
+
 #endif
-- 
2.50.1

