Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFBCC04A95
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBCA10E4B7;
	Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411AE10E4BC
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334758; x=1730870758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3FF4Vggekiisli3KR8GWS0ya3Ht4igh8jk4gF831JM=;
 b=lFar07T931SuNR/gmtDEz5b3Zr6oXts2RLtW92dPdJ6pUvFeLfbBUyqY
 UoCydI8/zYzJM1fafR4cGBfZxbzYMnMB+0ukGVLa7kXUOCkdAUtrb++C6
 Kazcl0sEoaHbJWuxK6bfYV6KU0rQqSsUgu/UobZC9eeeIQ7U1HdDpWm70
 Qr820dNC2jLOXcUxjrK/0isrWUZHZAV37sIa+bPocP4BgcwG7WS1q5Pu1
 xTsrt3/r0FCoGPlOromtoHGEch53MW7VkQiddYHxcWIC+GIKXaPTfNFV/
 ijDyF4MREjRRS5lFY5Ll+8JUXTFMldL79DT/ntN9o2bVig3P1zG3pMUuo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769536"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769536"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689887"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689887"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:26:00 -0800
Message-Id: <20231107052603.124361-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 24/27] drm/xe: Add xe_hw_fence_signal helper
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
Cc: Matthew Brost <matthw.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This help implement cpu binds in run_job by having a helper to signal
the cpu bind job's fence.

Signed-off-by: Matthew Brost <matthw.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_hw_fence.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a6094c81f2ad..d53124587076 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -208,6 +208,14 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 	return container_of(fence, struct xe_hw_fence, dma);
 }
 
+void xe_hw_fence_signal(struct dma_fence *dma_fence)
+{
+	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
+	struct xe_device *xe = gt_to_xe(fence->ctx->gt);
+
+	xe_map_wr(xe, &fence->seqno_map, 0, u32, dma_fence->seqno);
+}
+
 struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
 				       struct iosys_map seqno_map)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index cfe5fd603787..faa0d7fb9ce9 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -26,5 +26,6 @@ void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx);
 
 struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
 				       struct iosys_map seqno_map);
+void xe_hw_fence_signal(struct dma_fence *fence);
 
 #endif
-- 
2.34.1

