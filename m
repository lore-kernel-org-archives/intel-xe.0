Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EE1EEE25C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E100310EC4E;
	Thu, 12 Sep 2024 20:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTnmyOcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AF810EC4B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173516; x=1757709516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqZMtuKtNoVfmWR2Zrxr9j72puE2uGsJ81WaZTDymJ8=;
 b=gTnmyOcVwcLgYJD8tDCsA/2qDBwcghs9JPuCEN3dANQNxuouPvDLMQ2C
 RsQpLEmogVq4D55/46BCBpIN0hJmO0poPnXaMBZ6f7XFl5nfWtPw1uOTk
 Lnv9E66Q8+Qc0n0nEU9u5e1CXediibFeEaog+uLmmPviB7SPGHJaGlO95
 1FdKJoGkEaf9/Yu+m/9g2YesxvNQ+e0voKgQJGo9dda6SJ2q4mBXRaz9V
 Q5Jjr8STsbkGQDOpPMertYbeNILWJZrtCorufVydjj7dgTbn57us18Mel
 t11RMWyqWAzfKUleDi28lz0HKHn1C09XyBUJAIDLYNHV62aJuKD6E9tBd g==;
X-CSE-ConnectionGUID: K/pWofBZSJCSwuumrRC53A==
X-CSE-MsgGUID: 2K2HC8JxTSe/KKwLXEcSUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725117"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:36 -0700
X-CSE-ConnectionGUID: LbpeSTznT4W3XlIwrvDuBA==
X-CSE-MsgGUID: ZmO9PNhIRO+e1gbhb0y4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126785"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 3/6] drm/xe/pf: Add functions to save and restore VF GuC state
Date: Thu, 12 Sep 2024 22:38:14 +0200
Message-Id: <20240912203817.1880-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

To successfully migrate a VM with attached GPU VF we also need to
migrate VF's GuC state. Add necessary functions that interacts with
GuC to save and restore a VF GuC state. We will start using them in
upcoming patches.

Since VF migration requires many more changes in the driver, enable
those functions only under debug config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 334 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  17 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  40 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   6 +
 6 files changed, 400 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index edfd812e0f41..8f1c5c329f79 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -129,6 +129,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf.o \
 	xe_gt_sriov_pf_config.o \
 	xe_gt_sriov_pf_control.o \
+	xe_gt_sriov_pf_migration.o \
 	xe_gt_sriov_pf_monitor.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_gt_sriov_pf_service.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 065a9878f8e9..e71fc3d2bda2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_mmio.h"
 
@@ -89,6 +90,7 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 		pf_enable_ggtt_guest_update(gt);
 
 	xe_gt_sriov_pf_service_update(gt);
