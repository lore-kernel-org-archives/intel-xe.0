Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0D5C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253710E4D9;
	Tue, 25 Feb 2025 13:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJqPmFVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2376B10E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489498; x=1772025498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZFynfRuwyuGaNqbK0Koz02ziJDjYgCGJmShYO52kMAk=;
 b=bJqPmFVBnxX4y0W3biVZiHMSy8cyL6oR+w3xf+J6UxgHPLKEu8HVc6QN
 XPVntGJqu/7gD5UKYEvznxpnCF0Ab94eK0DJ5BS6LNVawoeRJsoh9XDwg
 kuWIoyVTrYAepzQOjj1ZCJmygs3RwjHUxGAeuO4qsyrKfpWMO+mh51KUE
 pyBuKa2OfI72TNMFx6JphXXRRPaFd2X/v43OhXKVbMRe2F9Uhn7QT/0Eq
 AVTwUhfE/+Kig7XGF9FQh9PUUdPaSnLXfOUgTgHz6sHBVKBN43PLq5j6M
 mn9puYXJZJ1JgU5k/0dSRqQD7FxAD+JSuMDNCpvGf5FmYY9tC4qpTsUDW w==;
X-CSE-ConnectionGUID: Rldaaqu1S02xxaF3XXJ6/g==
X-CSE-MsgGUID: dYVY65emTQu+G2pk/Z9flA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41139268"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41139268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:17 -0800
X-CSE-ConnectionGUID: S4DPQ6U1RHCpPa/W99lBBw==
X-CSE-MsgGUID: 9KL03yJWQgO+mn69ei+ZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116163657"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:16 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
Date: Tue, 25 Feb 2025 14:17:04 +0100
Message-ID: <20250225131753.1170520-2-francois.dugast@intel.com>
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

Check if the atomic counter limit has been reached and if that is the
case, set the counter value to the new increment to prevent keeping
a garbage value, and notify it in the kernel log as below:

    [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 2e9879ea4674..753c081b68a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -8,8 +8,15 @@
 #include <drm/drm_print.h>
 
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
 
+static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	"tlb_inval_count",
+	"vma_pagefault_count",
+	"vma_pagefault_bytes",
+};
+
 /**
  * xe_gt_stats_incr - Increments the specified stats counter
  * @gt: GT structure
@@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 		return;
 
 	atomic_add(incr, &gt->stats.counters[id]);
-}
 
-static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
-	"tlb_inval_count",
-	"vma_pagefault_count",
-	"vma_pagefault_bytes",
-};
+	if (atomic_read(&gt->stats.counters[id]) < 0) {
+		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
+		atomic_set(&gt->stats.counters[id], incr);
+	}
+}
 
 /**
  * xe_gt_stats_print_info - Print the GT stats
-- 
2.43.0

