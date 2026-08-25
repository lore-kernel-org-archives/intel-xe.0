Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759B2C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817E10E1A4;
	Tue, 25 Aug 2026 11:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C07e2GlU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C210E1A4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655963; x=1819191963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rElESuUQ7urCxxO0OqEf117lR9yZ3a4eywDXoZ3qwVg=;
 b=C07e2GlUcnP6Qk+0UIe+Fhr+zl/dp/SELTV9+Whm4HIof5wQQRxRy1sq
 ke6VUdtABft1GHHXhQVpny9E3cN+fPqsveITxA9m/IDAfJiu0FFfut+fo
 QNGpsD4XLLSfutQnO5IfZsqZHDGEUAdbuT8ZwBvGqr9D+rdn+gRBjPzQa
 nFMECHO+fPZ7A8dEBpOQ3YhfGZTcp7HtIA+zv95NFGOhxinhK7rl+UG74
 /z29/nU3FPLWfZxM3x8QuHBCmR1+SftMZMNprY1OD0S7x1TaEBWwAi/TD
 R2b0YK/t1Ck7IhTYqJJjgSSnNPtTef6uY/vVu/JX9L6cHhzhjSnmqRwHl Q==;
X-CSE-ConnectionGUID: OXkq1XruTtGuWseOY9OjEQ==
X-CSE-MsgGUID: sUs7jLcrSDSzVMP+/rGx2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248246"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:06:03 -0700
X-CSE-ConnectionGUID: wUO35sZuQJ6pWfQPTrWobA==
X-CSE-MsgGUID: Vj8Nbpl6TsKXAF6r3FOSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131346"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:05:59 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 2/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
Date: Tue, 25 Aug 2026 16:35:45 +0530
Message-ID: <20260825110542.1359776-11-mallesh.koujalagi@intel.com>
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

Make sysctrl_wait_bit_set() return an error code rather than a bool
and update callers to use xe_log_err() with the propagated error code.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v5:
- Fix align issue. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index f97dec375efe..b5412ca42bb8 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -42,15 +42,11 @@ static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 				  timeout_ms * 1000, NULL, false);
 }
 
-static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
-				 unsigned int timeout_ms)
+static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
+				unsigned int timeout_ms)
 {
-	int ret;
-
-	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
-			     timeout_ms * 1000, NULL, false);
-
-	return ret == 0;
+	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
+			      timeout_ms * 1000, NULL, false);
 }
 
 static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
@@ -193,9 +189,10 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	struct xe_device *xe = sc_to_xe(sc);
 	int ret;
 
-	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
-		xe_err(xe, "sysctrl: Response frame timeout\n");
-		return -ETIMEDOUT;
+	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
+	if (ret) {
+		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
+		return ret;
 	}
 
 	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
-- 
2.48.1

