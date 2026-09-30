Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F3CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 22:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6370A10E1AE;
	Wed, 30 Sep 2026 22:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtuZBfu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F0A10E1AE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 22:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790808253; x=1822344253;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=+vDqfi9ySUlnLYWnOR8A/WdunsK9l3/QdihuGP2I5Mk=;
 b=ZtuZBfu4YYbIQDhw4JxEtGwvXnMK6IKEw9xmZWGwuZNdJQK3Ni36RQuN
 u4vAweQV/4r7DtEeh6bEspcHaxds4oleqEeYhS3nXyfeehVVASG+9nl/E
 n0VREPlwSHSjDH4ZEM8Bg23XWRAWm8a17LJ7kIB4tUENJjCtQ07TtV2WX
 HveRr1gfXYOgtDUmkBEQ2s5NRSDunhh8EB4kze3zkTvUeDumUgPWiYRvA
 ohCOEZCovnL7m7Y1OCh7Av2N8Nz3QneafRmH1k4+YxEKz4BUW3Z5Y1ufS
 5wfmQXAMmo/2cc9uMi9TxBC89UgEZvZjy+4MHGA/QSXLxz/Wf9G67Juf9 g==;
X-CSE-ConnectionGUID: d/NtdVSOSf+HWSqAVGzZzQ==
X-CSE-MsgGUID: rXEOGXsYTBSeTqQDopLvKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90458559"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="90458559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 15:44:12 -0700
X-CSE-ConnectionGUID: E4g2OwMmQyanDjZ3neZC3g==
X-CSE-MsgGUID: mxAwmIquTFO/n8xAsj6Jcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="274929690"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 15:44:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 30 Sep 2026 15:44:00 -0700
Subject: [PATCH v2] drm/xe/xe3p: Read resource copy presence from fuse register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-res_copy_fuse-v2-1-60444264f666@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJuShKpJV96jiGgy1oE2kcRKR
 XL3pkI3Xf4P3rdDxEAY4VrsEHClSN7lkKcCzNS7OzKyuUFyWXEtFQsYO+PnrRtfEZm81EoYFNr
 oEvJnDjjS+/Bube6J4uLDdvCr+K4/Sf9Jq2CCKa7qyg49L+3QkFvwcTb+CW1K6QOOp/fVqgAAA
 A==
X-Change-ID: 20260928-res_copy_fuse-24781ce19c95
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4200;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=+vDqfi9ySUlnLYWnOR8A/WdunsK9l3/QdihuGP2I5Mk=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqvZC7rVwMWsNqWbjNwmgRuphh6aLLmhekk8ohl
 bb23wn+bOyJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCar2QuwAKCRBNeSQFyHKQ
 BBcwD/4+FiZlmHMbs/MTjaQ7zzdXumWECP+EQo+W7fln4v2SSDYtvzwQpFV/kOGp/9rT3V/bwii
 /rpm3eRus7xDz6bYdD6cumy7kTSoz86cI1SdZLsbZ69luRb4UNmh65n58kV15fEvqO/g2xNFH2y
 yNNjW4z8wLKpdKBbij5e1SmYMImH7v9PiNompXlWCnZKN0CvrWNUGFz57kEVvdUjRYuFmClFGot
 NUCST7jexmI2JFYWpNVjY/vPIF65Pt36JuczYD5FL4EPmEyNrOMQuYL0Hgacn6s+1h7lVqHSMuf
 UbFZdOL66AVML3zJvN+E+7KvdhWTeSspwvBYXJODiWM1x1cONZsqNAkHdjYpURxuIdzlkcDVekb
 gxIEdp3CWIpSGHZgDxwyNHI5MT+na+a01GSI/4zDF86AkfAyZc4hdnN4XSRWGcsscVnddnu8yym
 v5t1yhJJ5+GJMWn961TnzZPFM8eWcnSKxSgNGkCdlFthgUzMezO7qEf18IhsufnR/7ias8GjrhX
 yenKu/XeHwq25T5C7C33yWUx8j6NIKxBRjA2onzq0oLznXZdrjfhROw9HRxa/VXW8xcDgsiIjF3
 bf9ULBVJ2PD1PDyLVVr0PSZ00OXJ1Y5uyfTA2ehjA89TSIG/p29KEpWl0aS86/zn6Hl4gNsycoi
 3y2NeC2GWXEwOJw==
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
Changes in v2:
- Also add fuse register to ver_35_runtime_regs[] so that the PF will
  share the register value with the VF in SR-IOV setups where the VF
  can't access it directly.  (Sashiko)
- Link to v1: https://lore.kernel.org/r/20260929-res_copy_fuse-v1-1-80876dba05db@intel.com
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c           | 37 ++++++++++++++++++++++-------
 3 files changed, 32 insertions(+), 9 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 6586df2fcb91..fba2d5e1e94c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -114,6 +114,7 @@ static const struct xe_reg ver_35_runtime_regs[] = {
 	XE3P_XPC_GT_GEOMETRY_DSS_3,	/* _MMIO(0x915c) */
 	XE3P_XPC_GT_COMPUTE_DSS_3,	/* _MMIO(0x9160) */
 	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
+	RESOURCE_COPY_ENABLE,		/* _MMIO(0x9174) */
 };
 
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
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
base-commit: 332faa4cbc2e48ba71db4b3f45c981248f089b2d
change-id: 20260928-res_copy_fuse-24781ce19c95

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

