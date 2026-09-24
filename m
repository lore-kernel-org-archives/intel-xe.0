Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA5DC98313
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68C210E8EB;
	Thu, 24 Sep 2026 06:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfsLLM//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F56D10E8EB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230159; x=1821766159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1MC2Fk8j2TiEJlud90aq5SK6AyA2vrGOEiUVUnjdus=;
 b=RfsLLM//FAPMlX2MyZy8A21xbMxA98iJIiCqDvEMJrSlqLevl+90abGH
 9qp+Ybes8B3h3YMKa6/Q4TUXruzW0CaNWcROX0zJGcBSzkCfe3JjfMOoc
 qnHYnTOd9KiZesp5B6i+p5u0fMDFINCWul/+M82KqafR1OlckRI8hbHXE
 7PjZhKsnGXoi14N7Jk1J2rUzUrau09aRs2PXz5Sqzc4ESNi0yuhJDTGXN
 nQGKHR9NJ3442/ZNadt5h2Z4GIbDSiArAOb8Fy2KSlPxMM+nZ7FjF0K2v
 BOmf49jcMaIr1aSdcUQWdnaWbQDe/ktf2ELaj7d/UhSByv0AVs3Cc0FjB A==;
X-CSE-ConnectionGUID: luL1jEcZRU+/tG6lWo+pBw==
X-CSE-MsgGUID: MJxlnGsOQp2AOeFdxVkm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853955"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:19 -0700
X-CSE-ConnectionGUID: Ihv+OCkCTDWOVosAGZuVTg==
X-CSE-MsgGUID: IcVhCQR9Q+OA1MNQDhoU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096601"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:15 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 01/10] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
Date: Thu, 24 Sep 2026 11:39:02 +0530
Message-ID: <20260924060900.146167-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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
index e21848ca7594..53a9fd57eeba 100644
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

