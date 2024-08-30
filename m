Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D0CA0EE6
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9E10E806;
	Fri, 30 Aug 2024 06:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abm/0EUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA71210E801
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7f59JRpSM5ddaNBMlv242+X6qtxAA40TzV8tohP4wFI=;
 b=abm/0EUgRt3xvt0IUxy5i7/v8v8V5mXgmRqV2W4c0pme15thcr57Xjkl
 7CDNShj5wA+L7u63KHJ00fKx0+JN6TSTv+uiEOwagYlTFLGz2B0czCzKy
 hCGtvoG79/q4IqZ47GxzhXdK4Vgb+eTKvJqupkwEPMzEwIPVqZQhCI7KL
 SpO9ExGeQ7b+A8cLt3OAQgyNFGnWKyZnmke0xpkbTo9fzclrOacWe3zR1
 Fi8RQt9g+VK9Rdrn4FDweE9WNwHeiUBfUmQFvLFFzHu6cXFbJcjrmHNmm
 n4fxf7IjgQ9/I6aYKqEAXqefCsnGmA+sGoAr6Yr6ws6gE9Ap8hiFShr46 A==;
X-CSE-ConnectionGUID: T/w/tKRfTdmF6FAKrcSKuw==
X-CSE-MsgGUID: bwOwBiygSaSj0dR7qJ4ABw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245220"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:11 -0700
X-CSE-ConnectionGUID: sjT7hSZjRVKKYe+N4MarWA==
X-CSE-MsgGUID: MrCCSMAzSleGyJQmf5qE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040568"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 3/9] drm/xe/guc: Copy GuC log prior to dumping
Date: Thu, 29 Aug 2024 23:23:04 -0700
Message-ID: <20240830062310.3450387-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Add an extra stage to the GuC log print to copy the log buffer into
regular host memory first, rather than printing the live GPU buffer
object directly. Doing so helps prevent inconsistencies due to the log
being updated as it is being dumped. It also allows the use of the
ASCII85 helper function for printing the log in a more compact form
than a straight hex dump.

v2: Use %zx instead of %lx for size_t prints.
v3: Replace hexdump code with ascii85 call (review feedback from
Matthew B). Move chunking code into next patch as that reduces the
deltas of both.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 40 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..ffd0b4b02d84 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -6,9 +6,12 @@
 #include "xe_guc_log.h"
 
 #include <drm/drm_managed.h>
+#include <linux/vmalloc.h>
 
 #include "xe_bo.h"
+#include "xe_devcoredump.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
@@ -49,32 +52,35 @@ static size_t guc_log_size(void)
 		CAPTURE_BUFFER_SIZE;
 }
 
+/**
+ * xe_guc_log_print - dump a copy of the GuC log to some useful location
+ * @log: GuC log structure
+ * @p: the printer object to output to
+ */
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 {
 	struct xe_device *xe = log_to_xe(log);
 	size_t size;
-	int i, j;
+	void *copy;
 
-	xe_assert(xe, log->bo);
+	if (!log->bo) {
+		drm_puts(p, "GuC log buffer not allocated");
+		return;
+	}
 
 	size = log->bo->size;
 
-#define DW_PER_READ		128
-	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
-	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
-		u32 read[DW_PER_READ];
-
-		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
-				   DW_PER_READ * sizeof(u32));
-#define DW_PER_PRINT		4
-		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
-			u32 *print = read + j * DW_PER_PRINT;
-
-			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
-				   *(print + 0), *(print + 1),
-				   *(print + 2), *(print + 3));
-		}
+	copy = vmalloc(size);
+	if (!copy) {
+		drm_printf(p, "Failed to allocate %zu", size);
+		return;
 	}
+
+	xe_map_memcpy_from(xe, copy, &log->bo->vmap, 0, size);
+
+	xe_print_blob_ascii85(p, copy, 0, size);
+
+	vfree(copy);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
-- 
2.46.0

