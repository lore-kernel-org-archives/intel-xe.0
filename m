Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C6CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827AA10E3A1;
	Tue, 26 Aug 2025 18:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgvsvUgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490F810E3A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756232957; x=1787768957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDXA1SzjNGgH5BxpivtE6OoQ+mg1AcTBnd9NEbnnyTg=;
 b=RgvsvUgnWzAEZ+fGUYLelkjxenQ6zlwVMFJ1nerDjSYtRYH3/jr58uqT
 zZZqUzljsln8QI9X7gzGvhvDxOCb6pYhEHok7vPrzXf1dRPN5ro61cMo1
 ODD6I/nrPlTmsPYdOodtAaNcFJC/NXo7l1NysAjynuLI471TJm6S5iXnN
 vhrXQSP+kNTKdqLRcSvv+S1+1ITuuFi9o3RBtOtooxSPu1536u2Mp2TMC
 FqhCrag28RDFQIdROlzTy+5Pf6JOqwCIFGmiDKI5p8xR+4A4SDPf8q7hs
 GHXRf3ykTRLfTw8jvJTshTJfF/UjxXIuGeXMVONCbgklKfM2kCu2Pel4U Q==;
X-CSE-ConnectionGUID: Y0C8xVXFTQe54v+ve+FClg==
X-CSE-MsgGUID: HaX5Fz1TSIe0q72V2Xzsbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="76080655"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="76080655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:17 -0700
X-CSE-ConnectionGUID: ebZfS0FJS2Gq463OnAGa3w==
X-CSE-MsgGUID: rsniZxOYQ9uiHDXK15wYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173800842"
Received: from dut137arlu.fm.intel.com ([10.105.23.75])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:14 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/9] drm/xe: Add xe_tlb_inval structure
Date: Tue, 26 Aug 2025 18:29:06 +0000
Message-Id: <20250826182911.392550-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826182911.392550-1-stuart.summers@intel.com>
References: <20250826182911.392550-1-stuart.summers@intel.com>
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

