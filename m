Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAE9C47E49
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 17:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915210E193;
	Wed, 24 Jan 2024 17:18:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4E10EA51
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706116723; x=1737652723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qc1Gb60WpyAMmKzcoHf4NXoks47bTGEJjssF/NSUaKc=;
 b=KnPVt+GUWLQmlDaxUL9k12YDgR5TzgFlaEQIPIU6GLsOlLktGzrkxm2g
 KNRH3efqBlK0hjIJcdNG11X4QKd58y9WC1bm6ZShWXn+KSRhqCfPsYf4x
 E2vJmcELWSr92fkqjIIQ+yD7IsvPoM7cYIDY3haEHFBGQ/vGGxTCJ5h2e
 OsQ9WIr7SzjZB9hOBnEphB5K1KOBeOH2v37iovvmRQsHz5mzsnAHagFGm
 zNgpaJj6nzKGoHoJgXC9YmGz5KijSmynhziMXVYBu4eu1IvNuXDFwjsu1
 6tEERj1eKdiyrtSowr7O23AgVI9SQUYpGuNPGnZZobYuFGoLQIEKQ/HBc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8559185"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8559185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 09:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="34848984"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 09:18:40 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix crash in trace_dma_fence_init()
Date: Wed, 24 Jan 2024 09:18:30 -0800
Message-ID: <20240124171830.95774-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

trace_dma_fence_init() uses dma_fence_ops functions
like get_driver_name() and get_timeline_name() to generate trace
information but the Xe KMD implementation of those functions makes
use of xe_hw_fence_ctx that was being set after dma_fence_init().

So here just inverting the order to fix the crash.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a6094c81f2ad0..a5de3e7b0bd6a 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -217,13 +217,13 @@ struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
 	if (!fence)
 		return ERR_PTR(-ENOMEM);
 
-	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
-		       ctx->dma_fence_ctx, ctx->next_seqno++);
-
 	fence->ctx = ctx;
 	fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&fence->irq_link);
 
+	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
+		       ctx->dma_fence_ctx, ctx->next_seqno++);
+
 	trace_xe_hw_fence_create(fence);
 
 	return fence;
-- 
2.43.0

