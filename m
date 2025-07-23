Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEABC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 21:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A86710E1A7;
	Wed, 23 Jul 2025 21:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iILb+EsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D0610E077
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Jul 2025 21:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753305622; x=1784841622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKG/QQXHlppG/Ub8osszpgrjTUKqUsuyG/ege3PjxR8=;
 b=iILb+EsJo93io7wDEnf/xjdJw2c2btQCjheyj4tQHbDGECx2tv+5JIV0
 osSfo1ANIqmwwIHLnt5rhZzeOW+NP5zfqrnpTpQhRGM81Zi+aaSlixbfB
 UMo6l8NbaxKi80knv8ojBIdQ8dFZD9RrNRO8KJ0rUDJTAnAcz7JHc3B4q
 ujrrsv1MLkBD1VdnAbPhhxyb6YUu35dj9OIUWbHCqtIQB2ar9Gf48edcO
 c9Bg5QG9R9lv8xscottbGHTfgI/m4hM9LJe00UXbwSbyqyABV2NxPM1ww
 CsAQkF7756X0deDUJTh3uqzLKRpAPoo9Jo+65OHkqY1rzGpj5UGBA9aAC Q==;
X-CSE-ConnectionGUID: 2j36K2wlSZSJj0lq4/CENw==
X-CSE-MsgGUID: 1OM2m+39Q0a0kAoiVMFmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66168648"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="66168648"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 14:20:20 -0700
X-CSE-ConnectionGUID: hl7dgpjTRW+w6bgC3a3QzA==
X-CSE-MsgGUID: aWcBcBQnRbezUMiB7H7Ciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159040448"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 14:20:21 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
Date: Wed, 23 Jul 2025 14:20:19 -0700
Message-ID: <20250723212020.3678133-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
References: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

All the field generation for the CTL defines (used for GuC init data)
were hand-rolled rather than using FIELD_PREP/REG_GENMASK/BIT macros.

Also, there were a bunch of macros defined for verbosity settings that
were never used.

So fix that all up.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 21 ++++++---------------
 drivers/gpu/drm/xe/xe_guc_fwif.h | 28 +++++++++-------------------
 2 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1ca7f4f27e26..8fac3c518975 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -73,8 +73,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
 		flags |= GUC_LOG_DISABLED;
 	else
-		flags |= GUC_LOG_LEVEL_TO_VERBOSITY(level) <<
-			 GUC_LOG_VERBOSITY_SHIFT;
+		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
 
 	return flags;
 }
@@ -117,22 +116,14 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
 	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
 
-	BUILD_BUG_ON((CRASH_BUFFER_SIZE / LOG_UNIT - 1) >
-			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
-	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) >
-			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
-	BUILD_BUG_ON((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) >
-			(GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT));
-
 	flags = GUC_LOG_VALID |
 		GUC_LOG_NOTIFY_ON_HALF_FULL |
 		CAPTURE_FLAG |
 		LOG_FLAG |
-		((CRASH_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
-		((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
-		((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) <<
-		 GUC_LOG_CAPTURE_SHIFT) |
-		(offset << GUC_LOG_BUF_ADDR_SHIFT);
+		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
+		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
 
 	#undef LOG_UNIT
 	#undef LOG_FLAG
@@ -145,7 +136,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 {
 	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
-	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
+	u32 flags = FIELD_PREP(GUC_ADS_ADDR, ads);
 
 	return flags;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb..b05646cb4fb1 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -84,13 +84,10 @@ struct guc_update_exec_queue_policy {
 #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
 #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
 #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
-#define   GUC_LOG_CRASH_SHIFT		4
-#define   GUC_LOG_CRASH_MASK		(0x3 << GUC_LOG_CRASH_SHIFT)
-#define   GUC_LOG_DEBUG_SHIFT		6
-#define   GUC_LOG_DEBUG_MASK	        (0xF << GUC_LOG_DEBUG_SHIFT)
-#define   GUC_LOG_CAPTURE_SHIFT		10
-#define   GUC_LOG_CAPTURE_MASK	        (0x3 << GUC_LOG_CAPTURE_SHIFT)
-#define   GUC_LOG_BUF_ADDR_SHIFT	12
+#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
+#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
+#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
+#define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
 
 #define GUC_CTL_WA			1
 #define   GUC_WA_GAM_CREDITS		BIT(10)
@@ -110,21 +107,14 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3
-#define   GUC_LOG_VERBOSITY_SHIFT	0
-#define   GUC_LOG_VERBOSITY_LOW		(0 << GUC_LOG_VERBOSITY_SHIFT)
-#define   GUC_LOG_VERBOSITY_MED		(1 << GUC_LOG_VERBOSITY_SHIFT)
-#define   GUC_LOG_VERBOSITY_HIGH	(2 << GUC_LOG_VERBOSITY_SHIFT)
-#define   GUC_LOG_VERBOSITY_ULTRA	(3 << GUC_LOG_VERBOSITY_SHIFT)
-#define	  GUC_LOG_VERBOSITY_MIN		0
+#define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
 #define	  GUC_LOG_VERBOSITY_MAX		3
-#define	  GUC_LOG_VERBOSITY_MASK	0x0000000f
-#define	  GUC_LOG_DESTINATION_MASK	(3 << 4)
-#define   GUC_LOG_DISABLED		(1 << 6)
-#define   GUC_PROFILE_ENABLED		(1 << 7)
+#define	  GUC_LOG_DESTINATION		REG_GENMASK(5, 4)
+#define   GUC_LOG_DISABLED		BIT(6)
+#define   GUC_PROFILE_ENABLED		BIT(7)
 
 #define GUC_CTL_ADS			4
-#define   GUC_ADS_ADDR_SHIFT		1
-#define   GUC_ADS_ADDR_MASK		(0xFFFFF << GUC_ADS_ADDR_SHIFT)
+#define   GUC_ADS_ADDR			REG_GENMASK(21, 1)
 
 #define GUC_CTL_DEVID			5
 
-- 
2.49.0

