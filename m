Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE9CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7E10FEBF;
	Fri,  9 Oct 2026 06:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDPbNSph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2B110FEBF
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791528488; x=1823064488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3NyJrkbJm+hfq3XWs4+Db0ska6usc/LzUAt0tFU1Hrs=;
 b=eDPbNSph4gRYI7JFPs8HgIEkNM5R5w4+EuYVqDvkfRZ71N5sveru1Hqz
 5zz+H0GoYlefPVqTwuYTw5j9M0O7sKfjfO67M8lfOFfmy59YYK5La/mz0
 QUl4yrcXB/DHQHjiH1CdJCb7oMhJVAM3FthYUJyQuexjw1wWfzeIFVZd1
 lPGpNTl7E8QcSNMwoMsAck/2t7DFOsZ/aTE4lIc02rc78MhIXc+INSiyd
 LU7nrKTlcW4oasBVl470g6PI8jVxXjBCB8dFta2g0IX5efUPxqmigcb5r
 PrgxNHDib5BL/5QZpf+1pSL7fg7IIibECUzZ005T/49gYEJ030PnQ5PHB w==;
X-CSE-ConnectionGUID: PjQuL9hVRluZKrmjlTvBsA==
X-CSE-MsgGUID: 6P36Mjx9QGeiLsVmrfaH8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="313869"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="313869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:48:07 -0700
X-CSE-ConnectionGUID: Sjtdg/M/RXmLq0lmyEhuhA==
X-CSE-MsgGUID: N6tUOjo3Qr21gYvIFejflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="333065"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:48:03 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michal.wajdeczko@intel.com, michael.j.ruhl@intel.com,
 paul.e.luse@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v2] drm/xe/sysctrl: Add mailbox control state to error messages
Date: Thu,  8 Oct 2026 23:47:55 -0700
Message-ID: <20261009064754.3927132-2-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Include decoded mailbox control register information in mailbox
busy, timeout and firmware error paths to provide additional
context for failure debugging

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v2 (Umesh):
 - Remove redundant casts
 - Align log/format string style
 - Drop duplicate frame number in frame-ack timeout message
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 ++++++++++++++++++-------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 25425e8bb533..f1a231dfec1e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -7,6 +7,7 @@
 #include <linux/cleanup.h>
 #include <linux/minmax.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 
 #include "regs/xe_sysctrl_regs.h"
@@ -36,17 +37,27 @@ struct xe_sysctrl_mailbox_msg_hdr {
 	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
 
 static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
-				  unsigned int timeout_ms)
+				  unsigned int timeout_ms, u32 *out_val)
 {
 	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
-				  timeout_ms * 1000, NULL, false);
+				  timeout_ms * 1000, out_val, false);
 }
 
 static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
-				unsigned int timeout_ms)
+				unsigned int timeout_ms, u32 *out_val)
 {
 	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
-			      timeout_ms * 1000, NULL, false);
+			      timeout_ms * 1000, out_val, false);
+}
+
+static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
+{
+	scnprintf(buf, size, "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
+		  REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
+		  REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
+		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
+		  ctrl_reg);
 }
 
 static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
@@ -128,17 +139,23 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 			       const u8 *mbox_cmd,
 			       size_t cmd_size, unsigned int timeout_ms)
 {
+	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
+		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
 	struct xe_device *xe = sc_to_xe(sc);
 	u32 ctrl_reg, total_frames, frame;
 	size_t bytes_sent, frame_size;
+	char ctrl_desc[48];
 	bool phase;
 	int ret;
 
 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
 
-	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
+	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
 	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy %#x.%#x %s\n",
+			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
+			   ctrl_desc);
 		return ret;
 	}
 
@@ -159,9 +176,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 
 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 
-		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
+		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms, &ctrl_reg);
 		if (ret) {
-			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
+			sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+			xe_log_err(xe, SYSCTRL, ret, "Frame acknowledgment timeout %#x.%#x %s\n",
+				   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
+				   ctrl_desc);
 			return ret;
 		}
 
@@ -171,17 +191,22 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	return 0;
 }
 
-static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
-				 size_t frame_size, unsigned int timeout_ms,
+static int sysctrl_process_frame(struct xe_sysctrl *sc,
+				 const struct xe_sysctrl_mailbox_msg_hdr *req,
+				 void *out, size_t frame_size, unsigned int timeout_ms,
 				 bool *done)
 {
 	u32 curr_frame, total_frames, ctrl_reg;
 	struct xe_device *xe = sc_to_xe(sc);
+	char ctrl_desc[48];
 	int ret;
 
-	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
+	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &ctrl_reg);
 	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout %#x.%#x %s\n",
+			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req),
+			   ctrl_desc);
 		return ret;
 	}
 
@@ -219,7 +244,7 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	while (!done && remain) {
 		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
 
-		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
+		ret = sysctrl_process_frame(sc, req, out, frame_size, timeout_ms,
 					    &done);
 		if (ret)
 			return ret;
@@ -240,8 +265,9 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	}
 
 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
-		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
-			   XE_SYSCTRL_HDR_RESULT(hdr));
+		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x %#x.%#x\n",
+			   XE_SYSCTRL_HDR_RESULT(hdr),
+			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
 		return -EIO;
 	}
 
-- 
2.43.0

