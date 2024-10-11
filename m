Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CE7CEDDBD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 07:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EC110EA6D;
	Fri, 11 Oct 2024 07:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSHJK9HD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E309210EA6E
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728631598; x=1760167598;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=1BnDJ700AO5ADjJDHLOgAPtIm1j/3eACt5rKdMPn2LU=;
 b=kSHJK9HD0Q9yuxqCNj63nB5Ucm/fzLXyus/VCcvAQPulNjmpv6eLggkg
 pFmfiiBwG4h79ULODCd1j7dXUI/rHFochcRgRaRazG5dKu65t/kFzcgrY
 vn+DTnggGKK7u457fiDssYDhXAoAfoEn1hne1UyO5jlRwGK48jrLSQaGN
 OwYmDOywx8gReLf/L61gj1Svymak9dQ0E6gWcKx9qRMO6LbVQtILP2KVT
 is/ut0GOvvAkVM88Uu2TsX36ILFNW0IFg6Ggbm0BYqD+rdKD0SWFRpzME
 d8JzH5kxX78hWJD7ToIaneLG99M1zr4x6Bs6SXMKotmUOjZHblXNzZsOS Q==;
X-CSE-ConnectionGUID: UZdhqShoQA280NW1+acwBQ==
X-CSE-MsgGUID: suB/BUkYQKGAsB0uiGaReg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30895011"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="30895011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:26:37 -0700
X-CSE-ConnectionGUID: 6aXOqVgMRk+uRpYVxNWJcA==
X-CSE-MsgGUID: JH0Ae+EKRuuw8GStnj3nXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76748758"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:26:36 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 11 Oct 2024 09:26:30 +0200
Subject: [PATCH v3] drm/xe: add system memory page iterator support to
 xe_res_cursor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
X-B4-Tracking: v=1; b=H4sIACXTCGcC/43OwQrCMBAE0F+RnI00SW2MJ/9DJKSb1S5oWza1V
 KT/buqpNz0ODG/mLRIyYRLHzVswjpSoa3Mw242AJrQ3lBRzFrrQpSoKJyf0jMnDk1PHPsTo+3B
 DTwNyGDqWUbtoDRisnRNZ6RmvNH0Xzpec65BQ1hxaaBY38kMO1C/NhlIGXt8ro1r6/6+OSioJh
 4Mpywr31hYnage876B7iGV11CtPqd+ezp6pbG1LUADarb15nj/WVK9MOAEAAA==
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3367;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=1BnDJ700AO5ADjJDHLOgAPtIm1j/3eACt5rKdMPn2LU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnCNMrgCMnZtwzECBOmOE9lVIm0HkTrYlGLrYjrgXF
 n4KQ3B2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZwjTKwAKCRAjYrKT3hD919GzC/
 96W2VMYehaR5Y8pULhliYfQmfl7celAKP+E1eYLFgwqr6ohQbtHG2LO15mwlKPiQx83+gWMh2Rpe+f
 zwzBSRX5Evwu72uprbtQldL9w0dTO20L5Errry4JedWJEXLEQZZ4LHMUYrrUPnZSWtU12Z00qdc5c5
 4nxd54iYC9M7POdEJagTbjbti7+hI2RZ5zF02n0z7y3aG8yCxhUHarmSdhmYzNozf3K3PQfhs7VFCC
 fFHtcpZvCIXvbGiwvYkosbr2WtjtdGEeHel8o5Fq7TP1E+kh+/99VWUwDUQ+e+whA45I4BuR01dk5N
 dzCobwIWRPCM3XbpgSAfG4Jfl/RWDRbpQtfej4kU2jqo85zEZvDh+XvLnNshqBJoR6dJg3OdJVzPz/
 QHFEKrXj8jYnNpjRU/47tt+3tThH9OmSNbAYHCH9KtEDiLUv7UD0aPQkgS3HUK7RsN5GAFHvvSDEi2
 vIHnmHOdgHk8Lw5Hppt/PKdlBl5V6/m4VQkYtkitWxcfs=
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

Currently xe_res_cursor allows iteration only over DMA side of sg tables.
Adding possibility to iterate over pages allows the use of cursor in more
contexts.

v2: fixed wording in commit message (Jonathan)
v3: indentation and author fixes (checkpatch)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
- Link to v2: https://lore.kernel.org/r/20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com
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
index dca374b6521c..610407f23dbd 100644
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
+				     u64 start, u64 size,
+				     struct xe_res_cursor *cur, u32 mem_type)
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
+					  u64 start, u64 size,
+					  struct xe_res_cursor *cur)
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

