Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12269C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D3010E786;
	Mon, 21 Sep 2026 13:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7YI15W+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2AE10E786
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789997987; x=1821533987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wAzEjXBTBk6mQXVAzw9UtP9+IGoArMe67zUaVBxNWCQ=;
 b=F7YI15W+UVwIGvkolWmCtxeVioIGyYL7G5HXWDRpahG6Oib2Hw+cp83b
 eWzqq8s4GkMgmJuum6w4AmMaQDYuXZtWpHcl8iTrYI7+b85T/Dthm/q/M
 IKLRUgsCMHlNC7liyuivK7pHJYQpaM+DXC0vzs/EMJH+IPyw8VCKV+dsk
 hsCj9PqbYVdrQmd2nhjL2+tKYDeimvHISikoetQXXFI7A64borcNzB83Q
 SmUl9OfiG5N50Hq+UVDdLqSAatNoh8t2w6l2al8gs3427BHSJQHSJ2iZ6
 m58r0VtuPzRKBx4Iz/vz4iU9T8a58G2xXk/pyg9eybZQDX0LqttZn2eBq w==;
X-CSE-ConnectionGUID: jXq8wHS6S2yovhlsyhEOmg==
X-CSE-MsgGUID: OX+no+WeRBO/ygL87zue2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036249"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:39:47 -0700
X-CSE-ConnectionGUID: fwO4ywQ4QiiD0zbQhk8Q3A==
X-CSE-MsgGUID: Rf42GGUcSFi1cLk9FP8UtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298898617"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:39:43 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 01/10] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
Date: Mon, 21 Sep 2026 19:09:28 +0530
Message-ID: <20260921133927.128281-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
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
index 72baf1aa4b3a..c36cac8c6288 100644
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
@@ -146,12 +143,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	u32 ctrl_reg, total_frames, frame;
 	size_t bytes_sent, frame_size;
 	bool phase;
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
 
 	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
@@ -174,9 +173,10 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 
 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 
-		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
-			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
-			return -ETIMEDOUT;
+		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
+		if (ret) {
+			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
+			return ret;
 		}
 
 		bytes_sent += frame_size;
-- 
2.48.1

