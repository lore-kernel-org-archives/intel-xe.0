Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F44CF58C4
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 03:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269B10E785;
	Fri, 20 Sep 2024 03:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKvdW8nC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469610E785
 for <Intel-Xe@lists.freedesktop.org>; Fri, 20 Sep 2024 03:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802470; x=1758338470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6bq7x1TR5KHZFiCZoS9iUTEeAoF/JQCRzOhFtLnmQd4=;
 b=GKvdW8nCoQvtGzPHyMBNle61Dk4j+KsmJvkN2V6p7kUuqNAcbCFTAK0t
 1fnjISfLxkbEo4toowZF60OE9o9gjpRXSncbH9oMyKXJAYgACAyVii25/
 bKPDWu/7RwJVjBrOkjmNXi0uHmeie1PISdh10za7nDs7DG835sFoxY0jq
 cHsJN1493PAU9M0TauANrARFvDQz/LSfDwTpwNiVBXNIanD2ZKZ2uBk5T
 W19A502jyZbYZyF4Wtu1Juimgjj42wjFukb4W54I6/A7Ek96s62GqAQBE
 1lPi6IvKUtn/lEK9PSR/KZjBp4Qh2QEu2uCnW2/w3ninERIEfjIG6EziJ w==;
X-CSE-ConnectionGUID: qgViUZC/RZ6hmYrsHo7Yxg==
X-CSE-MsgGUID: +ohaJLx8Rv2tsqIqFVPOzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25983962"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25983962"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:21:10 -0700
X-CSE-ConnectionGUID: hcPw7E0ZTFKCIc1chRJd7A==
X-CSE-MsgGUID: ZtFk43AaSxekXMbJqSb7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="74504452"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2024 20:21:10 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 05/11] drm/xe/guc: Copy GuC log prior to dumping
Date: Thu, 19 Sep 2024 20:21:02 -0700
Message-ID: <20240920032108.629796-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032108.629796-1-John.C.Harrison@Intel.com>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
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
2.46.0

