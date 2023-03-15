Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B87C7618D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B5D10E8C6;
	Wed, 15 Mar 2023 15:55:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BDF10E971
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895733; x=1710431733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3kwaiVgHGSCoKFbWKl9GdI8IDHb3Mj2nV7tK3CbY0c=;
 b=naN9sCOnxQfBXRDOeaFkCZp4LwdJJfZLPnb1TMJeWRP6eXfVKc3GNgUU
 8u+xEC/tH2TWQYuJiLilsYRvt1ShRthYZRVsen0KzoLtD/r7RzpW2gqj8
 yIlwbrF9Vhw4oURKOTUfq9dM+UghtCT2v2eXZakcYmV4d2c7O0Pm0XZZm
 L5WNZzuN1uXHaK9gra8QWkYhsjKZsv/7FHrTXo4uFs1sYuVun5GBnXOwP
 W/3A5t8RA1qPr2oQ/EuEkp+cgLmcNgpBCz4in7uQE0zKbB+J8RkyAKRpd
 vINU1wguWj2+nH3KyiF/cAFDxr3HQhgBAb78sd0A+Lb87YMgGMKIhBt1a w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321583041"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321583041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711973642"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711973642"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 16:55:01 +0100
Message-Id: <20230315155507.43933-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/7] drm/xe: Use a define to set initial seqno
 for fences
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Also for HW fences, write the initial seqno - 1 to the HW completed
seqno to initialize.

v2:
- Use __dma_fence_is_later() to compare hw fence seqnos. (Matthew Auld)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c   | 5 +++--
 drivers/gpu/drm/xe/xe_hw_fence.c | 4 ++--
 drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
 drivers/gpu/drm/xe/xe_lrc.c      | 3 +++
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 3b6f8a25112a..7e6367a84f1f 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -13,6 +13,7 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
@@ -57,11 +58,11 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 
 	if (xe_engine_is_parallel(e)) {
 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
-		e->parallel.composite_fence_seqno = 1;
+		e->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
 	if (e->flags & ENGINE_FLAG_VM) {
 		e->bind.fence_ctx = dma_fence_context_alloc(1);
-		e->bind.fence_seqno = 1;
+		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
 
 	for (i = 0; i < width; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index e56ca2867545..ffe1a3992ef5 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -129,7 +129,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 	ctx->gt = gt;
 	ctx->irq = irq;
 	ctx->dma_fence_ctx = dma_fence_context_alloc(1);
-	ctx->next_seqno = 1;
+	ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
 	sprintf(ctx->name, "%s", name);
 }
 
@@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
 
 	return dma_fence->error ||
-		(s32)fence->dma.seqno <= (s32)seqno;
+		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 07f202db6526..523c2611ef5d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -8,6 +8,8 @@
 
 #include "xe_hw_fence_types.h"
 
+#define XE_FENCE_INITIAL_SEQNO 1
+
 int xe_hw_fence_module_init(void);
 void xe_hw_fence_module_exit(void);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9140b057a5ba..fb8c6f7d6528 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -697,6 +697,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
 
+	map = __xe_lrc_seqno_map(lrc);
+	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
+
 	return 0;
 
 err_lrc_finish:
-- 
2.39.2

