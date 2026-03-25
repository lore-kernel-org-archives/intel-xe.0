Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D93109C034
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 16:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7633B10E7C1;
	Wed, 25 Mar 2026 16:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNW8qyOu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23810E7C1
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774454530; x=1805990530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ndn2aZnnbpO9plNfat5kpwfD1VAI717NY9iZWncwls8=;
 b=GNW8qyOu1Yoc4kc5foxkcemqgJXXJq1b7axPIpKcau4X+j7uxC7+ifYd
 5PsKUeIQJWYlpPaoK8FlYUdu66cwaxJ9mc9MkBO/mbZUdieQCMdpCEY1J
 DnU5hB0Iog54xneKgE7uHfoUQarhXJMrc56DiTx6/ECqEPptW+OgU37/7
 H0O3R7q1IuP2+JZsMexRuZs248utIe1vggKrkiG7FQzqP4DsUsuVqqBjJ
 dJuSY2/V7qGWTbvsex+/b7BLir17zclPK/PvuvtZxq0hggA9vvoVQcxQE
 DVyqt/rkPQCYC+c5SV2aDy/Nr47s5afV1BKi/+xDwVerOxPxzyihrSLGe A==;
X-CSE-ConnectionGUID: PLsodsjMRw2uEF6GmNkiwg==
X-CSE-MsgGUID: xjL0wMvHTDi3l8NWqPcE2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75690363"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75690363"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:02:04 -0700
X-CSE-ConnectionGUID: QuPy24PaQe+vXRTPMRsRgw==
X-CSE-MsgGUID: 4LsoptUQQ1SkIUBNk8IB+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223920901"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.87])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:02:02 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Add new SVM copy GT stats per size
Date: Wed, 25 Mar 2026 17:01:52 +0100
Message-ID: <20260325160152.1057556-1-francois.dugast@intel.com>
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

Breakdown the GT stats for copy to host and copy to device per size (4K,
64K 2M) to make it easier for user space to track memory migrations.
This is helpful to verify allocation alignment is correct when porting
applications to SVM.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_svm.c            | 27 ++++++++++++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 81cec441b449..59b3b23a54c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -85,7 +85,13 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_64K_CPU_COPY_US, "svm_64K_cpu_copy_us"),
 	DEF_STAT_STR(SVM_2M_CPU_COPY_US, "svm_2M_cpu_copy_us"),
 	DEF_STAT_STR(SVM_DEVICE_COPY_KB, "svm_device_copy_kb"),
+	DEF_STAT_STR(SVM_4K_DEVICE_COPY_KB, "svm_4K_device_copy_kb"),
+	DEF_STAT_STR(SVM_64K_DEVICE_COPY_KB, "svm_64K_device_copy_kb"),
+	DEF_STAT_STR(SVM_2M_DEVICE_COPY_KB, "svm_2M_device_copy_kb"),
 	DEF_STAT_STR(SVM_CPU_COPY_KB, "svm_cpu_copy_kb"),
+	DEF_STAT_STR(SVM_4K_CPU_COPY_KB, "svm_4K_cpu_copy_kb"),
+	DEF_STAT_STR(SVM_64K_CPU_COPY_KB, "svm_64K_cpu_copy_kb"),
+	DEF_STAT_STR(SVM_2M_CPU_COPY_KB, "svm_2M_cpu_copy_kb"),
 	DEF_STAT_STR(SVM_4K_GET_PAGES_US, "svm_4K_get_pages_us"),
 	DEF_STAT_STR(SVM_64K_GET_PAGES_US, "svm_64K_get_pages_us"),
 	DEF_STAT_STR(SVM_2M_GET_PAGES_US, "svm_2M_get_pages_us"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b6081c312474..081c787ddcb6 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -40,7 +40,13 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
 	XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
 	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
+	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB,
+	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB,
+	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB,
 	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
+	XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB,
+	XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB,
+	XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB,
 	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
 	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
 	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a91c84487a67..0251098650af 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -485,10 +485,33 @@ static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
 				      const enum xe_svm_copy_dir dir,
 				      int kb)
 {
-	if (dir == XE_SVM_COPY_TO_VRAM)
+	if (dir == XE_SVM_COPY_TO_VRAM) {
+		switch (kb) {
+		case 4:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB, kb);
+			break;
+		case 64:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB, kb);
+			break;
+		case 2048:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB, kb);
+			break;
+		}
 		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
-	else
+	} else {
+		switch (kb) {
+		case 4:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB, kb);
+			break;
+		case 64:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB, kb);
+			break;
+		case 2048:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB, kb);
+			break;
+		}
 		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
+	}
 }
 
 static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
-- 
2.43.0

