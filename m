Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15C5CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 19:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A310E7BC;
	Wed, 13 Aug 2025 19:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHqCUIff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EF110E12A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755114493; x=1786650493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDXA1SzjNGgH5BxpivtE6OoQ+mg1AcTBnd9NEbnnyTg=;
 b=kHqCUIffCnvmZF+YZTzOE/9mk5Si7vo8ZF8QNYBt1tX+uxDUvX8VVtCB
 ZY/xxxdIA+SXzWJ9SRmt3GkQ9I+nOOvozyxknbKr6HZ7ZzEJNe0UeALUe
 PNYd9sS/6ktqJWghwfWQqvFosv6oP2TFKmAFa+JcxxybVuEILgPNVUbIw
 lAlt5BpwqsH3ATw4XbZVvBMfrhhJRgumdspkSK1HIBzm67XeIp42yeZ0A
 6Qv26fBZFtZs9kTWwf/ZVxK90zwDdyngsyaaKMiCSpmxXiMLcydlA1VUW
 w5ngPNoKIo/9Ln2tRRCbIKDQ7M4Q7zqIX3wjrlEpLdRArwS9HBYdxNw5w A==;
X-CSE-ConnectionGUID: HDfdEvrmTbOPi861HhnNkQ==
X-CSE-MsgGUID: G1r/3/jlT9myP2w2+JrxJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60047019"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60047019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
X-CSE-ConnectionGUID: ps5Xhd3CST2nzy0QA3RmXw==
X-CSE-MsgGUID: 0JnGGNoMQoS9oNo/aQMhOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166206188"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:48:12 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/9] drm/xe: Add xe_tlb_inval structure
Date: Wed, 13 Aug 2025 19:48:01 +0000
Message-Id: <20250813194806.140500-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813194806.140500-1-stuart.summers@intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Extract TLB invalidation state into a structure to decouple TLB
invalidations from the GT, allowing the structure to be embedded
anywhere in the driver.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h | 34 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h           | 33 ++-------------------
 2 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
index 919430359103..442f72b78ccf 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
@@ -6,10 +6,44 @@
 #ifndef _XE_GT_TLB_INVAL_TYPES_H_
 #define _XE_GT_TLB_INVAL_TYPES_H_
 
+#include <linux/workqueue.h>
 #include <linux/dma-fence.h>
 
 struct xe_gt;
 
+/** struct xe_tlb_inval - TLB invalidation client */
+struct xe_tlb_inval {
+	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
+#define TLB_INVALIDATION_SEQNO_MAX	0x100000
+	int seqno;
+	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
+	struct mutex seqno_lock;
+	/**
+	 * @tlb_inval.seqno_recv: last received TLB invalidation seqno,
+	 * protected by CT lock
+	 */
+	int seqno_recv;
+	/**
+	 * @tlb_inval.pending_fences: list of pending fences waiting TLB
+	 * invaliations, protected by CT lock
+	 */
+	struct list_head pending_fences;
+	/**
+	 * @tlb_inval.pending_lock: protects @tlb_inval.pending_fences
+	 * and updating @tlb_inval.seqno_recv.
+	 */
+	spinlock_t pending_lock;
+	/**
+	 * @tlb_inval.fence_tdr: schedules a delayed call to
+	 * xe_gt_tlb_fence_timeout after the timeut interval is over.
+	 */
+	struct delayed_work fence_tdr;
+	/** @wtlb_invalidation.wq: schedules GT TLB invalidation jobs */
+	struct workqueue_struct *job_wq;
+	/** @tlb_inval.lock: protects TLB invalidation fences */
+	spinlock_t lock;
+};
+
 /**
  * struct xe_gt_tlb_inval_fence - XE GT TLB invalidation fence
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 85cfcc49472b..7dc5a3f310f1 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_pf_types.h"
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_gt_stats_types.h"
+#include "xe_gt_tlb_inval_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_oa_types.h"
@@ -186,37 +187,7 @@ struct xe_gt {
 	} reset;
 
 	/** @tlb_inval: TLB invalidation state */
-	struct {
-		/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
-#define TLB_INVALIDATION_SEQNO_MAX	0x100000
-		int seqno;
-		/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
-		struct mutex seqno_lock;
-		/**
-		 * @tlb_inval.seqno_recv: last received TLB invalidation seqno,
-		 * protected by CT lock
-		 */
-		int seqno_recv;
-		/**
-		 * @tlb_inval.pending_fences: list of pending fences waiting TLB
-		 * invaliations, protected by CT lock
-		 */
-		struct list_head pending_fences;
-		/**
-		 * @tlb_inval.pending_lock: protects @tlb_inval.pending_fences
-		 * and updating @tlb_inval.seqno_recv.
-		 */
-		spinlock_t pending_lock;
-		/**
-		 * @tlb_inval.fence_tdr: schedules a delayed call to
-		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
-		 */
-		struct delayed_work fence_tdr;
-		/** @wtlb_invalidation.wq: schedules GT TLB invalidation jobs */
-		struct workqueue_struct *job_wq;
-		/** @tlb_inval.lock: protects TLB invalidation fences */
-		spinlock_t lock;
-	} tlb_inval;
+	struct xe_tlb_inval tlb_inval;
 
 	/**
 	 * @ccs_mode: Number of compute engines enabled.
-- 
2.34.1

