Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BBC54E90
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 22:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCB210E031;
	Wed, 21 May 2025 22:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kc92ZWGF";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EBD10E031
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 22:42:59 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-23229fdaff4so48574505ad.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747867378; x=1748472178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QzOeSxIp64gaqIASo/AJYd7lERc0oTdyCDSHOudSZt4=;
 b=kc92ZWGFc6V3HqkGzsNopVsljSMOmqCx56nGo0g7qa5Xd910sjwDbh7PSkJjzBQANf
 0HWA5gfDRR21DV+FLaqkdjt+g8uVsdvTKiRVPXzP0jAJYtQ5WPeJwSEDcCX6aiGFWobM
 FmNwXzsqgU9/HFVqthJzG6Vj84JPB13/7SqDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747867378; x=1748472178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzOeSxIp64gaqIASo/AJYd7lERc0oTdyCDSHOudSZt4=;
 b=FWzRI09avKeFTM1Ur54FE9uIyhsXo0RLcisCvtrBIkWP+cJJdH+RDXzJSzf1+6pLPl
 fQZpz1Y7aUO3U6C7yyxh2xfwH+nz5jdy+Fo1AmxIFGPsrf0Tfi+v3nJwheShmYQlUfmt
 ReEMTvYyxp/+vNew+wCXJ9uSiuJ5oEoPHCV2GPtXI+jE58mhIeSw3/r+VqMWq4jgy9Hj
 rUrEX5rw0sv1q29swLEg4c7G7cYRI8SWYYiQT/qFJkzY1fwTB5UsRJRv97M2ZceefLFQ
 6yL/CauPIHdqirfTk17liMocbfZSY9nKMA2N6859STVqhzZJMUODgFkXTOQkAK/j9DQX
 DfWA==
X-Gm-Message-State: AOJu0YzqzH8dfW9Xgy7sinBRzyMJiNAfzUlUdwJzE1fwL7gNGhdN4jR0
 umkywxD7LnnETWMWv5PnL2rHU0/GtiKHICyp1kITfihpxmQN0x/ReJ3Bt8UhBIvgVxi5EuduMqf
 Qfow=
X-Gm-Gg: ASbGnctsmT1B+mT99UHGwhR2iwCfs9p/KlwPgkmdXKKpSdJY4scQsjVRKbBlbwkwJ4H
 5E4/nje9jwAKMaOSeFCD91Cn+dBPnrI5QPXpaXtklNjW89TzhjU0D6nnNw4KHGC240p5J+Tdwxq
 NBGVUUdUXVzLz9cY8pyCGrJCrw9VFO9Lv5eWZI0wTZ6+50V4OPZP9TkKA+QLIwq3OJvaLyfPl9W
 /4SYUV5qYeSsnT+AbtXCkmQDbJLawMuwys1UZgVbmZJj+7wyWVc3mKtjxHXC9z2VB78kgaapOx2
 Zo0+z3WmfG6/2jLeXt9HJ4rW1+EWgUjncBHY2czuE4Y49dlq4lCXrHgEwiNcGq5xW+R7IZFc3LJ
 Lwra4S+/kUwEDH9qJuPp/kcfD9WcEF9YYbLfWiCTG
X-Google-Smtp-Source: AGHT+IFZ7i12QWIm/IX6rpJ14txJ4sv2dQOxWX98yPiK8jw6Zxg6atrzmFTKtJYUQeTTzkmldjr6JA==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id
 d9443c01a7336-231d43bf736mr291204945ad.27.1747867378439; 
 Wed, 21 May 2025 15:42:58 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (209.131.82.34.bc.googleusercontent.com. [34.82.131.209])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e97227sm97470215ad.109.2025.05.21.15.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 15:42:57 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v2] drm/xe/bo: add GPU memory trace points
Date: Wed, 21 May 2025 22:42:35 +0000
Message-ID: <20250521224239.856298-1-justonli@chromium.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
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

v2:
 - Use u64 as preferred by checkpatch (Tvrtko)
 - Fix errors in comments/Kconfig description (Tvrtko)
 - drop redundant "CONFIG_" in Kconfig

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
 drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01735c6ece8ba..2371eeda0afd5 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recommended for driver developers only.
 	 If in doubt, say "N".
+
+config DRM_XE_GPU_MEM_TRACEPOINTS
+	bool "Enable Xe GPU memory usage tracepoints"
+	default n
+	select TRACE_GPU_MEM
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage.
+	  Intended for performance profiling and required for
+	  Android.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa98..49ee20d54ede6 100644
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
+	u64 global_total_pages =
+		atomic64_add_return(num_pages, &xe->global_total_pages);
+
+	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
+}
+
+static void update_process_mem(struct drm_file *file, ssize_t size)
+{
+	struct xe_file *xef = to_xe_file(file);
+	u64 process_mem = atomic64_add_return(size, &xef->process_mem);
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
index f81be293b260e..dd9d411e66dac 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -639,6 +639,14 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
+	/**
+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t global_total_pages;
+#endif
 };
 
 /**
@@ -700,6 +708,14 @@ struct xe_file {
 
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
2.49.0.1143.g0be31eac6b-goog

