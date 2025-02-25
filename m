Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E50C021BE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C810E7C6;
	Tue, 25 Feb 2025 19:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKFSTyDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9183710E7C6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740513578; x=1772049578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0yDBtmcQQNR5K8exw07YY70X/aKM60oddqX8YB+dL8=;
 b=FKFSTyDzXxIp0sI3NBJWAVP9viAbHf8cKVVOXFUBFlbHaqvjEcb8yhFl
 jW+EggYIDvJWhL4ooc/pta2sqmWqciSiG4BXcp78FiVKodmJPL7vf5q4J
 6uP5rsi+S9EG9YQy8CGTaeP2MwTyls9SAYfzUiTkqsR6Bv4Xud0DEFgbh
 iPxue0Q9gvz66gcmPyKxmvldBnWWWmR90/5E1Tcfgg056TnsXPloiKEbB
 esY8QcLlk1YPrPvlgGmNFdRj4zjspRY8z+4Ad2Og0T4x4i2CBxC83lPfz
 6XzQyOhybBe69iPXfPGdfv0EDum++Fqgd/DXKe5JmjDNCKHMFODfQ0feX Q==;
X-CSE-ConnectionGUID: d7poNuSYRNqd0D2JhAzZHQ==
X-CSE-MsgGUID: exgx4vJfQBSQrxiRpSwv9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45252986"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45252986"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:37 -0800
X-CSE-ConnectionGUID: VbwnrVnRRwaUiEBt1bm2Gg==
X-CSE-MsgGUID: WWU8qOcQRLSTEEbGNoP47w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147396780"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:59:36 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe/gt_pagefault: Change vma_pagefault unit to
 kilobyte
Date: Tue, 25 Feb 2025 20:57:34 +0100
Message-ID: <20250225195902.1247100-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225195902.1247100-1-francois.dugast@intel.com>
References: <20250225195902.1247100-1-francois.dugast@intel.com>
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

Increase the amount of bytes that can be counted before the counter
overflows, while not losing information as the VMA is not expected
to have sub-kilobyte size.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 46701ca11ce0..17d69039b866 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -137,7 +137,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
 	bool atomic;
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
 
 	trace_xe_vma_pagefault(vma);
 	atomic = access_is_atomic(pf->access_type);
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index af3fd03f665c..6155ea354432 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -29,7 +29,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	"tlb_inval_count",
 	"vma_pagefault_count",
-	"vma_pagefault_bytes",
+	"vma_pagefault_kb",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b072bd80c4b9..d556771f99d6 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -9,7 +9,7 @@
 enum xe_gt_stats_id {
 	XE_GT_STATS_ID_TLB_INVAL,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
-	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
+	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
-- 
2.43.0

