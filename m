Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C95CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7F910E7EF;
	Mon, 18 May 2026 19:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AksayWK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6063910E5B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132360; x=1810668360;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=usXcReshcRHEls4V0ef91ALwklkI7uU+MYqr+v/+QPk=;
 b=AksayWK4OejgKRBYoupKuC8zZ+gq2wsBTsKWTMDgnmdmfaWgb2tTR96y
 oqY6eKQv4QpV4pG5Hc/R98xHbzKuO9ZHBru4PA98T4inXtheaqQ9P6Fqo
 N/ynRHI0Akdvg5h152xL8caLMxQcvG1bDhY/0m5d06Hqsq9Z863AcNE6+
 yTZv4KOXTzyibRK7IgDrRFj7cpXilROEOA5HeCPTzkUog/BgPHZOFeTP2
 XqR2nBIouOOUloilFoT8h4mLs8yA4//i9zWqVlu82GCXw5wmlpp7cyfkf
 U8HkntFsMAfgRDubdC8FKQaNQWjLEQT4lpkPx+C+PBrU2sHji+IcBzQ7l Q==;
X-CSE-ConnectionGUID: 2kWqveJKTQSR4ZKlkFJRog==
X-CSE-MsgGUID: dj5XAUMXQJu7hxNKySCYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304791"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:00 -0700
X-CSE-ConnectionGUID: 1F6U20u8S8OPvrzXBgYpYg==
X-CSE-MsgGUID: jUcYIOqDTUGpDFS9s7BLkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276025"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/xe/memirq: Use IRQ page from HW engine definition
Date: Mon, 18 May 2026 21:25:42 +0200
Message-ID: <20260518192547.600-5-michal.wajdeczko@intel.com>
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

We can now drop repeated calculations of the actual IRQ page used
by the engines from our memory based interrupt handler and other
functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
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

