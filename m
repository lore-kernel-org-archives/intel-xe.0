Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4AFC7EE23
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 02:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4210E002;
	Fri,  9 Jun 2023 02:44:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD90F10E002
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 02:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686278681; x=1717814681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OBcGPkt2vtMdCUPJHj7FEI5RnSi9/V3c+XWre6fCXG0=;
 b=ddPPNHSMIgUsj0ZhClFWfXye2XfujEq9c2vcpJIPmsrBIO/7syc5acb3
 Z2kJ49YdIsIXyLGTpbSQGnJ8a7+uTd/Toy/5HmlNIB+PKnxKuN+zPsBrY
 GEgIrAEGQV44jqnYjM/B4YKJuopTb71Zr+dnCWyRRFy3V1Jn0uFC5Pn5C
 W5RYlpXXZs+VZBZbDmbmN/tKz5ozInzbNOeKEgzkT0KleeIaRIMPfFGDq
 l97+BLyYsTzUejGmpFivhtK2k7seAPl7HW+3DTsXTRE2FVDDJOHpmBheS
 e7tnn6+L8hJz6Y4dZXmJkWSoeWXtrdzTytn+cFJhWQl8AbW3MP+e+IqoV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443863535"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="443863535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 19:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704375466"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="704375466"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 19:44:38 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 08:19:54 +0530
Message-Id: <20230609024954.987039-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Donot apply forcewake while reading
 actual frequency
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
Cc: matthew.d.roper@intel.com, vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

RPSTAT1 is an sgunit register and thus doesn't need forcewake.
MTL_MIRROR_TARGET_WP1 is within an "always on" power domain and thus
doesn't require any forcewake to ensure the register is powered
up and usable. When GT is RC6 the actual frequency reported will be 0.

v2:
 - Add bspec index (Anshuman)
 - %s/GEN12_RPSTAT1/GT_PERF_STATUS as per bspec
v3: Update Fixes tag

Bspec: 51837, 67651
Fixes: 9d9212dd4228 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 67faa9ee0006..5d5cf4b0d508 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -31,7 +31,7 @@
 #define GEN10_FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
 
-#define GEN12_RPSTAT1		XE_REG(0x1381b4)
+#define GT_PERF_STATUS		XE_REG(0x1381b4)
 #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
 
 #define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
@@ -371,26 +371,18 @@ static ssize_t freq_act_show(struct device *dev,
 	ssize_t ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
-	/*
-	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
-	 * to verify that our freq requests are really happening.
-	 */
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		goto out;
 
+	/* When in RC6, actual frequency reported will be 0. */
 	if (xe->info.platform == XE_METEORLAKE) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
 	} else {
-		freq = xe_mmio_read32(gt, GEN12_RPSTAT1);
+		freq = xe_mmio_read32(gt, GT_PERF_STATUS);
 		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
 	}
 
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-- 
2.25.1

