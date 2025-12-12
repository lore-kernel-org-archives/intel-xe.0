Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EED59D82
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BCB10E924;
	Fri, 12 Dec 2025 18:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ermwm4/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85EF10E924
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765563271; x=1797099271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UKLebK3Lho9pd1yhWXvUhffzHFJx5NHIROP437YTiRA=;
 b=Ermwm4/9ckQfu4YXd7trq5HqcTv63C7SHmeiAxHZ21WEtCdiD+1wfXQQ
 sPfWU0TbvGkk7gAOWmh7KULIrfNpH51JGcP43iiPlLDdbWSTitb5kKe8G
 6CRpm6ynFtnr8JwGZ05MVMZhwgkoNCKvQUcfj3VSyqGl8YxCl8xiOsfv5
 2DkSITYPa0tziZqNz53izUcxVCsw0k3Xq3g0WDsV8yifXph2/nBKUMcEu
 qLirNYJfs/yd/WTvCYer0MRaNuVBCKxm9Ee6BUzg0umAYefShI36nNXiC
 h73HRmyyhqCwIDoo1VZrqpEOt0AZHRhVmqEXkznfaSMuwkPpac2adoNYb A==;
X-CSE-ConnectionGUID: Fiq1jYakTjmZFtiyayRRtw==
X-CSE-MsgGUID: zfJkMQNnR5qggYi5H4lA0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67611747"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67611747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:14:31 -0800
X-CSE-ConnectionGUID: FYv6kUVKQjuAnQe/ijOyUg==
X-CSE-MsgGUID: zNOY8AovR1q1vGx5fAep2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="202080597"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:14:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 1/2] drm/xe: Track pre-production workaround support
Date: Fri, 12 Dec 2025 10:14:12 -0800
Message-ID: <20251212181411.294854-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

Pre-production DG2 hardware is no longer part of the Xe CI shards, so we
should be able to re-test now.

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
index 339b9aef9499..cdaa1c1e73f5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -804,6 +804,61 @@ static int probe_has_flat_ccs(struct xe_device *xe)
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
@@ -974,6 +1029,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	detect_preproduction_hw(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b35ba29d4d35..c751b47a8e11 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -317,6 +317,8 @@ struct xe_device {
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
 		u8 has_mert:1;
+		/** @info.has_pre_prod_wa: Pre-production workarounds still present in driver */
+		u8 has_pre_prod_wa:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d731b468f1be..b9096b9af4d9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -347,6 +347,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_flat_ccs = 1,
+	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
@@ -369,6 +370,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 	.has_i2c = true,
 	.has_late_bind = true,
+	.has_pre_prod_wa = 1,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
@@ -388,6 +390,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_flat_ccs = 1,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
+	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
@@ -401,6 +404,7 @@ static const struct xe_device_desc nvls_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_mem_copy_instr = true,
+	.has_pre_prod_wa = 1,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 48,
@@ -416,6 +420,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
 	.has_mert = true,
+	.has_pre_prod_wa = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -685,6 +690,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
+	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index bfac64d04dee..87f5569d22b1 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -50,6 +50,7 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
+	u8 has_pre_prod_wa:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.52.0

