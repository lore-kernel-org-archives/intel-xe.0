Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853ACD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633910F266;
	Thu, 14 May 2026 15:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTFay/i8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACAC10F25A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770830; x=1810306830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vUO2Tp1w4rs4k135VqPrSLtvZRd+2BYqiLkFVYEA/+Y=;
 b=TTFay/i8THAhvYdNTiW9jQPgbXnff29c1vTs1Z3j1yd32qVIbIQD5d/q
 P9okZa14FscL9NFDDA6Veh6eoLIUBLAidNMlO2KYiBZrWT3c17gwu9r+V
 QOq1sIy+tZW4+fXzs3cjNSJlxZ2DyAVTwlztgjPzIqbVt/9z4W3algZF9
 PwtCW+D4aViwdQ3HArAfhTs9T07LybZv3Ph+W4z+FneXnYn/MAi5ndYVp
 b4yLXkE+8B6+H+dYG5tKrNIcZ343VqYjNdj8MA2XIPpPiCBdyELVZOvvG
 Sw5nML63kZ2MNBzP4uAdUCr9ovbIOQLQ5Tkbjr9kPQLjPyLhWaXmmN6Wg g==;
X-CSE-ConnectionGUID: 0CkDXY8xRQOSOmnnzXqQ3w==
X-CSE-MsgGUID: HLAb5diKTwmAOWYzC99LuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178850"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178850"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:30 -0700
X-CSE-ConnectionGUID: j/iq+GUrRG+xfTvenUuOFQ==
X-CSE-MsgGUID: NPbSswqERzmzTk+e8lrhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152874"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 7/9] drm/xe/memirq: Dump all source pages if MSI-X
Date: Thu, 14 May 2026 17:00:08 +0200
Message-ID: <20260514150010.7123-8-michal.wajdeczko@intel.com>
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

When using MSI-X, engines report their source/status on a separate
MEMIRQ pages, so we need to dump additional source pages, not just
the first one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_memirq_types.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index bd2417207b0b..7bc7dc106a79 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -221,6 +221,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
 	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
 	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
+	memirq->num_pages = num_pages;
 
 	memirq_assert(memirq, !memirq->source.is_iomem);
 	memirq_assert(memirq, !memirq->status.is_iomem);
@@ -532,6 +533,18 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
 				       guc_name(guc));
 }
 
+static void memirq_dump_source_pages(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, !memirq->bo->vmap.is_iomem);
+
+	for (int n = 0; n < memirq->num_pages; n++) {
+		memirq_debug(memirq, "SOURCE %*ph\n", 32,
+			     memirq->bo->vmap.vaddr + XE_MEMIRQ_SOURCE_OFFSET(n));
+		memirq_debug(memirq, "SOURCE %*ph\n", 32,
+			     memirq->bo->vmap.vaddr + XE_MEMIRQ_SOURCE_OFFSET(n) + 32);
+	}
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
@@ -551,9 +564,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 	if (!memirq->bo)
 		return;
 
-	memirq_assert(memirq, !memirq->source.is_iomem);
-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
-	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEMIRQ))
+		memirq_dump_source_pages(memirq);
 
 	for_each_gt(gt, xe, gtid) {
 		if (gt->tile != tile)
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 02ac938cadb4..eab384342878 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -14,6 +14,7 @@ struct xe_bo;
  * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
  *
  * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
+ * @num_pages: number of per-instance source/status pages.
  * @source: iosys pointer to `Interrupt Source Report Page`_.
  * @status: iosys pointer to `Interrupt Status Report Page`_.
  * @mask: iosys pointer to Interrupt Enable Mask.
@@ -21,6 +22,7 @@ struct xe_bo;
  */
 struct xe_memirq {
 	struct xe_bo *bo;
+	unsigned int num_pages;
 	struct iosys_map source;
 	struct iosys_map status;
 	struct iosys_map mask;
-- 
2.47.1

