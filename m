Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4FFCA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFA10F0DB;
	Tue, 29 Sep 2026 21:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2fa/BCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7D10F0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790716118; x=1822252118;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Q5M4Y2JplezyOEVyJtWEelU2Udu0RuBPJpwyaCUMi+g=;
 b=B2fa/BCbuKuj4JPcBhclYlr59RkInW//kRG/XEb3C3ebR7Ah5rDdpn6A
 ziymHVZSKoXXe/UHKtd23g8GLtChu+xWPtTJYnLZmq9MZiewpkHUaOvrS
 hEmMYHJR7cw41EoVbNXTghgkfA6zB1WvhguKHFSwB3Vt9Z1F7mq4PYpd4
 A9peScQdyK7KrVQmfx/6f45H3ZAGkyG5gCu5ysS7pANBhHDmaNuBAtPrb
 iRCDYcFzeu3Pr5/7MRaH1NAqoLqBZb2/NynA/zkYs6y/d5TZwCI07q/rK
 ZhPepiVVkLqAm1CBHJo7TTWuMg82WGZ2QTzaSp9lWbAsI+fi4p4Yw6KKo A==;
X-CSE-ConnectionGUID: uO+/rf2DRROzGHp7vN/FRw==
X-CSE-MsgGUID: jsPk/kAJRauJR6kZ23I5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90345096"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90345096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:08:37 -0700
X-CSE-ConnectionGUID: srkgieB7Tdql2GIC3v4amw==
X-CSE-MsgGUID: wp7Me5dQQTG9RwvIHvjsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275519657"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:08:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 29 Sep 2026 14:08:16 -0700
Subject: [PATCH] drm/xe/xe3p: Read resource copy presence from fuse
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-res_copy_fuse-v1-1-80876dba05db@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyML3aLU4vjk/ILK+LTS4lRdIxNzC8PkVEPLZEtTJaCegqLUtMwKsHn
 RsbW1AFwciXVfAAAA
X-Change-ID: 20260928-res_copy_fuse-24781ce19c95
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3234;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Q5M4Y2JplezyOEVyJtWEelU2Udu0RuBPJpwyaCUMi+g=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqvCjUJl73V4PSLCX9Ekr4EVN4QbAN9wNtMm1i+
 D76lt+FZuCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCarwo1AAKCRBNeSQFyHKQ
 BCGEEAC5Kv1f1HoaKXRF1jgaLOJjAkDHz8oIXxmTxkHjjQShjNmZwJlzdq2H1xeJfU6iJHiPv1+
 zJ542luK4jooUY/j74tsRI0BX6ce2mlyFAyDjWUnvWQF7cNft9ji3ckKMWGYygTiLGA/EI6LT6l
 ibxCs/YvldYbkzUm7aJaY5uTlwQMPbrBs8Jsw6t98PT92Do8axvs7gexWtBqlol5+XpS4BKzmo4
 mc12DEZ1m9VvZmexy9Bp6gZdj5Hog+GGwWav5aDC1jZ1zDCkceAAlGSCDmi3ReqSeDPu5zllEGn
 aSVcz4Lk89+CtvaJzBWePQcP3MqVHG8a7YP8N1YVWatixEJ1dwFvl5jb5/JB+zgy1Vqv7P0qRtC
 tkCBTP15188UjJfIA9MOKbxm+mHHyvtIwFLll+HKLp+wSrPueVfiHEwvw4SSumfE9iJdS0PHuwQ
 aveoq6NNhtD7hecQV0x3DeK71GtCY5AUVtW8eswGYbOUD/2vcASoT8/Tlx8Cf26AA2Yp6c7ReNS
 6Oi2eMTapyr1vKUO3Aem+6micEbMxSCbGxeyRB8EslxDWjwJcDltST+USUtHwfBn4y+eRXjc/o2
 m+UWLurenhkzHS4uKJBeqZpxcNUDn6kgAil4ubb/psTLpWD3rCaVCNtAYYRV37U2/Oj8T3fzNFk
 I47t5rnDnZfoBhQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

As with service copy engines, Xe3p also introduced a fuse register to
indicate whether the resource copy engine is present.  Somewhat
confusingly, the register field is 16 bits wide, even though all current
platforms only have at most a single resource copy engine (BCS0).

Bspec: 74623
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 37 +++++++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 650f117c3e13..f5cd3a94e47f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -301,6 +301,9 @@
 #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
 #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
 
+#define RESOURCE_COPY_ENABLE			XE_REG(0x9174)
+#define   FUSE_RESOURCE_COPY_ENABLE_MASK	REG_GENMASK(15, 0)
+
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
 #define   GRDOM_FULL				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9680d2a5adec..265f95c0c899 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -875,23 +875,42 @@ static u32 read_svccopy_fuses(struct xe_gt *gt)
 			     xe_mmio_read32(&gt->mmio, SERVICE_COPY_ENABLE));
 }
 
+static u32 read_rescopy_fuses(struct xe_gt *gt)
+{
+	u32 fuse = REG_FIELD_GET(FUSE_RESOURCE_COPY_ENABLE_MASK,
+				 xe_mmio_read32(&gt->mmio, RESOURCE_COPY_ENABLE));
+
+	/*
+	 * Although the register field is 16-bits wide, we don't expect to ever
+	 * see more than one resource copy engine (BCS0 in bit 0) enabled.
+	 */
+	xe_gt_WARN(gt, fuse & GENMASK(15, 1), "Unexpected resource copy fuse (%#x)\n", fuse);
+
+	return fuse & BIT(0);
+}
+
 static void read_copy_fuses(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 bcs_mask;
+	u32 bcs_mask, svc_copy_mask, res_copy_mask;
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	if (GRAPHICS_VER(xe) >= 35)
-		bcs_mask = read_svccopy_fuses(gt);
-	else if (GRAPHICS_VERx100(xe) == 1260)
-		bcs_mask = infer_svccopy_from_meml3(gt);
-	else
+	if (GRAPHICS_VER(xe) >= 35) {
+		svc_copy_mask = read_svccopy_fuses(gt);
+		res_copy_mask = read_rescopy_fuses(gt);
+	} else if (GRAPHICS_VERx100(xe) == 1260) {
+		svc_copy_mask = infer_svccopy_from_meml3(gt);
+		/* Only BCS1-BCS8 may be fused off */
+		res_copy_mask = 0x1;
+	} else {
 		return;
+	}
 
-	/* Only BCS1-BCS8 may be fused off */
-	bcs_mask <<= XE_HW_ENGINE_BCS1;
-	for (int i = XE_HW_ENGINE_BCS1; i <= XE_HW_ENGINE_BCS8; ++i) {
+	bcs_mask = svc_copy_mask << XE_HW_ENGINE_BCS1 |
+		res_copy_mask << XE_HW_ENGINE_BCS0;
+
+	for (int i = XE_HW_ENGINE_BCS0; i <= XE_HW_ENGINE_BCS8; ++i) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 

---
base-commit: e6a6d431be7101c5cdbb1b5d97caa9c1ea9cb493
change-id: 20260928-res_copy_fuse-24781ce19c95

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

