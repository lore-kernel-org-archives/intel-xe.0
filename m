Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F05CC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94910F069;
	Wed, 13 Mar 2024 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsQYdwH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8410F00A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367888; x=1741903888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQ3I2OcrIepS2S7ERd4FrCn8iKo/RhBBV56rWD4kPkQ=;
 b=MsQYdwH1JWEDAxtkZxFQG6RqinmEmoiD6TZiGkbWYhB01RsldOMaNV9f
 kzaIY3INBwX0nIG+g1n47tqg1I07PZGav0LU0bLH157JaGmOQBvHvf12p
 7a3bitRgtkTihT3axzCkoU0Zpu7qE+h1biynxjHrdYmjsMuWPq0GI8fOK
 nI3EUEodgs8n1Z6P7qmwUjPKm2e8bvW04UbI3ISqR5fWkZOXmNdOwiovt
 Ihy0ARfgIMnPKMARZ8RxrUR/tIlLFg1m3REts3FoEDPbqqAi/BpWUrx8w
 1o/wfPqbt+ApUARe4J8rVzgD4cot4hoZtNm4tPfPyjOfSsrS+8ouXRmbc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5027633"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5027633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11964308"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/4] drm/xe/guc: Introduce GuC context ID Manager
Date: Wed, 13 Mar 2024 23:11:10 +0100
Message-Id: <20240313221112.1089-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313221112.1089-1-michal.wajdeczko@intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

While we are already managing GuC IDs directly in GuC submission
code, using bitmap() for MLRC and ida() for SLRC, this code can't
be easily extended to meet additional requirements for SR-IOV use
cases, like limited number of IDs available on VFs, or ID range
reservation for provisioning VFs by the PF.

Add a separate component for managing GuC IDs, that will replace
existing ID management. Start with bitmap() based implementation
that could be optimized later based on perf data.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: apply review comments from Matt
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_guc_id_mgr.c | 275 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h |  22 +++
 drivers/gpu/drm/xe/xe_guc_types.h  |  17 ++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..705c0eaf6e71 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -97,6 +97,7 @@ xe-y += xe_bb.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
 	xe_guc_hwconfig.o \
+	xe_guc_id_mgr.o \
 	xe_guc_log.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
