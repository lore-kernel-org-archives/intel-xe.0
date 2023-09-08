Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC0BEE57C1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59A10E861;
	Fri,  8 Sep 2023 04:23:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B89110E867
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQK0U/H/u3ohUhX3L96+gciEm8OW6JE9++bT2oIGvsQ=;
 b=nIlvdpqDsF+rYTbLA9zrm8FLtGFcwl5dh9zJJa1WAiKm142k3mLPfdw8
 DzkVZbTV/dPGVltYIfsRG/1SJq7FLYVu3aQ6vDSHtE9sG5mwpeUd1fZis
 SZC4YgP1fty/Ilrl3V0XP45KOPoVAdMbKH+HEepJPF3Umlc+MYqlzW3x5
 dHva4TuhiCeQFNdFTlx/5V6W2kOGvcBKn3tRRIAsZh8mSgl9hb6D5gygQ
 6Ak6TRNBhwT4synEz5KepxXZflMbP8Df/GsvDiE3MDuB2XjLw5K0NMM9w
 yCVSVhnrLEpEYTfPLK3HUCU6+nLvyrt9CjC1THY4PJHikHpAUmvJKw9pC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935389"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200716"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200716"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:35 -0700
Message-ID: <20230908042348.1592535-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/17] drm/xe/oa: Module init/exit and
 probe/remove
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

Perform OA initialization at module init and probe time:

* Setup perf_stream_paranoid and oa_max_sample_rate files in /proc
* Setup metrics sysfs directories to expose which metrics configurations
  are available
* Setup OA groups which associate hw engines with OA units
* Initialize OA units

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_device.c          |  11 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_module.c          |   5 +
 drivers/gpu/drm/xe/xe_oa.c              | 310 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h              |  18 ++
 8 files changed, 355 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9d2311f8141f1..c01b4cab84746 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_oa.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 109aeb25d19c2..727bd354079d6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,6 +25,7 @@
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
@@ -323,6 +324,10 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	err = xe_oa_init(xe);
+	if (err)
+		goto err_irq_shutdown;
+
 	err = xe_display_init(xe);
 	if (err)
 		goto err_irq_shutdown;
@@ -333,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_display_register(xe);
 
+	xe_oa_register(xe);
+
 	xe_debugfs_register(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
@@ -361,10 +368,14 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_oa_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_unlink(xe);
 
+	xe_oa_fini(xe);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 750e1f0d33398..2594664db3889 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
+#include "xe_oa.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
@@ -361,6 +362,9 @@ struct xe_device {
 	 */
 	struct task_struct *pm_callback_task;
 
+	/** @oa: oa perf counter subsystem */
+	struct xe_oa oa;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7c..dc700198f33f7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -13,6 +13,7 @@
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
+#include "xe_oa.h"
 
 struct xe_exec_queue_ops;
 struct xe_migrate;
@@ -347,6 +348,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @oa: oa perf counter subsystem per gt info */
+	struct xe_oa_gt oa;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index cd4bc1412a3ff..c38674c827c91 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -146,6 +146,8 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 	/** @eclass: pointer to per hw engine class interface */
 	struct xe_hw_engine_class_intf *eclass;
+	/** @oa_group: oa unit for this hw engine */
+	struct xe_oa_group *oa_group;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index de85494e2280b..460e8161c6f21 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
@@ -53,6 +54,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_register_pci_driver,
 		.exit = xe_unregister_pci_driver,
 	},
+	{
+		.init = xe_oa_sysctl_register,
+		.exit = xe_oa_sysctl_unregister,
+	},
 };
 
 static int __init xe_init(void)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
