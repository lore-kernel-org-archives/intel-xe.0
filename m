Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76703C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F6310E42D;
	Mon, 11 Dec 2023 10:17:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DD410E418
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289856; x=1733825856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1r2w2DVFTwNLDl3JZAL7W9gXLX1S8CUfMkaw8bRULDc=;
 b=PESzXX5mn7fVkUZDWav4hpA2CvedIKfW2+keQPG9nZT3pKrakxQA34cG
 gwJ6LMnsHFee5zQL2nPXfsO0VASjxQF+sHc4Gat8FKtk1KXQFrdEmPBF8
 UukdjN5CDO5IETXrBDeatkT2er/b9YnekIc2jPE6beIXHC/aw9Qi46Y/N
 JUgfz1JjVNjjFtyz3Xg/dxbFqN4FbTDu/tGvcT8D9lcfVWTrGkfx6atQr
 bwN/Ycws5cfHhUsnHKnxvT8CJfPlpzeExkl2v5MlR5chketC4CChco4TN
 uA9e97LBDJthdkvwZFhPK7aP9xZckVtGYagNIHXxj/N9IZpIkD3kllbWD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480816314"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="480816314"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766321890"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766321890"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/xe: Introduce GuC Doorbells Manager
Date: Mon, 11 Dec 2023 11:17:13 +0100
Message-Id: <20231211101719.1659-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211101719.1659-1-michal.wajdeczko@intel.com>
References: <20231211101719.1659-1-michal.wajdeczko@intel.com>
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
Cc: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GFX doorbell solution provides a mechanism for submission of
workload to the graphics hardware by a ring3 application without
the penalty of ring transition for each workload submission.

This feature is not currently used by the Linux drivers, but in
SR-IOV mode the doorbells are treated as shared resource and the
PF driver must be able to provision exclusive range of doorbells
IDs across all enabled VFs.

Introduce simple GuC doorbell ID manager that will be used by the
PF driver for VFs provisioning and can later be used by submission
code once we are ready to switch from H2G based notifications to
doorbells mechanism.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

---
v2: fix renames, lock in fini
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_guc_db_mgr.c | 257 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h |  22 +++
 drivers/gpu/drm/xe/xe_guc_types.h  |  15 ++
 drivers/gpu/drm/xe/xe_uc.c         |   5 +
 5 files changed, 300 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f4ae063a7005..0c2e247dc188 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
 	xe_guc.o \
 	xe_guc_ads.o \
 	xe_guc_ct.o \
+	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
 	xe_guc_hwconfig.o \
 	xe_guc_log.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
