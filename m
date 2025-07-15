Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEBAC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B865710E6C2;
	Tue, 15 Jul 2025 21:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ds7NkkI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A597210E6C2
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752614502; x=1784150502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5asJc3A+td+cyTaQL5D0y813bnDe618astL01jcbKE=;
 b=Ds7NkkI7AHKv3d8obWNFYOZK8ezzteexqTNAcsJCVgG9svmMyHjJ1eo4
 u99UhrApFakuQHnZbjRDD6qJUIlTs+lQHbLHZjrEpE4JulkOilp5PVQwO
 xCBFD5gQDhmcN1MDC+Nl7PN/kSs9GO5mf70n/wjhOL0CZOmgdpQ9QOUse
 4eQ11S6i1OK20Cm3Fs9VTEoLbtM6mjw0bDznsJQcidqZynCxO0Y+wbJsS
 QORXA/7A4g0eKnJeDnkY52zOWondI4ZpqcZt+kwmnCqQc+60/g8rim2yK
 jegM5a+4pMJFkzU3OmInrYC8dNnC5FW8iUHF1aqm4QnPgxrLCHn1GgmE0 Q==;
X-CSE-ConnectionGUID: mVl8ODb/QgScwp3pOe4DbQ==
X-CSE-MsgGUID: HGB7+W1xS5OqwfJtQkMUaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54999488"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54999488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:41 -0700
X-CSE-ConnectionGUID: /vEis9RgT4S1cJJ8MsM+OQ==
X-CSE-MsgGUID: RiHv2p+1S4KeICNWRA4pGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156733537"
Received: from dut158arls.fm.intel.com ([10.105.23.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:39 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/4] drm/xe: Add xe_tlb_inval structure
Date: Tue, 15 Jul 2025 21:21:25 +0000
Message-Id: <20250715212125.337195-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715212125.337195-1-stuart.summers@intel.com>
References: <20250715212125.337195-1-stuart.summers@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h | 30 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h           | 29 ++-------------------
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
index 919430359103..b998276dd931 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
@@ -6,10 +6,40 @@
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
+	/** @tlb_inval.lock: protects TLB invalidation fences */
+	spinlock_t lock;
+};
+
 /**
  * struct xe_gt_tlb_inval_fence - XE GT TLB invalidation fence
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index b82795fc0070..ed21bd63b001 100644
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
@@ -186,33 +187,7 @@ struct xe_gt {
 	} reset;
 
 	/** @tlb_inval: TLB invalidation state */
-	struct {
-		/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
-#define TLB_INVALIDATION_SEQNO_MAX	0x100000
-		int seqno;
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
-		/** @tlb_inval.lock: protects TLB invalidation fences */
-		spinlock_t lock;
-	} tlb_inval;
+	struct xe_tlb_inval tlb_inval;
 
 	/**
 	 * @ccs_mode: Number of compute engines enabled.
-- 
2.34.1

