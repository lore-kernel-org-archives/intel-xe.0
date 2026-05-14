Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4226ECD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554810F25B;
	Thu, 14 May 2026 15:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFRpfRID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB0A10E5CF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770825; x=1810306825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6g2XBopCRhhuGRdeP3zvrZcbikx2JV8L816ddh+zTbQ=;
 b=gFRpfRIDnonOOoM2Sa8ztRmTN1JOfv8Vof3zxOKwmXb+7nwI7Gn9z3Ct
 1Vz1meA7Umt0rxRay1ALJxArxsckgdw+9mfwjwP+iPbtdw2CfIwskKdMy
 ZXD8nRB6WN1lFU5oWWtxWGJZIotPYa9rFuP2h0i2rX9qYrDgk8nsGoYtY
 jYBDKG+xhTrgLrihiUXdtM14yvCAAhStsDmrJxtD/QeSDP7NduSDBu2gC
 Sk1O10OdQTNz6do/6+8lB9h9ULOrGbiOMpnYperXUSJtVjDmjNGCdw280
 PCoLnFgjjnpi3xLLcz5Z6zbk0uN1gIseZTvcl/vpbN0pWJMjlL58zM7ir A==;
X-CSE-ConnectionGUID: 6q+f+C7WRpC7FUkLcBSBYQ==
X-CSE-MsgGUID: rwjz7iWBR+eR4UJDRg0MHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178829"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:25 -0700
X-CSE-ConnectionGUID: 7nSYzBv6Trugg8WJ0/W2eA==
X-CSE-MsgGUID: PwRko1LkT2KfN7rWp3w9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152859"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/9] drm/xe/memirq: Update GuC initialization and IRQ handler
Date: Thu, 14 May 2026 17:00:04 +0200
Message-ID: <20260514150010.7123-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

