Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234DD5E12E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 11:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6510E119;
	Tue, 16 Dec 2025 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQUJZPLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B8410E119
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765884512; x=1797420512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MDWQdwO4chqqWEg9SUD6lEI3UoPKlcyvwWkqKu2JhC8=;
 b=AQUJZPLAUKpf5znsk4Y+V3RwqlxsOkeS2y8aXzPzWZBoKErQz5C3Crmu
 1g27+fOXLuhAaRLr00AEH/AT9ie5whk22wPlxGTt8XQRjS44QgUmQ4blr
 z3c0MLU4RnzG2m7d68ufjjWZbRtxRup8cyRg4PEAbP+SwKD6JKz18hdBo
 VR+NwEDb40kdKdV0GI9lAzw7zv2bIwm1b/Qs+E2/0krMKI6U7exDF5tsX
 HVgpGx3GFiXcaYtXJVXWU1mNFo+kup868VO5d2rSflvmejPeTKqetxWHQ
 Gm7O/0K081xVC8jZXTQkABvlXZy5RvPD+SzbI73uCBUH4PiGFq737ZSlm Q==;
X-CSE-ConnectionGUID: YHauMdB+S42TiXJExWsziA==
X-CSE-MsgGUID: iDlgR177RN+htKBaKdxjvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78105791"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="78105791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:28:31 -0800
X-CSE-ConnectionGUID: F80MZvAbQvCzY2YdQ4EawQ==
X-CSE-MsgGUID: gDOKYxvcSqqemHaZQsdRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197093712"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:28:29 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Raag Jadav <raag.jadav@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/nvm: enable cri platform
Date: Tue, 16 Dec 2025 13:10:34 +0200
Message-ID: <20251216111034.3093507-1-alexander.usyskin@intel.com>
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

Mark CRI as one that have the CSC NVM device.
Update the writable override flow to take the information from
the scratch register for CRI.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---

V2: Fix commit message format (Raag)
    Drop fallthrough; (Raag)

 drivers/gpu/drm/xe/xe_nvm.c | 34 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c |  1 +
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 33f4ac82fc80..01510061d4d4 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -10,6 +10,7 @@
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
+#include "xe_pcode_api.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_sriov.h"
 
@@ -45,39 +46,50 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	if (xe->info.platform != XE_BATTLEMAGE)
+	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
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

