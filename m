Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162D4CD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261510E814;
	Mon, 18 May 2026 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuNTQLNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E7310E7EF
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132363; x=1810668363;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QXMA/J5R3U8Vdzet9slH1yEn7QJlTiWl5zLNpquK2x0=;
 b=MuNTQLNmeytbZIAETYH4d3/Kq/B0bqNBJVERNdrSlF9YLtGKSN3i76gq
 lWy5uE6ZrUNMPyVagLAkS1sm15/da+crTL+AHEllUwcV8WE+qGNk7Amja
 mX84nPqtXReJQ76D+OPgA3q1LcUFrfjB2KyrQMzybfU/zpNKXnQlkcBQH
 yl2wqt0uOol9XFl5UX9RMFyLXmpmIaNJ329Q/0Y0UmjCxEl1+PDKMshOI
 gWCyoFi9ht+byApPE4Oiw/PVLT1mpSnilMZD1Kqs3OjnpMQeklcFsm111
 n3MEQZlzpmCC3ZlW7foHtFm92LuA7L9Haq3qVmijrI/1/kwavxyE0xUfz Q==;
X-CSE-ConnectionGUID: yEp+tGMBSPO7TqrIQCFH9w==
X-CSE-MsgGUID: 0mC0yJjJQRGxLy51eaPz8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304797"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:03 -0700
X-CSE-ConnectionGUID: Q2AhXDn5TAuYImrtIiqdfA==
X-CSE-MsgGUID: OAolNOFFSxalzbWsxRtZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276036"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/xe/memirq: Dump all source pages if MSI-X
Date: Mon, 18 May 2026 21:25:45 +0200
Message-ID: <20260518192547.600-8-michal.wajdeczko@intel.com>
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

When using MSI-X, engines report their source/status on separate
MEMIRQ pages, so we need to dump additional source pages, not just
the first one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_memirq_types.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 8dabd6744af9..609e0f3220cc 100644
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

