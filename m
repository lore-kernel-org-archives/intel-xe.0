Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25536E7716E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 01:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B0E10E120;
	Fri,  6 Dec 2024 01:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkCAdO0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CF910E120
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 01:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733449833; x=1764985833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AupmiJXRxETNi1I1WD9E6/yUQlLJcDyw7WVL3xaYCQQ=;
 b=BkCAdO0+0tAPinxkZoMHBes5sCTgSs8H+x4ikQThJeETntBsD7bA6jst
 +F7hFP/BAVzetG3oCkT8D327MaQCbSU6jViR8wfvf6U8NOvxJBAjTDXyh
 zE1a+5xeMRmzM0E7gu8BZOjCHojyeCnCuueKGkEwWwEd9zXkQF2dNGZ9w
 U6NmIVQnICE6gu+Lp5pDsQaUHXZNlEKtS3b/kPjGK3N46FINf7htXafRX
 37xrIAkrRhwLr/mZGco2FirrqYUAAcZVQJEx9zYADqt/tG6XgDpAksZdI
 gi82P4NNxBP5BZvVPIL1hSGdKGOd4+vJ5ZMrYu0knUlqoGH1ucB9m0C1M A==;
X-CSE-ConnectionGUID: BoYeHiQsSLmjK4u+3WzJTg==
X-CSE-MsgGUID: c0+kg9BYRGe1Lj0qfwSZGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37726305"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="37726305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 17:50:32 -0800
X-CSE-ConnectionGUID: aDFGzVenQ1Cw+ABk3rxQxg==
X-CSE-MsgGUID: X7LO8IbTQQybs7YTTNJ9yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94348079"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 17:50:32 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Call invalidation_fence_fini for PT inval fences in
 error state
Date: Thu,  5 Dec 2024 17:50:22 -0800
Message-ID: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Invalidation_fence_init takes a PM reference, which is released in its
_fini counterpart, so we need to make sure that the latter is called,
even if the fence is in an error state.

Since we already have a function that calls _fini() and signals the
fence in the tlb inval code, we can expose that and call it from the PT
code.

Fixes: f002702290fc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 1 +
 drivers/gpu/drm/xe/xe_pt.c                  | 3 +--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 4e9f89392160..665927b80e9e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -65,6 +65,14 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 	__invalidation_fence_signal(xe, fence);
 }
 
+void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	if (WARN_ON_ONCE(!fence->gt))
+		return;
+
+	__invalidation_fence_signal(gt_to_xe(fence->gt), fence);
+}
+
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index f430d5797af7..00b1c6c01e8d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -28,6 +28,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence,
 				       bool stack);
+void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence);
 
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 684dc075deac..65c3c1688710 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1334,8 +1334,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 		queue_work(system_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
-		dma_fence_signal(&ifence->base.base);
-		dma_fence_put(&ifence->base.base);
+		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
 	}
 	dma_fence_put(ifence->fence);
 }
-- 
2.43.0

