Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E18CF9C72
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 20:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23EE10E741;
	Tue, 24 Sep 2024 20:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYCsCNlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEEA10E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727209557; x=1758745557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0O/513QAlC1Q4RhTKy39MNuDR/N7rcQpoYRDkEziemw=;
 b=VYCsCNlMpISY3bIOR3CgRnsKEj4L8IHxfh4256VB0DVQICCACoUBpL6m
 NN0KcYR5/pJlyoi2HITnk1I+D1S2dqrMazZOGoCZxUyt92JobGcsmdUJA
 FWmNYMQCpruRqvujFWepH7FaOq2CXdzsITZn0u3Ck53ZDYgGqKZzsL9NI
 kzlsHXOkoRhK2TrsgESVnPlkLmeQaRe4D09Klh34wrRGBkVRBhqxLlvSH
 1WAz5bLu0HtHLQXhEsejLjWy9L7V/FOX8rwpzFuPIa7kBvmgpmZssZnmu
 Zq3o+BAiF4ntqxbkehTInUBajPIzQ53U/MsZhUVcYG7ZRgsDyigYZGtPR w==;
X-CSE-ConnectionGUID: MzLz3eqxS0+R8oKcei0Yug==
X-CSE-MsgGUID: 1EqdcaCoSlqDwuU6iLqJMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51647409"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="51647409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 13:25:57 -0700
X-CSE-ConnectionGUID: ZrosjuPZStK2Uu4I/r2Aag==
X-CSE-MsgGUID: uk8jCMUETdWtio/Q8SOVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76335584"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 24 Sep 2024 13:25:55 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/4] drm/xe/vf: React to MIGRATED interrupt
Date: Tue, 24 Sep 2024 22:25:50 +0200
Message-Id: <20240924202553.1541574-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924202553.1541574-1-tomasz.lis@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
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

To properly support VF Save/Restore procedure, fixups need to be
applied after PF driver finishes its part of VF Restore. Those
fixups are applied by the VF driver within a VM.

A VF driver gets informed that it was migrated by receiving an
interrupt from each GuC. That should be the trigger for fixups.

The VF can safely do post-migration fixups on resources associated
to each GuC only after that GuC issued the MIGRATED interrupt.

This change introduces a worker to be used for post-migration fixups,
and a mechanism to schedule said worker when all GuCs sent the irq.

v2: renamed and moved functions, updated logged messages, removed
  unused includes, used anon struct (mwajdeczko)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 11 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  2 +
 drivers/gpu/drm/xe/xe_guc.c          | 11 +++++
 drivers/gpu/drm/xe/xe_memirq.c       |  3 ++
 drivers/gpu/drm/xe/xe_sriov.c        |  4 ++
 drivers/gpu/drm/xe/xe_sriov_types.h  | 10 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h     | 14 ++++++
 10 files changed, 131 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8f1c5c329f79..1f07983bb865 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,7 @@ xe-y += \
 	xe_gt_sriov_vf.o \
 	xe_guc_relay.o \
 	xe_memirq.o \
+	xe_sriov_vf.o \
 	xe_sriov.o
 
 xe-$(CONFIG_PCI_IOV) += \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 484fb34dde98..07ff7554fc3e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -374,6 +374,8 @@ struct xe_device {
 
 		/** @sriov.pf: PF specific data */
 		struct xe_device_pf pf;
+		/** @sriov.vf: VF specific data */
+		struct xe_device_vf vf;
 
 		/** @sriov.wq: workqueue used by the virtualization workers */
 		struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d3baba50f085..489ace57c2a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -27,6 +27,7 @@
 #include "xe_guc_relay.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_vf.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -692,6 +693,16 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
 	return err;
 }
 
+void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
+	smp_mb__after_atomic();
+	xe_gt_sriov_info(gt, "VF migration recovery ready\n");
+	xe_sriov_vf_start_migration_recovery(xe);
+}
+
 static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
 {
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index e541ce57bec2..544e913b8465 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,6 +18,8 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 
+void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
+
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b6cd5e941f19..05aa93070e5a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1092,10 +1092,21 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
 	return guc_self_cfg(guc, key, 2, val);
 }
 
+static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		xe_gt_sriov_vf_migrated_event_handler(gt);
+}
+
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
 	if (iir & GUC_INTR_GUC2HOST)
 		xe_guc_ct_irq_handler(&guc->ct);
+
+	if (iir & GUC_INTR_SW_INT_0)
+		xe_guc_sw_0_irq_handler(guc);
 }
 
 void xe_guc_sanitize(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3f8d4ca64302..2d2f40378942 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -435,6 +435,9 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 
 	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
+
+	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
+		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 69a066ef20c0..2f4c3ae24f6e 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -12,6 +12,7 @@
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_vf.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -112,6 +113,9 @@ int xe_sriov_init(struct xe_device *xe)
 			return err;
 	}
 
+	if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_init_early(xe);
+
 	xe_assert(xe, !xe->sriov.wq);
 	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
 	if (!xe->sriov.wq)
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index c7b7ad4af5c8..8c518e68d33a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -56,4 +56,14 @@ struct xe_device_pf {
 	struct mutex master_lock;
 };
 
+struct xe_device_vf {
+	/** @migration: VF Migration state data */
+	struct {
+		/** @migration.worker: VF migration recovery worker */
+		struct work_struct worker;
+		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
+		unsigned long gt_flags;
+	} migration;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
new file mode 100644
index 000000000000..0e332bb215fd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_sriov.h"
+#include "xe_sriov_vf.h"
+#include "xe_sriov_printk.h"
+
+static void migration_worker_func(struct work_struct *w);
+
+/**
+ * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
+ * @xe: the &xe_device to initialize
+ */
+void xe_sriov_vf_init_early(struct xe_device *xe)
+{
+	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
+}
+
+static void vf_post_migration_recovery(struct xe_device *xe)
+{
+	drm_dbg(&xe->drm, "migration recovery in progress\n");
+	/* FIXME: add the recovery steps */
+	drm_notice(&xe->drm, "migration recovery ended\n");
+}
+
+static void migration_worker_func(struct work_struct *w)
+{
+	struct xe_device *xe = container_of(w, struct xe_device,
+					    sriov.vf.migration.worker);
+
+	vf_post_migration_recovery(xe);
+}
+
+static bool vf_ready_to_recovery_on_all_tiles(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id) {
+		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags))
+			return false;
+	}
+	return true;
+}
+
+/**
+ * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
+ * @xe: the &xe_device to start recovery on
+ *
+ * This function shall be called only by VF.
+ */
+void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
+{
+	bool started;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	if (!vf_ready_to_recovery_on_all_tiles(xe))
+		return;
+
+	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
+	smp_mb();
+
+	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
+	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
+		 "scheduled" : "already in progress");
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
new file mode 100644
index 000000000000..7b8622cff2b7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_H_
+#define _XE_SRIOV_VF_H_
+
+struct xe_device;
+
+void xe_sriov_vf_init_early(struct xe_device *xe);
+void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
+
+#endif
-- 
2.25.1

