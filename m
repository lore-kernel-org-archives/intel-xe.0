Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F37C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D6410F9B3;
	Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEKZAGYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D988E10F8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711564079; x=1743100079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4GqvTTX1dhH2UjxildesgvaCJPVjwJbOqmHPUYbpNA=;
 b=gEKZAGYWChOPOxpyD0ohIhM+NqIFgNmwlIvvzOezH93O2eE99XZ82TOr
 5D3kTeef2ybZ2XnmS+dc5VDIDHH7lBoinx00AX3+lbNgSnLBhMj9u9yhX
 Y/2SE2tdhIBcw/9UcUVMFylsJ0bDdg7fG7HAMA0gTKfuxuxEI3okGFHIY
 LtRUJHZTUnOkm1GRFPLuxfZPGO2PSbTR7RHoR1FMIRSvb3WlMFfCjPtv5
 HfiSNLbzh0WTks+fSI8gCJOQUD2GC59IQwxgySsHmh+6H4kSAU2wxhG1w
 rdq9rVIi/CXeBleLfv7Xe7IeOK+64wUVWAsLPMe2qGvjrad/2jMhJONda w==;
X-CSE-ConnectionGUID: kPU7FckoTnKb6awWP8XN1g==
X-CSE-MsgGUID: 2PEw3WnCSUC+xPGruTnzVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18074620"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18074620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20917427"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:27:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe: Separate pure MMIO init from VRAM checkout
Date: Wed, 27 Mar 2024 19:27:38 +0100
Message-Id: <20240327182740.407-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240327182740.407-1-michal.wajdeczko@intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
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

We can setup root tile registers mapping at the same time as we
do early mapping of the entire MMIO BAR and keep mandatory VRAM
checkout as a separate step. This will allow us to perform SR-IOV
VF mode detection between those two steps using regular MMIO regs
access functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c   | 59 ++++++++++++++--------------------
 drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bfe75eb59f..286ebccc3fc8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -424,7 +424,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_root_tile_init(xe);
+	err = xe_mmio_verify_vram(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 1de9de4f94b6..5d13fc7cb9d2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -360,32 +360,9 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 		iounmap(xe->mem.vram.mapping);
 }
 
-static int xe_verify_lmem_ready(struct xe_device *xe)
-{
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-
-	if (!IS_DGFX(xe))
-		return 0;
-
-	if (IS_SRIOV_VF(xe))
-		return 0;
-
-	/*
-	 * The boot firmware initializes local memory and assesses its health.
-	 * If memory training fails, the punit will have been instructed to
-	 * keep the GT powered down; we won't be able to communicate with it
-	 * and we should not continue with driver initialization.
-	 */
-	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
-		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
 int xe_mmio_init(struct xe_device *xe)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
 
@@ -401,21 +378,33 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-}
-
-int xe_mmio_root_tile_init(struct xe_device *xe)
-{
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	int err;
-
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	err = xe_verify_lmem_ready(xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_verify_vram(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	/*
+	 * The boot firmware initializes local memory and assesses its health.
+	 * If memory training fails, the punit will have been instructed to
+	 * keep the GT powered down; we won't be able to communicate with it
+	 * and we should not continue with driver initialization.
+	 */
+	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
+		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
+		return -ENODEV;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 67ead99f321b..b1680c4a14fb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,7 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
-int xe_mmio_root_tile_init(struct xe_device *xe);
+int xe_mmio_verify_vram(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
-- 
2.43.0

