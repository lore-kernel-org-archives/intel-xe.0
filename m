Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF4FC77B72
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 23:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEF010ED67;
	Thu,  6 Apr 2023 23:56:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE2C10E0B9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680825398; x=1712361398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RFvlKuR96LZQXIBI5f0RkeFvuyYDiTxlbdIrOevXDBM=;
 b=Ipgj+nNiBD8dqSmug9vSl9FLmxdGlGRfcvLKqksuME6hJ+XYtIUU99/E
 bN04ZHNRxIpRxSYX58btdY4RATNQb6XJ8upkiE1CX+svHLJ1J7i6uoaw3
 E53Q9QDA8zJQPldby+mggaaVQ2WCGsK1MAqwfVlk1WGJalLQ5Iy4FUDvO
 3mLaBIo0c3HW4ORBHRpUA9y42Kb/vDk3HJxVcohBrLa3RV3F3pIB8OLUP
 kk7p4KFdps4Uq2/M1jngq0Tp52lN4U3waPESSk93Drer4ctEj+GLEZeAV
 VG+LwVxEC7uf+OebkyIctBEyd7T/H6U2b1Keu7x45ANGC4M4Nk77VmgAs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344640863"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="344640863"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861587169"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="861587169"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 16:56:13 -0700
Message-Id: <20230406235621.1914492-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406235621.1914492-1-matthew.d.roper@intel.com>
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/9] drm/xe: Start splitting xe_device_desc
 into graphics/media structures
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rather than storing all characteristics for an entire platform in the
xe_device_desc structure, create secondary graphics and media structures
to hold traits and feature flags specific to those IPs.  This will
eventually allow us to assign the graphics and media characteristics at
runtime based on the contents of the relevant GMD_ID registers.

For now, just move the IP versions into the new structures to keep
things simple.  Other IP-specific fields will migrate to these
structures in future patches.

Note that there's one functional change introduced by this:  previously
PVC was recognized as media version 12.60.  That's technically true, but
in practice the media engines are fused off on all production hardware.
By simply not assigning a media IP structure to PVC it will effectively
be treated as IP version 0.0 now (which the rest of the driver should
treat as non-existent media).

v2:
 - Split the new structures out to their own header.  This will ease the
   addition of KUnit tests later.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 94 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pci_types.h | 21 +++++++
 2 files changed, 86 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_types.h

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 20be113544fa..a438be55e28b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -20,6 +20,7 @@
 #include "xe_drv.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 
