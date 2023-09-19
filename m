Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D86FCE79AE
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3104A10E294;
	Tue, 19 Sep 2023 16:16:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B910E143
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140179; x=1726676179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kdbqUCAtI5AgYBdQmlhXQbX8IsRoDSuTfbt19yoR4c4=;
 b=QyHukW0GNXez2HAFDWJBV9WaOgwKtV1UP4Ik2QWmzdstdcsSr3utmMN7
 hJ+v3/nTM04BQCrftx4Lxge5EGkCkRy/i4XED+LWsqlZ3uDnvP+MS+sZs
 ZQt2trbjutVVkL1ffDnhKmL7/Lr6KRLaR6g+lp9e/Ohcopy3EpjMQMy3/
 Et2ZMPgExi8rj6aBxhyJmGcI67jn+vD+iIVm2SbsA/0Hf0CW36R+Y2695
 x0o/OyMra0PqHLZNPxwmXhXGHEU2RKzMFz0eO5bdPrCSFmKfo02i9bm0W
 tmBrU3z047Pp0L7DEjAGA1saHAeqovixtc9cyvcIZwMB7CVlRnE8d+XQ3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913534"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016511"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016511"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:32 -0700
Message-ID: <20230919161049.2307855-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/21] drm/xe/oa: Module init/exit and
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
 drivers/gpu/drm/xe/xe_oa.c              | 309 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h              |  18 ++
 8 files changed, 354 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cc95a46b5e4d3..a40c4827b9c85 100644
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
index b6bcb6c3482e7..2c3dac6340f04 100644
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
 
 	xe_pmu_register(&xe->pmu);
@@ -363,10 +370,14 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_oa_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
 
+	xe_oa_fini(xe);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a01..8161407913607 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,6 +17,7 @@
 #include "xe_platform_types.h"
 #include "xe_pmu.h"
 #include "xe_step_types.h"
+#include "xe_oa.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
@@ -365,6 +366,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
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
index 7194595e7f312..5bf957b127f0f 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_pci.h"
 #include "xe_pmu.h"
 #include "xe_sched_job.h"
@@ -68,6 +69,10 @@ static const struct init_funcs init_funcs[] = {
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
index 0000000000000..fae067e73c027
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -0,0 +1,309 @@
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
+	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
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

