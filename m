Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BC8C27C51
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0443511222D;
	Thu, 30 May 2024 00:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCoR76m/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B11123A9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029214; x=1748565214;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6k3WrDHRF0eyygxOmcKr0AaOic7jUD87Hboy8o3UGXo=;
 b=YCoR76m/xbADHQRm5rSkfbjfRgHQVCnqQyw2WjHQxf19sz5998+1h3sH
 t8o+/NJdpXf07NkslDqviqMfxsmxPGDaVy4rwzAdKZUcQfwyFBcbIbLRc
 eFzRGYxYdgzwIVS0EIyBbSul4KqW8t5ZMHZen0vkHOpDEJrHCl0cuHR6/
 bmf3jJKcLdeLVdAWDqAyTilinsePg24LXazScrv896buiczCt3tCZqTa9
 vvkq01HWj/11GFcFGJORwBreRqZV9/K+VapMBYxRhEyehuCBxcaU9xGmM
 qlZSqpoRt2vFARYyh6GU2YLZYPk6HdCM3n2LH5eplv4sgiy1/nF9R2rml w==;
X-CSE-ConnectionGUID: MQllV5KPT9GaS/owItGqBg==
X-CSE-MsgGUID: 5HvWNAPsTqCWY3i0UPVjQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975404"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:24 -0700
X-CSE-ConnectionGUID: M2KbyZ6sSnGUW0jcgeqhXA==
X-CSE-MsgGUID: AnICCLnzQbOTVSJrYO9Rsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088757"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:23 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 24/26] drm/xe: Add dma_addr res cursor
Date: Wed, 29 May 2024 20:47:30 -0400
Message-Id: <20240530004732.84898-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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
index 655af89b31a9..8cf880cd7971 100644
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
 
@@ -158,6 +160,7 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 {
 	XE_WARN_ON(!sg);
 	cur->node = NULL;
+	cur->dma_addr = false;
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
@@ -166,6 +169,29 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
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
@@ -192,6 +218,11 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
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
@@ -233,6 +264,11 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
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

