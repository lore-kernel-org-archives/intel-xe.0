Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5666CE80A9A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5DD10E416;
	Wed, 27 Sep 2023 07:47:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B08810E471
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695800823; x=1727336823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o04X9wM2KWPz1aTuIEL4JrqdID5FewknsmhwKnoZmvk=;
 b=ma3sxqGVv2C9KNUD5use236D6SfJlpeGHmCMduJPJKMfXKP9wKGXvS8u
 CN5HmaHa/YpLiWnL25PlfrQ62E5Qnv2FQxD8Qsni08Cuea179cgxWP3ir
 h64t3BPCFgV+dkq2vEPFqy1h54a7Amv0zDYt5m1M8KOcLUyceiqAxjmB4
 K/nJc8SobD91dxLFpKJvK/wFTotN1TuZMFP/vrSJ3HB37pd02uTM2vwzA
 ytNOkl5UWHPBGJ66hOXBH+YFUTqRJOzeZQ6sXzlVT3wQP+i/+iEUoM+ZT
 MJKnaSx+EKpSKiVbBwlzdkVn/rBLzLoJYRROXt+zPNbgnxijnjC/ZFpOi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361143835"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361143835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725712286"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="725712286"
Received: from lab-ah.igk.intel.com (HELO lab-ah.corp.intel.com)
 ([10.102.138.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:46:48 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 09:46:07 +0200
Message-Id: <20230927074607.3027012-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: implement driver initiated functional
 reset
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

Driver initiated functional reset (FLR) is the highest level of reset
that we can trigger from within the driver. In contrast to PCI FLR it
doesn't require re-enumeration of PCI BAR. It can be useful in case
GT fails to reset. It is also the only way to trigger GSC reset from
the driver and can be used in future addition of GSC support.

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

Since this is my 1st patch to xe please be merciful in comments :)

Regards
Andrzej
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
 drivers/gpu/drm/xe/xe_gt.c           |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
 drivers/gpu/drm/xe/xe_mmio.c         | 38 ++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e13fbbdf6929ea..769a8fd005931a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -359,6 +359,12 @@
 #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
 
+#define GU_CNTL					XE_REG(0x101010)
+#define   LMEM_INIT				REG_BIT(7)
+#define   DRIVERFLR				REG_BIT(31)
+#define GU_DEBUG				XE_REG(0x101018)
+#define   DRIVERFLR_STATUS			REG_BIT(31)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
 				   gt_to_tile(gt)->id, gt->info.id);
 
+	gt->needs_flr_on_fini = true;
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7c8..dc194e9656abd5 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -347,6 +347,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @needs_flr_on_fini: requests functional reset on fini */
+	bool needs_flr_on_fini;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3ccc0af4430be4..593ecc98cdfe8a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/minmax.h>
+#include <linux/units.h>
 
 #include "xe_mmio.h"
 
@@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	}
 }
 
+static void driver_initiated_flr(struct xe_gt *gt)
+{
+	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
+	struct xe_device *xe = gt->tile->xe;
+	int ret;
+
+	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
+
+	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	if (ret) {
+		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
+		return;
+	}
+	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
+	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
+	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
+	if (ret) {
+		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		return;
+	}
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
 static void mmio_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		if (gt->needs_flr_on_fini)
+			driver_initiated_flr(gt);
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
-- 
2.34.1

