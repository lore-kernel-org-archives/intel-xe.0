Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44668CF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 22:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F5110E873;
	Fri, 20 Sep 2024 22:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQ9507mS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E719710E873
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726871370; x=1758407370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFiEFtBAZE0AxMZzUYC585Xnd7vavzgJTfASlw3l4x4=;
 b=VQ9507mSOBPZW1mXUCjOgsRdlUv/R+p4sGHbx8WKc8xFt2CKFeqFTNqR
 Tj7hVCbQ5fzxmYPzkgnWvbBO2dQUKbjerETKMNwqyr4Mm5HS150OUlMO9
 vEuw0U2Mrzr/xXpSMOa2tW4AS15h7/I+18TIiBIEhWK/6ldk+hUdakfWp
 xGARRXHqp+SlM7AayMPW1yrkRM0zWPqHg+jldkodbHqCBVJhFFSre9Y9w
 JKfl+gketE2T4j0kt7c3r1LkgvJafS26DJVbtXJOfXWXuJfmJ3m8UJrvi
 pQuWrPIN+cbryRk2UjrpFizSWO2vKiSNHcV+x8aS5tyJXf2JV5Gfgk0Cv w==;
X-CSE-ConnectionGUID: wdHp7blaTpm31ghJVYzczw==
X-CSE-MsgGUID: 7ry2OJ4DRwShf9gdoaSAQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13616065"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="13616065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 15:29:30 -0700
X-CSE-ConnectionGUID: xgxboZnPRsSpC1xo381FLg==
X-CSE-MsgGUID: dZlpI+41QHyoUU7PRv4PQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70328092"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 15:29:28 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe/vf: React to MIGRATED interrupt
Date: Sat, 21 Sep 2024 00:29:23 +0200
Message-Id: <20240920222926.846985-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920222926.846985-1-tomasz.lis@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c          |  3 +
 drivers/gpu/drm/xe/xe_memirq.c       |  3 +
 drivers/gpu/drm/xe/xe_sriov.c        | 15 +++++
 drivers/gpu/drm/xe/xe_sriov.h        |  1 +
 drivers/gpu/drm/xe/xe_sriov_types.h  |  6 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 82 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h     | 17 ++++++
 9 files changed, 129 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ae245fbd91ee..aa06644dffd5 100644
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
index 5ad96d283a71..331b55b457ab 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -374,6 +374,7 @@ struct xe_device {
 
 		/** @sriov.pf: PF specific data */
 		struct xe_device_pf pf;
+		struct xe_device_vf vf;
 
 		/** @sriov.wq: workqueue used by the virtualization workers */
 		struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b6cd5e941f19..65cfd6bd68f1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1096,6 +1096,9 @@ void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
 	if (iir & GUC_INTR_GUC2HOST)
 		xe_guc_ct_irq_handler(&guc->ct);
+
+	if (iir & GUC_INTR_SW_INT_0)
+		xe_sriov_migrated_event_handler(guc);
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
index 69a066ef20c0..7447d85104e5 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -9,9 +9,11 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_guc.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_vf.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -112,6 +114,9 @@ int xe_sriov_init(struct xe_device *xe)
 			return err;
 	}
 
+	if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_init_early(xe);
+
 	xe_assert(xe, !xe->sriov.wq);
 	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
 	if (!xe->sriov.wq)
@@ -150,3 +155,13 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 		strscpy(buf, "PF", size);
 	return buf;
 }
+
+int xe_sriov_migrated_event_handler(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (!IS_SRIOV_VF(gt_to_xe(gt)))
+		return 0;
+
+	return xe_sriov_vf_migrated_event_handler(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 688fbabf08f1..f7575177b75a 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -13,6 +13,7 @@
 struct drm_printer;
 
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
+int xe_sriov_migrated_event_handler(struct xe_guc *guc);
 const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 
 void xe_sriov_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index c7b7ad4af5c8..a0b590bc7ffa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -56,4 +56,10 @@ struct xe_device_pf {
 	struct mutex master_lock;
 };
 
+struct xe_device_vf {
+	/** @migration_worker: migration recovery worker */
+	struct work_struct migration_worker;
+	unsigned long migration_gt_flags;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
new file mode 100644
index 000000000000..b068c57b2bdc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_guc_ct.h"
+#include "xe_module.h"
+#include "xe_sriov.h"
+#include "xe_sriov_vf.h"
+#include "xe_sriov_printk.h"
+
+static void migration_worker_func(struct work_struct *w);
+
+void xe_sriov_vf_init_early(struct xe_device *xe)
+{
+	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
+}
+
+static void vf_post_migration_recovery(struct xe_device *xe)
+{
+	drm_dbg(&xe->drm, "migration recovery in progress\n");
+	/* FIXME: add the recovery steps */
+	drm_notice(&xe->drm, "migration recovery completed\n");
+}
+
+static void migration_worker_func(struct work_struct *w)
+{
+	struct xe_device *xe = container_of(w, struct xe_device,
+						     sriov.vf.migration_worker);
+
+	vf_post_migration_recovery(xe);
+}
+
+/**
+ * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
+ * @xe: the &xe_device to start recovery on
+ *
+ * This function shall be called only by VF.
+ */
+static void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
+{
+	bool started;
+
+	XE_WARN_ON(!IS_SRIOV_VF(xe));
+
+	WRITE_ONCE(xe->sriov.vf.migration_gt_flags, 0);
+	smp_mb();
+
+	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration_worker);
+	dev_info(xe->drm.dev, "VF migration recovery %s\n", started ?
+		 "scheduled" : "already in progress");
+}
+
+static bool vf_ready_to_recovery_on_all_tiles(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id) {
+		if (!test_bit(id, &xe->sriov.vf.migration_gt_flags))
+			return false;
+	}
+	return true;
+}
+
+int xe_sriov_vf_migrated_event_handler(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	set_bit(gt->info.id, &xe->sriov.vf.migration_gt_flags);
+	smp_mb__after_atomic();
+	dev_info(xe->drm.dev, "VF migration recovery ready on gt%d\n",
+		 gt->info.id);
+	if (vf_ready_to_recovery_on_all_tiles(xe))
+		xe_sriov_vf_start_migration_recovery(xe);
+
+	return -EREMOTEIO;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
new file mode 100644
index 000000000000..d70cd84747e5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_H_
+#define _XE_SRIOV_VF_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_gt;
+
+void xe_sriov_vf_init_early(struct xe_device *xe);
+int xe_sriov_vf_migrated_event_handler(struct xe_gt *gt);
+
+#endif
-- 
2.25.1

