Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334EC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 00:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F6810EA9F;
	Thu,  9 Jul 2026 00:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9TcDHFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EACE10EA9F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783555598; x=1815091598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aQjdcER9mSAmKZz5+zPNGihLLn3XJC8A8T/ctHbILoI=;
 b=V9TcDHFGnqKXggABrMIbSrNETwMZKw1Pt/Er7nxvg4oy6L1PEWc4o/S6
 wT8f0AbO16b+Lgo17eOqXMaGVKZVGRQEgYyoKLJq+uFzOT9Kg74KctB8w
 6ef8eJ6MebGYEMf467UvE5fvmHKKIrgmy+A0Z+zLnEombVg5AqTJa+fNB
 kLjQg8nQwHIwa8u1C2b6/wEwL3YTKudWxRdmTFTI84v+GnZQi+TLiTccy
 TqLn6H17FHCuQJPKU5qQ/RYIIJ7540h1tMHy0J9ydFH3sL5+FnVopv4rn
 Qg5zWfGCfNlEimXGBPP0/ryREPtG+y0+BLSKcE7NBOSP1jBg6KhDjyxIW A==;
X-CSE-ConnectionGUID: q7jwCrD2S0+VGJsRhQQBBQ==
X-CSE-MsgGUID: c1y4Yh8pT4CMCdjKylK/Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95747378"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95747378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 17:06:38 -0700
X-CSE-ConnectionGUID: IVfbiskySa2XwdcokN8cLQ==
X-CSE-MsgGUID: rH+DUrB3S0WdZkHKtZnn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251776003"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 17:06:37 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v3 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Date: Wed,  8 Jul 2026 17:06:30 -0700
Message-ID: <feaf428427dbb94c0c7079a86778fd2925861bc0.1783554762.git.harish.chegondi@intel.com>
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
v3: 1. Make SWF_SCRATCHPAD an indexed register and move it to xe_regs.h
    2. Use write instead of rmw to write to SWF_SCRATCHPAD register
    3. Reduce the firmware ACK timeout to 10ms

 drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
 drivers/gpu/drm/xe/xe_eu_stall.c   | 38 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 3 files changed, 39 insertions(+), 3 deletions(-)

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
index d37770c58c5d..311b0ffa1ab2 100644
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
@@ -693,6 +701,19 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to apply the workaround and wait for an ACK */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_ENABLE);
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_ENABLE,
+					1000, 10000, true, &gt->mmio, SWF_SCRATCHPAD(0));
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
@@ -730,7 +751,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 
-	return 0;
+	return ret;
 }
 
 static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
@@ -840,6 +861,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
+	u32 reg_value;
+	int ret = 0;
 
 	if (!stream->enabled)
 		return 0;
@@ -853,11 +876,20 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to revert the workaround and wait for an ACK */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_DISABLE);
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_DISABLE,
+					1000, 10000, true, &gt->mmio, SWF_SCRATCHPAD(0));
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
index 9027365f0043..41734b9672c5 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -66,3 +66,4 @@
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
 16029380221	MEDIA_VERSION(3500)
+14027054324	GRAPHICS_VERSION(3511)
-- 
2.43.0

