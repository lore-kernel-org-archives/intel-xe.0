Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1788AC54E63
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1383B112339;
	Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXJlBZDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4E910F966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIqsKTyXdiDhtoF88uPQnRwD+lgr7urXdMLbNqeLy3Y=;
 b=lXJlBZDj0befRtaB3mBBDfKP6jbXQbVaWZkFOtyes2+KubuNoI3x8/Hj
 St7CXDsN0I1SuLKqzVwiXF6Gy4tYoh45vEODtVkwgYZBDcw/bGaBfxTJ+
 td4b7BpMCpoT/t8IhaVgmXhuHRy0w6k8z2VUkviPEJ36RYYB9rRzY7ZXU
 Z/VYfY0cTFCtRt31FdME5wh+gP6Hf+pU0K7zMyLFzQQraQft4sg31/JyT
 bpSKNU2cF5Dd71Koqp41F6LcQkRHiXogXjx2tHbZkQr8aGJ/ce9edQcI6
 0KBd169Jpj2ghz5rLfaTLLtCeZTcK4Gh2XfdgjFXUNDVwP945peNzlFss A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761970"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761970"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403015"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 16/30] drm/xe: Use ordered WQ for TLB invalidation fences
Date: Thu,  7 Mar 2024 21:07:52 -0800
Message-Id: <20240308050806.577176-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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
index 110d6917089b..a878e2217c7f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1107,7 +1107,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(ifence->gt->ordered_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		dma_fence_signal(&ifence->base.base);
-- 
2.34.1

