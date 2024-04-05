Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBE1CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9C113A55;
	Fri,  5 Apr 2024 08:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvxjTeAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D22113A55
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305704; x=1743841704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ORokziFlDmcNB9I1H9a7A/bQeFCYlS4zzJQvZZ41lhM=;
 b=PvxjTeAdzCEgdw+8C1NgeM3uxTpo1zXtH6MP8rS9k5bN7gPaAM7TbhyT
 Vk7tRP8dcZLNPvu3w93/r3t0i1y57yO2gM9lqHPIGp6dv/BzyuMZZsrjJ
 3q7AkJ6NS8MJz028TrkFn7+nxMgkGVfca7XUoVUzB9U3yiRuc93CLKhrs
 8gSLbbq+ZtcdQYasiqlgUfFvom0nwb6HJxeZ7xJLuK8NGVLG8+hkmK64X
 I7ARcupGU2/WeWcgbGlhuxQ+QfCW/K1gSIuVuLt5WCJnIsskDeakxGmWY
 tWMaDqeDzGk94nQD4vWWA5oWby3Es1krq0yfTOgT/UKHSPJGQRCa2xj1p A==;
X-CSE-ConnectionGUID: /6JgK01wS6mO7qXgZKS/xA==
X-CSE-MsgGUID: bGdTwoEgTdeAQilOH2LfCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7811403"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7811403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:24 -0700
X-CSE-ConnectionGUID: 2RUdIlISQL2RF68Q3B/Z3Q==
X-CSE-MsgGUID: G7o1lxxgQ4yqo9B3p5gCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="50033347"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Date: Fri,  5 Apr 2024 14:12:31 +0530
Message-Id: <20240405084231.3620848-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405084231.3620848-1-badal.nilawar@intel.com>
References: <20240405084231.3620848-1-badal.nilawar@intel.com>
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
v4: s/drm_WARN/xe_gt_WARN/ (Michal)

Cc: John Harrison <john.harrison@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 38 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 3 files changed, 39 insertions(+), 7 deletions(-)

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
index 0a8f27243c84..757cbbb87869 100644
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
@@ -279,21 +282,42 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
+				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
+{
+	u32 klv_entry[] = {
+		/* 16:16 key/length */
+		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
+		FIELD_PREP(GUC_KLV_0_LEN, 0),
+		/* 0 dwords data */
+	};
+	u32 size;
+
+	size = sizeof(klv_entry);
+
+	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
+		       "w/a klv buffer too small to add klv id %d\n", klv_id))
+		return;
+
+	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
+			 klv_entry, size);
+	*offset += size;
+	*remain -= size;
+}
+
 static void guc_waklv_init(struct xe_guc_ads *ads)
 {
+	struct xe_gt *gt = ads_to_gt(ads);
 	u64 addr_ggtt;
 	u32 offset, remain, size;
 
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
-	/* Add workarounds here
-	 *
-	 * if (XE_WA(gt, wa_id))
-	 *	guc_waklv_enable_simple(ads,
-	 *				wa_klv_id,
-	 *				&offset, &remain);
-	 */
+	if (XE_WA(gt, 14019882105))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					&offset, &remain);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 68600cdead84..98a81468bc8e 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,3 +20,4 @@
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
 14018094691	GRAPHICS_VERSION(2004)
+14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-- 
2.25.1

