Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFC2E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 19:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3810E46D;
	Tue, 14 Jan 2025 19:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAEWqWoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7910E46D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736881376; x=1768417376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgE99fzdr8tEEWhM40EJZ1DGE6JHaLeaYGQ3tTy7gyc=;
 b=DAEWqWoQ1M31PAsnA1ghkoEJeE4m4di10zqmsqBOK16aYGRYOdwowV7V
 uhuY7+hfi+JhCmdv2r/OEw00fnZYaZeZC+aM5JfztuArz4phamZC5crzv
 JQdXE1mgX4X0GQRNKyT/bEMcwUev7cOMgB3U4WwslZVwg9od96zmI763E
 JI2xHNnAiqkDKB+D6pBxwqdLFSajpnlz8hUrsEopLUCgRPBk6woumVmM5
 TvEvchzpoiT3z/ZDKlEvUCvp4Lm3WUwEiNQ6Kx+yBQRModzoEO1tNWHbX
 OvfT0vBW4NdsVwedz7IAUyhD9JdldDk6EjZh0O4xYyOuLUUN/fjtWEDXx A==;
X-CSE-ConnectionGUID: msujnhLRSCq+WVaD60eqiw==
X-CSE-MsgGUID: cpotlHICR4yNrsR12AS/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47684647"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="47684647"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:02:55 -0800
X-CSE-ConnectionGUID: ej8iPzq0SO6Nl9KGxNKK/g==
X-CSE-MsgGUID: 3knuXru3Ssqzat2XtmFJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105752744"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:02:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/mtl: Add Wa_22018931422
Date: Tue, 14 Jan 2025 11:02:43 -0800
Message-ID: <20250114190242.2026743-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.1
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

Although Wa_22018931422 still isn't fully documented in the hardware
database, it's been implemented in i915 for over a year and has been
successful at fixing MCR lock timeout issues.  Bring the same workaround
over to the Xe driver.

Since the official documentation for this workaround still isn't fully
complete, there isn't clear guidance on exactly which platform(s)
are/aren't impacted, but our belief is that this should be applied to
the graphics and media IPs used by MTL and ARL platforms.  Offline
discussion with the hardware teams indicated that this should not be
relevant to any Xe2 or later platforms.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4059
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c     | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index a1676b787fdc..f2699ac9a4f6 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -5,8 +5,11 @@
 
 #include "xe_gt_mcr.h"
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
@@ -14,6 +17,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
@@ -607,9 +611,27 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
 	 * shares the same steering control register. The semaphore is obtained
 	 * when a read to the relevant register returns 1.
 	 */
-	if (GRAPHICS_VERx100(xe) >= 1270)
+	if (GRAPHICS_VERx100(xe) >= 1270) {
+		/*
+		 * The steering control and semaphore registers are inside an
+		 * "always on" power domain with respect to RC6.  However there
+		 * are some issues if higher-level platform sleep states are
+		 * entering/exiting at the same time these registers are
+		 * accessed.  Grabbing GT forcewake and holding it over the
+		 * entire lock/steer/unlock cycle ensures that those sleep
+		 * states have been fully exited before we access these
+		 * registers.  This wakeref will be released in the unlock
+		 * routine.
+		 */
+		if (XE_WA(gt, 22018931422)) {
+			gt->mcr_fw = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+			xe_gt_WARN(gt, !gt->mcr_fw,
+				   "Could not grab forcewake during MCR steering\n");
+		}
+
 		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
 				     true);
+	}
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
 }
@@ -620,6 +642,9 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
 		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
 
+	if (XE_WA(gt, 22018931422))
+		xe_force_wake_put(gt_to_fw(gt), gt->mcr_fw);
+
 	spin_unlock(&gt->mcr_lock);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..2e0c138599de 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -389,6 +389,12 @@ struct xe_gt {
 	 */
 	spinlock_t mcr_lock;
 
+	/**
+	 * @mcr_fw: Forcewake reference during MCR steering (only used when
+	 *    Wa_22018931422 is in effect).
+	 */
+	unsigned int mcr_fw;
+
 	/**
 	 * @global_invl_lock: protects the register for the duration
 	 *    of a global invalidation of l2 cache
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40438c3d9b72..92a922bad630 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -42,3 +42,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+22018931422	GRAPHICS_VERSION_RANGE(1270, 1274)
+		MEDIA_VERSION(1300)
-- 
2.47.1

