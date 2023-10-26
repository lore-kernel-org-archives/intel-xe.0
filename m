Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36417C27C4C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1594B10E74C;
	Thu, 26 Oct 2023 04:02:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EEB10E752
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292914; x=1729828914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3FF4Vggekiisli3KR8GWS0ya3Ht4igh8jk4gF831JM=;
 b=N+7IS6mPdEqCdNWK7UXl6KVhIwsrD3x5GTVIuGDIL0oS8v7e4ek+Z/ik
 0TnDtMMKO80Z3Hsz0gBYbaef9XVQEaOyUd/QnlfH285gDYcm4kh0EWHV8
 YcKq/xvJ4841fjzJR7HPjcYwkPGTUnGKtD3VxipmfFpCLH0ZY4qSHVaFb
 4VGYVEEJfX/e6EFUs011LaeFDCR+0bxf2TwBP+vVMLeZfk6SCr3USwLaE
 GOWfDrWvUwyqVVh1iRNDWA3GrvGzZ78QpmTMLAl6BarhJGiszCGs0lWZ7
 bejfZ3MTGKZPdH1KaVYPY5Xf6WeUt7cVLaj8NgYpprrYG8Jp92A2923rr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822014"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822014"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682423"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682423"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:10 -0700
Message-Id: <20231026040213.1272993-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 23/26] drm/xe: Add xe_hw_fence_signal helper
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

