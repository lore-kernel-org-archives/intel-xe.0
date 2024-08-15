Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B5C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 19:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EFF10E529;
	Thu, 15 Aug 2024 19:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llFZsVyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162610E529
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 19:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723750470; x=1755286470;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j50y08nHPEku+dtjbpLW9JIMhyc7z9/mX2HWHFove2U=;
 b=llFZsVynEDQN/gv6ieesPN2lHNU7I3fPaDj9cBezG5RH6rdFi3jdhldw
 zma8b447oBew8Bjd5Xc3vQ+E8+n7sisrjboqrjtQHcHbCPDfETAatvfzT
 n3AW4lQ0scgSetIqbyfDk3XL2LXcquU2v6EeAHTVkjG2PkpP2wHYRjd2f
 Mjs3S+i6D7HugXQvb79z77pPCEgByJAY4J4/GYRaWJQ1LmTP+bt4CMm64
 2wzCtFTaHuPl2FKcJWhUzK2ZZiG0aqgQKxoo9z7fxIPLj+h8R8D1axQga
 tShdzyCz3GQgrZNY9bWV10GFvC8SrSY8tXNcqpva+sQykVMIjcME7bj3R A==;
X-CSE-ConnectionGUID: B74ZMDDxQOm/xgPxA0Qe4Q==
X-CSE-MsgGUID: WuB4MclCQxOy2Arheeb5pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13038366"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="13038366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:34:29 -0700
X-CSE-ConnectionGUID: YhS+hnUeT2ql0dnKsAwMDA==
X-CSE-MsgGUID: C97YdPJ0REaMRT4Ya+ehnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="60232246"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:34:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop HW fence pointer to HW fence ctx
Date: Thu, 15 Aug 2024 12:35:22 -0700
Message-Id: <20240815193522.16008-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The HW fence ctx objects are not ref counted rather tied to the life of
an LRC object. HW fences reference the HW fence ctx, HW fences can
outlive LRCs thus resulting in UAF. Drop the  HW fence pointer to HW
fence ctx rather just store was is needed directly in HW fence.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c       | 9 +++++----
 drivers/gpu/drm/xe/xe_hw_fence_types.h | 7 +++++--
 drivers/gpu/drm/xe/xe_trace.h          | 2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 45a9789cf501..25c20eac9e3a 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -148,20 +148,20 @@ static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 
-	return dev_name(gt_to_xe(fence->ctx->gt)->drm.dev);
+	return dev_name(fence->xe->drm.dev);
 }
 
 static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 
-	return fence->ctx->name;
+	return fence->name;
 }
 
 static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-	struct xe_device *xe = gt_to_xe(fence->ctx->gt);
+	struct xe_device *xe = fence->xe;
 	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
 
 	return dma_fence->error ||
@@ -253,7 +253,8 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 	struct  xe_hw_fence *hw_fence =
 		container_of(fence, typeof(*hw_fence), dma);
 
-	hw_fence->ctx = ctx;
+	hw_fence->xe = gt_to_xe(ctx->gt);
+	sprintf(hw_fence->name, "%s", ctx->name);
 	hw_fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&hw_fence->irq_link);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index b33c4956e8ea..364a61f4bfda 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 
+struct xe_device;
 struct xe_gt;
 
 /**
@@ -61,8 +62,10 @@ struct xe_hw_fence_ctx {
 struct xe_hw_fence {
 	/** @dma: base dma fence for hardware fence context */
 	struct dma_fence dma;
-	/** @ctx: hardware fence context */
-	struct xe_hw_fence_ctx *ctx;
+	/** @xe: Xe device for hw fence driver name */
+	struct xe_device *xe;
+	/** @name: name of hardware fence context */
+	char name[MAX_FENCE_NAME_LEN];
 	/** @seqno_map: I/O map for seqno */
 	struct iosys_map seqno_map;
 	/** @irq_link: Link in struct xe_hw_fence_irq.pending */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 1abdb30cb7ad..8573d7a87d84 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -309,7 +309,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 		    TP_ARGS(fence),
 
 		    TP_STRUCT__entry(
-			     __string(dev, __dev_name_gt(fence->ctx->gt))
+			     __string(dev, __dev_name_xe(fence->xe))
 			     __field(u64, ctx)
 			     __field(u32, seqno)
 			     __field(struct xe_hw_fence *, fence)
-- 
2.34.1

