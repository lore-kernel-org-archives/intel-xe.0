Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746DE6FE2B
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 18:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA3010E2C0;
	Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gF4iA5UM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD7E10E2B7
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766515189; x=1798051189;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gzaTDb4z7gefXHkNnb9hKhfoOdcgofAlvKVKKooaH2o=;
 b=gF4iA5UMV+Eo38q04MjoxuErr9Jw8HhDjRQyyQAdngxjPgRxtI9d/ZSc
 XQOVGO0Am3RXbzZl59f0fKWBs/VtblIpAWs22pAxccKW9BCdDWnA14yl2
 ecTXwT+6Xnu5CFbEakHAabhei/9vBllgTI19cL3QNj/ircOscRAPXZkq1
 xw8XRyf0kkekd6wEuphGGA4y3koHwlU5MBX438IVCGKDYHuANg+vgQ68J
 MDSvOeEhkfHB5O5g/+KybxdHVhmqha58Qc8PDvoXFOU7xarXC3HhMbGIU
 YPSfMBLi/UGcvBPm9ay6p7/rRG6uMDTvxsCzIrP9HGPHF8sNiJ/5GJ5nX Q==;
X-CSE-ConnectionGUID: 1TqzLbaGRxCZD9Ew/Db7PQ==
X-CSE-MsgGUID: gQ0yCeDPQwSOdsiRIR1LYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93839537"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="93839537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
X-CSE-ConnectionGUID: 7M8oVb6zSiO5TfPuRFI4/g==
X-CSE-MsgGUID: XCkDZSpFTSKfvDoeT4TvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199079223"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 2/3] drm/xe/soc_remapper: Use SoC remapper helper from VSEC
 code
Date: Tue, 23 Dec 2025 10:39:46 -0800
Message-ID: <20251223183943.3175941-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
References: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Since different drivers can use SoC remapper, modify VSEC code to
access SoC remapper via a helper that would synchronize such accesses.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2: (Lucas)
- retain comment
- s/BITS/MASK/

v3: (Michal)
- Use scope based locks
- Add kernel doc for functions

v4: (Badal)
- Prevent bad accesses to SoC remapper
- Enable soc remapper for BMG

v5: Drop has_soc_remapper check (Badal)
v6: (Shuicheng)
- s/herlper/helper
- Handle xe_pm_runtime_put on error
---
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 ---
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  5 +++++
 drivers/gpu/drm/xe/xe_pci.c                   |  3 +++
 drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 20 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vsec.c                  |  6 ++++--
 7 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 0f79c0714454..240d57993ea6 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -18,9 +18,6 @@
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
-#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
-#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
-
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
new file mode 100644
index 000000000000..9edf234227a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_SOC_REMAPPER_REGS_H_
+#define _XE_SOC_REMAPPER_REGS_H_
+
+#include "xe_regs.h"
+
+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
+#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 69570e21c16b..e292c6ebd4cb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -334,6 +334,8 @@ struct xe_device {
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
+		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
@@ -582,6 +584,9 @@ struct xe_device {
 	struct {
 		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
 		spinlock_t lock;
+
+		/** @soc_remapper.set_telem_region: Set telemetry index */
+		void (*set_telem_region)(struct xe_device *xe, u32 index);
 	} soc_remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 18d4e6b5c319..55daa1b5f383 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -370,6 +370,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_i2c = true,
 	.has_late_bind = true,
 	.has_pre_prod_wa = 1,
+	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
@@ -421,6 +422,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_mbx_power_limits = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
+	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -692,6 +694,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
 	xe->info.has_pxp = desc->has_pxp;
+	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 3bb51d155951..e2bd4c81b2a7 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -53,6 +53,7 @@ struct xe_device_desc {
 	u8 has_pre_prod_wa:1;
 	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
+	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index f2cc1f5b334a..9fd084f76c6b 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -3,8 +3,23 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "regs/xe_soc_remapper_regs.h"
+#include "xe_mmio.h"
 #include "xe_soc_remapper.h"
 
+static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
+				       u32 mask, u32 val)
+{
+	guard(spinlock_irqsave)(&xe->soc_remapper.lock);
+	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+}
+
+static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
+{
+	xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
+				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
+}
+
 /**
  * xe_soc_remapper_init() - Initialize SoC remapper
  * @xe: Pointer to xe device.
@@ -15,7 +30,10 @@
  */
 int xe_soc_remapper_init(struct xe_device *xe)
 {
-	spin_lock_init(&xe->soc_remapper.lock);
+	if (xe->info.has_soc_remapper_telem) {
+		spin_lock_init(&xe->soc_remapper.lock);
+		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8f23a27871b6..c83ea3d48fae 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -158,13 +158,15 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 
 	guard(mutex)(&xe->pmt.lock);
 
+	if (!xe->soc_remapper.set_telem_region)
+		return -ENODEV;
+
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
 	/* set SoC re-mapper index register based on GUID memory region */
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
+	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
-- 
2.43.0

