Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93ACD6E69
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDC310E81A;
	Wed, 11 Oct 2023 13:31:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC7A10E81A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697031099; x=1728567099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KdvNbbmcZkiEVaibWLThNH/bDBQnFZbDfZ1tShiR1mU=;
 b=TO7nDFALjF7/uF2ZDe+Koj0de7p12Ku0yKQ9PYrjkFGIG+ZASq9JIaqS
 fD5XDo+igoRrGcr5r9Z88DPRT7yPGY5kGwszv3zpV3hMXRjezgqqdt1cL
 Q2YM2vmEFjQfNprbPtyu3579fkFuhL44uwklra5uVTS94GxrCH1i+5w9H
 l6Urita5z4t4670n+c0D9iFhVVMWsGJVLs97sIgZg3kF8OVOFc+oOwjj3
 Zx8O1ExGlFhAYfxUJzfhki9sZtQS/kD3AN21hC5K72ZFENCgKR9bRf6uf
 rW7q8jSFWLxHFNlS1bC7tEK2Qsy6dE1EMadMh0qLHLS2OobDHXHbHiUUY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381907389"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="381907389"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927571765"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="927571765"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:31:36 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 15:31:18 +0200
Message-Id: <20231011133119.1257132-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: implement driver initiated
 function-reset
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Driver initiated function-reset (FLR) is the highest level of reset
that we can trigger from within the driver. In contrast to PCI FLR it
doesn't require re-enumeration of PCI BAR. It can be useful in case
GT fails to reset. It is also the only way to trigger GSC reset from
the driver and can be used in future addition of GSC support.

v2:
  - use regs from xe_regs.h
  - move the flag to xe.mmio
  - call flr only on root gt
  - use BIOS protection check
  - copy/paste comments from i915

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi all,

This is initial attempt to implement Driver-FLR in xe. Implementation
is copied from i915. I've skipped comments, but I can re-add them if
requested.
In i915 Driver-FLR is performed on driver unload if GSC was used.
In xe GSC is not yet supported, but I have added trigger to perform FLR
in case GT fails to reset, I guess this could be proper use-case and
of course this is prerequisite to GSC support.

Regards
Andrzej
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  7 +++
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_gt.c           |  2 +
 drivers/gpu/drm/xe/xe_mmio.c         | 82 ++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index dbb0ea1a585eda..ac5fa25877766e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -53,8 +53,15 @@
 
 #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
 
+#define GU_CNTL_PROTECTED			XE_REG(0x10100C)
+#define   DRIVERINT_FLR_DIS			REG_BIT(31)
+
 #define GU_CNTL					XE_REG(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
+#define   DRIVERFLR				REG_BIT(31)
+
+#define GU_DEBUG				XE_REG(0x101018)
+#define   DRIVERFLR_STATUS			REG_BIT(31)
 
 #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
 #define   SGSI_SIDECLK_DIS			REG_BIT(17)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0efa7a1d2188e9..886d1c769c27fd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -285,6 +285,8 @@ struct xe_device {
 		size_t size;
 		/** @regs: pointer to MMIO space for device */
 		void *regs;
+		/** @needs_flr_on_fini: requests function-reset on fini */
+		bool needs_flr_on_fini;
 	} mmio;
 
 	/** @mem: memory info for device */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1ea..37e9576b92b5da 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -616,6 +616,8 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
 				   gt_to_tile(gt)->id, gt->info.id);
 
+	gt_to_xe(gt)->mmio.needs_flr_on_fini = true;
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e4cf9bfec422e6..27a0ebe2324daa 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/minmax.h>
+#include <linux/units.h>
 
 #include "xe_mmio.h"
 
@@ -372,6 +373,83 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	}
 }
 
+/*
+ * The driver-initiated FLR is the highest level of reset that we can trigger
+ * from within the driver. It is different from the PCI FLR in that it doesn't
+ * fully reset the SGUnit and doesn't modify the PCI config space and therefore
+ * it doesn't require a re-enumeration of the PCI BARs. However, the
+ * driver-initiated FLR does still cause a reset of both GT and display and a
+ * memory wipe of local and stolen memory, so recovery would require a full HW
+ * re-init and saving/restoring (or re-populating) the wiped memory. Since we
+ * perform the FLR as the very last action before releasing access to the HW
+ * during the driver release flow, we don't attempt recovery at all, because
+ * if/when a new instance of i915 is bound to the device it will do a full
+ * re-init anyway.
+ */
+static void driver_flr(struct xe_device *xe)
+{
+	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	int ret;
+
+	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
+		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
+		return;
+	}
+
+	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
+
+	/*
+	 * Make sure any pending FLR requests have cleared by waiting for the
+	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
+	 * to make sure it's not still set from a prior attempt (it's a write to
+	 * clear bit).
+	 * Note that we should never be in a situation where a previous attempt
+	 * is still pending (unless the HW is totally dead), but better to be
+	 * safe in case something unexpected happens
+	 */
+	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	if (ret) {
+		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
+		return;
+	}
+	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
+
+	/* Trigger the actual Driver-FLR */
+	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
+
+	/* Wait for hardware teardown to complete */
+	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	if (ret) {
+		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		return;
+	}
+
+	/* Wait for hardware/firmware re-init to complete */
+	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
+			     flr_timeout, NULL, false);
+	if (ret) {
+		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
+		return;
+	}
+
+	/* Clear sticky completion status */
+	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
+}
+
+static void driver_flr_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (xe->mmio.needs_flr_on_fini)
+		driver_flr(xe);
+}
+
+static int driver_flr_init(struct xe_device *xe)
+{
+	return drmm_add_action_or_reset(&xe->drm, driver_flr_fini, xe);
+}
+
 static void mmio_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
@@ -405,6 +483,10 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = driver_flr_init(xe);
+	if (err)
+		return err;
+
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
-- 
2.34.1

