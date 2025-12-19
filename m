Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4603BD78785
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 14:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0875910F008;
	Fri, 19 Dec 2025 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vf/orpV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2173710EFFE
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766155748; x=1797691748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q2kgZm13YS6aKuMTr3ejallzkjHihxTwjK++bEMW92s=;
 b=Vf/orpV00VX4U5h4UoBSZqFzKOKwHGX5sQSoDP62xYlj1vrTy0/42/K7
 FUqCxI1SzcBuANTZj7s75Yi10z9GFx8ThB/q/pq9lJ1NrjPCKfnT8GlD9
 XOkA5JyVs6IvYhwaIXV9rzKrP1yMeoXCNT9zqwsmmWGaTWjqm1K9/8+bj
 Gn+KJ1GjP54XaUp/TdMcsB4QOUNbHHO+L2BqK1uUeYe6dGWJLi2m7RQwf
 KwvSwhwPNYlaOqIgCWmG88bXMeCpnja+EJ7CjY0CJxpUQLLkb9EgamMNO
 kYsogK2NFsjNoga/U2AppjeYEbXvwVNYajb35snn5gFXAqUpBhKOcUlDx w==;
X-CSE-ConnectionGUID: 5BIumRyOSRmJpYmenmRdvg==
X-CSE-MsgGUID: DHddvunERbiqyb7A0/M1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79235670"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79235670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:49:08 -0800
X-CSE-ConnectionGUID: 7DPuVYIfTdyrx7wBCscl+w==
X-CSE-MsgGUID: DXOuCSr5Tq+rS6hKkwO8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203391056"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:49:06 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] drm/xe/device: Convert wait for lmem init into an assert
Date: Fri, 19 Dec 2025 20:20:25 +0530
Message-ID: <20251219145024.2955946-2-balasubramani.vivekanandan@intel.com>
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

Prior to lmem init check, driver is waiting for the pcode uncore_init
status. uncore_init status will be flagged after the complete boot and
initialization of the SoC by the pcode. uncore_init confirms that lmem
init and mmio unblock has been already completed.
It makes no sense to check for lmem init after the pcode uncore_init
check. So change the wait for lmem init check into an assert which
confirms lmem init is set.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2: Instead of discarding lmem init check, change it into an assert
    (MattR)

---
 drivers/gpu/drm/xe/xe_device.c | 73 ++++++++--------------------------
 1 file changed, 16 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 00afc84a8683..b5d00804f164 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,7 +8,6 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
-#include <linux/iopoll.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -638,62 +637,14 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static int lmem_initializing(struct xe_device *xe)
+static void assert_lmem_ready(struct xe_device *xe)
 {
-	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
-		return 0;
-
-	if (signal_pending(current))
-		return -EINTR;
-
-	return 1;
-}
-
-static int wait_for_lmem_ready(struct xe_device *xe)
-{
-	const unsigned long TIMEOUT_SEC = 60;
-	unsigned long prev_jiffies;
-	int initializing;
-
-	if (!IS_DGFX(xe))
-		return 0;
-
-	if (IS_SRIOV_VF(xe))
-		return 0;
-
-	if (!lmem_initializing(xe))
-		return 0;
-
-	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
-	prev_jiffies = jiffies;
-
-	/*
-	 * The boot firmware initializes local memory and
-	 * assesses its health. If memory training fails,
-	 * the punit will have been instructed to keep the GT powered
-	 * down.we won't be able to communicate with it
-	 *
-	 * If the status check is done before punit updates the register,
-	 * it can lead to the system being unusable.
-	 * use a timeout and defer the probe to prevent this.
-	 */
-	poll_timeout_us(initializing = lmem_initializing(xe),
-			initializing <= 0,
-			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
-	if (initializing < 0)
-		return initializing;
-
-	if (initializing) {
-		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
-		return -EPROBE_DEFER;
-	}
-
-	drm_dbg(&xe->drm, "lmem ready after %ums",
-		jiffies_to_msecs(jiffies - prev_jiffies));
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
 
-	return 0;
+	xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) &
+		  LMEM_INIT);
 }
-ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
 
 static void vf_update_device_info(struct xe_device *xe)
 {
@@ -748,6 +699,11 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 
+	/*
+	 * Check for pcode uncore_init status to confirm if the SoC
+	 * initialization is complete. Until done, any MMIO or lmem access from
+	 * the driver will be blocked
+	 */
 	err = xe_pcode_probe_early(xe);
 	if (err || xe_survivability_mode_is_requested(xe)) {
 		int save_err = err;
@@ -764,9 +720,12 @@ int xe_device_probe_early(struct xe_device *xe)
 		return save_err;
 	}
 
-	err = wait_for_lmem_ready(xe);
-	if (err)
-		return err;
+	/*
+	 * Make sure the lmem is initialized and ready to use. xe_pcode_ready()
+	 * is flagged after full initialization is complete. Assert if lmem is
+	 * not initialized.
+	 */
+	assert_lmem_ready(xe);
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
-- 
2.43.0

