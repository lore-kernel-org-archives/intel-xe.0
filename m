Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60178CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 22:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8D510F605;
	Mon,  1 Apr 2024 22:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwR2ET3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241F910F604
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712009933; x=1743545933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YuGGke4xbDiu4G8LhN78sJQjwUfpKas6zLi4TJgfpcQ=;
 b=IwR2ET3ZJ5pJJRHpeXa/wczlFNIDzPDt4LNlr4WbeGIHVaKTPdGtQm0W
 NMo2cYeRBzbDRJHIPeByn50LUIkLcN4nWM60CX4dDH58repnvf9dUrZv5
 SaLRnN1lahHUDYrpJOrdcm0zcKjBZrguEjKTLbu0AsaZ6tFk6eYp7v2qL
 ubftCWfCIh5Dfxcdc61JXuBwipqBOorfK9s/GwroKQDA5txNOMTihi2Lw
 7l3+KKarYbwRK9r78mGTw/V+Mn0Zs9e0vZvWw/5wG6Ka+i7vGyYwkbrg8
 eUbuuwYQAIV7AIEgiLqmPyTv9yQijBETk5UD8qxIYGlxaDJBAPv43nGSU Q==;
X-CSE-ConnectionGUID: gX7Aijd1RN2cmgpl/XuTSQ==
X-CSE-MsgGUID: lLnUCTTvRdKmE7gy9CEhCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7022996"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7022996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="17805025"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:18:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: lucas.demarchi@intel.com,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Use ordered WQ for TLB invalidation fences
Date: Mon,  1 Apr 2024 15:19:13 -0700
Message-Id: <20240401221913.139672-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401221913.139672-1-matthew.brost@intel.com>
References: <20240401221913.139672-1-matthew.brost@intel.com>
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

TLB invalidation fences need to be ordered within an exec queue and if
an unordered WQ is used TLB invalidation fences could be reordered. Use
an ordered WQ to fix this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 580fe869b414..8f2ba4472ad0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1105,7 +1105,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(ifence->gt->ordered_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		dma_fence_signal(&ifence->base.base);
-- 
2.34.1

