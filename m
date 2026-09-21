Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E6C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245D10E665;
	Mon, 21 Sep 2026 13:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS/F7Vew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677D010E78F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789997992; x=1821533992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Syectxli4a90KeQUBM1Nr6D33WURcTsEFyvg5MWY09c=;
 b=LS/F7VewZ4OIb3xECWvjIxMyOuCapypajJgOxSPU9NuVhGhMW0NV6Aix
 cAeZMDngHdtoreL1Yt7yLxp2Sg8bYIYmLj1AN5J6mbZLp21fWx22a7eic
 zJhgM7MZu0XT6lvY5WM1SmqU7TujFb3J4vPSnWVbE0kuuYwaA8uHbePC2
 bzIXR6y0DMwENWOmclzPk1+jx16sAl5dAtjdzj/iTPD+Xod8C++ljNLDW
 6SlfL+rbBpSXZtjKDCpUvsg4Pp6ctKd8avVgAIBbWhouB3+dsD0e23ZR7
 J7o5Yw6o5O/PbGDgk53k/9lWsFevRZ8F2XpqbG/BLbCqyG+u7Q/tplIPp g==;
X-CSE-ConnectionGUID: lVsGI5/7TKiDOW8+n4Ni+Q==
X-CSE-MsgGUID: iMJ9xP9bTYaC9Hgk+GmBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036257"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:39:51 -0700
X-CSE-ConnectionGUID: j8dbfbnVSxm8c3EOdDDYuA==
X-CSE-MsgGUID: uyz7Tx3nSzaksH0ziyPOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298898640"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:39:47 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 02/10] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_set()
Date: Mon, 21 Sep 2026 19:09:29 +0530
Message-ID: <20260921133927.128281-14-mallesh.koujalagi@intel.com>
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

