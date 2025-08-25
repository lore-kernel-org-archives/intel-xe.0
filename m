Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C63C8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 17:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D16810E25A;
	Mon, 25 Aug 2025 17:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsTBwPR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D68F10E522
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756144649; x=1787680649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVs8TY76p3dw/1lnzlhtnIIWB8u/wYDCgWgY9moBb2Y=;
 b=KsTBwPR2BeDzPbENqA935lM7ThfNNXs8VX3mGy72wRbnJzDy5p++NXVJ
 A9U2aRrzAde1EuhpmZjzqsUlLIB7sbKQ0Lf1M3GryRWxIMdLgHOKxTASX
 K5IXP6zPCLL3ppovjUb85O6+Y7c0g2n5Rsltq9Fz8PIrVR0K2TFxztR5B
 YTPkqr7n6Q+QeVuhHRWk4RLK5r57Q4xKJuBlcvsQGLxNGTtlzyN+9+N0X
 b8ukKD50bHrplcyP1iGYsMYjKjmAYHujIZ+jCLV30txRXyDerqYmaHDz5
 MyDJQZHHyzwWYiIODqCWbiH1qZnJOI+zpvZIbixI9VL58kJXDwMPl6MUT w==;
X-CSE-ConnectionGUID: yqz+Rv7gSfS5MuBn0x5Hog==
X-CSE-MsgGUID: IZnKigA7TJCyYr8nQWfBZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="45942699"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="45942699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 10:57:27 -0700
X-CSE-ConnectionGUID: l5QMJ0M2TWq/9vGa61vu4w==
X-CSE-MsgGUID: ePZj3d+oTei/1JWV7ZkDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168606921"
Received: from dut137arlu.fm.intel.com ([10.105.23.75])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 10:57:25 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Date: Mon, 25 Aug 2025 17:57:14 +0000
Message-Id: <20250825175721.89129-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825175721.89129-1-stuart.summers@intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
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

Add a new _fini() routine on the GT TLB invalidation
side to handle this worker cleanup on driver teardown.

v2: Move the TLB teardown to the gt fini() routine called during
    gt_init rather than in gt_alloc. This way the GT structure stays
    alive for while we reset the TLB state.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  |  2 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a3397f04abcc..178c4783bbda 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -603,6 +603,8 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	xe_gt_tlb_invalidation_fini(gt);
+
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 75854b963d66..db00c5adead9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -188,6 +188,18 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
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
+	xe_gt_tlb_invalidation_reset(gt);
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

