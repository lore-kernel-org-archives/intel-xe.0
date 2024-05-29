Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04582C27C52
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F2E112C92;
	Wed, 29 May 2024 01:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yran3BKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F10112C8C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944733; x=1748480733;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jFz9l2C9y1/58fWHfS18IsFwC9PUB72cLueakVDLa3U=;
 b=Yran3BKx+GxrJnKknZPFziiw2PzTUtt39sCF4wMozLhMfQDW2ipg/+jQ
 VD+4KrfX8hBGGWIt6iHjpgWMHh1a58GsVZl8JPXGH1lJjesV0hNn04bXN
 HSdfYe9PALjoxblkWolahME6X+4mQ5dzAbZ25+/4VP4m2b76Er0TWQ+W8
 +z3LyfqIEzO5DtN5RKJBvtVujkBsSZlJOQE8M6rrKYIp32/7lsPehv1VC
 rBuf7cFrW7BX9O7iPZHIchIjGxLvOTjQVWNpQGYib4HAWYbbPj9tfk6tN
 v64mU5gR2VB6HPErsaz0HfiLmeU+dYLqCqTBDB58QnGknslwIdrmcLjJX g==;
X-CSE-ConnectionGUID: wCvecA8pTtaIgyTo5K6IXw==
X-CSE-MsgGUID: YubQ2sUbSgCfewZacnNyNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849809"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:19 -0700
X-CSE-ConnectionGUID: PihuHew0QgmaFrD/l/sbeg==
X-CSE-MsgGUID: 4211+QgVS6eoBW5+QLkw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700516"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:18 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 24/26] drm/xe: Add dma_addr res cursor
Date: Tue, 28 May 2024 21:19:22 -0400
Message-Id: <20240529011924.4125173-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

v1: Modify dma_addr res cursor to use new dma map API (Oak)
    With the new dma map API, we don't need a dma_address
    array to hold dma addresses. Instead, dma address is
    pre-allocated from iova address space. Modify dma_addr
    res cursor for this purpose.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 0a306963aa8e..f4f3c296035e 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -46,6 +46,7 @@ struct xe_res_cursor {
 	u32 mem_type;
 	struct scatterlist *sgl;
 	struct drm_buddy *mm;
+	bool dma_addr;
 };
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
@@ -71,6 +72,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = false;
 	if (!res)
 		goto fallback;
 
@@ -160,6 +162,7 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
 		   !IS_ALIGNED(size, PAGE_SIZE));
 	cur->node = NULL;
+	cur->dma_addr = false;
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
@@ -168,6 +171,29 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	__xe_res_sg_next(cur);
 }
 
+/**
+ * xe_res_first_dma - initialize a xe_res_cursor with dma_addr
+ *
+ * @dma_addr: dma address
+ * @start: Start of the range
+ * @size: Size of the range
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size.
+ */
+static inline void xe_res_first_dma(const dma_addr_t dma_addr,
+				    u64 size, struct xe_res_cursor *cur)
+{
+	XE_WARN_ON(!IS_ALIGNED(size, PAGE_SIZE));
+
+	cur->node = NULL;
+	cur->start = dma_addr;
+	cur->remaining = size;
+	cur->sgl = NULL;
+	cur->dma_addr = true;
+	cur->mem_type = XE_PL_TT;
+}
+
 /**
  * xe_res_next - advance the cursor
  *
@@ -194,6 +220,11 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		return;
 	}
 
+	if (cur->dma_addr) {
+		cur->start += size;
+		return;
+	}
+
 	if (cur->sgl) {
 		cur->start += size;
 		__xe_res_sg_next(cur);
@@ -235,6 +266,11 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
+	if (cur->dma_addr)
+		return cur->start;
+	else if (cur->sgl)
+		return sg_dma_address(cur->sgl) + cur->start;
+	else
+		return cur->start;
 }
 #endif
-- 
2.26.3

