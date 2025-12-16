Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DB9D5B87C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 07:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FA410E5AA;
	Tue, 16 Dec 2025 07:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2+ogHOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A5010E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765870925; x=1797406925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vFa7fUPkK48J2b1VYReIiB660vFwQmOGfdjNCHWvui0=;
 b=H2+ogHOyFsM7xcvp//a7F6jadk/ZO6jhFfyNzSZnv3mqYlw52L6HKZEP
 55ps4O17yv0fGQeY+d5fp+gBDLrYcv7BPAhXnz2dgDDmNj640Dddg/YVJ
 65qRufJnDIkwGRGgZOBBC3Ku6lyNxgsbzFdjO6ocA3NH2fvhpiZVa/Jzd
 JzRJkv05940yu5CwdsD7U909UCVXZDp9DVBAu6QVd8O2HOIkWUnFJgypr
 0vowS3NXhAXWaENmbNzIm7XC5g0Yt0yVVhW+mBV239B9ACcQrk2QnliLU
 /o15zRLyFyikU6yZwVEW8aBgT4sF8DG0gqSzLy4W+jQjs7xzSD6Jdc3ri w==;
X-CSE-ConnectionGUID: 9p9k0kY3RTufWMD5A/pa1g==
X-CSE-MsgGUID: cDNEyXXgTFiAKlkz4iPxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78420940"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="78420940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:05 -0800
X-CSE-ConnectionGUID: ba9W7dwbSaiSTO5McIBLDw==
X-CSE-MsgGUID: sVgFFYmbR0a3ODex7I2t6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203050816"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 2/3] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
Date: Mon, 15 Dec 2025 23:42:02 -0800
Message-ID: <20251216074159.2788534-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 ---
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 13 +++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  5 ++++
 drivers/gpu/drm/xe/xe_pci.c                   |  3 +++
 drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 23 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vsec.c                  |  6 +++--
 7 files changed, 48 insertions(+), 6 deletions(-)
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
index 6da897b9f006..fc121b236dd9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -333,6 +333,8 @@ struct xe_device {
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
+		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
@@ -577,6 +579,9 @@ struct xe_device {
 	struct {
 		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
 		spinlock_t lock;
+
+		/** @soc_remapper.set_telem_region: Set telemetry index */
+		void (*set_telem_region)(struct xe_device *xe, u32 index);
 	} soc_remapper;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 673761c8623e..555a1c3b3841 100644
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
@@ -420,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_mbx_power_limits = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
+	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -691,6 +693,7 @@ static int xe_info_init_early(struct xe_device *xe,
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
index 8a6749918436..1baf5d38e4cd 100644
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
@@ -15,7 +30,13 @@
  */
 int xe_soc_remapper_init(struct xe_device *xe)
 {
-	spin_lock_init(&xe->soc_remapper.lock);
+	bool has_soc_remapper = xe->info.has_soc_remapper_telem;
+
+	if (has_soc_remapper)
+		spin_lock_init(&xe->soc_remapper.lock);
+
+	if (xe->info.has_soc_remapper_telem)
+		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8f23a27871b6..eded4330584c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -162,9 +162,11 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
+	if (!xe->soc_remapper.set_telem_region)
+		return -ENODEV;
+
 	/* set SoC re-mapper index register based on GUID memory region */
-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
+	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
-- 
2.43.0

