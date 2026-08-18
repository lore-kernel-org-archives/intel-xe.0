Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2511EC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 13:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5E910EB66;
	Tue, 18 Aug 2026 13:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcmK/PpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B5F10EB66
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787058612; x=1818594612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6BiwlLNjvIXRe7eik9YBfC1iLGWwrolrLGkxv3Z6pEA=;
 b=TcmK/PpVLnN5thW13qq15fK2QylWeqNzgXo92TL5nZ944VbG8QDZtjx9
 lycj1KVYczU+m0WcRPyoR+CQOhQK3S35YoIkc4jrK09UuppFFGxeXroap
 rnVLawOv88bl71hbgtMHauvuV2qG9p1M854X5gdeJoj2JUvbV+u+8EUnM
 ORiZB6wjeLFFl5i7Rl+raDjbdoFrWkZHm1dAROqSvLxkkkoH+aBLT1pc1
 d9h9HQPqTgzfeYh+YnXDzF2jSdjgoTfVsy38fZnEU07wzV8vXhBEpJ1hm
 2W+bE4KyZjkOmk+ZpS2DLF5kXNKq/Jk2KSi/K2vPW6ZyxoucJeTDJtefI Q==;
X-CSE-ConnectionGUID: 45bqno20QkazJSd1RAPtEA==
X-CSE-MsgGUID: ArIpYH7fRYWH/MK4J0ju9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91419979"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91419979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:10:11 -0700
X-CSE-ConnectionGUID: o76TtyBTQMGsvhxfr8X8yA==
X-CSE-MsgGUID: cTYD5k42QLa1ZXBA4Oi/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269063040"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 06:10:07 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3] drm/xe/sysctrl: Add better sysctrl error reporting
Date: Tue, 18 Aug 2026 18:40:04 +0530
Message-ID: <20260818131003.495053-2-mallesh.koujalagi@intel.com>
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

Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
tools can reliably detect and categorize common sysctrl failures.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Use -EOVERFLOW.
- Drop sysctrl in xe_log_err. (Michal)
- Drop redundant %pe.
- Print response->count.

v3:
- Rebase.
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c   | 12 ++++++----
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index da395148ee9d..4341ea99cdc3 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_irq.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_sysctrl.h"
@@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 
 		ret = xe_sysctrl_send_command(sc, command, &len);
 		if (ret) {
-			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
+			xe_log_err(xe, SYSCTRL, ret,
+				   "failed to get pending event\n");
 			return;
 		}
 
 		if (len != sizeof(*response)) {
-			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
-			       len, sizeof(*response));
+			xe_log_err(xe, SYSCTRL, -EMSGSIZE,
+				   "unexpected event response length %zu (expected %zu)\n",
+				   len, sizeof(*response));
 			return;
 		}
 
@@ -41,7 +44,8 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
 
 		if (!--count) {
-			xe_err(xe, "sysctrl: event flooding\n");
+			xe_log_err(xe, SYSCTRL, -EOVERFLOW,
+				   "event flooding: %u\n", response->count);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index e13eebaac1d0..a96ef2864526 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -11,6 +11,7 @@
 
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
@@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
 	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
 
 	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
-		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
+		xe_log_err(xe, SYSCTRL, -EINVAL,
+			   "Input data too large: %zu bytes\n", data_in_len);
 		return -EINVAL;
 	}
 
@@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
 
 	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
-		xe_err(xe, "sysctrl: Mailbox busy\n");
+		xe_log_err(xe, SYSCTRL, -EBUSY, "Mailbox busy\n");
 		return -EBUSY;
 	}
 
@@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
 
 		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
-			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
+			xe_log_err(xe, SYSCTRL, -EIO,
+				   "Failed to write frame %u\n", frame);
 			sc->phase_bit = 0;
 			return -EIO;
 		}
@@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 
 		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
-			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
+			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
+				   "Frame %u acknowledgment timeout\n", frame);
 			sc->phase_bit = 0;
 			return -ETIMEDOUT;
 		}
@@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	int ret;
 
 	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
-		xe_err(xe, "sysctrl: Response frame timeout\n");
+		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
+			   "Response frame timeout\n");
 		return -ETIMEDOUT;
 	}
 
@@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
-		xe_err(xe, "sysctrl: Response header mismatch\n");
+		xe_log_err(xe, SYSCTRL, -EPROTO,
+			   "Response header mismatch\n");
 		return -EPROTO;
 	}
 
 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
-		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
-		       XE_SYSCTRL_HDR_RESULT(hdr));
+		xe_log_err(xe, SYSCTRL, -EIO,
+			   "Firmware error: 0x%02lx\n",
+			   XE_SYSCTRL_HDR_RESULT(hdr));
 		return -EIO;
 	}
 
@@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				      cmd->data_in, cmd->data_in_len,
 				      &mbox_cmd, &cmd_size);
 	if (ret) {
-		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret,
+			   "Failed to prepare command\n");
 		return ret;
 	}
 
@@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 				   cmd->data_out, cmd->data_out_len, rdata_len,
 				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
 	if (ret)
-		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(xe, SYSCTRL, ret,
+			   "Mailbox command failed\n");
 
 	kfree(mbox_cmd);
 
-- 
2.48.1

