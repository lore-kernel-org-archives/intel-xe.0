Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D28C25B7D
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 07:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710E410E3DA;
	Fri, 24 May 2024 07:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYF8Utq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137CC10E54A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716535196; x=1748071196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5y8XKUSI7sGDMsWPnGg/d1Q03XWkDs9bRyefJ2STsls=;
 b=fYF8Utq7yJnRwRpQKv+fBVYuLmzqFK87GlQVC0R9j6e9sHhQaqC8GHY6
 y4DwYB5ttBDtozPm4Cme9/qcdnOLY5qqICQ7ZGxWi1s8poxBbTgC1O6dG
 pgqgfywfUQ6Kx/A9CaJjTyAtykolx2VWeKC+TFCz4rWD7I49edhJUaMFD
 6he1X3i25ky1z/o+MI65tB9/w4ZXfan2GOsZBc34JL+jmWEOcHqdmiBR9
 iXIVF+sPu4Qw2VekBiP5L713yhJp6q7cuxHGm2xLuqO6z2oergo2yrVVs
 tppZ5Gkn73JMNBYd3C3OqmdbGoRUACsENotJcWKWMrIGbIpAmlWinmSDF g==;
X-CSE-ConnectionGUID: U+xJJNcxRS6gb5f0LA++ww==
X-CSE-MsgGUID: N9MHmL4XSOCrYuXQ7arRhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13130619"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13130619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:56 -0700
X-CSE-ConnectionGUID: CbEWVQAVTsClTptTeZ+1xg==
X-CSE-MsgGUID: WZQ1GMC6Th67WTr4RZ6TLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="64751299"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/5] drm/xe: Split lrc seqno fence creation up
Date: Fri, 24 May 2024 09:19:37 +0200
Message-ID: <20240524071940.83042-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
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

Since sometimes a lock is required to initialize a seqno fence,
and it might be desirable not to hold that lock while performing
memory allocations, split the lrc seqno fence creation up into an
allocation phase and an initialization phase.

Since lrc seqno fences under the hood are hw_fences, do the same
for these and remove the xe_hw_fence_create() function since it
is not used anymore.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 59 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hw_fence.h |  7 ++--
 drivers/gpu/drm/xe/xe_lrc.c      | 48 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.h      |  3 ++
 4 files changed, 101 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index f872ef103127..35c0063a831a 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -208,23 +208,58 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 	return container_of(fence, struct xe_hw_fence, dma);
 }
 
-struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
-				       struct iosys_map seqno_map)
+/**
+ * xe_hw_fence_alloc() -  Allocate an hw fence.
+ *
+ * Allocate but don't initialize an hw fence.
+ *
+ * Return: Pointer to the allocated fence or
+ * negative error pointer on error.
+ */
+struct dma_fence *xe_hw_fence_alloc(void)
 {
-	struct xe_hw_fence *fence;
+	struct xe_hw_fence *hw_fence = fence_alloc();
 
-	fence = fence_alloc();
-	if (!fence)
+	if (!hw_fence)
 		return ERR_PTR(-ENOMEM);
 
-	fence->ctx = ctx;
-	fence->seqno_map = seqno_map;
-	INIT_LIST_HEAD(&fence->irq_link);
+	return &hw_fence->dma;
+}
 
-	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
-		       ctx->dma_fence_ctx, ctx->next_seqno++);
+/**
+ * xe_hw_fence_free() - Free an hw fence.
+ * @fence: Pointer to the fence to free.
+ *
+ * Frees an hw fence that hasn't yet been
+ * initialized.
+ */
+void xe_hw_fence_free(struct dma_fence *fence)
+{
+	fence_free(&fence->rcu);
+}
 
-	trace_xe_hw_fence_create(fence);
+/**
+ * xe_hw_fence_init() - Initialize an hw fence.
+ * @fence: Pointer to the fence to initialize.
+ * @ctx: Pointer to the struct xe_hw_fence_ctx fence context.
+ * @seqno_map: Pointer to the map into where the seqno is blitted.
+ *
+ * Initializes a pre-allocated hw fence.
+ * After initialization, the fence is subject to normal
+ * dma-fence refcounting.
+ */
+void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
+		      struct iosys_map seqno_map)
+{
+	struct  xe_hw_fence *hw_fence =
+		container_of(fence, typeof(*hw_fence), dma);
+
+	hw_fence->ctx = ctx;
+	hw_fence->seqno_map = seqno_map;
+	INIT_LIST_HEAD(&hw_fence->irq_link);
+
+	dma_fence_init(fence, &xe_hw_fence_ops, &ctx->irq->lock,
+		       ctx->dma_fence_ctx, ctx->next_seqno++);
 
-	return fence;
+	trace_xe_hw_fence_create(hw_fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index cfe5fd603787..f13a1c4982c7 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -24,7 +24,10 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name);
 void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx);
 
-struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
-				       struct iosys_map seqno_map);
+struct dma_fence *xe_hw_fence_alloc(void);
 
+void xe_hw_fence_free(struct dma_fence *fence);
+
+void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
+		      struct iosys_map seqno_map);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f679cb9aaea7..c28796cfaa03 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1033,10 +1033,54 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc)
 	return __xe_lrc_seqno_ggtt_addr(lrc);
 }
 
+/**
+ * xe_lrc_alloc_seqno_fence() - Allocate an lrc seqno fence.
+ *
+ * Allocate but don't initialize an lrc seqno fence.
+ *
+ * Return: Pointer to the allocated fence or
+ * negative error pointer on error.
+ */
+struct dma_fence *xe_lrc_alloc_seqno_fence(void)
+{
+	return xe_hw_fence_alloc();
+}
+
+/**
+ * xe_lrc_free_seqno_fence() - Free an lrc seqno fence.
+ * @fence: Pointer to the fence to free.
+ *
+ * Frees an lrc seqno fence that hasn't yet been
+ * initialized.
+ */
+void xe_lrc_free_seqno_fence(struct dma_fence *fence)
+{
+	xe_hw_fence_free(fence);
+}
+
+/**
+ * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
+ * @lrc: Pointer to the lrc.
+ * @fence: Pointer to the fence to initialize.
+ *
+ * Initializes a pre-allocated lrc seqno fence.
+ * After initialization, the fence is subject to normal
+ * dma-fence refcounting.
+ */
+void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
+{
+	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
+}
+
 struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
 {
-	return &xe_hw_fence_create(&lrc->fence_ctx,
-				   __xe_lrc_seqno_map(lrc))->dma;
+	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
+
+	if (IS_ERR(fence))
+		return fence;
+
+	xe_lrc_init_seqno_fence(lrc, fence);
+	return fence;
 }
 
 s32 xe_lrc_seqno(struct xe_lrc *lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b9da1031083b..7a8752fd8484 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -44,6 +44,9 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
 u64 xe_lrc_descriptor(struct xe_lrc *lrc);
 
 u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
+struct dma_fence *xe_lrc_alloc_seqno_fence(void);
+void xe_lrc_free_seqno_fence(struct dma_fence *fence);
+void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
 struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
 s32 xe_lrc_seqno(struct xe_lrc *lrc);
 
-- 
2.44.0

