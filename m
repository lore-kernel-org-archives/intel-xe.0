Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A037BD5B16E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 13:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5EA10E4BD;
	Mon, 15 Dec 2025 13:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEHcMOWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2F10E4BD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765804639; x=1797340639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ATFIXC91l6/bL702VKrWREbAiUFnwdof3D9bvYN1Vs=;
 b=JEHcMOWawP1wdvxHx/lFY4due/ggOKSI07BealfKi6y2cMWIEfPeRwog
 c+8fStikLOsSlNgfC2Rw27b7LTn9DNZBnorxWRhHq94UC+uuGdwoYw2GY
 XR1JQ3M0a7IBfk3pBTvkym8JpIRQtaHjP7uI3G2q+DfYgFe/KghasnDy9
 ClQynZgql3dEVEMAqUGZ6bxJbaFRd9xywBYT5aZ030fyQUw8REV71lo9L
 NIpiAY0BadcIytcUmcaV85PXsk+yCZr1LCfKm+EDw6xvtCVqpwtK2s+ma
 9IrczhSoFaV0SNX43X4vqAl4jmdGaFnvRJO+g8qCQlhI+97mIcTiL/unF Q==;
X-CSE-ConnectionGUID: YI+uX0t0T/ebLdOsivHqDg==
X-CSE-MsgGUID: JQfg8oclTGqdHE8Ab93HlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78819585"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78819585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:17:19 -0800
X-CSE-ConnectionGUID: WCN1zU2WTICxD7A8FzHS8A==
X-CSE-MsgGUID: g9ElLSzWT4KkbiZFFyFU3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197986777"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:17:17 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/nvm: enable cri platform
Date: Mon, 15 Dec 2025 14:59:28 +0200
Message-ID: <20251215125928.1931951-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Mark CRI as one that have CSC NVM device.
Update the writable override flow to take the
information from survivability register for CRI.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 35 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c |  1 +
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 33f4ac82fc80..87b7b0120f7c 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -10,6 +10,7 @@
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
+#include "xe_pcode_api.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_sriov.h"
 
@@ -45,39 +46,51 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	if (xe->info.platform != XE_BATTLEMAGE)
+	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
+		fallthrough;
+	case XE_BATTLEMAGE:
+		return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
+			 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
+	default:
 		return false;
-	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
-		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
+	}
 }
 
 static bool xe_nvm_writable_override(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	bool writable_override;
-	resource_size_t base;
+	struct xe_reg reg;
+	u32 test_bit;
 
 	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
+		reg = PCODE_SCRATCH(0);
+		test_bit = FDO_MODE;
+		break;
 	case XE_BATTLEMAGE:
-		base = DG2_GSC_HECI2_BASE;
+		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
+		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
 		break;
 	case XE_PVC:
-		base = PVC_GSC_HECI2_BASE;
+		reg = HECI_FWSTS2(PVC_GSC_HECI2_BASE);
+		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
 		break;
 	case XE_DG2:
-		base = DG2_GSC_HECI2_BASE;
+		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
+		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
 		break;
 	case XE_DG1:
-		base = DG1_GSC_HECI2_BASE;
+		reg = HECI_FWSTS2(DG1_GSC_HECI2_BASE);
+		test_bit = HECI_FW_STATUS_2_NVM_ACCESS_MODE;
 		break;
 	default:
 		drm_err(&xe->drm, "Unknown platform\n");
 		return true;
 	}
 
-	writable_override =
-		!(xe_mmio_read32(mmio, HECI_FWSTS2(base)) &
-		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	writable_override = !(xe_mmio_read32(mmio, reg) & test_bit);
 	if (writable_override)
 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
 	return writable_override;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0887d1912283..535325796067 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -416,6 +416,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_flat_ccs = false,
+	.has_gsc_nvm = 1,
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
 	.has_mert = true,
-- 
2.43.0

