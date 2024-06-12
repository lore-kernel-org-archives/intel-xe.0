Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F175CC27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B9310E769;
	Wed, 12 Jun 2024 02:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZV0naI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC1D10E782
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158541; x=1749694541;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zdND83iYHrJFQKCerf1zG73NbPScJxqEO61IJmXVPdw=;
 b=dZV0naI/05zssn5gUTX5J3zFBBjDOzRxBYrYtB5ZQpSlzkwKj0yanNta
 EdwomzjE0vredYOOayFRWMazyU9Fp8M6azuaY0u52Sl33Tu4b+jM7thou
 k49yIfXANctFuPdEHIV7QMJF0l2ua9ujvZVZe9+wqHaJzIp1Q/b3GFk3o
 HUpJ6pqlv4uR7Am65dTaA16gKi8Bo2cF0p8ttSvDMIkrtG2Gd/VIH6ahZ
 GW7M+/vC2/nhOpfVHutx9VgUjR2Utp3KGXWXr5B31hCKW/WH5V3jSv/tv
 N5/OLjMglGXCL0bVIW1K5uPELkv/VU/kNGgh8J6HiEHfhT/hDCmq2AazO w==;
X-CSE-ConnectionGUID: t0Dw2/dtQpmGRzewP/e8oQ==
X-CSE-MsgGUID: 21ek1KfETvO5i1JRL5qRUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427820"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: thig1W/KS2Sxvua8IXEXmA==
X-CSE-MsgGUID: H3WucEiFQgK30zx0DzQYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763641"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 24/43] drm/xe: Add dma_addr res cursor
Date: Tue, 11 Jun 2024 22:25:46 -0400
Message-Id: <20240612022605.385062-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 50 +++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..b17b3375f6d9 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -44,7 +44,9 @@ struct xe_res_cursor {
 	u64 remaining;
 	void *node;
 	u32 mem_type;
+	unsigned int order;
 	struct scatterlist *sgl;
+	const dma_addr_t *dma_addr;
 	struct drm_buddy *mm;
 };
 
@@ -71,6 +73,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = NULL;
 	if (!res)
 		goto fallback;
 
@@ -161,11 +164,43 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
+	cur->dma_addr = NULL;
 	cur->sgl = sg->sgl;
 	cur->mem_type = XE_PL_TT;
 	__xe_res_sg_next(cur);
 }
 
+/**
+ * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
+ *
+ * @dma_addr: dma_addr array to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size.
+ */
+static inline void xe_res_first_dma(const dma_addr_t *dma_addr,
+				    u64 start, u64 size,
+				    unsigned int order,
+				    struct xe_res_cursor *cur)
+{
+	XE_WARN_ON(start);
+	XE_WARN_ON(!dma_addr);
+	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+		   !IS_ALIGNED(size, PAGE_SIZE));
+
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->size = PAGE_SIZE << order;
+	cur->dma_addr = dma_addr;
+	cur->order = order;
+	cur->sgl = NULL;
+	cur->mem_type = XE_PL_TT;
+}
+
 /**
  * xe_res_next - advance the cursor
  *
@@ -192,6 +227,13 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		return;
 	}
 
+	if (cur->dma_addr) {
+		cur->size = (PAGE_SIZE << cur->order) -
+			(size - cur->size);
+		cur->start += size;
+		return;
+	}
+
 	if (cur->sgl) {
 		cur->start += size;
 		__xe_res_sg_next(cur);
@@ -233,6 +275,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
+	if (cur->dma_addr)
+		return cur->dma_addr[cur->start >> (PAGE_SHIFT + cur->order)] +
+			(cur->start & ((PAGE_SIZE << cur->order) - 1));
+	else if (cur->sgl)
+		return sg_dma_address(cur->sgl) + cur->start;
+	else
+		return cur->start;
 }
 #endif
-- 
2.26.3

