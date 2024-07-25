Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3769C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C9E10E87F;
	Thu, 25 Jul 2024 15:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx/mWIOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3742F10E87D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721920917; x=1753456917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AG8C3dg0me+51dGWzokS/nGpHVvLUtwr0ZhvBhjuVRs=;
 b=Cx/mWIOH0qOD+/ipRPuD5LTW6rtIxnxL0xgRw2TntP7o8U0u4l+hpNW5
 d7WzxKbdu8TttXuK2QxtyozDPYi4Yxa+FKs6O81VhNT6aaNC3ID/mXl+0
 lYtrY2VNcdznP+b1TNksbjZH+AbpTX+GWKNQrKx36dj8lYBcOwtXWu72f
 NtUzhxt2NhDlf4DBgcsHPkcNjniqJRJn0lIcwEd0Wu5s0Xy3q7WaZGExz
 7p3oGYQOPO6ctMWjE/iLv7lkPWY31rPhKIUi3OuwOtmAQ9NkWxAEXBHlq
 /MvlVzdvmWW2MQXss1sZl8e6u0dbSiEFQxUAlgw+B7h1hyE4to/uERiQQ w==;
X-CSE-ConnectionGUID: dswOnTfTQ22BsyJ0SwKLkg==
X-CSE-MsgGUID: gLHGRO7HR9uCAj1uLud73A==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42198067"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="42198067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:56 -0700
X-CSE-ConnectionGUID: JCjl6RtiRtua+LjlknxfuA==
X-CSE-MsgGUID: v+nP8RA3SQ+M9q3NAD5+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52646742"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:55 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe: Keep track of TLB inval events
Date: Thu, 25 Jul 2024 17:05:45 +0200
Message-ID: <20240725150550.13085-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240725150550.13085-1-nirmoy.das@intel.com>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
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

Use stats API to keep track of TLB invalidation events per GT.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c          | 10 +++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 31 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
 drivers/gpu/drm/xe/xe_uc_fw.c               |  2 +-
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..28a9aa18d3bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -27,6 +28,7 @@
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_sriov.h"
+#include "xe_stats.h"
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
@@ -288,6 +290,12 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
 };
 
+static void xe_gt_debugfs_stats_register(struct xe_gt *gt, struct dentry *root)
+{
+	gt->stats = xe_stats_init(&gt_to_xe(gt)->drm, root);
+	xe_gt_tlb_invalidation_stats_init(gt);
+}
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -321,4 +329,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		xe_gt_sriov_pf_debugfs_register(gt, root);
 	else if (IS_SRIOV_VF(xe))
 		xe_gt_sriov_vf_debugfs_register(gt, root);
+
+	xe_gt_debugfs_stats_register(gt, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 87cb76a8718c..60f9b8bc4121 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,11 +37,13 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 }
 
 static void
-__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
 
 	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
+	xe_stats_decrement_counter(gt->stats, "TLB_INVAL_INFLIGHT");
 	xe_gt_tlb_invalidation_fence_fini(fence);
 	dma_fence_signal(&fence->base);
 	if (!stack)
@@ -49,10 +51,10 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
 }
 
 static void
-invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+invalidation_fence_signal(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence)
 {
 	list_del(&fence->link);
-	__invalidation_fence_signal(xe, fence);
+	__invalidation_fence_signal(gt, fence);
 }
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
@@ -76,7 +78,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
 		fence->base.error = -ETIME;
-		invalidation_fence_signal(xe, fence);
+		invalidation_fence_signal(gt, fence);
 	}
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
 		queue_delayed_work(system_wq,
@@ -140,7 +142,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
-		invalidation_fence_signal(gt_to_xe(gt), fence);
+		invalidation_fence_signal(gt, fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	mutex_unlock(&gt->uc.guc.ct.lock);
 }
@@ -183,6 +185,9 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret) {
+		xe_stats_increment_counter(gt->stats, "TLB_INVAL_INFLIGHT");
+		xe_stats_increment_counter(gt->stats, "TLB_INVAL_TOTAL_SENT");
+
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
 		 * We haven't actually published the TLB fence as per
@@ -191,7 +196,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		 * we can just go ahead and signal the fence here.
 		 */
 		if (tlb_invalidation_seqno_past(gt, seqno)) {
-			__invalidation_fence_signal(xe, fence);
+			__invalidation_fence_signal(gt, fence);
 		} else {
 			fence->invalidation_time = ktime_get();
 			list_add_tail(&fence->link,
@@ -204,7 +209,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	} else if (ret < 0) {
-		__invalidation_fence_signal(xe, fence);
+		__invalidation_fence_signal(gt, fence);
 	}
 	if (!ret) {
 		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
@@ -321,7 +326,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
-		__invalidation_fence_signal(xe, fence);
+		__invalidation_fence_signal(gt, fence);
 		return 0;
 	}
 
@@ -455,7 +460,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
 			break;
 
-		invalidation_fence_signal(xe, fence);
+		invalidation_fence_signal(gt, fence);
 	}
 
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
@@ -525,3 +530,11 @@ void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fenc
 {
 	xe_pm_runtime_put(gt_to_xe(fence->gt));
 }
+
+void xe_gt_tlb_invalidation_stats_init(struct xe_gt *gt)
+{
+	xe_stats_add_entry(gt->stats, "TLB_INVAL_TOTAL_SENT",
+			   XE_STATS_TYPE_COUNTER);
+	xe_stats_add_entry(gt->stats, "TLB_INVAL_INFLIGHT",
+			   XE_STATS_TYPE_COUNTER);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index a84065fa324c..62180379cc40 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -36,4 +36,5 @@ xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 	dma_fence_wait(&fence->base, false);
 }
 
+void xe_gt_tlb_invalidation_stats_init(struct xe_gt *gt);
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 631928258d71..702b21ac611a 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -15,6 +15,7 @@
 #include "xe_oa.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
+#include "xe_stats.h"
 #include "xe_uc_types.h"
 
 struct xe_exec_queue_ops;
@@ -133,6 +134,9 @@ struct xe_gt {
 		u8 has_indirect_ring_state:1;
 	} info;
 
+	/* @stats: Track stats of various events, currently TLB inval */
+	struct xe_stats *stats;
+
 	/**
 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
 	 * register space, but have their own copy of GSI registers at a
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c1dcf58d25d7..0e51d853fa4a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -258,7 +258,7 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
 		path_override = xe_modparam.huc_firmware_path;
 		break;
 	case XE_UC_FW_TYPE_GSC:
-		path_override = xe_modparam.gsc_firmware_path;
+		path_override = "";
 		break;
 	default:
 		break;
-- 
2.42.0

