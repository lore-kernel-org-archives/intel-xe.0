Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3631CCA0EED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 23:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AF110E80B;
	Wed, 20 Aug 2025 23:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZ0k/ekU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C0A10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755732660; x=1787268660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dnfe9H+ec+th/zE/VB66Eziim3ZTWlh6H89Dwy/XviY=;
 b=BZ0k/ekUVZ9BrIjJhb2MAZzM6TNEbu+BIbAqZSPJObIJfOn2mpuzUR9+
 W2RlLF+c1s/WJPpK9RpGtVv+HxXKXp8jAxl1VTo5GG1UwMOLaOC9tALD7
 PnJ1uhRwLWKnM+ldO/yIt1g0emqiNtxJ+kel5cPLpk1T4GvnWlRcFCZ+f
 5/NWxFHIyJwXnPmrhc/PZtzyPOSdY/Gcc6SjBR4/HreO5jvn52dnPCsBP
 +h1xuAWGlL95W42V2AW1jrMdyA4KrkDKJ5vRzjAFsb+32PJwBs6nmchoY
 pAvnKU3aJccegGQZwE65GzzwmuMmmSpxfVupQimOqbRRpkBIAo8Am9fol Q==;
X-CSE-ConnectionGUID: tRXMgSGATZag3ChsCw3R4w==
X-CSE-MsgGUID: e7nKSdWPTvug/LFBfRC4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45586299"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="45586299"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
X-CSE-ConnectionGUID: Qsr6eXT5Sdq7oKER5M5EGg==
X-CSE-MsgGUID: EUMMu4YZSseriiWjlHqZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167470921"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Date: Wed, 20 Aug 2025 23:30:50 +0000
Message-Id: <20250820233057.83894-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820233057.83894-1-stuart.summers@intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
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

There is a small window of time during the driver teardown where
the TLB invalidation fence->gt is set to NULL but an invalidation
worker is still alive. This won't cause an issue currently because
the tlb_invalidation structure itself is still present. However as
part of a future refactor, we are looking to split that structure
out. To be safe, go ahead and cancel any outstanding TLB invalidation
fence worker thread on _fini() since at that time we are already
tearing down the driverworker thread on _fini() since at that time we
are already tearing down the driver and don't need to continue
monitoring this.

Add a new _fini() routine on the GT TLB invalidation
side to handle this worker cleanup on driver teardown.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  |  2 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a3397f04abcc..bbf3f4da7f54 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -69,6 +69,8 @@ static void gt_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_gt *gt = arg;
 
+	xe_gt_tlb_invalidation_fini(gt);
+
 	destroy_workqueue(gt->ordered_wq);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 75854b963d66..170f6c97268f 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -188,6 +188,27 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
+/**
+ *
+ * xe_gt_tlb_invalidation_fini - Clean up GT TLB invalidation state
+ *
+ * Cancel pending fence workers and clean up any additional
+ * GT TLB invalidation state.
+ */
+void xe_gt_tlb_invalidation_fini(struct xe_gt *gt)
+{
+	/*
+	 * At this point, we expect any outstanding TLB transactions
+	 * to still signal through the normal channels of interrupts
+	 * or MMIO polling updates, etc. There could be some workers
+	 * triggered as a result of timeouts in those channels, though,
+	 * that we want to make sure get cleaned up during an unbind.
+	 * So here, cancel the delayed work, but let the normal fence
+	 * signaling handle the rest.
+	 */
+	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+}
+
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 {
 	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index f7f0f2eaf4b5..3e4cff3922d6 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -16,6 +16,7 @@ struct xe_vm;
 struct xe_vma;
 
 int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
+void xe_gt_tlb_invalidation_fini(struct xe_gt *gt);
 
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
-- 
2.34.1

