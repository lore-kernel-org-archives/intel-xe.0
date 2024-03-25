Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191FF10E965;
	Mon, 25 Mar 2024 14:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikXs57jh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E410E95B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378245; x=1742914245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upPEmuJm8O5f9/pSObq7PfCCg2M5u8eS5/x4s7MoKps=;
 b=ikXs57jh+auXycKfNZlJoysgUck4GAJBKYD0rKbmyI/nOELk07HarKYK
 XvhU5dCbI1Y87zUIw37ck9d1PcK0RaRCffU0MwTd1BgKY975eqVrJWS7M
 ucbK/gqQhuxJ1Xr4MoQJIXq6x7tDA3XVKDvKnvnnevOPI2dh6ArSy4xHs
 YNHJuADiZctB8eyFILzxs4VQS24Und0DJNJzNZTmdH1CF+grm0D5ppLzS
 wB5v1BbcpOskAUja/XhFsev7pVE62/Dv/5K09aXq8P+dOCKvo3RZdtguK
 qtbyNfl7UVmUPz5oYLi+NyVvECFRNClqHX/ixyWFNiA00q5+lHp2RnOHo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17819367"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17819367"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20328979"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Date: Mon, 25 Mar 2024 20:34:35 +0530
Message-Id: <20240325150435.2967536-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325150435.2967536-1-badal.nilawar@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
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

Enable GuC Wa_14019882105 to block interrupts during C6 flow
when the memory path has been blocked

v2: Make helper function generic and name it as
    guc_waklv_enable_simple (John Harrison)
v3: Make warning descriptive (John Harrison)

Cc: John Harrison <john.harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 0400bc0fccdc..5dd45e06f0b6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -319,4 +319,11 @@ enum  {
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
 
+/*
+ * Workaround keys:
+ */
+enum xe_guc_klv_ids {
+	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a98344a0ff4b..633e5fd9c738 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -7,6 +7,8 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -19,6 +21,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
@@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
+				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
+{
+	u32 size;
+	u32 klv_entry[] = {
+		/* 16:16 key/length */
+		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+		FIELD_PREP(GUC_KLV_0_LEN, 0),
+		/* 0 dwords data */
+	};
+
+	size = sizeof(klv_entry);
+
+	if (*remain < size) {
+		drm_warn(&ads_to_xe(ads)->drm,
+			 "w/a klv buffer too small to add klv id %d\n", klv_id);
+	} else {
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
+				 klv_entry, size);
+		*offset += size;
+		*remain -= size;
+	}
+}
+
 static void guc_waklv_init(struct xe_guc_ads *ads)
 {
+	struct xe_gt *gt = ads_to_gt(ads);
 	u64 addr_ggtt;
 	u32 offset, remain, size;
 
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
-	/*
-	 * Add workarounds here:
-	 *
-	 * if (want_wa_<name>) {
-	 *      size = guc_waklv_<name>(guc, offset, remain);
-	 *      offset += size;
-	 *      remain -= size;
-	 * }
-	 */
+	if (XE_WA(gt, 14019882105))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					&offset, &remain);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 48cdba1cbf95..a8d15f004b6c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,3 +19,4 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
+14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-- 
2.25.1

