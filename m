Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A6D2447F
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 06:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A510EA3C;
	Fri, 11 Oct 2024 06:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AerPFP9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072BF10EA3C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 06:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728626756; x=1760162756;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=vJ+fpCDWb1pzj+RYDPkUqrySRqt0GqcPViJhaKE8otM=;
 b=AerPFP9OVGmiUV4jYXxEmAzl9GqGWQuhR7LVhMV2tHEXfzRE2zABwUUL
 48plilGMCSKiDVJVm55YSDHudmYas9wKpWosNRkzBbRqzMGmRtmnaMptE
 0ykB5ZMeCdNEC81SMwR1WscUku9jaPIHPCYP15XffnuCRM+GBmGYehxfs
 ovtnd0R5Eny04wMgm/qA7EGsKS96iAOVq+XB0hGDeERjjGblh9YFs2me8
 Rel+6TAYe5L4OJgLjtnwp5c0LoSykN9Qy71WicJ7B6QyfAnToS7toBa58
 dTRYSvFWhJSLHia8yJXIc6Q/JaH+4jXF/SMLi4pO1BpF0GoCPwXWCkTR1 w==;
X-CSE-ConnectionGUID: t0A635l8T1qZHwQEIWDRPQ==
X-CSE-MsgGUID: m4l0M8hbTEWNo88Fg01uZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27888434"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27888434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:05:55 -0700
X-CSE-ConnectionGUID: aQk8m92FS72S6gTnFbkKBg==
X-CSE-MsgGUID: 2/SsY22kQcWlddHLjmmffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77293591"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:05:54 -0700
From: Hajda <andrzej.hajda@intel.com>
Date: Fri, 11 Oct 2024 08:05:43 +0200
Subject: [PATCH v2] drm/xe: add system memory page iterator support to
 xe_res_cursor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com>
X-B4-Tracking: v=1; b=H4sIADbACGcC/42OQQ6CMBBFr2K6tqYUFOrKexjSlHaESaQl00owh
 LtbOIHLl/y891cWgRAiu59WRjBjxOAzyPOJ2cH4Hji6zEwKWRVCKL6AJojafigG0sY5PZkeNCY
 gkwJxJ5WrS1tCpxTLlonghctReLaZOxOBd2S8HXavo5EnnPblgDELvseVudj3/1fnghfcNk1ZV
 Te41rV4oE/wvtgwsnbbth/j1/e16AAAAA==
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3205;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=vJ+fpCDWb1pzj+RYDPkUqrySRqt0GqcPViJhaKE8otM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnCMBBr7VrvFqpmtC1K5KNImRGFNdLNFgi7ZcbjCm4
 sV8N32KJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZwjAQQAKCRAjYrKT3hD913b7DA
 CuQjCyAi8BP+pz3I9KI3DZ+KUVsRaINPKaryfXykkHZf4yXd4076nNfkOUun3k+f5prbbJ/h9/+OVI
 E638STqJPGs3JuhZqbZCZ9/2/yz/6Kh83lJa91fT1bYXTiOn6oKFYQE5UNNLZRGD0MN1mSB0U2A6Ui
 AtWdejyW/WR2XQJt5Vy52/b7iHc4vK2fuUpWrD7OQTlMgaC3xgGS1x0PXTmsOd1rkzCR5TUJg7/pIJ
 jTcvIMWWo53SfKPDxshqsXlB+TdUaqBFFQ1pOoKxaU7DneQD8/2dMCXZYeDcNyGBObsz1IKVhuG819
 iBm8S0drFmXeh4YFgBQinp8UdmN8KGtXns/mXQfQZ5pbmaNSviNdjS2qQ+pdvZk7C0AJYi2q73NucR
 WVAHB8vijyQuLvXx8ZQ0bKP7ZwvJDZXEEb0gZiPweK61PEygsmsiVGXbsmf+WHgzlcaLEiTDtHeFFZ
 E/4ZO2oqQIv/ZPyrWZJ7iHvHrW39OuIPHmC770EXEFre0=
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

v2: fixed wording in commit message(Jonathan)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
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

