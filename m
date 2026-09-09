Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFACC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389C10ECEE;
	Wed,  9 Sep 2026 12:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnKSDTQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A710ECEE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788955227; x=1820491227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qkRnX7wL/gTF81LkJYNC3DI8wMyRn/OqreaXSNYLjOk=;
 b=nnKSDTQXNhOSN/f1PKBCccQqvktE5mnvFUBWkCzq4cBW4EOdGUY35BdX
 dQ03BwbaEoVT0Kj9ni6yiELlJF45X0FSj7eMNLP3kdqVaZj2d+tOZrKGO
 kS3XAA1Dm+B2ybS0pM4l1bcb0MKCqmFFtLPFKP5EBMcZBVq8+kipHXSLz
 f4IkGWNBZCWg9NyeXWzzekv0I4fc0zIBJxYfgWDS2Hqebt7VhrRcvTzSJ
 t5Zf4QiG4Slz0uBGTHfpc4BWbmOyCzDx+yzHLREO/SJv9OM+bHnTOb2Nv
 tj/bZAAA7V0KxEOWUsKLzCiJBGTt6+kZw+eth1DNzvSnJWCqwuKvPly33 w==;
X-CSE-ConnectionGUID: sul1YeT6QKqL0OGlR+QCFg==
X-CSE-MsgGUID: MiEkAxnJQeSnkjI8Mm5u4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99709229"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99709229"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:00:26 -0700
X-CSE-ConnectionGUID: RxV2uZ2gSpuVF3lH3y7Ivw==
X-CSE-MsgGUID: bXXPeny7TZqC0OKt75bvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="276524709"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:00:22 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 srinivasa.adatrao@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/gt_throttle: Report power brake as a throttle reason
 on CRI
Date: Wed,  9 Sep 2026 17:19:32 +0530
Message-ID: <20260909114931.1039331-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

CRI defines bit 5 of the perf limit reasons register as a power brake
(PWRBRK) indicator. Add PWRBRK_MASK and a reason_pwrbrk sysfs attribute
for CRI in place of reason_ratl.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..dbbb0daecee2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -657,6 +657,7 @@
 #define   MEM_THERMAL_MASK			REG_BIT(2)
 #define   VR_THERMAL_MASK			REG_BIT(3)
 #define   ICCMAX_MASK				REG_BIT(4)
+#define   PWRBRK_MASK				REG_BIT(5)
 #define   SOC_AVG_THERMAL_MASK			REG_BIT(6)
 #define   FASTVMODE_MASK			REG_BIT(7)
 #define   PSYS_PL1_MASK				REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 1e7e3a31aa69..c0af5484611d 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -39,7 +39,7 @@
  * - ``reason_mem_thermal``: Memory thermal
  * - ``reason_vr_thermal``: VR thermal
  * - ``reason_iccmax``: ICCMAX
- * - ``reason_ratl``: RATL thermal algorithm
+ * - ``reason_pwrbrk``: Power brake
  * - ``reason_soc_avg_thermal``: SoC average temp
  * - ``reason_fastvmode``: VR is hitting FastVMode
  * - ``reason_psys_pl1``: PSYS PL1
@@ -200,6 +200,7 @@ static THROTTLE_ATTR_RO(reason_psys_pl1, PSYS_PL1_MASK);
 static THROTTLE_ATTR_RO(reason_psys_pl2, PSYS_PL2_MASK);
 static THROTTLE_ATTR_RO(reason_p0_freq, P0_FREQ_MASK);
 static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
+static THROTTLE_ATTR_RO(reason_pwrbrk, PWRBRK_MASK);
 
 static struct attribute *cri_throttle_attrs[] = {
 	/* Common */
@@ -209,12 +210,12 @@ static struct attribute *cri_throttle_attrs[] = {
 	&attr_reason_pl2.attr.attr,
 	&attr_reason_pl4.attr.attr,
 	&attr_reason_prochot.attr.attr,
-	&attr_reason_ratl.attr.attr,
 	/* CRI */
 	&attr_reason_vr_thermal.attr.attr,
 	&attr_reason_soc_thermal.attr.attr,
 	&attr_reason_mem_thermal.attr.attr,
 	&attr_reason_iccmax.attr.attr,
+	&attr_reason_pwrbrk.attr.attr,
 	&attr_reason_soc_avg_thermal.attr.attr,
 	&attr_reason_fastvmode.attr.attr,
 	&attr_reason_psys_pl1.attr.attr,
-- 
2.43.0