+	xe_gt_sriov_pf_migration_init(gt);
 }
 
 static u32 pf_get_vf_regs_stride(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
new file mode 100644
index 000000000000..8815fbde00cc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "abi/guc_actions_sriov_abi.h"
+#include "xe_bo.h"
+#include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_migration.h"
+#include "xe_gt_sriov_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+#include "xe_sriov.h"
+
+/* Return: number of dwords saved/restored/required or a negative error code on failure */
+static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
+				      u64 addr, u32 ndwords)
+{
+	u32 request[PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_PF2GUC_SAVE_RESTORE_VF) |
+		FIELD_PREP(PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_0_OPCODE, opcode),
+		FIELD_PREP(PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_1_VFID, vfid),
+		FIELD_PREP(PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_2_ADDR_LO, lower_32_bits(addr)),
+		FIELD_PREP(PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_3_ADDR_HI, upper_32_bits(addr)),
+		FIELD_PREP(PF2GUC_SAVE_RESTORE_VF_REQUEST_MSG_4_SIZE, ndwords),
+	};
+
+	return xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
+}
+
+/* Return: size of the state in dwords or a negative error code on failure */
+static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	ret = guc_action_vf_save_restore(&gt->uc.guc, vfid, GUC_PF_OPCODE_VF_SAVE, 0, 0);
+	return ret ?: -ENODATA;
+}
+
+/* Return: number of state dwords saved or a negative error code on failure */
+static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
+				     void *buff, size_t size)
+{
+	const int ndwords = size / sizeof(u32);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_bo *bo;
+	int ret;
+
+	xe_gt_assert(gt, size % sizeof(u32) == 0);
+	xe_gt_assert(gt, size == ndwords * sizeof(u32));
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL,
+				  ALIGN(size, PAGE_SIZE),
+				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT |
+				  XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
+					 xe_bo_ggtt_addr(bo), ndwords);
+	if (!ret)
+		ret = -ENODATA;
+	else if (ret > ndwords)
+		ret = -EPROTO;
+	else if (ret > 0)
+		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
+
+	xe_bo_unpin_map_no_vm(bo);
+	return ret;
+}
+
+/* Return: number of state dwords restored or a negative error code on failure */
+static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
+					const void *buff, size_t size)
+{
+	const int ndwords = size / sizeof(u32);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_bo *bo;
+	int ret;
+
+	xe_gt_assert(gt, size % sizeof(u32) == 0);
+	xe_gt_assert(gt, size == ndwords * sizeof(u32));
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL,
+				  ALIGN(size, PAGE_SIZE),
+				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT |
+				  XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
+
+	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
+					 xe_bo_ggtt_addr(bo), ndwords);
+	if (!ret)
+		ret = -ENODATA;
+	else if (ret > ndwords)
+		ret = -EPROTO;
+
+	xe_bo_unpin_map_no_vm(bo);
+	return ret;
+}
+
+static bool pf_migration_supported(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	return gt->sriov.pf.migration.supported;
+}
+
+static struct mutex *pf_migration_mutex(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	return &gt->sriov.pf.migration.snapshot_lock;
+}
+
+static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
+							      unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	lockdep_assert_held(pf_migration_mutex(gt));
+
+	return &gt->sriov.pf.vfs[vfid].snapshot;
+}
+
+static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
+{
+	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
+}
+
+static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	drmm_kfree(&xe->drm, snapshot->guc.buff);
+	snapshot->guc.buff = NULL;
+	snapshot->guc.size = 0;
+}
+
+static int pf_alloc_guc_state(struct xe_gt *gt,
+			      struct xe_gt_sriov_state_snapshot *snapshot,
+			      size_t size)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	void *p;
+
+	pf_free_guc_state(gt, snapshot);
+
+	if (!size)
+		return -ENODATA;
+
+	if (size % sizeof(u32))
+		return -EINVAL;
+
+	if (size > SZ_2M)
+		return -EFBIG;
+
+	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	snapshot->guc.buff = p;
+	snapshot->guc.size = size;
+	return 0;
+}
+
+static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		unsigned int vfid = pf_snapshot_index(gt, snapshot);
+
+		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
+					vfid, snapshot->guc.size / sizeof(u32));
+		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
+				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
+	}
+}
+
+static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	size_t size;
+	int ret;
+
+	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	if (ret < 0)
+		goto fail;
+	size = ret * sizeof(u32);
+	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
+
+	ret = pf_alloc_guc_state(gt, snapshot, size);
+	if (ret < 0)
+		goto fail;
+
+	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	if (ret < 0)
+		goto fail;
+	size = ret * sizeof(u32);
+	xe_gt_assert(gt, size);
+	xe_gt_assert(gt, size <= snapshot->guc.size);
+	snapshot->guc.size = size;
+
+	pf_dump_guc_state(gt, snapshot);
+	return 0;
+
+fail:
+	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
+	pf_free_guc_state(gt, snapshot);
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+{
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	mutex_lock(pf_migration_mutex(gt));
+	err = pf_save_vf_guc_state(gt, vfid);
+	mutex_unlock(pf_migration_mutex(gt));
+
+	return err;
+}
+
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	int ret;
+
+	if (!snapshot->guc.size)
+		return -ENODATA;
+
+	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
+				snapshot->guc.size / sizeof(u32), vfid);
+	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
+	if (ret < 0)
+		goto fail;
+
+	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
+	return 0;
+
+fail:
+	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	mutex_lock(pf_migration_mutex(gt));
+	ret = pf_restore_vf_guc_state(gt, vfid);
+	mutex_unlock(pf_migration_mutex(gt));
+
+	return ret;
+}
+
+static bool pf_check_migration_support(struct xe_gt *gt)
+{
+	/* GuC 70.25 with save/restore v2 is required */
+	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
+
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
+ * @gt: the &xe_gt
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
+
+	if (!pf_migration_supported(gt))
+		return 0;
+
+	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
new file mode 100644
index 000000000000..6643d730a9ab
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_MIGRATION_H_
+#define _XE_GT_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+
+int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
+int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
new file mode 100644
index 000000000000..1f3110b6d44f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
+ *
+ * Used by the PF driver to maintain per-VF migration data.
+ */
+struct xe_gt_sriov_state_snapshot {
+	/** @guc: GuC VF state snapshot */
+	struct {
+		/** @guc.buff: buffer with the VF state */
+		u32 *buff;
+		/** @guc.size: size of the buffer (must be dwords aligned) */
+		u32 size;
+	} guc;
+};
+
+/**
+ * struct xe_gt_sriov_pf_migration - GT-level data.
+ *
+ * Used by the PF driver to maintain non-VF specific per-GT data.
+ */
+struct xe_gt_sriov_pf_migration {
+	/** @supported: indicates whether the feature is supported */
+	bool supported;
+
+	/** @snapshot_lock: protects all VFs snapshots */
+	struct mutex snapshot_lock;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 28e1b130bf87..0426b1a77069 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -10,6 +10,7 @@
 
 #include "xe_gt_sriov_pf_config_types.h"
 #include "xe_gt_sriov_pf_control_types.h"
+#include "xe_gt_sriov_pf_migration_types.h"
 #include "xe_gt_sriov_pf_monitor_types.h"
 #include "xe_gt_sriov_pf_policy_types.h"
 #include "xe_gt_sriov_pf_service_types.h"
@@ -29,6 +30,9 @@ struct xe_gt_sriov_metadata {
 
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
+
+	/** @snapshot: snapshot of the VF state data */
+	struct xe_gt_sriov_state_snapshot snapshot;
 };
 
 /**
@@ -36,6 +40,7 @@ struct xe_gt_sriov_metadata {
  * @service: service data.
  * @control: control data.
  * @policy: policy data.
+ * @migration: migration data.
  * @spare: PF-only provisioning configuration.
  * @vfs: metadata for all VFs.
  */
@@ -43,6 +48,7 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
+	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.43.0

