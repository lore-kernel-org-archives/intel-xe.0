Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBBC2BA15
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902AD10E963;
	Thu, 13 Jun 2024 04:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOeSh3aG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1368310E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252035; x=1749788035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zdND83iYHrJFQKCerf1zG73NbPScJxqEO61IJmXVPdw=;
 b=hOeSh3aG3SxaqTJb3/wuKsaLIONXLkCxhS6/oV+hRsUugsxzn+Jb5bO+
 389nkfqRraxw0vWBmCvGIVcwejZFxuWzrwpWZp+zbgqb3atTE55RzGsrf
 thSvrUKSNhoLxNLe4i19ddufhtfXcxH3QpKwKcjxUz5shpjW/2EIAOU3N
 42i4G8MV1lcTfptaf/DATOXyiWEZbt4vbd/rY9le+KlKz+vViyeSWjuzW
 lkTYYkL9C2J3ht2Lq1kjRVDbPFPrVdIhfFV3JarADaG7vg5P9gO+IC9IR
 +xZIP3ggNw09xOYj4dGom10GhOWsmraW8GeJKgHbvEg75sILqwpxZJ2rJ A==;
X-CSE-ConnectionGUID: /X6KGrftTC+fex98StZw8A==
X-CSE-MsgGUID: /Bzg/ePqTauZ1WJxe9vPXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847995"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: DmxRw3l+TkWn/LlTAwLSEA==
X-CSE-MsgGUID: Gjp0DrZlQaa5qwtTnSrqeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476344"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 23/42] drm/xe: Add dma_addr res cursor
Date: Thu, 13 Jun 2024 00:24:10 -0400
Message-Id: <20240613042429.637281-23-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

