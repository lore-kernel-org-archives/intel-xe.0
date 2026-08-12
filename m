Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0367DC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17810E401;
	Wed, 12 Aug 2026 12:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8Yf0roH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0349310EFA3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538112; x=1818074112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oHcRdl2wB4o4oqDCnLJIh3UPt6xU0U7ErVxabaZkD5A=;
 b=X8Yf0roHCt7rI3GvQGNB3r99Wb5PJvgyMpptB/OKDJ0GyZmYpIRDOvC8
 T2OtaV/WC1YtQ4FepobUP89ZOS0KvQ2xVwjsNrXtb7nl8gd2HAfhkABNE
 4GmsIZm4w1Y/St8Su1hmVjlFjeW9kJFuZlNfW7zln86it4DDgZLeFNEB0
 5RRD0jHxrnZYUf3RI7KHcsldnyZJf15NMV5j5X4n/LBoO9uN4E+26QrDH
 cQZoSO26nuNzBmbuy9biDhLWtrX1P6kDit5tUEswyrcPUaqeHQPMEh2Xt
 zLiMfiOhdPvkw0lyrsc5O4FvcqHYqXSyefbR6KAsGi1jfYVogtJSP6vyK g==;
X-CSE-ConnectionGUID: F5vM6HS+QEC0slF9+Wkfbg==
X-CSE-MsgGUID: OH7e/me7TxSXDZUAPHDuIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87304438"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87304438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:35:11 -0700
X-CSE-ConnectionGUID: E4RxDp1aReKcPHMt9ocnfw==
X-CSE-MsgGUID: 8PbWt/ELRcSd02nlJx0B4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260322690"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 05:35:06 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 3/3] drm/xe/sysctrl: Add better sysctrl error reporting
Date: Wed, 12 Aug 2026 18:04:53 +0530
Message-ID: <20260812123449.239480-8-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
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