new file mode 100644
index 000000000000..15816f90e960
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "regs/xe_guc_regs.h"
+
+#include "xe_assert.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_db_mgr.h"
+#include "xe_guc_types.h"
+
+/**
+ * DOC: GuC Doorbells
+ *
+ * The GFX doorbell solution provides a mechanism for submission of workload
+ * to the graphics hardware by a ring3 application without the penalty of
+ * ring transition for each workload submission.
+ *
+ * In SR-IOV mode, the doorbells are treated as shared resource and PF must
+ * be able to provision exclusive range of IDs across VFs, which may want to
+ * use this feature.
+ */
+
+static struct xe_guc *dbm_to_guc(struct xe_guc_db_mgr *dbm)
+{
+	return container_of(dbm, struct xe_guc, dbm);
+}
+
+static struct xe_gt *dbm_to_gt(struct xe_guc_db_mgr *dbm)
+{
+	return guc_to_gt(dbm_to_guc(dbm));
+}
+
+static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
+{
+	return gt_to_xe(dbm_to_gt(dbm));
+}
+
+#define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
+#define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
+
+static void __fini_dbm(struct drm_device *drm, void *arg)
+{
+	struct xe_guc_db_mgr *dbm = arg;
+	unsigned int weight;
+
+	mutex_lock(dbm_mutex(dbm));
+
+	weight = bitmap_weight(dbm->bitmap, dbm->count);
+	if (weight) {
+		struct drm_printer p = xe_gt_info_printer(dbm_to_gt(dbm));
+
+		xe_gt_err(dbm_to_gt(dbm), "GuC doorbells manager unclean (%u/%u)\n",
+			  weight, dbm->count);
+		xe_guc_db_mgr_print(dbm, &p, 1);
+	}
+
+	bitmap_free(dbm->bitmap);
+	dbm->bitmap = NULL;
+	dbm->count = 0;
+
+	mutex_unlock(dbm_mutex(dbm));
+}
+
+/**
+ * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
+ * @dbm: the &xe_guc_db_mgr to initialize
+ * @count: number of doorbells to manage
+ *
+ * The bare-metal or PF driver can pass ~0 as &count to indicate that all
+ * doorbells supported by the hardware are available for use.
+ *
+ * Only VF's drivers will have to provide explicit number of doorbells IDs
+ * that they can use.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
+{
+	int ret;
+
+	if (count == ~0)
+		count = GUC_NUM_DOORBELLS;
+
+	dbm_assert(dbm, !dbm->bitmap);
+	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+
+	if (!count)
+		goto done;
+
+	dbm->bitmap = bitmap_zalloc(count, GFP_KERNEL);
+	if (!dbm->bitmap)
+		return -ENOMEM;
+	dbm->count = count;
+
+	ret = drmm_add_action_or_reset(&dbm_to_xe(dbm)->drm, __fini_dbm, dbm);
+	if (ret)
+		return ret;
+done:
+	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell(s)\n", dbm->count);
+	return 0;
+}
+
+static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
+				    unsigned int count, unsigned int spare)
+{
+	unsigned int used;
+	int index;
+
+	dbm_assert(dbm, count);
+	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	if (!dbm->count)
+		return -ENODATA;
+
+	if (spare) {
+		used = bitmap_weight(dbm->bitmap, dbm->count);
+		if (used + count + spare > dbm->count)
+			return -EDQUOT;
+	}
+
+	index = bitmap_find_next_zero_area(dbm->bitmap, dbm->count, 0, count, 0);
+	if (index >= dbm->count)
+		return -ENOSPC;
+
+	bitmap_set(dbm->bitmap, index, count);
+
+	return index;
+}
+
+static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
+				     unsigned int start, unsigned int count)
+{
+	dbm_assert(dbm, count);
+	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+	dbm_assert(dbm, dbm->count);
+	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		unsigned int n;
+
+		for (n = 0; n < count; n++)
+			dbm_assert(dbm, test_bit(start + n, dbm->bitmap));
+	}
+	bitmap_clear(dbm->bitmap, start, count);
+}
+
+/**
+ * xe_guc_db_mgr_reserve_id_locked() - Reserve a single GuC Doorbell ID.
+ * @dbm: the &xe_guc_db_mgr
+ *
+ * This function expects that submission lock is already taken.
+ *
+ * Return: ID of the allocated GuC doorbell or a negative error code on failure.
+ */
+int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm)
+{
+	return dbm_reserve_chunk_locked(dbm, 1, 0);
+}
+
+/**
+ * xe_guc_db_mgr_release_id_locked() - Release a single GuC Doorbell ID.
+ * @dbm: the &xe_guc_db_mgr
+ * @id: the GuC Doorbell ID to release
+ *
+ * This function expects that submission lock is already taken.
+ */
+void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id)
+{
+	return dbm_release_chunk_locked(dbm, id, 1);
+}
+
+/**
+ * xe_guc_db_mgr_reserve_range() - Reserve a range of GuC Doorbell IDs.
+ * @dbm: the &xe_guc_db_mgr
+ * @count: number of GuC doorbell IDs to reserve
+ * @spare: number of GuC doorbell IDs to keep available
+ *
+ * This function is dedicated for the for use by the PF which expects that
+ * allocated range for the VF will be contiguous and that there will be at
+ * least &spare IDs still available for the PF use after this reservation.
+ *
+ * Return: starting ID of the allocated GuC doorbell ID range or
+ *         a negative error code on failure.
+ */
+int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm,
+				unsigned int count, unsigned int spare)
+{
+	int ret;
+
+	mutex_lock(dbm_mutex(dbm));
+	ret = dbm_reserve_chunk_locked(dbm, count, spare);
+	mutex_unlock(dbm_mutex(dbm));
+
+	return ret;
+}
+
+/**
+ * xe_guc_db_mgr_release_range() - Release a range of Doorbell IDs.
+ * @dbm: the &xe_guc_db_mgr
+ * @start: the starting ID of GuC doorbell ID range to release
+ * @count: number of GuC doorbell IDs to release
+ */
+void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
+				 unsigned int start, unsigned int count)
+{
+	mutex_lock(dbm_mutex(dbm));
+	dbm_release_chunk_locked(dbm, start, count);
+	mutex_unlock(dbm_mutex(dbm));
+}
+
+/**
+ * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
+ * @dbm: the &xe_guc_db_mgr to print
+ * @p: the &drm_printer to print to
+ * @indent: tab indentation level
+ */
+void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
+			 struct drm_printer *p, int indent)
+{
+	unsigned int rs, re;
+	unsigned int total;
+
+	drm_printf_indent(p, indent, "count: %u\n", dbm->count);
+	if (!dbm->bitmap)
+		return;
+
+	mutex_lock(dbm_mutex(dbm));
+
+	total = 0;
+	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
+		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
+				  rs, re - 1, re - rs);
+		total += re - rs;
+	}
+	drm_printf_indent(p, indent, "available total: %u\n", total);
+
+	total = 0;
+	for_each_set_bitrange(rs, re, dbm->bitmap, dbm->count) {
+		drm_printf_indent(p, indent, "reserved range: %u..%u (%u)\n",
+				  rs, re - 1, re - rs);
+		total += re - rs;
+	}
+	drm_printf_indent(p, indent, "reserved total: %u\n", total);
+
+	mutex_unlock(dbm_mutex(dbm));
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
new file mode 100644
index 000000000000..c250fa0ca9d6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_DB_MGR_H_
+#define _XE_GUC_DB_MGR_H_
+
+struct drm_printer;
+struct xe_guc_db_mgr;
+
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
+
+int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
+void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
+
+int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm, unsigned int count, unsigned int spare);
+void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm, unsigned int start, unsigned int count);
+
+void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index cd80802e8918..16de203c62a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -17,6 +17,19 @@
 #include "xe_guc_pc_types.h"
 #include "xe_uc_fw_types.h"
 
+/**
+ * struct xe_guc_db_mgr - GuC Doorbells Manager.
+ *
+ * Note: GuC Doorbells Manager is relying on &xe_guc::submission_state.lock
+ * to protect its members.
+ */
+struct xe_guc_db_mgr {
+	/** @count: number of doorbells to manage */
+	unsigned int count;
+	/** @bitmap: bitmap to track allocated doorbells */
+	unsigned long *bitmap;
+};
+
 /**
  * struct xe_guc - Graphic micro controller
  */
@@ -31,6 +44,8 @@ struct xe_guc {
 	struct xe_guc_ct ct;
 	/** @pc: GuC Power Conservation */
 	struct xe_guc_pc pc;
+	/** @dbm: GuC Doorbell Manager */
+	struct xe_guc_db_mgr dbm;
 	/** @submission_state: GuC submission state */
 	struct {
 		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 25e1ddfd2f86..a7ede72f6a16 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -9,6 +9,7 @@
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_guc_db_mgr.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
@@ -56,6 +57,10 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
+	if (ret)
+		goto err;
+
 	ret = xe_guc_submit_init(&uc->guc);
 	if (ret)
 		goto err;
-- 
2.25.1

