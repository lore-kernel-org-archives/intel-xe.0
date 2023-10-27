Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2EAC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 09:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E250A10E968;
	Fri, 27 Oct 2023 09:43:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D762E10E968
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698399783; x=1729935783;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=+hOg/PhOYoF3GlOkhiQiEm8yx/Qyjdp2v+yuzDS6Tz8=;
 b=AY3elACDaKhvJMt2GC0p532QNYKvzDkn7c9Pvlx2Zte2loxzFsdwQUul
 290M/XVfgsXgg/P+Fl3YpPMQcr+rnr+hWUn3bl+WPtR8c5ZDah2oOb6O+
 J9/Yxl0D6RddvVxdjJo6cF1/GJBsCpEVY9GMHYD8HGrIxAJTgzzLMcrVF
 7WuvlSmk9Tr/iZjN+ZsZ1G9IjZirNl6l+XSuc7FpEdcXJVa/xO9iczxhW
 wh4nZqCJ/GSkdOmSdtXwpyLzzQg+6oBwUvNi8yxLZW2EO3g3jWQmaLLkP
 T2MFlWPL26YnHuwsYNW+/A4qOIabilkeSi8178jPGzCL9rL3uhzw1USM1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473983647"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="473983647"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 02:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736032640"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="736032640"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 02:43:01 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 27 Oct 2023 11:42:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-xe-ups-driver_flr-v4-1-5a169a54624c@intel.com>
X-B4-Tracking: v=1; b=H4sIAB6GO2UC/32PS27DMAxErxJoXTqmlP+q9yiCQjLpSoEtB5RjO
 A1890rpJqssBxi+eXyoxBI4qdPqoYSnkMIQc9h8rFTjbfxhCJSz0rU2WOsNzAy3awKSMLF8t52
 AdnQgrBvc8UHlu6twG+Yn8+uccytDD6MXti8kRDQG8Vih3u7RaECwkeSXL5W3F7KfIY7cVc3QF
 6SzicGJjY0viH+HNUlfdCLPYyn5kMZB7s9XJlPW31lPJk9u3Z52xh11S/yyeF6W5Q+P7lFwGgE
 AAA==
To: intel-xe@lists.freedesktop.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6499;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=+hOg/PhOYoF3GlOkhiQiEm8yx/Qyjdp2v+yuzDS6Tz8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBlO4YlJ2L1XPCcKEkhLA+ioYBLY0FfST/d2W0hok9X
 /ZugEMGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZTuGJQAKCRAjYrKT3hD911qeC/
 oCKVCWFypkzqCYg892MPQtIaSrCcPYKc7u4fPf8+X6xC5KQ5ibX/7aQqdN6AUm6Ol2I9qjAdhIJxYI
 mJTbCqSXxhaqBhQJaO6+oLTlRdzgSIEO3jy3KQ0Bvo/LaTiNHJf8a8K/KJoUJFjwl6o0Ax7wHqlQTw
 nGwKN+OK+PjY+jZxC/UYl5nMxLSD5QLj0f73jwVb6+fFCGHntRXGLV31H34WLRcBDCfPH9WIqwfF3+
 m1kYAn4UXLFp9Ji+Jq8WkQDkINvcLN/RtubAcAoAyQhMPVDXveD1d5J530E0LHRhSsYyRa6cMVCESN
 Xr25pW9S+wVa7likysvEhD6ywWG5dlvFD5zeOfJnM9nqCwn+7bWDGMba41UFknybYP/BHQIDK5LVej
 EAKcIOFdoueT0soJzDC+Od1KEpIXfeJDWGu0pt0Nc5fztXY2IRs84z65YMafr0AQGu2+e74tNAkO/h
 afaDUy279rJ+zP/cOiD4Y579cdHcGgAMNf3KoU7F8rJ70=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
Subject: [Intel-xe] [PATCH v4] drm/xe: implement driver initiated
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
v3:
  - flr code moved to xe_device.c
v4:
  - needs_flr_on_fini moved to xe_device

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
- Link to v3: https://lore.kernel.org/r/20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  7 ++++
 drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_gt.c           |  2 +
 4 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2240cd157603fc..a646d13af03ac7 100644
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
index 8341acf66e5f92..515cdf599fab31 100644
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
index 44d622d4cc3a17..9a0b0ccc10183a 100644
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
index d380f67b336598..73c090762771b8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -626,6 +626,8 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
 				   gt_to_tile(gt)->id, gt->info.id);
 
+	gt_to_xe(gt)->needs_flr_on_fini = true;
+
 	return err;
 }
 

---
base-commit: 76d7314ce7ceb58ee595a0ae1ba45bc99b9e277d
change-id: 20231024-xe-ups-driver_flr-2bd8d10c16e8

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

