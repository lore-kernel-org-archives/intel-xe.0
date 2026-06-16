Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD9DCD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 23:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AE810E29E;
	Tue, 16 Jun 2026 23:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvuIKDez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DDF10E29E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781650824; x=1813186824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NYLuRz7Yh78udxKzOuiO3C+uXpFDIK9YK1PSwmk9i7c=;
 b=WvuIKDezCvt0HU1QN/2g1uQfH1z3XdduWUuCqPiqIEYG8LPzvNl0nZZg
 a4R8ZgtjfXZWEvURpt/pLyENjEUw0fYCTFtr740kEU7eabGJh5AdcoQJ/
 Bu3J1exviH1hAD0BayiKvW6t7q87sbv9kehCJbQby3L8QBzUp0l9jhEkS
 Co2B//5nDmBQejv0tPUn7L52XJle3hTinOYAnEbBH9rTxRiJN8zLmlwK0
 mF5wET8jORRdLkObwRK0T9eFpV7c55UZ7TCrm5////fgHx36pAzWZ+5Bq
 a4wrGVZhXX9Wm+waMSrTSf/ikrbG3ypVT+Kfv8DgmX15M9Zl1su2wcR6P A==;
X-CSE-ConnectionGUID: 4wTv0/rFTambwBkhGNYB/A==
X-CSE-MsgGUID: nzZRK1h5SeS7/jb7/29xnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81567396"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81567396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:00:24 -0700
X-CSE-ConnectionGUID: +CcgHpB/TEmQ4t+XPHx4Nw==
X-CSE-MsgGUID: Rq0iokyGQKqc2m6eO3FryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="253012951"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:00:23 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Add WA 14027054324 support for graphics
 IP 35.11
Date: Tue, 16 Jun 2026 16:00:18 -0700
Message-ID: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
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

Bspec update for the SWF scratch pad register is still pending, but has
been confirmed offline with the firmware team.

Bspec: 53188
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_eu_stall.c     | 37 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..2a649d036660 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -616,6 +616,9 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define SWF_SCRATCHPAD				XE_REG(0x4f000)
+#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 
 /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d37770c58c5d..fa54187de5dc 100644
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
@@ -30,6 +32,11 @@
 
 #define POLL_PERIOD_MS	5
 
+#define REQ_EUSTALL_ENABLE	0x20
+#define ACK_EUSTALL_ENABLE	0x60
+#define REQ_EUSTALL_DISABLE	0x40
+#define ACK_EUSTALL_DISABLE	0
+
 static size_t per_xecore_buf_size = SZ_512K;
 
 struct per_xecore_buf {
@@ -682,7 +689,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	struct per_xecore_buf *xecore_buf;
 	struct xe_gt *gt = stream->gt;
 	u16 group, instance;
-	int xecore;
+	int xecore, ret = 0;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -693,6 +700,19 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		return -ETIMEDOUT;
 	}
 
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to apply the workaround and wait for an ACK */
+		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_ENABLE);
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_ENABLE,
+					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
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
@@ -840,6 +860,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 {
 	struct xe_gt *gt = stream->gt;
+	u32 reg_value;
+	int ret = 0;
 
 	if (!stream->enabled)
 		return 0;
@@ -853,11 +875,20 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	if (XE_GT_WA(gt, 22016596838))
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
+	if (XE_GT_WA(gt, 14027054324)) {
+		/* Request the firmware to revert the workaround and wait for an ACK */
+		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_DISABLE);
+		ret = read_poll_timeout(xe_mmio_read32, reg_value,
+					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_DISABLE,
+					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
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

