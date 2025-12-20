Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D26BE668AC
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 01:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A0A10E0A6;
	Sat, 20 Dec 2025 01:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA4TDOhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FEA10E057
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 01:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766195089; x=1797731089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOI2yd/FvGMxSle4jcLqYjCYjqrrRM6iP4eH1EJiMGA=;
 b=DA4TDOhfwZeHt682dY5IubGx3aqX6btTxacjbREp1pof1EtMesANyT3I
 e2luaiJIcJCLsQy1IJx6ALf/+hdDOsJPCRl8b7nZ8XZRO4zlPKBGWIYEA
 q5T8qhjbl/66U2Tl8uBw3d68pVfdqw1yIMpbPtDV6CdPpZMyE5H1ZQFSp
 Ncs/CG+W6/fQ2VvQJZpKKEOELCrW1qgvup6ir0NBemEH6KYM16B/AgR4g
 KadmafvWfkuMGIanIfo3jgkTi1A2Z7Zm+CJDT55kw21zX3tyYZR/p7KV4
 TmXpAAfrLO6HIqChG2YzR2iBQuUc6b7F187SRCaFf/Kb5KlmBWGg4sepD Q==;
X-CSE-ConnectionGUID: /CgiBoHARui7BPG7sQO+cQ==
X-CSE-MsgGUID: bzMB6NPcSpa086NGnaGO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79273652"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="79273652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:49 -0800
X-CSE-ConnectionGUID: +fgtSs6gQzeVUu1FHjEACg==
X-CSE-MsgGUID: w+7tJJ+ZT+a6aSUyaVFopQ==
X-ExtLoop1: 1
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v6 2/3] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
Date: Fri, 19 Dec 2025 17:44:45 -0800
Message-ID: <20251220014442.3076408-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
References: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
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
index 8a6749918436..eaf18d85279d 100644
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