new file mode 100644
index 0000000000000..d44ef611c76eb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/nospec.h>
+#include <linux/sizes.h>
+#include <linux/uuid.h>
+
+#include <drm/xe_drm.h>
+#include <drm/drm_drv.h>
+
+#include "regs/xe_oa_regs.h"
+#include "xe_gt.h"
+#include "xe_device.h"
+#include "xe_oa.h"
+
+static u32 xe_oa_stream_paranoid = true;
+static int xe_oa_sample_rate_hard_limit;
+static u32 xe_oa_max_sample_rate = 100000;
+
+static const struct xe_oa_format oa_formats[] = {
+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
+	[XE_OA_FORMAT_A12]			= { 0, 64 },
+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
+};
+
+static struct ctl_table_header *sysctl_header;
+
+void xe_oa_register(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	if (!oa->xe)
+		return;
+
+	oa->metrics_kobj = kobject_create_and_add("metrics",
+						  &xe->drm.primary->kdev->kobj);
+}
+
+void xe_oa_unregister(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	if (!oa->metrics_kobj)
+		return;
+
+	kobject_put(oa->metrics_kobj);
+	oa->metrics_kobj = NULL;
+}
+
+static u32 num_oa_groups_per_gt(struct xe_gt *gt)
+{
+	return 1;
+}
+
+static u32 __oam_engine_group(struct xe_hw_engine *hwe)
+{
+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
+		/*
+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
+		 * within the gt use the same OAM. All MTL SKUs list 1 SA MEDIA.
+		 */
+		drm_WARN_ON(&hwe->gt->tile->xe->drm,
+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
+
+		return OA_GROUP_OAM_SAMEDIA_0;
+	}
+
+	return OA_GROUP_INVALID;
+}
+
+static u32 __oa_engine_group(struct xe_hw_engine *hwe)
+{
+	switch (hwe->class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return OA_GROUP_OAG;
+
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return __oam_engine_group(hwe);
+
+	default:
+		return OA_GROUP_INVALID;
+	}
+}
+
+static struct xe_oa_regs __oam_regs(u32 base)
+{
+	return (struct xe_oa_regs) {
+		base,
+		GEN12_OAM_HEAD_POINTER(base),
+		GEN12_OAM_TAIL_POINTER(base),
+		GEN12_OAM_BUFFER(base),
+		GEN12_OAM_CONTEXT_CONTROL(base),
+		GEN12_OAM_CONTROL(base),
+		GEN12_OAM_DEBUG(base),
+		GEN12_OAM_STATUS(base),
+		GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT,
+	};
+}
+
+static struct xe_oa_regs __oag_regs(void)
+{
+	return (struct xe_oa_regs) {
+		0,
+		GEN12_OAG_OAHEADPTR,
+		GEN12_OAG_OATAILPTR,
+		GEN12_OAG_OABUFFER,
+		GEN12_OAG_OAGLBCTXCTRL,
+		GEN12_OAG_OACONTROL,
+		GEN12_OAG_OA_DEBUG,
+		GEN12_OAG_OASTATUS,
+		GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT,
+	};
+}
+
+static void xe_oa_init_groups(struct xe_gt *gt)
+{
+	const u32 mtl_oa_base[] = {
+		[OA_GROUP_OAM_SAMEDIA_0] = 0x393000,
+	};
+	int i, num_groups = gt->oa.num_oa_groups;
+
+	for (i = 0; i < num_groups; i++) {
+		struct xe_oa_group *g = &gt->oa.group[i];
+
+		/* Fused off engines can result in a group with num_engines == 0 */
+		if (g->num_engines == 0)
+			continue;
+
+		if (i == OA_GROUP_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
+			g->regs = __oag_regs();
+			g->type = TYPE_OAG;
+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
+			g->regs = __oam_regs(mtl_oa_base[i]);
+			g->type = TYPE_OAM;
+		}
+
+		/* Set oa_unit_ids now to ensure ids remain contiguous. */
+		g->oa_unit_id = gt->tile->xe->oa.oa_unit_ids++;
+	}
+}
+
+static int xe_oa_init_gt(struct xe_gt *gt)
+{
+	u32 num_groups = num_oa_groups_per_gt(gt);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_oa_group *g;
+
+	g = kcalloc(num_groups, sizeof(*g), GFP_KERNEL);
+	if (!g)
+		return -ENOMEM;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u32 index = __oa_engine_group(hwe);
+
+		hwe->oa_group = NULL;
+		if (index < num_groups) {
+			g[index].num_engines++;
+			hwe->oa_group = &g[index];
+		}
+	}
+
+	gt->oa.num_oa_groups = num_groups;
+	gt->oa.group = g;
+
+	xe_oa_init_groups(gt);
+
+	return 0;
+}
+
+static int xe_oa_init_engine_groups(struct xe_oa *oa)
+{
+	struct xe_gt *gt;
+	int i, ret;
+
+	for_each_gt(gt, oa->xe, i) {
+		ret = xe_oa_init_gt(gt);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
+{
+	__set_bit(format, oa->format_mask);
+}
+
+static void xe_oa_init_supported_formats(struct xe_oa *oa)
+{
+	switch (oa->xe->info.platform) {
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+		oa_format_add(oa, XE_OA_FORMAT_A12);
+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
+		break;
+
+	case XE_DG2:
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		break;
+
+	case XE_METEORLAKE:
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
+		break;
+
+	default:
+		drm_err(&oa->xe->drm, "Unknown platform\n");
+	}
+}
+
+int xe_oa_init(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+	struct xe_gt *gt;
+	int i, ret;
+
+	/* Support OA only with GuC submission and Gen12+ */
+	if (XE_WARN_ON(!xe_device_guc_submission_enabled(xe)) ||
+	    XE_WARN_ON(GRAPHICS_VER(xe) < 12))
+		return 0;
+
+	oa->xe = xe;
+	oa->oa_formats = oa_formats;
+
+	for_each_gt(gt, xe, i)
+		mutex_init(&gt->oa.lock);
+
+	/* Choose a representative limit */
+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.clock_freq / 2;
+
+	mutex_init(&oa->metrics_lock);
+	idr_init_base(&oa->metrics_idr, 1);
+
+	ret = xe_oa_init_engine_groups(oa);
+	if (ret) {
+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
+		return ret;
+	}
+
+	xe_oa_init_supported_formats(oa);
+
+	oa->xe = xe;
+	return 0;
+}
+
+void xe_oa_fini(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+	struct xe_gt *gt;
+	int i;
+
+	if (!oa->xe)
+		return;
+
+	for_each_gt(gt, xe, i)
+		kfree(gt->oa.group);
+
+	idr_destroy(&oa->metrics_idr);
+
+	oa->xe = NULL;
+}
+
+static struct ctl_table oa_ctl_table[] = {
+	{
+	 .procname = "perf_stream_paranoid",
+	 .data = &xe_oa_stream_paranoid,
+	 .maxlen = sizeof(xe_oa_stream_paranoid),
+	 .mode = 0644,
+	 .proc_handler = proc_dointvec_minmax,
+	 .extra1 = SYSCTL_ZERO,
+	 .extra2 = SYSCTL_ONE,
+	 },
+	{
+	 .procname = "oa_max_sample_rate",
+	 .data = &xe_oa_max_sample_rate,
+	 .maxlen = sizeof(xe_oa_max_sample_rate),
+	 .mode = 0644,
+	 .proc_handler = proc_dointvec_minmax,
+	 .extra1 = SYSCTL_ZERO,
+	 .extra2 = &xe_oa_sample_rate_hard_limit,
+	 },
+	{}
+};
+
+int xe_oa_sysctl_register(void)
+{
+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
+	return 0;
+}
+
+void xe_oa_sysctl_unregister(void)
+{
+	unregister_sysctl_table(sysctl_header);
+}
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
new file mode 100644
index 0000000000000..ba4ba80fd34cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_OA_H_
+#define _XE_OA_H_
+
+#include "xe_oa_types.h"
+
+int xe_oa_init(struct xe_device *xe);
+void xe_oa_fini(struct xe_device *xe);
+void xe_oa_register(struct xe_device *xe);
+void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_sysctl_register(void);
+void xe_oa_sysctl_unregister(void);
+
+#endif
-- 
2.41.0

