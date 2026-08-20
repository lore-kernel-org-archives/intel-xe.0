Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3BC5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737D710EFB7;
	Thu, 20 Aug 2026 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHex9xH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4F110EFBE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221012; x=1818757012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D3FJPf1NgpUBKWHUTEVaTNVQLxQcj7HpiCbR/7yWMMw=;
 b=fHex9xH1Kcq2lCKN16hLig9DclJVlkFkHKyzFt6NlxML5INfcO6CLMsm
 MOpe+JAX3jpCrjr/aWnWXkTUCEpkex+euw83d9HGdbHm3Zm3nIPSkS/uf
 Hi611WIdDpZ+88yRGFxsCCiO1ayA7by31UFe5/3yq4kvbsiBfRkYBbJKw
 v4tdu8a0/zZHKmLZXzbUjX4tOVncz1qmo8eJpYDCOX0dKeN8zcmTvUq6W
 oAajCOqFZdpVgL0nWfnXNRItztqccWvytt5coEF1ggJHR6KeZei+Fqy/F
 Z45dfCwqFcrskd5n8o/MQM5p74Hes3QdG01s8GXM51DLW+UrXYfYLjcpa Q==;
X-CSE-ConnectionGUID: hmC8P1ttTliZ08HUjUZbOw==
X-CSE-MsgGUID: 3pwBopEBQLyvmBN0etbA0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113290924"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="113290924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:16:52 -0700
X-CSE-ConnectionGUID: K2BPoVYESLaqzP/0Qia9cg==
X-CSE-MsgGUID: 6+dtS8snRDGVvF3fCPAe3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="271176405"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 03:16:48 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 2/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
Date: Thu, 20 Aug 2026 15:46:35 +0530
Message-ID: <20260820101632.527214-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
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

Make sysctrl_wait_bit_set() return an error code rather than a bool.
and update callers to use xe_log_err() with the propagated error code.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index ef847f0a8f2c..3523651b467b 100644
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
+	return xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
 			     timeout_ms * 1000, NULL, false);
-
-	return ret == 0;
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
+		xe_log_err(xe, SYSCTRL, ret,  "Response frame timeout\n");
+		return ret;
 	}
 
 	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
-- 
2.48.1

