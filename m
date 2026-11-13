Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE00606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gAw318LS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25D410E04E;
	Fri, 13 Nov 2026 19:18:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2151410E04E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794597482; x=1826133482;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nEkcmKkode2tHBM+cr7jALZUQQI42FsWy15tyfCVRzg=;
 b=gAw318LSPxFzMclpgtinuyvWFqGZtUdzWQfqriNiMil+ulmmVDMLnuRu
 V8xvSuvEcD0gRpwtEbI/zB9EBCLAqEBCRh5Nz/J0lkctN9Zi5UPm/LYgW
 v0hGuBn7/Lc8SBFSQlJUNa2Vc1s0Ro8DaCXBetwt2XVUL3LI3Op8N/gOc
 m8D0E4mG8GiTeFlKh0R8goG7zEX8P2HmEet3ixtL2fmRgkS/5sz1YFQUC
 jKUxfSrkTk4D2fXf7JGjq0v93MPIvTlex00BUrDnaV9bq4XqPi9jCLlhX
 6S76C/vU7v/Cbc5LDDFNRIaCN00lw5DUyPFj0iqUfQWfaNC0QLo1StPUR w==;
X-CSE-ConnectionGUID: U9/G8LGgRmiFzDYX4T0Xuw==
X-CSE-MsgGUID: ugDMCskTQ82Allb8idmUxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3514441"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3514441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:17:50 -0800
X-CSE-ConnectionGUID: CtWLMrqnRnGO9HcXgKJGng==
X-CSE-MsgGUID: aBTaTmakQsCGX1Hq8bprBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8833163"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:17:50 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe/wopcm: Simplify GuC WOPCM programming
Date: Fri, 13 Nov 2026 19:17:40 +0000
Message-ID: <20261113191739.1447747-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting from PVC, the GuC WOPCM registers are programmed by BIOS/IFWI,
which is a trusted entity, so we don't really need to double-check the
programmed values; therefore, if we find the WOPCM registers already
locked we can just return early and keep going.
For legacy platform (which are not officially supported by the Xe
driver), we still need to do the math ourselves.
By switching to use the WOPCM size from the HW instead of using an
hardcoded value, we make it impossible for the programming to end up
incorrect when using the official binaries (because those are sized so
that they're guaranteed to fit), so in this case we can drop the layout
check as well. If a malicious user is using modified binaries, we'll
still catch the error and fail at either parse or load time.

Given these simplifications and the fact that the only user left for this
is the uC code, we can move the code in the xe_uc.c file. As part of
this, the wopcm re-programming post-reset/resume has been moved from
do_gt_restart to xe_uc_load_hw.
The documentation has also been dropped, both because it's wrong for
platforms officially supported by the Xe driver (the WOPCM is now shared
by root and media GTs and the GSC FW is also stored there) and because we
don't use the layout anymore so we don't really care.

v2: Don't check against the WOPCM size on VFs, rework WOPCM base and
size log to not look like base and end.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst       |   6 -
 drivers/gpu/drm/xe/Makefile                |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                 |   5 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   1 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |   1 -
 drivers/gpu/drm/xe/xe_guc.c                |  11 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c      |   1 -
 drivers/gpu/drm/xe/xe_uc.c                 | 131 +++++++++-
 drivers/gpu/drm/xe/xe_uc_types.h           |   3 -
 drivers/gpu/drm/xe/xe_wopcm.c              | 287 ---------------------
 drivers/gpu/drm/xe/xe_wopcm.h              |  16 --
 drivers/gpu/drm/xe/xe_wopcm_types.h        |  26 --
 12 files changed, 137 insertions(+), 354 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_wopcm.c
 delete mode 100644 drivers/gpu/drm/xe/xe_wopcm.h
 delete mode 100644 drivers/gpu/drm/xe/xe_wopcm_types.h

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index d3030d1c9a84..ed4dc12826f3 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -13,12 +13,6 @@ Firmware Layout
 .. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
    :doc: GSC-based Firmware Layout
 
-Write Once Protected Content Memory (WOPCM) Layout
-==================================================
-
-.. kernel-doc:: drivers/gpu/drm/xe/xe_wopcm.c
-   :doc: Write Once Protected Content Memory (WOPCM) Layout
-
 GuC CTB Blob
 ============
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0392ba58dd65..52f0d5dd5468 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -154,8 +154,7 @@ xe-y += xe_bb.o \
 	xe_vsec.o \
 	xe_wa.o \
 	xe_wait_user_fence.o \
-	xe_wedge.o \
-	xe_wopcm.o
+	xe_wedge.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o \
 			   xe_amc.o
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fe71cb011d3a..3d3b326b9e9e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -68,7 +68,6 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 #include "xe_wedge.h"
-#include "xe_wopcm.h"
 
 #define GRDOM_RESET_TIMEOUT_MS	5
 
@@ -863,10 +862,6 @@ static int do_gt_restart(struct xe_gt *gt)
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
-	err = xe_wopcm_init(&gt->uc.wopcm);
-	if (err)
-		return err;
-
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_enable_ring(hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index cca2f837e90b..cae6322fb9a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,7 +33,6 @@
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
-#include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2a5f2064ad3e..60f1b29358f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -38,7 +38,6 @@
 #include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wedge.h"
-#include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c4fb34e64cd6..e7e818897bf5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -47,15 +47,16 @@
 #include "xe_sleep.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_tile.h"
 #include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
-#include "xe_wopcm.h"
 
 static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 			    struct xe_bo *bo)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = tile_to_xe(tile);
 	u32 addr;
 
 	/*
@@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 	 * might be different for each tile. So, just always ask for the address
 	 * on the target GuC.
 	 */
-	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
+	addr = __xe_bo_ggtt_addr(bo, tile->id);
+
+	if (!IS_SRIOV_VF(xe))
+		xe_assert(xe, addr >= xe_tile_wopcm_size(tile));
 
 	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
-	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
 	xe_assert(xe, addr < GUC_GGTT_TOP);
 	xe_assert(xe, xe_bo_size(bo) <= GUC_GGTT_TOP - addr);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index 24293521e090..a7c84f2d10c5 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -12,7 +12,6 @@
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile_sriov_vf.h"
-#include "xe_wopcm.h"
 
 /**
  * DOC: GGTT nodes shifting during VF post-migration recovery
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index b32ba504041c..501961c2cc8f 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
@@ -18,10 +19,12 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_uc_fw.h"
 #include "xe_wedge.h"
-#include "xe_wopcm.h"
+#include "regs/xe_guc_regs.h"
 
 static struct xe_gt *
 uc_to_gt(struct xe_uc *uc)
@@ -52,6 +55,126 @@ int xe_uc_init_noalloc(struct xe_uc *uc)
 	return ret;
 }
 
+static bool __wopcm_regs_locked(struct xe_gt *gt,
+				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
+{
+	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
+	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
+
+	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
+	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
+		return false;
+
+	*guc_wopcm_base = reg_base & GUC_WOPCM_OFFSET_MASK;
+	*guc_wopcm_size = reg_size & GUC_WOPCM_SIZE_MASK;
+	return true;
+}
+
+static int __wopcm_init_regs(struct xe_gt *gt, u32 base, u32 size)
+{
+	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
+	u32 mask;
+	int err;
+
+	xe_gt_assert(gt, !(base & ~GUC_WOPCM_OFFSET_MASK));
+	xe_gt_assert(gt, !(size & ~GUC_WOPCM_SIZE_MASK));
+
+	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
+	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
+					 size | GUC_WOPCM_SIZE_LOCKED);
+	if (err)
+		goto err_out;
+
+	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
+	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
+					 base | huc_agent, mask,
+					 base | huc_agent |
+					 GUC_WOPCM_OFFSET_VALID);
+	if (err)
+		goto err_out;
+
+	xe_gt_dbg(gt, "Programmed GuC WOPCM [b=%uK, s=%uK]\n", base / SZ_1K, size / SZ_1K);
+
+	return 0;
+
+err_out:
+	xe_gt_notice(gt, "Failed to init uC WOPCM registers to [b=%uK, s=%uK]!\n",
+		     base / SZ_1K, size / SZ_1K);
+	xe_gt_notice(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
+		     DMA_GUC_WOPCM_OFFSET.addr,
+		     xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
+	xe_gt_notice(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
+		     GUC_WOPCM_SIZE.addr,
+		     xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
+
+	return err;
+}
+
+static int uc_program_wopcm(struct xe_uc *uc)
+{
+	struct xe_gt *gt = uc_to_gt(uc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
+	u32 wopcm_size = xe_tile_wopcm_size(tile);
+	u32 guc_wopcm_base;
+	u32 guc_wopcm_size;
+	bool locked;
+
+	if (!xe_uc_fw_is_supported(&gt->uc.guc.fw))
+		return -ENODEV;
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+
+	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
+	if (locked) {
+		/*
+		 * We trust the programming to have been done correctly. If
+		 * something is wrong we'll catch it at FW load time.
+		 */
+		xe_gt_dbg(gt, "GuC WOPCM is already locked [b=%uK, s=%uK]\n",
+			  guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
+		return 0;
+	}
+
+	/*
+	 * WOPCM partitioning on platforms with a media GT is more complex,
+	 * because both GTs share the same WOPCM space. However, on all
+	 * platforms with media GT we expect the registers to be preprogrammed
+	 * by BIOS/IFWI, so we should never have to do the programming ourselves
+	 * and can therefore skip the implementation.
+	 */
+	if (XE_WARN_ON(tile->media_gt)) {
+		xe_gt_err(gt, "WOPCM not locked on platform with media GT\n");
+		return -EIO;
+	}
+
+	/*
+	 * On legacy HW (pre-PVC) where the driver is responsible for
+	 * programming the WOPCM registers, the WOPCM is divided into three
+	 * regions, in order from bottom to top:
+	 * 1 - The HuC region, which contains the HuC firmware + a 16KB reserved
+	 *     section.
+	 * 2 - The GuC region, which contains the GuC firmware + a reserved
+	 *     section for GuC's usage.
+	 * 3 - A reserved region for HW contexts, which is 36KB in size.
+	 *
+	 * To keep the math simple, we remove the HW context region from the
+	 * WOPCM size, calculate the size of region 1 and then leave the
+	 * remaining area for region 2. The official binaries are guaranteed to
+	 * fit in the WOPCM, so the math below can only go wrong if a user is
+	 * manipulating the blobs. In such a scenario, we'll catch the error at
+	 * FW load time, so no need to double verify it here.
+	 */
+	wopcm_size -= (SZ_32K + SZ_4K);
+
+	guc_wopcm_base = huc_fw_size + SZ_16K;
+	guc_wopcm_base = ALIGN(guc_wopcm_base, 1UL << GUC_WOPCM_OFFSET_SHIFT);
+
+	guc_wopcm_size = wopcm_size - guc_wopcm_base; /* already 4KB aligned */
+
+	return __wopcm_init_regs(gt, guc_wopcm_base, guc_wopcm_size);
+}
+
 int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
