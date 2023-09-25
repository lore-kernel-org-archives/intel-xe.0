Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B5CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6053910E335;
	Mon, 25 Sep 2023 22:11:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D600210E335
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679889; x=1727215889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTlyI9DM9bbXAyZBhFYJjUbsS/kOYvIb/dvpAfuPW6I=;
 b=Yn3hKWmAamRBVyLlq3qriSOYOky8YQkDNYUbypG02GtZCBujJQrCc7t+
 WrYvNg7BUBuXhxM1x7XuxbRZDQlTsxRoDWzDTKRJbJXeXKsYLLnxjRq44
 piXAZO56RBERnbrGftq73scGsxbzEf9ocZ4GV4MOvbZ4XLgxyyBn/uUxK
 pEVTBmM902Lf947UIaWJowh0uR58TJnfyqtXPJFlIxVTtxi44exijCvdQ
 zUwonnj7eg96jvULY5rAxFEB/N2Fd9sC16rj5U8OPwnE46EADUJupurFm
 zcOpGDSkf9hXnGwVVQTkmzDWQ2TyDRA572Z0vjanC8gWi2/+RAEqruXGb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412333007"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412333007"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087761"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087761"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 15:10:46 -0700
Message-Id: <20230925221049.2681491-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925221049.2681491-1-lucas.demarchi@intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/9] drm/xe/pat: Keep track of relevant indexes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the PAT entries are relevant for own driver use, which varies
per platform. Let the PAT early initialization set what they should
point to so the rest of the driver can use them where needed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pat.c          | 9 +++++++++
 drivers/gpu/drm/xe/xe_pt_types.h     | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 98835ee058f5..7d0f2109c23a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -15,6 +15,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
+#include "xe_pt_types.h"
 #include "xe_pmu.h"
 #include "xe_step_types.h"
 
@@ -342,6 +343,7 @@ struct xe_device {
 		const u32 *table;
 		/** Number of PAT entries */
 		int n_entries;
+		u32 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
 	/** @d3cold: Encapsulate d3cold related stuff */
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 86386633e206..966b63252735 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -108,14 +108,23 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.ops = &mtl_pat_ops;
 		xe->pat.table = mtl_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 2;
+		xe->pat.idx[XE_CACHE_WT] = 1;
+		xe->pat.idx[XE_CACHE_WB] = 3;
 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
 		xe->pat.ops = &pvc_pat_ops;
 		xe->pat.table = pvc_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 0;
+		xe->pat.idx[XE_CACHE_WT] = 2;
+		xe->pat.idx[XE_CACHE_WB] = 3;
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
 		xe->pat.ops = &tgl_pat_ops;
 		xe->pat.table = tgl_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 3;
+		xe->pat.idx[XE_CACHE_WT] = 2;
+		xe->pat.idx[XE_CACHE_WB] = 0;
 	} else {
 		/*
 		 * Going forward we expect to need new PAT settings for most
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 64e3921a0f46..bf5000499251 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -17,6 +17,7 @@ enum xe_cache_level {
 	XE_CACHE_NONE,
 	XE_CACHE_WT,
 	XE_CACHE_WB,
+	__XE_CACHE_LEVEL_COUNT,
 };
 
 #define XE_VM_MAX_LEVEL 4
-- 
2.40.1

