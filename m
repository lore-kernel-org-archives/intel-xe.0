Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD39C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272610E67E;
	Tue, 25 Feb 2025 13:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3gbbndt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0010E4D9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489501; x=1772025501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEPOlBY7BH7eRWgGIQ9W3LymA+bHX7jbo8j2dBynWfM=;
 b=N3gbbndtdG1oVtybtxw8/M1iLeHr2AX4NvNQBoCqMS3k5qtg523bx4R6
 Fm7loaGW7Ll+h7b5yJFLm+wm8jelbYyt7eANSRGC4pyuNC5Xm9HrC/uj0
 yvbZ4lvt6br1KF+htOLQ0ZE1fZYxj2qWa0lCgiwkWP+LPLeK/3omryZmu
 qAKhy4IGjnUb3MfnYAAGNRzzNZ10duAZZ16wRR2MyPVpZfp3sQz23eNhU
 zA3emKV8vUQ3wV+Hxbs7ywN7n2fpSMQCIiwFmiJnwYKVypYyd+BDa4HFC
 7TxeiUyFELRbHkADqwu6o7psRojSjTGFFvU+ooX7x/F3yetLWLTP6j/hI g==;
X-CSE-ConnectionGUID: I1fILqXHSsqnc4aQu58NCA==
X-CSE-MsgGUID: cH7HpA90QsSDdetCbN/Ttw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41139277"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41139277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:21 -0800
X-CSE-ConnectionGUID: bWWAEKWDQkmJ/LmuPhDnUA==
X-CSE-MsgGUID: fW55XwinR/uFval0389M2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116163684"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 3/3] drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte
Date: Tue, 25 Feb 2025 14:17:06 +0100
Message-ID: <20250225131753.1170520-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225131753.1170520-1-francois.dugast@intel.com>
References: <20250225131753.1170520-1-francois.dugast@intel.com>
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
index 83de2ec92fdc..50a1636773d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -14,7 +14,7 @@
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

