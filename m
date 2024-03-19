Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FA0CD11BF
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365E710FBBC;
	Tue, 19 Mar 2024 15:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTUr7yxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9410FBDE
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710863714; x=1742399714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=40esPPHF7MdYdmMDs4zD1+asKvzV6jbTHA5394Xs0yE=;
 b=HTUr7yxTBnIwcq+eWE+r9qvbw5WP7FWAhOxC6Tv7kRN40GGOAtXY0B7w
 jTlJgtUsCqRfNLpgOaGBRe0bf0mpD6RVQznfyBWbgSOZnJGvbbxXEgshA
 /Dl5oKHkrqjb4rWuYMkJq4aYa9JC4Zf53ZuR1L613IvoqBrdhM/2+IJPB
 p7EQiz8PjZ+sg3zsj+FCqVZvQdeIeT2TVttFi/wIXdQhU60UC1Y1swNyW
 HiLd6/5Qt6/a5VQQQvY/N5PRQbRvYFKjlJymsH37kVV1Junwr+yfrMTJs
 TnXJgdzKsrS4blJbJsbdU70IF/adogBGcaKIgEYoNl2fM9LFS4k8PYlm+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17145568"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="17145568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13949209"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:12 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Date: Tue, 19 Mar 2024 21:38:59 +0530
Message-Id: <20240319160859.2672825-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240319160859.2672825-1-badal.nilawar@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
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

Cc: John Harrison <john.harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 40 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 39 insertions(+), 9 deletions(-)

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
index 506f0be35763..c71228bc8d57 100644
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
@@ -279,22 +282,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
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
+		drm_warn(&ads_to_xe(ads)->drm, "Cannot apply guc wa klv_id %d\n", klv_id);
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
 	u32 addr_ggtt, offset, remain, size;
 
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

