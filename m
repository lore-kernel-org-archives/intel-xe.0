Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F13CD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C61D10F24D;
	Thu, 14 May 2026 15:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSqEDS4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5E510F25A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770826; x=1810306826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rMx7Iznd5tC5yKk1VnRDYpq4ZBdxgqz7/4HNeleHHo4=;
 b=gSqEDS4ye4sKwLpCuJhHsCN618Qqld06ZcuforADsKxRkaxPvyh8Q+14
 9zPoHhowbXWtmiLeVnBiyLxcmjpKVk2VTHsvzulvrEhWthUNnxMNbdSQV
 fJ2QXI8kYeHrZ4TZReJwobSUQgH+a90cEZU+K5Ocy1TUSToW4AIjJRJxJ
 3FOLEVcyz9H7dxk+bDsutfntc1MGJuSMf/hbGHRgsPVjKfN8q+PFI+kIv
 iQfy8wV5sTwl0tS+94kniEvZu1srC8EQSRUrQHVqg2A/zKGjyGREg9WF9
 sfejiPqAXgUc90hrPNVNuRRRlps415M4NAqt3w0Eqs7YAK9E6OY+4ThUK g==;
X-CSE-ConnectionGUID: JILgQPdVTKWHUz1mpMtl2w==
X-CSE-MsgGUID: ym59gzf3TI+uAf8p9tiVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178837"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178837"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:26 -0700
X-CSE-ConnectionGUID: 5ih9mJkUQ/W8aNTplzzodQ==
X-CSE-MsgGUID: FfXzl1uJSV6eMoSvXNNHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152863"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 4/9] drm/xe/memirq: Use IRQ page from HW engine definition
Date: Thu, 14 May 2026 17:00:05 +0200
Message-ID: <20260514150010.7123-5-michal.wajdeczko@intel.com>
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

We can now drop repeated calculations of the actual IRQ page used
by the engines from our memory based interrupt handler and other
functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 38 +++++++++-------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 6d27102b8011..285fffea62d8 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -263,15 +263,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	return 0;
 }
 
-static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
-{
-	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
-	memirq_assert(memirq, memirq->bo);
-
-	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
-}
-
 /**
  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
  * @memirq: the &xe_memirq to query
@@ -286,16 +277,7 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
-	return __memirq_source_page(memirq, hwe->instance);
-}
-
-static u32 __memirq_status_page(struct xe_memirq *memirq, u16 instance)
-{
-	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
-	memirq_assert(memirq, memirq->bo);
-
-	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page);
 }
 
 /**
@@ -312,7 +294,7 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
 	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
-	return __memirq_status_page(memirq, hwe->instance);
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(hwe->irq_page);
 }
 
 /**
@@ -500,16 +482,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
  */
 void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
-	u16 offset = hwe->irq_offset;
-	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
-	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-							    XE_MEMIRQ_SOURCE_OFFSET(instance));
+	struct iosys_map source =
+		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+				      XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page));
 
-	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
-		struct iosys_map status_offset =
+	if (memirq_received(memirq, &source, hwe->irq_offset, "SRC")) {
+		struct iosys_map status =
 			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
-		memirq_dispatch_engine(memirq, &status_offset, hwe);
+					      XE_MEMIRQ_VECTOR_OFFSET(hwe->irq_page,
+								      hwe->irq_offset));
+		memirq_dispatch_engine(memirq, &status, hwe);
 	}
 }
 
-- 
2.47.1

