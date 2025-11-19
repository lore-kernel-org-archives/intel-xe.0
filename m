Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424C1CF6484
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 22:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40D810E266;
	Wed, 19 Nov 2025 22:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWXxKEws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B4D10E266
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 22:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763589908; x=1795125908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OB1D6Q9DpWvgdJNc6UiKHBQ4VkpnMevwjb74qXb7kuA=;
 b=eWXxKEwsN/JZIE+zBcp7WhFJDV7tMLWm0P3uGoqQrRJA5aWDbmdjl32b
 rVBz+D/D4NkEwWR9SjK6bNwsKyS+tDHnnbuG4VfvCZM1Ei0E3dlI04iis
 cq7STpbkZJCJsSCZF9MjouzZ8s3R8FVMvzoDo/hbio3B4EXgp5vXas0UC
 i+3k4KfFjGWD77lUCpF65g+pLYn6HPQxKyfxYUdAXSxeq4omMpS8xEDmv
 6VZ/SgVXyFT7jQuikDR6f5V5db7ks9yeObBnvplcCsOQnKG/a3a+Gkz2K
 B6QHq1gJyXk5Jm6/CuDg0ib+WqDVvJtTsObwYq14L2qFJ/ECyIL0nB9Hu Q==;
X-CSE-ConnectionGUID: WpHGavBXRhShisWyeqVemg==
X-CSE-MsgGUID: 8VbcQ9raQgWDGb0kEgZA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="75974878"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="75974878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:05:07 -0800
X-CSE-ConnectionGUID: gbY/0nLfQYCYjbBCVMK68A==
X-CSE-MsgGUID: n1J8lW/FT6il/h+Wz2fCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228497025"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:05:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe: Track pre-production workaround support
Date: Wed, 19 Nov 2025 14:05:00 -0800
Message-ID: <20251119220459.3997343-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
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

When we're initially enabling driver support for a new platform/IP, we
usually implement all workarounds documented in the WA database in the
driver.  Many of those workarounds are restricted to early steppings
that only showed up in pre-production hardware (i.e., internal test
chips that are not available to the general public).  Since the
workarounds for early, pre-production steppings tend to be some of the
ugliest and most complicated workarounds, we generally want to eliminate
them and simplify the code once the platform has launched and our
internal usage of those pre-production parts have been phased out.

Let's add a flag to the device info that tracks which platforms we've
removed pre-production workarounds for so that we can print a warning
and taint if someone tries to load the driver on a pre-production part.
This will help our internal users understand the likely problems they'll
encounter if they try to load the driver on an old pre-production
device.

The Xe behavior here is similar to what we've done for many years on
i915 (see intel_detect_preproduction_hw()), except that instead of
manually coding up ranges of device steppings that we believe to be
pre-production hardware, Xe will use the hardware's own production vs
pre-production fusing status, which we can read from the FUSE2 register.
This fuse didn't exist on older Intel hardware, but should be present on
all platforms supported by the Xe driver.

Going forward, let's set the expectation that we'll start looking into
removing pre-production workarounds for a platform around the time that
platforms of the next major IP stepping are having their force_probe
requirement lifted.  This timing is just a rough guideline; there may be
cases where some instances of pre-production parts are still being
actively used in CI farms, internal device pools, etc. and we'll need to
wait a bit longer for those to be swapped out.

Bspec: 78271, 52544
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_device.c       | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  1 +
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 5 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..93643da57428 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -227,6 +227,9 @@
 
 #define MIRROR_FUSE1				XE_REG(0x911c)
 
+#define FUSE2					XE_REG(0x9120)
+#define   PRODUCTION_HW				REG_BIT(2)
+
 #define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
 #define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..ed758888cfa1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -797,6 +797,52 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	return 0;
 }
 
+/*
+ * Detect if the driver is being run on pre-production hardware.  We don't
+ * keep workarounds for pre-production hardware long term, so print an
+ * error and add taint if we're being loaded on a pre-production platform
+ * for which the pre-prod workarounds have already been removed.
+ *
+ * The general policy is that we'll remove any workarounds that only apply to
+ * pre-production hardware around the time force_probe restrictions are lifted
+ * for a platform of the next major IP generation (for example, Xe2 pre-prod
+ * workarounds should be removed around the time the first Xe3 platforms have
+ * force_probe lifted).
+ */
+static void detect_preproduction_hw(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	int id;
+
+	/*
+	 * The "SW_CAP" fuse contains a bit indicating whether the device is a
+	 * production or pre-production device.  This fuse is reflected through
+	 * the GT "FUSE2" register, even though the contents of the fuse are
+	 * not GT-specific.  Every GT's reflection of this fuse should show the
+	 * same value, so we'll just use the first available GT for lookup.
+	 */
+	for_each_gt(gt, xe, id)
+		break;
+
+	if (!gt)
+		return;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT)) {
+		xe_gt_err(gt, "Forcewake failure; cannot determine production/pre-production hw status.\n");
+		return;
+	}
+
+	if (xe_mmio_read32(&gt->mmio, FUSE2) & PRODUCTION_HW)
+		return;
+
+	xe_info(xe, "Pre-production hardware detected.\n");
+	if (xe->info.has_prod_wa_only) {
+		xe_err(xe, "Pre-production workarounds for this platform have already been removed.\n");
+		add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
+	}
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -967,6 +1013,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	detect_preproduction_hw(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0b2fa7c56d38..fe76640db859 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -308,6 +308,8 @@ struct xe_device {
 		u8 has_mbx_power_limits:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
+		/** @info.has_prod_wa_only: Only production hardware workarounds supported */
+		u8 has_prod_wa_only:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd03b4b3ebdb..25365a891f9d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -673,6 +673,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_prod_wa_only = desc->has_prod_wa_only;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..3045e860221c 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -47,6 +47,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
+	u8 has_prod_wa_only:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.51.1

