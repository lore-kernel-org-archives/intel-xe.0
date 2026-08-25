Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45595C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C510E156;
	Tue, 25 Aug 2026 11:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5+CeM9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022F710E156
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655959; x=1819191959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZjXa0dAF+m9jytUCmFjaxHhfemKoPk0LdvrRJ2bwZmQ=;
 b=L5+CeM9nfHZBsZBYfUCAwMEDlCL5Dv4g3v1aszF7+0/Zlxcs5cF2AWpX
 qqSkbAXuJFIlJLn5USW0FUKFC146FyBYcXIWTdPSvBB7jvn9Ze65jiuaG
 82KyYlxjiKHunB92vibimUZ4rEIdXCh1p5FJuiHFlVjLUBAJhPnbHLJbH
 Ya0S2wgZQ3tt158eBTtTPc39j9L8/PRAj0HRR1guECwAL2+K/N3Rlo27h
 jZK+kDewzUVFUkqqac032KzvWxJMwxhbfKG/fMcXeaWMmF5mAeCDDfTQm
 k7hpEwWrALNPRDx2yogVx7rrLzIZTZXzRCbN4KZou/jdaj5d5z54Edc9t Q==;
X-CSE-ConnectionGUID: F3dZZSc0QJq1dhForTIjww==
X-CSE-MsgGUID: ++naEJ3iQgOFpxzfgoxcew==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248239"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:05:59 -0700
X-CSE-ConnectionGUID: l0mNDw4KQsyIokC6R+jxMg==
X-CSE-MsgGUID: 8XMQWHBBRwKUfdkG31dHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131340"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:05:54 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
Date: Tue, 25 Aug 2026 16:35:44 +0530
Message-ID: <20260825110542.1359776-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
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

Make sysctrl_wait_bit_clear() return an error code rather than a bool
and update callers to use xe_log_err() with the propagated error code.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v5:
- Fix align issue. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index e13eebaac1d0..f97dec375efe 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -11,6 +11,7 @@
 
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
@@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
 #define XE_SYSCTRL_HDR_RESULT(hdr) \
 	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
 
-static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
-				   unsigned int timeout_ms)
+static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
+				  unsigned int timeout_ms)
 {
-	int ret;
-
-	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
-				 timeout_ms * 1000, NULL, false);
-
-	return ret == 0;
+	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+				  timeout_ms * 1000, NULL, false);
 }
 
 static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
@@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	struct xe_device *xe = sc_to_xe(sc);
 	u32 ctrl_reg, total_frames, frame;
 	size_t bytes_sent, frame_size;
+	int ret;
 
 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
 
-	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
-		xe_err(xe, "sysctrl: Mailbox busy\n");
-		return -EBUSY;
+	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
+	if (ret) {
+		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
+		return ret;
 	}
 
 	sc->phase_bit ^= 1;
@@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 
 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 
-		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
-			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
+		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
+		if (ret) {
+			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
 			sc->phase_bit = 0;
-			return -ETIMEDOUT;
+			return ret;
 		}
 
 		bytes_sent += frame_size;
-- 
2.48.1