@@ -43,10 +44,8 @@ struct xe_gt_desc {
 };
 
 struct xe_device_desc {
-	u8 graphics_ver;
-	u8 graphics_rel;
-	u8 media_ver;
-	u8 media_rel;
+	const struct xe_graphics_desc *graphics;
+	const struct xe_media_desc *media;
 
 	u64 platform_engine_mask; /* Engines supported by the HW */
 
@@ -84,17 +83,57 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 #define NOP(x)	x
 
+static const struct xe_graphics_desc graphics_xelp = {
+	.ver = 12,
+	.rel = 0,
+};
+
+static const struct xe_graphics_desc graphics_xelpp = {
+	.ver = 12,
+	.rel = 10,
+};
+
+static const struct xe_graphics_desc graphics_xehpg = {
+	.ver = 12,
+	.rel = 55,
+};
+
+static const struct xe_graphics_desc graphics_xehpc = {
+	.ver = 12,
+	.rel = 60,
+};
+
+static const struct xe_graphics_desc graphics_xelpg = {
+	.ver = 12,
+	.rel = 70,
+};
+
+static const struct xe_media_desc media_xem = {
+	.ver = 12,
+	.rel = 0,
+};
+
+static const struct xe_media_desc media_xehpm = {
+	.ver = 12,
+	.rel = 55,
+};
+
+static const struct xe_media_desc media_xelpmp = {
+	.ver = 13,
+	.rel = 0,
+};
+
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
 	.require_force_probe = true, \
-	.graphics_ver = 12, \
-	.media_ver = 12, \
 	.dma_mask_size = 39, \
 	.max_tiles = 1, \
 	.vm_max_level = 3, \
 	.vram_flags = 0
 
 static const struct xe_device_desc tgl_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
 	.platform_engine_mask =
@@ -104,6 +143,8 @@ static const struct xe_device_desc tgl_desc = {
 };
 
 static const struct xe_device_desc adl_s_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
 	.platform_engine_mask =
@@ -115,6 +156,8 @@ static const struct xe_device_desc adl_s_desc = {
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
 
 static const struct xe_device_desc adl_p_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xem,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
 	.platform_engine_mask =
@@ -131,9 +174,10 @@ static const struct xe_device_desc adl_p_desc = {
 	.is_dgfx = 1
 
 static const struct xe_device_desc dg1_desc = {
+	.graphics = &graphics_xelpp,
+	.media = &media_xem,
 	GEN12_FEATURES,
 	DGFX_FEATURES,
-	.graphics_rel = 10,
 	PLATFORM(XE_DG1),
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
@@ -143,26 +187,18 @@ static const struct xe_device_desc dg1_desc = {
 
 #define XE_HP_FEATURES \
 	.require_force_probe = true, \
-	.graphics_ver = 12, \
-	.graphics_rel = 50, \
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
 	.max_tiles = 1, \
 	.vm_max_level = 3
 
-#define XE_HPM_FEATURES \
-	.media_ver = 12, \
-	.media_rel = 50
-
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
 static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
 static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
-	.graphics_rel = 55, \
-	.media_rel = 55, \
 	PLATFORM(XE_DG2), \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -181,15 +217,17 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
+	.graphics = &graphics_xehpg,
+	.media = &media_xehpm,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 
 	DG2_FEATURES,
 };
 
 static const struct xe_device_desc dg2_desc = {
+	.graphics = &graphics_xehpg,
+	.media = &media_xehpm,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 
 	DG2_FEATURES,
 };
@@ -216,14 +254,12 @@ static const struct xe_gt_desc pvc_gts[] = {
 };
 
 static const struct xe_device_desc pvc_desc = {
+	.graphics = &graphics_xehpc,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
 	.extra_gts = pvc_gts,
-	.graphics_rel = 60,
 	.has_flat_ccs = 0,
-	.media_rel = 60,
 	.platform_engine_mask = PVC_ENGINES,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.dma_mask_size = 52,
@@ -254,16 +290,15 @@ static const struct xe_gt_desc xelpmp_gts[] = {
 
 static const struct xe_device_desc mtl_desc = {
 	/*
-	 * Real graphics IP version will be obtained from hardware GMD_ID
-	 * register.  Value provided here is just for sanity checking.
+	 * FIXME:  Real graphics/media IP will be mapped from hardware
+	 * GMD_ID register.  Hardcoded assignments here will go away soon.
 	 */
+	.graphics = &graphics_xelpg,
+	.media = &media_xelpmp,
 	.require_force_probe = true,
-	.graphics_ver = 12,
-	.graphics_rel = 70,
 	.dma_mask_size = 46,
 	.max_tiles = 2,
 	.vm_max_level = 3,
-	.media_ver = 13,
 	.has_range_tlb_invalidation = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
@@ -369,10 +404,11 @@ static void xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
-				    desc->graphics_rel;
-	xe->info.media_verx100 = desc->media_ver * 100 +
-				 desc->media_rel;
+	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
+				    desc->graphics->rel;
+	if (desc->media)
+		xe->info.media_verx100 = desc->media->ver * 100 +
+					 desc->media->rel;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.platform = desc->platform;
 	xe->info.dma_mask_size = desc->dma_mask_size;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
new file mode 100644
index 000000000000..cc372694ecca
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PCI_TYPES_H_
+#define _XE_PCI_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_graphics_desc {
+	u8 ver;
+	u8 rel;
+};
+
+struct xe_media_desc {
+	u8 ver;
+	u8 rel;
+};
+
+#endif
-- 
2.39.2

