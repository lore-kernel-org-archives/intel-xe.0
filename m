Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB5ACD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FF010E5B4;
	Mon, 18 May 2026 19:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5V0tpjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562610E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132359; x=1810668359;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hYFhWPQJqDn3UFfuEaoDfZ5eUlnrGpcV9yxhVQQD8gg=;
 b=n5V0tpjAZQrPg3udoPltLI+hLyNZbaT55XIh71xRaNaHTehdK7Mdy4dW
 6OBnGD42lREnpQxzbkaNUj20psJAw7YIPLErA0VVHescH3Jnx14Ql/FR5
 5k1p1qZwkjViYdKNJ1MR1ZFYXW9EzM1FLiEkgfJj9kHn+lZLGFDZTiSCo
 iSnkNNuldmwuRsHRRBzB3JduQXgaqoTTr9ne9YLFRaHPMrxadH28NUaBK
 RXvY6CQ3BsITBnrFT1JVl04V1FcGLrhRC0qrmzwiGllJzTH/c6WOVM8UQ
 1JFSDoOQveDZq2MbH9Bsj+yh3MlmK4idxz9Sz5Ndh5Vfsxw7/+Ubu/XGP g==;
X-CSE-ConnectionGUID: IKx6Ik4LSuyjTwbstkvLqg==
X-CSE-MsgGUID: 9d9xFt9gQ2qBQ83GOky1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304789"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304789"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:59 -0700
X-CSE-ConnectionGUID: o1SxVAbjTcOVa0eb0Hc1Zg==
X-CSE-MsgGUID: eNV8OdbASJ+PLFFme7rLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276023"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/xe/memirq: Update GuC initialization and IRQ
 handler
Date: Mon, 18 May 2026 21:25:41 +0200
Message-ID: <20260518192547.600-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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

Introduce and use simple macro to calculate exact location of the
status vector to avoid inline calculation. Fix type for the GuC
source and status MEMIRQ addresses.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 118c2285e893..6d27102b8011 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -159,6 +159,9 @@ static const char *guc_name(struct xe_guc *guc)
 /* IMR */
 #define XE_MEMIRQ_ENABLE_OFFSET		0x440
 
+/* engine ISR vector offset */
+#define XE_MEMIRQ_VECTOR_OFFSET(page, source)	(XE_MEMIRQ_STATUS_OFFSET(page) + (source) * SZ_16)
+
 static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 {
 	/*
@@ -346,13 +349,14 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 {
 	bool is_media = xe_gt_is_media_type(guc_to_gt(guc));
 	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
-	u32 source, status;
+	u64 source, status;
 	int err;
 
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
-	source = __memirq_source_page(memirq, 0) + offset;
-	status = __memirq_status_page(memirq, 0) + offset * SZ_16;
+	/* GuC expects exact locations, it doesn't add anything on its own */
+	source = xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(0) + offset;
+	status = xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_VECTOR_OFFSET(0, offset);
 
 	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
 				source);
@@ -520,7 +524,8 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
-	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
+	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+						     XE_MEMIRQ_VECTOR_OFFSET(0, offset));
 
 	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
 				       guc_name(guc));
@@ -560,7 +565,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 	/* GuC and media GuC (if present) must be checked separately */
 
 	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
-		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_GUC)));
 		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
 	}
 
@@ -568,7 +574,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 		return;
 
 	if (memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
-		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_MGUC)));
 		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
 	}
 }
-- 
2.47.1

