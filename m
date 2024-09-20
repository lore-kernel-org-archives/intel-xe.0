Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E429C78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6032410E83B;
	Fri, 20 Sep 2024 14:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4gRyncV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0D10E83B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726841367; x=1758377367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3zdtPpB21wE4XBY9UTTIqy3DpDmOY4FfCGnYHQ7dSI=;
 b=H4gRyncVqsct6Di6G9Sd01qHbEAiuzHsOwOxBdiPIFQdA8E2q+HPTK3S
 6smpozsJ8cAoOP2UKnc22Kvi99KZW+y8L4Nzk2Dx6CsuemU14m2RLtFry
 qMEbOMS8K7wxwIZBXz1+ehHBvJp4t7+RwlPY7Oubyu4Sdi3a83HwbQo3h
 8gOyLid2ZE+V2ppgmQvVDNwJmjbEC5uTm5aeVmOmaUzPUTPJV0daEPQC2
 8zIOkpcQJcpfRzlEJuUZ3I7RuyBn5M0T/1oNOPkuBPjxbUER+kxFIT0Ol
 Sgpx+WTv9NsOs3meEc8ZTpX56t+i7OPfrPVqwLi1mnDWhAQwFbX90cQ43 A==;
X-CSE-ConnectionGUID: MtGQJPyoQ/CgtyGq9RV5eQ==
X-CSE-MsgGUID: TldhXwDASPe8nKf9L3hGEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43368348"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43368348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:27 -0700
X-CSE-ConnectionGUID: bFtKBq8jTxeccsOisQ15ag==
X-CSE-MsgGUID: ulqOuCxMQOOnPHpCythP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70182623"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:26 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [CI 05/12] drm/xe/guc: Copy GuC log prior to dumping
Date: Fri, 20 Sep 2024 19:59:15 +0530
Message-Id: <20240920142922.618649-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920142922.618649-1-badal.nilawar@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
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
v4: Add a prefix to the ASCII85 output to aid tool parsing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 40 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..be47780ec2a7 100644
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
+	xe_print_blob_ascii85(p, "Log data", copy, 0, size);
+
+	vfree(copy);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
-- 
2.34.1