new file mode 100644
index 000000000000..bee49bc908bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_id_mgr.h"
+#include "xe_guc_types.h"
+
+static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
+{
+	return container_of(idm, struct xe_guc, submission_state.idm);
+}
+
+static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
+{
+	return guc_to_gt(idm_to_guc(idm));
+}
+
+static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
+{
+	return gt_to_xe(idm_to_gt(idm));
+}
+
+#define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
+#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
+
+static void __fini_idm(struct drm_device *drm, void *arg)
+{
+	struct xe_guc_id_mgr *idm = arg;
+
+	mutex_lock(idm_mutex(idm));
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+
+		if (weight) {
+			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
+
+			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
+				  weight, idm->total);
+			idm_print_locked(idm, &p, 1);
+		}
+	}
+
+	bitmap_free(idm->bitmap);
+	idm->bitmap = NULL;
+	idm->total = 0;
+	idm->used = 0;
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+/**
+ * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @limit: number of IDs to manage
+ *
+ * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
+ * context IDs supported by the GuC firmware are available for use.
+ *
+ * Only VF drivers will have to provide explicit number of context IDs
+ * that they can use.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+{
+	int ret;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, !idm->total);
+	idm_assert(idm, !idm->used);
+
+	if (limit == ~0)
+		limit = GUC_ID_MAX;
+	else if (limit > GUC_ID_MAX)
+		return -ERANGE;
+	else if (!limit)
+		return -EINVAL;
+
+	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+	idm->total = limit;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
+	return 0;
+}
+
+static unsigned int find_last_zero_area(unsigned long *bitmap,
+					unsigned int total,
+					unsigned int count)
+{
+	unsigned int found = total;
+	unsigned int rs, re, range;
+
+	for_each_clear_bitrange(rs, re, bitmap, total) {
+		range = re - rs;
+		if (range < count)
+			continue;
+		found = rs + (range - count);
+	}
+	return found;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
+				    unsigned int count, unsigned int retain)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->total)
+		return -ENODATA;
+
+	if (retain) {
+		/*
+		 * For IDs reservations (used on PF for VFs) we want to make
+		 * sure there will be at least 'retain' available for the PF
+		 */
+		if (idm->used + count + retain > idm->total)
+			return -EDQUOT;
+		/*
+		 * ... and we want to reserve highest IDs close to the end.
+		 */
+		id = find_last_zero_area(idm->bitmap, idm->total, count);
+	} else {
+		/*
+		 * For regular IDs reservations (used by submission code)
+		 * we start searching from the lower range of IDs.
+		 */
+		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+	}
+	if (id >= idm->total)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+	idm->used += count;
+
+	return id;
+}
+
+static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
+				     unsigned int start, unsigned int count)
+{
+	idm_assert(idm, count);
+	idm_assert(idm, count <= idm->used);
+	idm_assert(idm, start < idm->total);
+	idm_assert(idm, start + count - 1 < idm->total);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		unsigned int n;
+
+		for (n = 0; n < count; n++)
+			idm_assert(idm, test_bit(start + n, idm->bitmap));
+	}
+	bitmap_clear(idm->bitmap, start, count);
+	idm->used -= count;
+}
+
+/**
+ * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+/**
+ * xe_guc_id_mgr_release_locked() - Release one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the GuC context ID to release
+ * @count: number of IDs to release (can't be 0)
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ */
+void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+				  unsigned int count)
+{
+	return idm_release_chunk_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of GuC context IDs to reserve (can't be 0)
+ * @retain: number of GuC context IDs to keep available (can't be 0)
+ *
+ * This function is dedicated for the use by the PF driver which expects that
+ * reserved range of IDs will be contiguous and that there will be at least
+ * &retain IDs still available for the PF after this reservation.
+ *
+ * Return: starting ID of the allocated GuC context ID range or
+ *         a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
+			  unsigned int count, unsigned int retain)
+{
+	int ret;
+
+	idm_assert(idm, count);
+	idm_assert(idm, retain);
+
+	mutex_lock(idm_mutex(idm));
+	ret = idm_reserve_chunk_locked(idm, count, retain);
+	mutex_unlock(idm_mutex(idm));
+
+	return ret;
+}
+
+/**
+ * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @start: the starting ID of GuC context range to release
+ * @count: number of GuC context IDs to release
+ */
+void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
+			   unsigned int start, unsigned int count)
+{
+	mutex_lock(idm_mutex(idm));
+	idm_release_chunk_locked(idm, start, count);
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	unsigned int rs, re;
+
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	if (!idm->bitmap)
+		return;
+
+	drm_printf_indent(p, indent, "used %u\n", idm->used);
+	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
+		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+}
+
+/**
+ * xe_guc_id_mgr_print() - Print status of GuC ID Manager.
+ * @idm: the &xe_guc_id_mgr to print
+ * @p: the &drm_printer to print to
+ * @indent: tab indentation level
+ */
+void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	mutex_lock(idm_mutex(idm));
+	idm_print_locked(idm, p, indent);
+	mutex_unlock(idm_mutex(idm));
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
new file mode 100644
index 000000000000..368f8c80e4c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_ID_MGR_H_
+#define _XE_GUC_ID_MGR_H_
+
+struct drm_printer;
+struct xe_guc_id_mgr;
+
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
+void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+
+void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index edcd1a950bd3..69be1fb83047 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -31,6 +31,21 @@ struct xe_guc_db_mgr {
 	unsigned long *bitmap;
 };
 
+/**
+ * struct xe_guc_id_mgr - GuC context ID Manager.
+ *
+ * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
+ * to protect its members.
+ */
+struct xe_guc_id_mgr {
+	/** @bitmap: bitmap to track allocated IDs */
+	unsigned long *bitmap;
+	/** @total: total number of IDs being managed */
+	unsigned int total;
+	/** @used: number of IDs currently in use */
+	unsigned int used;
+};
+
 /**
  * struct xe_guc - Graphic micro controller
  */
@@ -49,6 +64,8 @@ struct xe_guc {
 	struct xe_guc_db_mgr dbm;
 	/** @submission_state: GuC submission state */
 	struct {
+		/** @submission_state.idm: GuC context ID Manager */
+		struct xe_guc_id_mgr idm;
 		/** @submission_state.exec_queue_lookup: Lookup an xe_engine from guc_id */
 		struct xarray exec_queue_lookup;
 		/** @submission_state.guc_ids: used to allocate new guc_ids, single-lrc */
-- 
2.43.0