@@ -76,7 +199,7 @@ int xe_uc_init(struct xe_uc *uc)
 		return 0;
 
 	if (!IS_SRIOV_VF(uc_to_xe(uc))) {
-		ret = xe_wopcm_init(&uc->wopcm);
+		ret = uc_program_wopcm(uc);
 		if (ret)
 			goto err;
 	}
@@ -193,6 +316,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	if (IS_SRIOV_VF(uc_to_xe(uc)))
 		return vf_uc_load_hw(uc);
 
+	ret = uc_program_wopcm(uc);
+	if (ret)
+		return ret;
+
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
index 2b47382f7b3b..56d89e03a59a 100644
--- a/drivers/gpu/drm/xe/xe_uc_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_types.h
@@ -9,7 +9,6 @@
 #include "xe_gsc_types.h"
 #include "xe_guc_types.h"
 #include "xe_huc_types.h"
-#include "xe_wopcm_types.h"
 
 /**
  * struct xe_uc - Xe micro controllers
@@ -21,8 +20,6 @@ struct xe_uc {
 	struct xe_huc huc;
 	/** @gsc: Graphics Security Controller */
 	struct xe_gsc gsc;
-	/** @wopcm: WOPCM */
-	struct xe_wopcm wopcm;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
deleted file mode 100644
index 7da1e3ebc839..000000000000
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ /dev/null
@@ -1,287 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#include "xe_wopcm.h"
-
-#include <linux/error-injection.h>
-
-#include "regs/xe_guc_regs.h"
-#include "xe_device.h"
-#include "xe_force_wake.h"
-#include "xe_gt_types.h"
-#include "xe_mmio.h"
-#include "xe_uc_fw.h"
-
-/**
- * DOC: Write Once Protected Content Memory (WOPCM) Layout
- *
- * The layout of the WOPCM will be fixed after writing to GuC WOPCM size and
- * offset registers whose values are calculated and determined by HuC/GuC
- * firmware size and set of hardware requirements/restrictions as shown below:
- *
- * ::
- *
- *    +=========> +====================+ <== WOPCM Top
- *    ^           |  HW contexts RSVD  |
- *    |     +===> +====================+ <== GuC WOPCM Top
- *    |     ^     |                    |
- *    |     |     |                    |
- *    |     |     |                    |
- *    |    GuC    |                    |
- *    |   WOPCM   |                    |
- *    |    Size   +--------------------+
- *  WOPCM   |     |    GuC FW RSVD     |
- *    |     |     +--------------------+
- *    |     |     |   GuC Stack RSVD   |
- *    |     |     +------------------- +
- *    |     v     |   GuC WOPCM RSVD   |
- *    |     +===> +====================+ <== GuC WOPCM base
- *    |           |     WOPCM RSVD     |
- *    |           +------------------- + <== HuC Firmware Top
- *    v           |      HuC FW        |
- *    +=========> +====================+ <== WOPCM Base
- *
- * GuC accessible WOPCM starts at GuC WOPCM base and ends at GuC WOPCM top.
- * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
- * context).
- */
-
-/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-/* FIXME: Larger size require for some platforms, do a proper probe sooner or later */
-#define DGFX_WOPCM_SIZE			SZ_4M
-#define LNL_WOPCM_SIZE			SZ_8M
-#define MTL_WOPCM_SIZE			SZ_4M
-#define WOPCM_SIZE			SZ_2M
-
-/* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
-#define WOPCM_RESERVED_SIZE		SZ_16K
-
-/* 16KB reserved at the beginning of GuC WOPCM. */
-#define GUC_WOPCM_RESERVED		SZ_16K
-/* 8KB from GUC_WOPCM_RESERVED is reserved for GuC stack. */
-#define GUC_WOPCM_STACK_RESERVED	SZ_8K
-
-/* GuC WOPCM Offset value needs to be aligned to 16KB. */
-#define GUC_WOPCM_OFFSET_ALIGNMENT	(1UL << GUC_WOPCM_OFFSET_SHIFT)
-
-/* 36KB WOPCM reserved at the end of WOPCM */
-#define WOPCM_HW_CTX_RESERVED		(SZ_32K + SZ_4K)
-
-static inline struct xe_gt *wopcm_to_gt(struct xe_wopcm *wopcm)
-{
-	return container_of(wopcm, struct xe_gt, uc.wopcm);
-}
-
-static inline struct xe_device *wopcm_to_xe(struct xe_wopcm *wopcm)
-{
-	return gt_to_xe(wopcm_to_gt(wopcm));
-}
-
-static u32 context_reserved_size(void)
-{
-	return WOPCM_HW_CTX_RESERVED;
-}
-
-static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
-			   u32 guc_wopcm_base, u32 guc_wopcm_size,
-			   u32 guc_fw_size, u32 huc_fw_size)
-{
-	const u32 ctx_rsvd = context_reserved_size();
-	u32 size;
-
-	size = wopcm_size - ctx_rsvd;
-	if (unlikely(guc_wopcm_base >= size ||
-		     guc_wopcm_size > size - guc_wopcm_base)) {
-		drm_err(&xe->drm,
-			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
-			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K,
-			size / SZ_1K);
-		return false;
-	}
-
-	size = guc_fw_size + GUC_WOPCM_RESERVED + GUC_WOPCM_STACK_RESERVED;
-	if (unlikely(guc_wopcm_size < size)) {
-		drm_err(&xe->drm, "WOPCM: no space for %s: %uK < %uK\n",
-			xe_uc_fw_type_repr(XE_UC_FW_TYPE_GUC),
-			guc_wopcm_size / SZ_1K, size / SZ_1K);
-		return false;
-	}
-
-	size = huc_fw_size + WOPCM_RESERVED_SIZE;
-	if (unlikely(guc_wopcm_base < size)) {
-		drm_err(&xe->drm, "WOPCM: no space for %s: %uK < %uK\n",
-			xe_uc_fw_type_repr(XE_UC_FW_TYPE_HUC),
-			guc_wopcm_base / SZ_1K, size / SZ_1K);
-		return false;
-	}
-
-	return true;
-}
-
-static bool __wopcm_regs_locked(struct xe_gt *gt,
-				u32 *guc_wopcm_base, u32 *guc_wopcm_size)
-{
-	u32 reg_base = xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET);
-	u32 reg_size = xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE);
-
-	if (!(reg_size & GUC_WOPCM_SIZE_LOCKED) ||
-	    !(reg_base & GUC_WOPCM_OFFSET_VALID))
-		return false;
-
-	*guc_wopcm_base = reg_base & GUC_WOPCM_OFFSET_MASK;
-	*guc_wopcm_size = reg_size & GUC_WOPCM_SIZE_MASK;
-	return true;
-}
-
-static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
-			     struct xe_wopcm *wopcm)
-{
-	u32 base = wopcm->guc.base;
-	u32 size = wopcm->guc.size;
-	u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? HUC_LOADING_AGENT_GUC : 0;
-	u32 mask;
-	int err;
-
-	XE_WARN_ON(!(base & GUC_WOPCM_OFFSET_MASK));
-	XE_WARN_ON(base & ~GUC_WOPCM_OFFSET_MASK);
-	XE_WARN_ON(!(size & GUC_WOPCM_SIZE_MASK));
-	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
-
-	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
-	err = xe_mmio_write32_and_verify(&gt->mmio, GUC_WOPCM_SIZE, size, mask,
-					 size | GUC_WOPCM_SIZE_LOCKED);
-	if (err)
-		goto err_out;
-
-	mask = GUC_WOPCM_OFFSET_MASK | GUC_WOPCM_OFFSET_VALID | huc_agent;
-	err = xe_mmio_write32_and_verify(&gt->mmio, DMA_GUC_WOPCM_OFFSET,
-					 base | huc_agent, mask,
-					 base | huc_agent |
-					 GUC_WOPCM_OFFSET_VALID);
-	if (err)
-		goto err_out;
-
-	return 0;
-
-err_out:
-	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
-	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
-		   DMA_GUC_WOPCM_OFFSET.addr,
-		   xe_mmio_read32(&gt->mmio, DMA_GUC_WOPCM_OFFSET));
-	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
-		   GUC_WOPCM_SIZE.addr,
-		   xe_mmio_read32(&gt->mmio, GUC_WOPCM_SIZE));
-
-	return err;
-}
-
-u32 xe_wopcm_size(struct xe_device *xe)
-{
-	if (xe->info.platform >= XE_LUNARLAKE)
-		return LNL_WOPCM_SIZE;
-	else if (IS_DGFX(xe))
-		return DGFX_WOPCM_SIZE;
-	else if (xe->info.platform == XE_METEORLAKE)
-		return MTL_WOPCM_SIZE;
-	else
-		return WOPCM_SIZE;
-}
-
-static u32 max_wopcm_size(struct xe_device *xe)
-{
-	if (xe->info.platform == XE_NOVALAKE_P)
-		return SZ_16M;
-	else
-		return SZ_8M;
-}
-
-/**
- * xe_wopcm_init() - Initialize the WOPCM structure.
- * @wopcm: pointer to xe_wopcm.
- *
- * This function will partition WOPCM space based on GuC and HuC firmware sizes
- * and will allocate max remaining for use by GuC. This function will also
- * enforce platform dependent hardware restrictions on GuC WOPCM offset and
- * size. It will fail the WOPCM init if any of these checks fail, so that the
- * following WOPCM registers setup and GuC firmware uploading would be aborted.
- */
-int xe_wopcm_init(struct xe_wopcm *wopcm)
-{
-	struct xe_device *xe = wopcm_to_xe(wopcm);
-	struct xe_gt *gt = wopcm_to_gt(wopcm);
-	u32 guc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.guc.fw);
-	u32 huc_fw_size = xe_uc_fw_get_upload_size(&gt->uc.huc.fw);
-	u32 ctx_rsvd = context_reserved_size();
-	u32 guc_wopcm_base;
-	u32 guc_wopcm_size;
-	bool locked;
-	int ret = 0;
-
-	if (!guc_fw_size)
-		return -EINVAL;
-
-	wopcm->size = xe_wopcm_size(xe);
-	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
-
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(guc_fw_size >= wopcm->size);
-	XE_WARN_ON(huc_fw_size >= wopcm->size);
-	XE_WARN_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
-
-	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
-	if (locked) {
-		drm_dbg(&xe->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
-			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
-		/*
-		 * When the GuC wopcm base and size are preprogrammed by
-		 * BIOS/IFWI, check against the max allowed wopcm size to
-		 * validate if the programmed values align to the wopcm layout.
-		 *
-		 * FIXME: This is giving the maximum overall WOPCM size and not
-		 * the size relative to each GT.
-		 */
-		wopcm->size = max_wopcm_size(xe);
-
-		goto check;
-	}
-
-	/*
-	 * Aligned value of guc_wopcm_base will determine available WOPCM space
-	 * for HuC firmware and mandatory reserved area.
-	 */
-	guc_wopcm_base = huc_fw_size + WOPCM_RESERVED_SIZE;
-	guc_wopcm_base = ALIGN(guc_wopcm_base, GUC_WOPCM_OFFSET_ALIGNMENT);
-
-	/*
-	 * Need to clamp guc_wopcm_base now to make sure the following math is
-	 * correct. Formal check of whole WOPCM layout will be done below.
-	 */
-	guc_wopcm_base = min(guc_wopcm_base, wopcm->size - ctx_rsvd);
-
-	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
-	guc_wopcm_size = wopcm->size - ctx_rsvd - guc_wopcm_base;
-	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
-
-	drm_dbg(&xe->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
-		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
-
-check:
-	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
-			   guc_fw_size, huc_fw_size)) {
-		wopcm->guc.base = guc_wopcm_base;
-		wopcm->guc.size = guc_wopcm_size;
-		XE_WARN_ON(!wopcm->guc.base);
-		XE_WARN_ON(!wopcm->guc.size);
-	} else {
-		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
-		return -E2BIG;
-	}
-
-	if (!locked)
-		ret = __wopcm_init_regs(xe, gt, wopcm);
-
-	return ret;
-}
-ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_wopcm.h b/drivers/gpu/drm/xe/xe_wopcm.h
deleted file mode 100644
index 0197a282460b..000000000000
--- a/drivers/gpu/drm/xe/xe_wopcm.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_WOPCM_H_
-#define _XE_WOPCM_H_
-
-#include "xe_wopcm_types.h"
-
-struct xe_device;
-
-int xe_wopcm_init(struct xe_wopcm *wopcm);
-u32 xe_wopcm_size(struct xe_device *xe);
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_wopcm_types.h b/drivers/gpu/drm/xe/xe_wopcm_types.h
deleted file mode 100644
index 99d34837c408..000000000000
--- a/drivers/gpu/drm/xe/xe_wopcm_types.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_WOPCM_TYPES_H_
-#define _XE_WOPCM_TYPES_H_
-
-#include <linux/types.h>
-
-/**
- * struct xe_wopcm - Overall WOPCM info and WOPCM regions.
- */
-struct xe_wopcm {
-	/** @size: Size of overall WOPCM */
-	u32 size;
-	/** @guc: GuC WOPCM Region info */
-	struct {
-		/** @guc.base: GuC WOPCM base which is offset from WOPCM base */
-		u32 base;
-		/** @guc.size: Size of the GuC WOPCM region */
-		u32 size;
-	} guc;
-};
-
-#endif
-- 
2.53.0

