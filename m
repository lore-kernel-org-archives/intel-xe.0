Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A215E784AC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D43112ACD;
	Thu, 25 Dec 2025 01:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIBMa3Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D19113F6F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OX17oB/GhX5ewkdaCHtK9/WL1ON3rNbgZMQu1I55Irw=;
 b=fIBMa3BkaxVeVMBZbd9mp1QZh3yY7SAFAm7XjjAnI7qt285HMmgViF1Z
 /wE8rL5FeiYvuxex342N5HJMzZ5hrSDou02gfG0PH0lplF++UmJ9D4ADW
 qPvjfSkE6oKXsCMp8wiVik1eiPxlM6gYagza3DVU+ZyG129KIeebImiFS
 ab8rSbPzjmGtMujGz9I8ZkgV2khGoXRZKSUS0xk+ADzF38ZzoUQVA/81N
 ls4xirE6a9s3QwNkD6m3fjVzcPuRlUHU6RrUrdlUhyTZTdHO34Tn7QsLZ
 uIQoTBiiPcmLrwEE9dPfHMyUl+EQ4Wcyo1tMxu+ecc72etb1DLFwPzlrW w==;
X-CSE-ConnectionGUID: a30Mer2YSgOSJboLuaEIGA==
X-CSE-MsgGUID: Hj34yvAWQs2FIcIyvTVT6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866359"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: RX2vbqlgQzeTs0ww1AH5rg==
X-CSE-MsgGUID: 6kAacugNRA28szkh21fQAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629131"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 05/13] drm/xe: Export to_xe_hw_fence
Date: Wed, 24 Dec 2025 17:17:26 -0800
Message-Id: <20251225011734.341683-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Allow other layers to operate on hardware fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 9 ++++++---
 drivers/gpu/drm/xe/xe_hw_fence.h | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 5995bf095843..ec06b1eaf004 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -138,8 +138,6 @@ void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)
 {
 }
 
-static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
-
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
 	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
@@ -200,7 +198,12 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
 	.release = xe_hw_fence_release,
 };
 
-static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
+/**
+ * to_xe_hw_fence() - Convert dma-fence to Xe hardware fence
+ *
+ * Return: struct xe_hw_fence or NULL
+ */
+struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 {
 	if (XE_WARN_ON(fence->ops != &xe_hw_fence_ops))
 		return NULL;
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 7a8678c881d8..4d5756681279 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -30,4 +30,7 @@ void xe_hw_fence_free(struct dma_fence *fence);
 
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 		      struct xe_exec_queue *q, struct iosys_map seqno_map);
+
+struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
+
 #endif
-- 
2.34.1

