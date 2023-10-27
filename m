Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF690C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83610EA5C;
	Fri, 27 Oct 2023 22:29:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679C10EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445779; x=1729981779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1scPgRKEXsuZvAX0jP/nWKTGHd01GPYV1nodVKPXtI=;
 b=TvFFX9uzBVuWGZaZ4E46foPsppFuQqtR3AxRrR6aiECS88cO9B6o+z11
 ju8FtW7LGWljnBDIMNqROjmyQrnkt7/iubEhntUTVt7ypy9kB4AAMKRO/
 4qT2PCtW2crWSZag2aFpcrhh5eyjeCCkSfHEOxkNrEoIhm4+4/WHcJhdO
 w3so90cy/BsvD3ZG8Yqe3MXEe/jr+TqLpATQZkDPPeAf4EW9k5221PoJw
 2ffwYxJd+Nb4o/zMnIggiiVPVnljUXl9LSk6HoOyNcGMnAXhIitfy8oAN
 SaL+u6YJsTLqrjDJ1UipxBXFM9H+koyvG/8MIUnMPnTXwx2z1+35zkOxu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397768"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397768"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360343"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360343"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:15 -0700
Message-ID: <20231027222928.1981633-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/12] drm/xe: implement driver initiated
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Andrzej Hajda <andrzej.hajda@intel.com>

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
v3:
  - flr code moved to xe_device.c
v4:
  - needs_flr_on_fini moved to xe_device

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  7 +++
 drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_gt.c           |  2 +
 4 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2240cd157603..a646d13af03a 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -57,8 +57,15 @@
 
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
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..515cdf599fab 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -5,6 +5,8 @@
 
 #include "xe_device.h"
 
+#include <linux/units.h>
+
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -260,6 +262,78 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	return ERR_PTR(err);
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
+static void xe_driver_flr(struct xe_device *xe)
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
+static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (xe->needs_flr_on_fini)
+		xe_driver_flr(xe);
+}
+
 static void xe_device_sanitize(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
@@ -294,6 +368,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
+	if (err)
+		return err;
+
 	for_each_gt(gt, xe, id) {
 		err = xe_pcode_probe(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 44d622d4cc3a..9a0b0ccc1018 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -405,6 +405,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @needs_flr_on_fini: requests function-reset on fini */
+	bool needs_flr_on_fini;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d380f67b3365..73c090762771 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -626,6 +626,8 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
 				   gt_to_tile(gt)->id, gt->info.id);
 
+	gt_to_xe(gt)->needs_flr_on_fini = true;
+
 	return err;
 }
 
-- 
2.41.0

