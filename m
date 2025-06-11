Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1E0C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB0B10E733;
	Wed, 11 Jun 2025 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8eGUVj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2009110E736
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749675955; x=1781211955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SfDrtFlxRL/aoypMfSyd2S8GCYgiANpYYRWOnAJlKyY=;
 b=Y8eGUVj1uf//K1/RlKjrGhWNx4BjIwT59m0WlIXOtsesFMXJ6WqEFYEu
 zfcd8yKX6KkXcJngts1bkYkr37wbX/L8Ddd96Bs764Th9JzDyw+De3pKd
 fUnRfp64MZmZYC81I+75kBgpuHRyEVAx6O+dVnme6CZhvL5G/6LPKBgYX
 bw7ySYaGBKkmZgL3LCEURLsRR0z6PuJNBdAqqFl9cgYpSu4Yo02hbOO/g
 KWu84fbxlsDjhWjkKE1u5sj44tWdBjCed8jN8q4b/OzEZqWbT2U9EGBlj
 gozxB66uLPnVAg7NDI1R9U4Lyx/VT8EYY+vnJ09PjFS5aKxtrL3bWipbT A==;
X-CSE-ConnectionGUID: 99gWatVcQ1u+oNG1SiMZTw==
X-CSE-MsgGUID: rB8Fi52WTJmqHo5Qul1ZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="54462480"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="54462480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:05:54 -0700
X-CSE-ConnectionGUID: ryYBSWg6RtOuqgSxlRTMgQ==
X-CSE-MsgGUID: 7fxXsx/lQDuEk+MulmHINw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152198739"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2025 14:05:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Clean up of GuC 'CTL' defines
Date: Wed, 11 Jun 2025 14:05:52 -0700
Message-ID: <20250611210553.3756700-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
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
were never used - it's just a number from 0 to 3, why do we need a define
for each level!?

So fix that all up.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 21 ++++++---------------
 drivers/gpu/drm/xe/xe_guc_fwif.h | 28 +++++++++-------------------
 2 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0fcdf389711a..e16d19b44bcc 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -72,8 +72,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
 		flags |= GUC_LOG_DISABLED;
 	else
-		flags |= GUC_LOG_LEVEL_TO_VERBOSITY(level) <<
-			 GUC_LOG_VERBOSITY_SHIFT;
+		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
 
 	return flags;
 }
@@ -116,22 +115,14 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
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
@@ -144,7 +135,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
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

