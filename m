Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ABCC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65310E67C;
	Tue, 25 Feb 2025 13:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koPRJx+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD0010E4D9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489500; x=1772025500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzRZbHsgYt4jDiAB559pEKt3ZWobwwdrhse8Xq9oCaY=;
 b=koPRJx+FjR6w02yonAIIYHO8bXOqvrHmo3yhzNNk11OlR3pp4AMiuatF
 xvagT6MdNqC2nSFF9FZIm8wpUg7r6s9l+6Cp7SWq2VDXyeKkG7VKJf5Zs
 nmx2vmNrSqt2vtIOYXNT+mcAmsJ63+q9LToo7XpB33zbmpgSAeDfc5eFM
 gqZx/K7uElEC2gyEzGp2yfldZJUr7ZFVPNDRkBVlY5wBviwkONA8xjm+3
 AwdLY2GjjYPhUHft9OvDsFAZOkOFk+QFrfdSK52mpGP7kg9yLmAmXQdPR
 eR1+RF72KSjfsl7Wi+VEcCwLeENi4X/oFyAcEWVF52iXcViO40nrz6/Gw A==;
X-CSE-ConnectionGUID: RdWiHxEwQ/adAZxh/3hqGg==
X-CSE-MsgGUID: iYwkkZoVRx2ubaAAP3oL0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41139274"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41139274"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:19 -0800
X-CSE-ConnectionGUID: VGXHfjg3SHW9qhEffs5Puw==
X-CSE-MsgGUID: tpJtuI89Tb6JHwF/NSdfzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116163669"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:18:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/3] drm/xe/gt_stats: Use atomic64_t for counters
Date: Tue, 25 Feb 2025 14:17:05 +0100
Message-ID: <20250225131753.1170520-3-francois.dugast@intel.com>
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

The stats counters are now used for things like counting the VMA
bytes during page faults. During workload execution, the counter
value can grow fast and easily reach the atomic int limit, in
which case it overflows. To make this less likely to happen, push
the limit by switching to 64b atomic to store the counter value.
Overhead is very small as there are only 3 stat entries per GT as
of now, and stats are only enabled with CONFIG_DEBUG_FS.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_gt_types.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 753c081b68a6..83de2ec92fdc 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -30,11 +30,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 	if (id >= __XE_GT_STATS_NUM_IDS)
 		return;
 
-	atomic_add(incr, &gt->stats.counters[id]);
+	atomic64_add(incr, &gt->stats.counters[id]);
 
-	if (atomic_read(&gt->stats.counters[id]) < 0) {
+	if (atomic64_read(&gt->stats.counters[id]) < 0) {
 		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
-		atomic_set(&gt->stats.counters[id], incr);
+		atomic64_set(&gt->stats.counters[id], incr);
 	}
 }
 
@@ -50,8 +50,8 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_stats_id id;
 
 	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
-		drm_printf(p, "%s: %d\n", stat_description[id],
-			   atomic_read(&gt->stats.counters[id]));
+		drm_printf(p, "%s: %lld\n", stat_description[id],
+			   atomic64_read(&gt->stats.counters[id]));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..f72b965cc9e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -139,7 +139,7 @@ struct xe_gt {
 	/** @stats: GT stats */
 	struct {
 		/** @stats.counters: counters for various GT stats */
-		atomic_t counters[__XE_GT_STATS_NUM_IDS];
+		atomic64_t counters[__XE_GT_STATS_NUM_IDS];
 	} stats;
 #endif
 
-- 
2.43.0

