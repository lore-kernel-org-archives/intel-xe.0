Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93B4E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1110E24A;
	Thu, 12 Dec 2024 01:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyGJ7VLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335010E24A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965331; x=1765501331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0tnQLGa/AQlEjJymBFS2XjKoq9ML9N2a/VlB9cVOm0=;
 b=TyGJ7VLsLLVatfU+G70nR4MPrNElypyxYHx9EDRPmbwZMfO3FHcaUiVw
 9VmYr4kcRznFmYaHlW+7F2TuhrdFmw+JRNb50FAPP/rk3MOb8TnLCw5j5
 dyerG4lVNpwdtT2SxSri57iIK4XDfcworQgDdm5uKOY+rnP0eFcgtUOXX
 gzqIe3VkgyinQ3WEZVx24QDO/J1TWzz2NvKzzsZts944zuX+uCHoG5gv8
 2g6aOVlzOUCDEOq+ANh1IgKAQXe8J99x4XWrx4fkLbRe/ECzPQf5bT6jW
 z5C0axw6rhpEnXPOSAfzS1bg1NFsSAeRq+xJ+a4I1caX2tkPSvvVJXAoD g==;
X-CSE-ConnectionGUID: iEGofDspQdexyu0foaBfkA==
X-CSE-MsgGUID: /gYAFRQlQLCWUPItBsjXJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379806"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:11 -0800
X-CSE-ConnectionGUID: xytjbn+WTdKpa2BaMmY7nQ==
X-CSE-MsgGUID: g/HpsOgoQmaa/10UCBhGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856638"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
Date: Thu, 12 Dec 2024 02:01:38 +0100
Message-Id: <20241212010141.389-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

The purpose of the GuC Buffer Cache is to maintain a set ofreusable
buffers that could be used while sending some of the CTB H2G actions
that require separate buffer with indirect data. Currently only few
PF actions need this so initialize it only when running as a PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: base it on xe_sa_manager instead (Matt, Rodrigo)
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_guc.c           |   5 +
 drivers/gpu/drm/xe/xe_guc_buf.c       | 172 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h       |  47 +++++++
 drivers/gpu/drm/xe/xe_guc_buf_types.h |  28 +++++
 drivers/gpu/drm/xe/xe_guc_types.h     |   3 +
 6 files changed, 256 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7730e0596299..2e50a697f549 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -56,6 +56,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_buf.o \
 	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4e2868efb620..af62586f3528 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_throttle.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
