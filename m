Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E8C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 20:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B02A10E3F3;
	Tue,  6 Aug 2024 20:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCXaQx9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9A10E3F2
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722974470; x=1754510470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=up73KUGxnDuZ3Lv3mojrCOr64HuXx6ZakmTHDxJtpqw=;
 b=HCXaQx9DXcXrEXr+0WiX1/skTBsTbIHRJVRanjBzdeU7BXUrd4oS22r8
 h8fhjd56DQhod2dnOcGimzD9g+PilaZ6WHSgyeH+kvV9AWIlJKGpetEYg
 hiUaSu40jPv1siw61/00LPkXwSmG7ANtTolyrUC8aS5z6QSecOF9h3nJv
 OEOA4+ZI+lxYwlEihXnDHxZH+1I9ZVxIWVAtgz+tb2jdLCHUHdZIz20P7
 l/5VVf9k402W3jdZzbyqyCscLuu8VeBR5nQoMITrQApj74lqgZuyk17vB
 ofjCkXc9JliOYFmEW6pE1WqRAi7ElvQHXQzjNtHAgowvvDmAKzcpoyjUU g==;
X-CSE-ConnectionGUID: FjR7RKxGQdS8pBN2Akuq/Q==
X-CSE-MsgGUID: AhgvKVKjTuixvHfmB5kVtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32400052"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="32400052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 13:01:09 -0700
X-CSE-ConnectionGUID: Be+ig109Qey/GJ2//VKi3g==
X-CSE-MsgGUID: k7pWNjQNSkeIdX9BJGjITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56591991"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 13:01:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
Date: Tue,  6 Aug 2024 21:45:04 +0200
Message-ID: <20240806194510.13044-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240806194510.13044-1-nirmoy.das@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add stats for tlb invalidadtion count which can be viewed with per GT
stat debugfs file.

Example output:
cat /sys/kernel/debug/dri/0/gt0/stats
tlb_inval_count: 22

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c            | 1 +
 drivers/gpu/drm/xe/xe_gt_stats.h            | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index cc69d748e8f6..adb5a9aa6bd3 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -15,6 +15,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id, int incr)
 }
 
 static const char *const stat_description[] = {
+	"tlb_inval_count",
 };
 
 int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index e83155ab1fdb..11b8ed17f9d9 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -12,6 +12,7 @@ struct xe_gt;
 //struct drm_printer;
 
 enum xe_gt_counter_stats {
+	XE_GT_COUNTER_TLB_INVAL,
 	XE_GT_COUNTER_STATS_NUM,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 87cb76a8718c..e3cdb0e041af 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -16,6 +16,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
+#include "xe_gt_stats.h"
 #include "regs/xe_guc_regs.h"
 
 #define FENCE_STACK_BIT		DMA_FENCE_FLAG_USER_BITS
@@ -213,6 +214,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			gt->tlb_invalidation.seqno = 1;
 	}
 	mutex_unlock(&guc->ct.lock);
+	xe_gt_stats_incr(gt, XE_GT_COUNTER_TLB_INVAL, 1);
 
 	return ret;
 }
-- 
2.42.0

