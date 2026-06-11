Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D745CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 23:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B5510F1CC;
	Thu, 11 Jun 2026 23:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtZbvaaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978410F1CC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 23:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781220875; x=1812756875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5T0Ik9s1y+bL6dEUUcyfRY6Xbu68C+/8uewdFWETnog=;
 b=FtZbvaaB+1WIWeCkSK/+Y+YGy2GDp+GDxgVIvlKsEA45MJ6HTfxLwJnv
 FJzjfQHYLJcompBTvjLcu7pUoon+bnNlmGLnczZUYKB251yKwCGgZ+epN
 LLBsKVzvLni5pIf+nMubp6r9twB64D2cGQG7B+8owwDmVysp8W8U0ho9o
 +U1uf9t6mrQJt7y4g9sVN9c69/6180WxoO6wmswWoAjAh5F+6GjG79pKi
 q/LrrYiAa738sthBTFCDdtnu1fClY+WHaopRudJgwkyRmurP8pHRRTbei
 qoKxh2w0VngtjqhshFZ8axY6gn8y+lBQpVDNeQvWELtVaKw1pQ56G1TdQ g==;
X-CSE-ConnectionGUID: mPHM2QCTRwCy2DG9icyKxw==
X-CSE-MsgGUID: Xu4Tt/N+QNSUKeTYki6avA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84620215"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="84620215"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:34:35 -0700
X-CSE-ConnectionGUID: I88OmpraStCuvQsUQqpGIQ==
X-CSE-MsgGUID: 19ru6qs7QhKFj7RMiJvqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="245545274"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:34:35 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Add workaround 14027094826 to graphics IP
 35.11
Date: Thu, 11 Jun 2026 16:34:27 -0700
Message-ID: <04a98a6d8566eabd96fbaa23cbc8545841863a8c.1781220263.git.harish.chegondi@intel.com>
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

Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
register. When the firmware sees this register set to 0x20,
it applies its part of the workaround and sets the scratch pad register
to 0x60.

Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
register. When the firmware sees this register set to 0x40, it reverts
its part of the workaround and sets the scratch pad
register to 0.

Bspec update for the SWF scratch pad register is still pending, but has
been confirmed offline with the firmware team.

Bspec: 53188
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_eu_stall.c     | 46 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..b86050503c4e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -616,6 +616,9 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define SWF_SCRATCHPAD				XE_REG(0x4f000)
+#define   POISON_SUPP_MASK			REG_GENMASK(6, 5)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 
 /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d37770c58c5d..4d0f97ca4cdb 100644
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
@@ -682,7 +684,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	struct per_xecore_buf *xecore_buf;
 	struct xe_gt *gt = stream->gt;
 	u16 group, instance;
-	int xecore;
+	int xecore, ret = 0;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -693,6 +695,26 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_GT_WA(gt, 14027094826)) {
+		/**
+		 * Writing 0x20 to SWF register will signal the firmware to suppress
+		 * poison propagation.
+		 */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x20);
+		/**
+		 * Firmware will write 0x60 to SWF after suppressing poison propagation.
+		 * Wait until the SWF value turns 0x60 before enabling EU stall sampling.
+		 */
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & POISON_SUPP_MASK) == 0x60,
+					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
+		if (ret) {
+			xe_gt_err(gt, "Time out while firmware is disabling poison propagation\n");
+			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
+			xe_pm_runtime_put(gt_to_xe(gt));
+			return ret;
+		}
+	}
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
@@ -730,7 +752,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
 
-	return 0;
+	return ret;
 }
 
 static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
@@ -840,6 +862,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
+	u32 reg_value;
+	int ret = 0;
 
 	if (!stream->enabled)
 		return 0;
@@ -853,11 +877,27 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
+	if (XE_GT_WA(gt, 14027094826)) {
+		/**
+		 * Writing 0x40 to SWF register will signal the firmware to enable
+		 * poison propagation.
+		 */
+		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x40);
+		/**
+		 * Firmware will write 0 to SWF after enabling poison propagation.
+		 * Wait until the SWF register value turns 0.
+		 */
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & POISON_SUPP_MASK) == 0,
+					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
+		if (ret)
+			xe_gt_err(gt, "Time out while firmware is enabling poison propagation\n");
+	}
 
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
-	return 0;
+	return ret;
 }
 
 static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..293aa83feca7 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14027094826	GRAPHICS_VERSION(3511)
-- 
2.43.0