@@ -654,6 +655,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = xe_guc_buf_cache_init(&guc->buf);
+	if (ret)
+		goto out;
+
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
new file mode 100644
index 000000000000..261c7c74417f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/cleanup.h>
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_bo.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_buf.h"
+#include "xe_sa.h"
+
+static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
+{
+	return container_of(cache, struct xe_guc, buf);
+}
+
+static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
+{
+	return guc_to_gt(cache_to_guc(cache));
+}
+
+/**
+ * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ *
+ * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
+ * indirect H2G data to GuC without a need to create a ad-hoc allocation.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+{
+	struct xe_gt *gt = cache_to_gt(cache);
+	struct xe_sa_manager *sam;
+
+	/* XXX: currently it's useful only for the PF actions */
+	if (!IS_SRIOV_PF(gt_to_xe(gt)))
+		return 0;
+
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
+	if (IS_ERR(sam))
+		return PTR_ERR(sam);
+	cache->sam = sam;
+
+	xe_gt_dbg(gt, "reusable buffer with %u dwords at %#x for %ps\n",
+		  xe_guc_buf_cache_dwords(cache), xe_bo_ggtt_addr(sam->bo),
+		  __builtin_return_address(0));
+	return 0;
+}
+
+/**
+ * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
+ * @cache: the &xe_guc_buf_cache to query
+ *
+ * Return: a size of the largest reusable buffer (in dwords)
+ */
+u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache)
+{
+	return cache->sam ? cache->sam->base.size / sizeof(u32) : 0;
+}
+
+/**
+ * xe_guc_buf_reserve() - Reserve a new sub-allocation.
+ * @cache: the &xe_guc_buf_cache where reserve sub-allocation
+ * @dwords: the requested size of the buffer in dwords
+ *
+ * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
+ * Must use xe_guc_buf_release() to release a sub-allocation.
+ *
+ * Return: a &xe_guc_buf of new sub-allocation.
+ */
+struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
+{
+	struct drm_suballoc *sa;
+
+	if (cache->sam)
+		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(32), GFP_ATOMIC);
+	else
+		sa = ERR_PTR(-EOPNOTSUPP);
+
+	return (struct xe_guc_buf){ .sa = sa };
+}
+
+/**
+ * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
+ * @cache: the &xe_guc_buf_cache where reserve sub-allocation
+ * @data: the data to flush the sub-allocation
+ * @size: the size of the data
+ *
+ * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
+ *
+ * Return: a &xe_guc_buf of new sub-allocation.
+ */
+struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
+				       const void *data, size_t size)
+{
+	struct drm_suballoc *sa;
+
+	sa = __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC);
+	if (!IS_ERR(sa))
+		memcpy(xe_sa_bo_cpu_addr(sa), data, size);
+
+	return (struct xe_guc_buf){ .sa = sa };
+}
+
+/**
+ * xe_guc_buf_release() - Release a sub-allocation.
+ * @buf: the &xe_guc_buf to release
+ *
+ * Releases a sub-allocation reserved by the xe_guc_buf_reserve().
+ */
+void xe_guc_buf_release(const struct xe_guc_buf buf)
+{
+	if (xe_guc_buf_is_valid(buf))
+		xe_sa_bo_free(buf.sa, NULL);
+}
+
+/**
+ * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
+ * @buf: the &xe_guc_buf to flush
+ *
+ * Return: a GPU address of the sub-allocation.
+ */
+u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_flush_write(buf.sa);
+	return xe_sa_bo_gpu_addr(buf.sa);
+}
+
+/**
+ * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
+ * @buf: the &xe_guc_buf to query
+ *
+ * Return: a CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
+{
+	return xe_sa_bo_cpu_addr(buf.sa);
+}
+
+/**
+ * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
+ * @buf: the &xe_guc_buf to query
+ *
+ * Return: a GPU address of the sub-allocation.
+ */
+u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
+{
+	return xe_sa_bo_gpu_addr(buf.sa);
+}
+
+/**
+ * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
+ * @cache: the &xe_guc_buf_cache with sub-allocations
+ * @ptr: the CPU pointer of the sub-allocation
+ * @size: the size of the data
+ *
+ * Return: a GPU address on success or 0 if the pointer was unrelated.
+ */
+u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
+{
+	ptrdiff_t offset = ptr - cache->sam->cpu_ptr;
+
+	if (offset < 0 || offset + size > cache->sam->base.size)
+		return 0;
+
+	return cache->sam->gpu_addr + offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
new file mode 100644
index 000000000000..0d67604d96bd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_BUF_H_
+#define _XE_GUC_BUF_H_
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+
+#include "xe_guc_buf_types.h"
+
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
+u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
+struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
+struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
+				       const void *data, size_t size);
+void xe_guc_buf_release(const struct xe_guc_buf buf);
+
+/**
+ * xe_guc_buf_is_valid() - Check if a buffer reference is valid.
+ * @buf: the &xe_guc_buf reference to check
+ *
+ * Return: true if @ref represents a valid sub-allication.
+ */
+static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
+{
+	return !IS_ERR_OR_NULL(buf.sa);
+}
+
+void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
+u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
+u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
+
+DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
+	     xe_guc_buf_release(_T),
+	     xe_guc_buf_reserve(cache, num),
+	     struct xe_guc_buf_cache *cache, u32 num);
+
+DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
+	     xe_guc_buf_release(_T),
+	     xe_guc_buf_from_data(cache, data, size),
+	     struct xe_guc_buf_cache *cache, const void *data, size_t size);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
new file mode 100644
index 000000000000..9e123d71c064
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_BUF_TYPES_H_
+#define _XE_GUC_BUF_TYPES_H_
+
+struct drm_suballoc;
+struct xe_sa_manager;
+
+/**
+ * struct xe_guc_buf_cache - GuC Data Buffer Cache.
+ */
+struct xe_guc_buf_cache {
+	/* private: internal sub-allocation manager */
+	struct xe_sa_manager *sam;
+};
+
+/**
+ * struct xe_guc_buf - GuC Data Buffer Reference.
+ */
+struct xe_guc_buf {
+	/* private: internal sub-allocation reference */
+	struct drm_suballoc *sa;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 83a41ebcdc91..573aa6308380 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -11,6 +11,7 @@
 
 #include "regs/xe_reg_defs.h"
 #include "xe_guc_ads_types.h"
+#include "xe_guc_buf_types.h"
 #include "xe_guc_ct_types.h"
 #include "xe_guc_fwif.h"
 #include "xe_guc_log_types.h"
@@ -58,6 +59,8 @@ struct xe_guc {
 	struct xe_guc_ads ads;
 	/** @ct: GuC ct */
 	struct xe_guc_ct ct;
+	/** @buf: GuC Buffer Cache manager */
+	struct xe_guc_buf_cache buf;
 	/** @capture: the error-state-capture module's data and objects */
 	struct xe_guc_state_capture *capture;
 	/** @pc: GuC Power Conservation */
-- 
2.47.1

