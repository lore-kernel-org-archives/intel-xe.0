Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E30ACEDD91
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 13:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B3010E6FE;
	Wed,  9 Oct 2024 13:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICyS3uEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD08510E6FE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728480720; x=1760016720;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=RaB9f8p5dpAK4PUGYcdxE0aA/cjeQmM36XHd6Yr8Ntg=;
 b=ICyS3uEqJEmiQXts4E6LgiQwSjO/jAfYxrXIdcMBTM2xtixVgUrUmJH8
 6rti62WiC0ea9xvl095PDsg3wZpdCJwooT8bLSSqX+RVJ81LAHFeB8gqO
 oHlZnyjC3wknuHJTWPo1OmZNE+dsclXj0OyRzeI8HK59OxvXLOtz5Mzq1
 IRDSlZzU0EaqoUwBNjTj9r2YfLUhA4fPrQhXtV/oMW2aw/ybwmi235e4j
 dNL+4vzZYprEm4N8wBVLj53r/yRY7Y29c9dpgqYnKM9HinLlicsYxWga8
 ovpPgVB5fdkAgNZ1y3T2wPdSV8OxZ55GQadnvtN1rnkCTszYY8nV0b+2k A==;
X-CSE-ConnectionGUID: 6ds3Pw6OQUKXmpM4A6Ua4A==
X-CSE-MsgGUID: 1ZITk6SqRC2XHZxyxa7Law==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27728280"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27728280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:31:59 -0700
X-CSE-ConnectionGUID: zwGuuYaYSRuQXB3B+ZpFWQ==
X-CSE-MsgGUID: V/vJFUZuTRyZKPEIfYX9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76704339"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:31:59 -0700
From: Hajda <andrzej.hajda@intel.com>
Date: Wed, 09 Oct 2024 15:31:37 +0200
Subject: [PATCH] drm/xe: add system memory page iterator support to
 xe_res_cursor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com>
X-B4-Tracking: v=1; b=H4sIALiFBmcC/x3NQQrDIBBA0auEWVcwplDsVUqRUafJLKoyk5RAy
 N1ru3yb/w9QEiaF+3CA0IeVa+kYLwOkBctMhnM3OOuuo7Xe7BSENKRNtErAnEPDmQKvJLhWMdn
 5fJvSRNF76JUm9OL9f3g8uyMqmShY0vLrZnmblRuc5xel5x5qiwAAAA==
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RaB9f8p5dpAK4PUGYcdxE0aA/cjeQmM36XHd6Yr8Ntg=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnBoXN73Uc5fcEvjivhPLLwCLef6hSP7XNxJkJKC/f
 NH+nA7mJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZwaFzQAKCRAjYrKT3hD91xPRC/
 sF/SEpK35EBCeZUXiaNAuYVRqeIzzQ6GtYJazql9IP1Nnf8DZrjxx16kr09RAwYVsGIpemvSqmyVxp
 Xn9VImx6y1pDMejM/jhCinD8t4xxa3tndHKXIkXBbOdudO20S91O0PHtMYzO5tXi0jzkV4UopWn56G
 iWNaD50K3NML63fWRWn0wXFa/JFWZtQt4zoSxqxmCdoLBqjyryXU10jrapxP0NwKuX8Ru7cq4k1X9B
 b+IBQQhDbwsdY5C8boBeBRSrtVucpP3xZHuRQVxVbhEk+cSbS/o2a0QTa/TAtkU0OvRM6c+kJlItOC
 sNu1NR/sJm94XVIo9cC5Tq2mSyQYAmcAHb64l3IlfQQBCoT3orWvPdKUPrCnyXBGueW6FgcpNwk8zI
 gnuzpmvs5PSdTj5qdMzCare8SvZad1GEcBIyda8pBpx2YnyXwlN8L3vYRc15UTKDikTtepp6zE7IAQ
 T4LYuEjpll/UTpog8WTPxmX2q3U5gXY++tD+8Bdu6h3/I=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Currently xe_res_cursor allows iteration only over DMA side of scatter
gatter tables. Adding possibility to iterate over pages allows
to use the cursor in more contexts.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi all,

This patch is required to proper implementation of userptr_vma access
in configurations with iommu turned on[1]. Required by upcoming eudebug
feature.

[1]: https://lore.kernel.org/intel-xe/20241001144306.1991001-13-mika.kuoppala@linux.intel.com/

Regards
Andrzej
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..c1f39a680ae0 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 {
 	struct scatterlist *sgl = cur->sgl;
 	u64 start = cur->start;
+	unsigned int len;
 
-	while (start >= sg_dma_len(sgl)) {
-		start -= sg_dma_len(sgl);
+	while (true) {
+		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);
+		if (start < len)
+			break;
+		start -= len;
 		sgl = sg_next(sgl);
 		XE_WARN_ON(!sgl);
 	}
-
 	cur->start = start;
-	cur->size = sg_dma_len(sgl) - start;
+	cur->size = len - start;
 	cur->sgl = sgl;
 }
 
+static inline void __xe_res_first_sg(const struct sg_table *sg,
+				   u64 start, u64 size,
+				   struct xe_res_cursor *cur, u32 mem_type)
+{
+	XE_WARN_ON(!sg);
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->size = 0;
+	cur->sgl = sg->sgl;
+	cur->mem_type = mem_type;
+	__xe_res_sg_next(cur);
+}
+
 /**
  * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
  *
@@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   u64 start, u64 size,
 				   struct xe_res_cursor *cur)
 {
-	XE_WARN_ON(!sg);
-	cur->node = NULL;
-	cur->start = start;
-	cur->remaining = size;
-	cur->size = 0;
-	cur->sgl = sg->sgl;
-	cur->mem_type = XE_PL_TT;
-	__xe_res_sg_next(cur);
+	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
+}
+
+/**
+ * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
+ *
+ * @sg: scatter gather table to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size
+ */
+static inline void xe_res_first_sg_system(const struct sg_table *sg,
+				   u64 start, u64 size,
+				   struct xe_res_cursor *cur)
+{
+	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);
 }
 
 /**

---
base-commit: f1561e6c62b5b5c3fe0276f2fbe7325e0d7c262d
change-id: 20241009-xe_res_cursor_add_page_iterator-d29d73c3eb99

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

