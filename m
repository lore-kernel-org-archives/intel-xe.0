Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2A9D65C43
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 12:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775510E2EE;
	Wed, 17 Dec 2025 12:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFtLTXZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322C510E2EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765975829; x=1797511829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sVy0HGRL+JaGFBlBRuNQ0JaZqIj9m1BfasJw49Jmczw=;
 b=ZFtLTXZNBNJN3y1hHmqr7SswcKkAjDaZ1lozXO45rGuS2L9BIrd7qOTr
 vpkMSpO+6EeJ0091i+EQsrb4yY2CR8JGwqFzz+8wfRmWjeXUYSv4WBx5x
 UIvUW69NMSkfJ4YVOILcFzZRLl+IgzwiUM0XP1JpMFwAt0usbRb5dtBrM
 WyappxDkgtDeFlVuErbLZ0Ft2LngeC4I+bz8eXg2ZbQtm4haXNNmKJtYA
 svhW4kubGGtK+qLuk7hP4m5IhQJyH/Yh6G7Gee8gwooU73S5AGHAfQLyu
 ZU1pELYjcvkLRrdLMpJjTZF/KkdRwZ3OMURdBSAMs7W/ZcoQHet9PuoU/ g==;
X-CSE-ConnectionGUID: imAeGnS/TaaCxZUJWrc1jg==
X-CSE-MsgGUID: s1/qgCqJR3K6avY8nIn4jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85500159"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="85500159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:50:28 -0800
X-CSE-ConnectionGUID: qghlgx4cTLC71SZeB/2PPg==
X-CSE-MsgGUID: gqraGq2gRliUZ/rHslfc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="203394561"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:50:27 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/device: Discard check for lmem_init
Date: Wed, 17 Dec 2025 18:21:43 +0530
Message-ID: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
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
status. uncore_init status will be asserted after the complete boot and
initialization of the SoC by the pcode. uncore_init confirms that lmem
init and mmio unblock has been already completed.
It makes no sense to check for lmem init after the pcode uncore_init
check. So it can be removed.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 67 +++-------------------------------
 1 file changed, 5 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..3818d0cccb0e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,7 +8,6 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
-#include <linux/iopoll.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -630,63 +629,6 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static int lmem_initializing(struct xe_device *xe)
-{
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
-
-	return 0;
-}
-ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
-
 static void vf_update_device_info(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_VF(xe));
@@ -740,6 +682,11 @@ int xe_device_probe_early(struct xe_device *xe)
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
@@ -756,10 +703,6 @@ int xe_device_probe_early(struct xe_device *xe)
 		return save_err;
 	}
 
-	err = wait_for_lmem_ready(xe);
-	if (err)
-		return err;
-
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
 	err = xe_device_vram_alloc(xe);
-- 
2.43.0

