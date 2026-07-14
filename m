Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C2C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 21:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4910E0D1;
	Tue, 14 Jul 2026 21:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlroUrwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4610E0D1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 21:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784063028; x=1815599028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eTypfvhISDNcwo5prL+OFhowyzv8GHS5o9h2CKnnJ6g=;
 b=mlroUrwN0ApNP83xRrP2oeMU+T5CoEDeMLPeAAAxWoFmu0BvWa3lZc49
 Dis1DdFC5Yfz9tG3vmCFheSUwLvhfp3kbMPhBsZXIN/Rqfa7KK33qyOLm
 w6qUyOMCNqsYFAbnciQ2Ozjg71Awlou8Fe9wSWgHs976zwUIzeYV9OEoD
 lRJpepyQAkY/LS+GfPCl5x34GtRDKo+VXdD5dws32KZlcxICrQuUw+d+s
 IdMYbZ6V8wmiFNM7eHEVo63Ak/Zd8XyIWLRh8vV4cjNg4sSTIGWTlRow1
 auANbkqIWZQI4edyzjpJCM6GxYaFoLxS4n9qtrKxFtsF1EbXzY45oO0Ys Q==;
X-CSE-ConnectionGUID: 6GktJxInQ9q5y8nl8fcvzA==
X-CSE-MsgGUID: wolVwbdYSCOgS+fOEf6IoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84653668"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84653668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:03:47 -0700
X-CSE-ConnectionGUID: RyhN8mEGRUO1pn6a3lfK6w==
X-CSE-MsgGUID: kbOnvkIuQ0SZzsZCLh57+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="279247058"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:03:46 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, balasubramani.vivekanandan@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Date: Tue, 14 Jul 2026 14:03:41 -0700
Message-ID: <643b0f5b70e4635b5fdd0544e764fd4596ab6f93.1784062276.git.harish.chegondi@intel.com>
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

WA 14027054324 is implemented in the firmware and is applied before
EU stall sampling and reverted after EU stall sampling. The driver
needs to notify the firmware whenever EU stall sampling is being
enabled/disabled so that the firmware takes the necessary action.
The driver uses a scratch pad register to communicate with the firmware.

Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
register to request the firmware to apply the workaround. The firmware
applies the workaround and sets the scratch pad register to 0x60
as an ACK.

Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
register to request the firmware to revert the workaround. The firmware
reverts the workaround and sets the scratch pad register to 0 as an ACK.

The firmware is expected to take about 1 ms to apply/revert the
workaround. 10 ms timeout is used in the driver while waiting for an
ack from the firmware to have adequate grace period.

Bspec update for the SWF scratch pad register is still pending, but has
been confirmed offline with the firmware team.

Bspec: 53188
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v4: 1. Use xe_mmio_wait32() instead of read_poll_timeout()
v3: 1. Make SWF_SCRATCHPAD an indexed register and move it to xe_regs.h
    2. Use write instead of rmw to write to SWF_SCRATCHPAD register
    3. Reduce the firmware ACK timeout to 10ms

 drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
 drivers/gpu/drm/xe/xe_eu_stall.c   | 35 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ad93c57edd17..6ca8b1f2440c 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,6 +7,9 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define SWF_SCRATCHPAD(_idx)			XE_REG(0x4f000 + (_idx) * 4)
+#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)
+
 #define SOC_BASE				0x280000
 
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d37770c58c5d..ffeae6e09f58 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -7,6 +7,7 @@
 #include <linux/fs.h>
 #include <linux/poll.h>
 #include <linux/types.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_drv.h>
 #include <generated/xe_wa_oob.h>
@@ -20,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_observation.h"
 #include "xe_pm.h"
 #include "xe_trace.h"
@@ -27,9 +29,15 @@
 
 #include "regs/xe_eu_stall_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 
 #define POLL_PERIOD_MS	5
 
+#define REQ_EUSTALL_ENABLE	0x20
+#define ACK_EUSTALL_ENABLE	0x60
+#define REQ_EUSTALL_DISABLE	0x40
+#define ACK_EUSTALL_DISABLE	0
+
 static size_t per_xecore_buf_size = SZ_512K;
 
 struct per_xecore_buf {
@@ -682,7 +690,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	struct per_xecore_buf *xecore_buf;
 	struct xe_gt *gt = stream->gt;
 	u16 group, instance;
-	int xecore;
+	int xecore, ret = 0;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -693,6 +701,18 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to apply the workaround and wait for an ACK */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_ENABLE);
+		ret = xe_mmio_wait32(&gt->mmio, SWF_SCRATCHPAD(0), SWF_EUSTALL_MASK,
+				     ACK_EUSTALL_ENABLE, 10000, NULL, false);
+		if (ret) {
+			xe_gt_err(gt, "Timeout polling for EU stall enable ACK from firmware\n");
+			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
+			xe_pm_runtime_put(gt_to_xe(gt));
+			return ret;
+		}
+	}
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
@@ -730,7 +750,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 
-	return 0;
+	return ret;
 }
 
 static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
@@ -840,6 +860,7 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
+	int ret = 0;
 
 	if (!stream->enabled)
 		return 0;
@@ -853,11 +874,19 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to revert the workaround and wait for an ACK */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_DISABLE);
+		ret = xe_mmio_wait32(&gt->mmio, SWF_SCRATCHPAD(0), SWF_EUSTALL_MASK,
+				     ACK_EUSTALL_DISABLE, 10000, NULL, false);
+		if (ret)
+			xe_gt_err(gt, "Timeout polling for EU stall disable ACK from firmware\n");
+	}
 
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
-	return 0;
+	return ret;
 }
 
 static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5d6574ec9dee..f02ac9bf7424 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -71,3 +71,4 @@
 		GRAPHICS_VERSION(3511)
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
+14027054324	GRAPHICS_VERSION(3511)
-- 
2.43.0

