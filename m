Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA5C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43CB10E7DA;
	Mon, 31 Aug 2026 10:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyTxwAmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936410E7D4
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173118; x=1819709118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Syectxli4a90KeQUBM1Nr6D33WURcTsEFyvg5MWY09c=;
 b=jyTxwAmWFYs7ATW/i9pYBg2J4QwPJ8oHkwUHZKBw4XFY6VDs3wuryyiW
 W1aZ1nWeN7CzXVR1E1MVuQXTTGs34OuNdvB28ZNzkj7pN8LZyDKKG1Upm
 afYBP+jI6U9ZrfwBcVwgLe6F+VXQ44RGss2m6NDfoS+q5f9o6N5wuFOCL
 kl+iE1m9EbPkDd1U9BjaMUOL5t7l4Dn9L3zBs37WnNkx2pQ915WiMVfEl
 dqCClu+1jaRbmsk+oLOtLi6rEs/+Vj5qXPQ8qaJcWb/yU5Hh6r2ncNVHd
 BBHz6E+Dsk69CgNZSOIwQGXYFSjDmTTZvRo4V+sSgdPncSg+Ju4X98HUf g==;
X-CSE-ConnectionGUID: 1V6gzBlTS7CAHCGYUeEJLw==
X-CSE-MsgGUID: IJrxjh4HSpmZiHNg0RsRRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264620"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:18 -0700
X-CSE-ConnectionGUID: okFNXvUfThmB6Lx+Ot6kYQ==
X-CSE-MsgGUID: MbJjr0e4QzCxTcITkioSAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685476"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:13 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 2/9] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
Date: Mon, 31 Aug 2026 16:14:59 +0530
Message-ID: <20260831104456.1770605-13-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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
index c36cac8c6288..b3d1538c8990 100644
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

