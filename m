Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FD5D12668
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3A310E68E;
	Tue,  2 Dec 2025 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uc45fN3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D029510E68E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764700985; x=1796236985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uM1gqVoN4kYHgUfaSTpzZ1M29mjeA5aUa5zHvp8g5HQ=;
 b=Uc45fN3wOvGFsHqwTLK0WUz4mQopbpEs//prm/MmQP7SL8KfbptsUUaS
 +gyIcTPMB5pczR2wZ90gEa/NGBeVhFMhFAUverRuCH52EU/hFehmo7dPC
 F/m/HXR5FBYjXhcgbdyYciTpWJ/3ajhM8SO4tBNUPII6owAru6a1SDbYi
 ZDoXwDBEWa6pjDSXmLlb6n4DuUi4GSh2T5pO3El+icpkGnLkChxsGZVAs
 5xGf+UUtabjnfXypaD2aHaYMGpCvLsqE8iACd4Hyr6R5E04ZGVAoVWcqn
 D4Q58kAVbqR5trD52fBSdkKFgB3boLKs5Gwl9HpHU1BW2u6rm/RmOL8ak Q==;
X-CSE-ConnectionGUID: WLwBJiCVS4usdKsKXj29uA==
X-CSE-MsgGUID: 8uHirGUKRZ+Fsw1nYlW+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78028487"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78028487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:43:04 -0800
X-CSE-ConnectionGUID: b+n1B+xMSraYKep8o+038g==
X-CSE-MsgGUID: evP1Js/rRGiBkQSKzN27Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="225140695"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:43:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4.1 1/2] drm/xe: Track pre-production workaround support
Date: Tue,  2 Dec 2025 10:42:57 -0800
Message-ID: <20251202184256.1718298-3-matthew.d.roper@intel.com>
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

Let's add a flag to the device info that tracks which platforms still
have support for pre-production workarounds for so that we can print a
warning and taint if someone tries to load the driver on a
pre-production part for a platform without pre-production workarounds.
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

v2:
 - Fix inverted forcewake check

v3:
 - Invert flag and add it to the platforms on which we still have
   pre-prod workarounds.  (Jani, Lucas)

v4:
 - Avoid checking pre-production on VF since they don't have access to
   the FUSE2 register.

Bspec: 78271, 52544
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

CI never ran on v4, so just resending after a rebase to resolve a
minor conflict with another patch that's recently landed upstream.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_device.c       | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_pci.c          |  6 +++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 5 files changed, 69 insertions(+)

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
index 1197f914ef77..5780cfba04eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -797,6 +797,61 @@ static int probe_has_flat_ccs(struct xe_device *xe)
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
+	 * SR-IOV VFs don't have access to the FUSE2 register, so we can't
+	 * check pre-production status there.  But the host OS will notice
+	 * and report the pre-production status, which should be enough to
+	 * help us catch mistaken use of pre-production hardware.
+	 */
+	if (IS_SRIOV_VF(xe))
+		return;
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
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT)) {
+		xe_gt_err(gt, "Forcewake failure; cannot determine production/pre-production hw status.\n");
+		return;
+	}
+
+	if (xe_mmio_read32(&gt->mmio, FUSE2) & PRODUCTION_HW)
+		return;
+
+	xe_info(xe, "Pre-production hardware detected.\n");
+	if (!xe->info.has_pre_prod_wa) {
+		xe_err(xe, "Pre-production workarounds for this platform have already been removed.\n");
+		add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
+	}
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -967,6 +1022,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	detect_preproduction_hw(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9de73353223f..19435239d7c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -315,6 +315,8 @@ struct xe_device {
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
 		u8 has_mert:1;
+		/** @info.has_pre_prod_wa: Pre-production workarounds still present in driver */
+		u8 has_pre_prod_wa:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 04fcbacda12a..b37b7e26bd2d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -346,6 +346,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_flat_ccs = 1,
+	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
@@ -367,6 +368,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_late_bind = true,
+	.has_pre_prod_wa = 1,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
@@ -386,6 +388,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_flat_ccs = 1,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
+	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
@@ -399,6 +402,7 @@ static const struct xe_device_desc nvls_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_mem_copy_instr = true,
+	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 48,
@@ -413,6 +417,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_flat_ccs = false,
 	.has_mbx_power_limits = true,
 	.has_mert = true,
+	.has_pre_prod_wa = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -681,6 +686,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
+	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..9b66c0a457fd 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -49,6 +49,7 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
+	u8 has_pre_prod_wa:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.51.1

