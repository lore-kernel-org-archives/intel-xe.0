Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AABC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 17:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628C610E5A3;
	Tue, 20 May 2025 17:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="grBgv8sX";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4A10E5A3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 17:17:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso5570362b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747761428; x=1748366228;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u1EL8YsXCIm+oZd57TRsu+y71dUMJhzeK4rHUWhU7Ck=;
 b=grBgv8sXASnMlZc0ameLGbNrEReKKRr1dpLhRu9T2MNS2wZcvyoEkBNuX4GDlAhHhK
 y2Y7BzQzkj64rxnU3uqJVcdRzW5oCkHZzSaEnguc6jJB1nU1Hs+LJ9U1y5uyRTdP8hHs
 cPp9d1Vx7Gq8PkGMJTEeKtjW4GfOz8h8oIsGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747761428; x=1748366228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u1EL8YsXCIm+oZd57TRsu+y71dUMJhzeK4rHUWhU7Ck=;
 b=qhhFpvMNj8HcG73eVBB+z3MW6c3TVlplaUJA6sNh1OVBSJzUgHyP1s+LCTLU/4w6Nc
 xhX35PWOp1S2j7dPvY9AeE+s1MsO+soC3CfdM8UKGem5s4EqcOjF1S9T9QtYXvnVZyw+
 RQZfQfgaqhZzMEy7kyPU0TL6vf0lPTJJ9aRjvhOnokQ32Zt0Z/m7MgOwUENq82jEjMfR
 nBuqUl/TnskkIla3HXU1BgCzfYkKPD526F9hR7RXvlxU4PFwhnAulP7DwAyZ6WKlhgfc
 pfXzxFOIWtTaB0ATvAErVqjnOZzcfq3TqXP19TsvFFaahKSv+8H96xaTCb3iAfDZfih/
 Y1Qg==
X-Gm-Message-State: AOJu0Yxaa82S9DVH0/+Ymi6iea5gSKm7cpMl0+3hNgBHVKQxgoOopLd7
 SAOPHeZ6AWey8BZt6c3OuL4aQyBJHSJ1Jtfr4tBkTuSP6/nRdwmxt0pN3AklXZEluZzWTSGKPWb
 Ocy0=
X-Gm-Gg: ASbGnctyVPddUGw9HsFpwi7IzeXsd/KlqD4jFL3TTpH5ZgScr5uJAE0mUP1DMeG5CqB
 5xWmpZGqdXYWu3sC3y8pr09O3/dnFzstP+t46MwFh/0Kp5sP6/SUudwo/YdfsCvPHG/b7zbOmT/
 THXB5Zx+sppkH8KCA8EFZEWcbSyBxX3RQ0P2m03yXF/vBzO4GrXXw3QAYTQB2fMxSo0YZRjC4U1
 KHGm3aDAl8+pwN/qzyccSNmsKJYgfS4UNzLAojkELfEkCKeQ3dYGdjRcyeGznax6WKXgLBvjHmP
 Yk2em62uv6yQ0r3WOzvXh40zgHIxTZmBCPV6rCJixgLlIRngklpVvRie5w8SPs5EOLj9OrCQE2W
 ztGYz8Huk7XdeGrnK48GqZqVqZHRH+6LKoNJMelEd
X-Google-Smtp-Source: AGHT+IEQhA7HF2UXm+CrWzdMdLwzPtUUT/yuizOVlUxSxBWjFuzMrbIIcCVx5MWz4ZrrXa9todsnGg==
X-Received: by 2002:a05:6a20:9c8d:b0:1ee:ab52:b8cc with SMTP id
 adf61e73a8af0-2160d97d901mr32264839637.21.1747761426496; 
 Tue, 20 May 2025 10:17:06 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (209.131.82.34.bc.googleusercontent.com. [34.82.131.209])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb084428sm8213269a12.57.2025.05.20.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:17:05 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, zzyiwei@google.com,
 Juston Li <justonli@chromium.org>
Subject: [PATCH] drm/xe/bo: add GPU memory trace points
Date: Tue, 20 May 2025 17:16:20 +0000
Message-ID: <20250520171650.771258-1-justonli@chromium.org>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
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

Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
global and per-process GPU memory usage.

These are required by VSR on Android 12+ for reporting GPU driver memory
allocations.

Signed-off-by: Juston Li <justonli@chromium.org>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
 drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 15 +++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01735c6ece8ba..e2ecc6df954ce 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recommended for driver developers only.
 	 If in doubt, say "N".
+
+config CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS
+	bool "Enable Xe GPU memory usage tracepoints"
+	default n
+	select TRACE_GPU_MEM
+	help
+	  Choose this option to enable tracepoints for tracking
+	  and per-process GPU memory usage.
+	  Intended for performance profiling and required for
+	  Android.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa98..f137d6ec5357d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -19,6 +19,8 @@
 
 #include <kunit/static_stub.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
 		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+static void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+	uint64_t global_total_pages =
+		atomic64_add_return(num_pages, &xe->global_total_pages);
+
+	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
+}
+
+static void update_process_mem(struct drm_file *file, ssize_t size)
+{
+	struct xe_file *xef = to_xe_file(file);
+	uint64_t process_mem = atomic64_add_return(size, &xef->process_mem);
+
+	rcu_read_lock(); /* Locks file->pid! */
+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), process_mem);
+	rcu_read_unlock();
+}
+#else
+static inline void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
+{
+}
+
+static inline void update_process_mem(struct drm_file *file, ssize_t size)
+{
+}
+#endif
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
@@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(tt);
+	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(tt);
+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+static int xe_gem_object_open(struct drm_gem_object *obj,
+			      struct drm_file *file_priv)
+{
+	update_process_mem(file_priv, obj->size);
+	return 0;
+}
+#endif
+
 static void xe_gem_object_close(struct drm_gem_object *obj,
 				struct drm_file *file_priv)
 {
@@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
 		xe_bo_unlock(bo);
 	}
+
+	update_process_mem(file_priv, -obj->size);
 }
 
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
@@ -1757,6 +1801,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+	.open = xe_gem_object_open,
+#endif
 	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f81be293b260e..5fb65f1c64cd6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -639,6 +639,13 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+	/**
+	 * @global_mem: global GPU pages usage tracked for gpu_mem tracepoints
+	 */
+	atomic64_t global_total_pages;
+#endif
 };
 
 /**
@@ -700,6 +707,14 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+	/**
+	 * @process_mem: per-process GPU memory usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t process_mem;
+#endif
 };
 
 #endif
-- 
2.49.0.1112.g889b7c5bd8-goog

