Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F4CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 18:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22310E0AD;
	Mon, 28 Sep 2026 18:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCGPqO+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C2710E0AD
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790620281; x=1822156281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6DTdZhglTJGhHwfXcfJRkp1kert1paly8NJvY5xvd1w=;
 b=jCGPqO+bl4N6E/4M8IV2I6O/jpj5M1wMWAhCnemNEiOMAUvY3at6WjKj
 Y8RgTgJ4kRVUm8BOTCM87r4mpJOx7tfXNHmQYqMFoAHDiVXObwAJX9bU0
 7/49AHsXtH7E0ZUjQY2RBKeIqukajWorTpRr/FAwgnv05ceaTeNwn2IiJ
 iYesADXM1mfwFSGXHVaobC5ySkB/bKdPdRujc1iF6XKU0HNtU03OIkLjd
 ypsMWH8AapXGHDOikZbWMQnshsa7p44Nr+ggodSikByvIHSgG5fRzcdvn
 bi0Z1JW2qbwnJcDZsZ7r+gBuz4oCgSUDHYcCa3nb5Hnqsq3p6Pwfg6QsL A==;
X-CSE-ConnectionGUID: nX1OugAdT+eDxHSuCF3RYw==
X-CSE-MsgGUID: jxKn/GJBSJOZSXYBUTWBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91192368"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="91192368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 11:31:21 -0700
X-CSE-ConnectionGUID: iDUgoa0GSvaVmc6HwSxpAw==
X-CSE-MsgGUID: G4Qfa2iOQrig6s7rsCglew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274236349"
Received: from dut6290acmr.fm.intel.com ([10.36.24.111])
 by orviesa008.jf.intel.com with ESMTP; 28 Sep 2026 11:31:20 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 matthew.d.roper@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v2] drm/xe: Implement print vfunc for page fault info logging
Date: Mon, 28 Sep 2026 18:31:21 +0000
Message-ID: <20260928183120.3788244-2-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a print vfunc to xe_pagefault_ops so different producer backends can
log specific relevant debug info while keeping the consumer layer free
of potential backend-specific formatting logic.

Consumer-specific error prints are handled by passing as input into
the vfunc.

v2:
 - Decode producer specific fields for print message. (Matthew)
 - Combine consumer and producer prints to one print call. (Sashiko)

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 32 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c       | 33 +++----------------------
 drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++++
 3 files changed, 45 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index df237fd40551..e65e4962a26c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -4,9 +4,11 @@
  */
 
 #include "abi/guc_actions_abi.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
+#include "xe_hw_engine.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 
@@ -68,10 +70,40 @@ static void guc_ack_fault_end(void *private)
 	xe_guc_ct_unlock(&guc->ct);
 }
 
+static void xe_guc_pagefault_print(struct xe_pagefault *pf,
+				   const char *err_str)
+{
+	const u32 *msg = pf->producer.msg;
+	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
+
+	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
+		   "\tFaulted Address: 0x%08lx%08lx\n"
+		   "\tFaultType: %lu\n"
+		   "\tAccessType: %lu\n"
+		   "\tFaultLevel: %lu\n"
+		   "\tEngineClass: %u %s\n"
+		   "\tEngineInstance: %lu\n"
+		   "\tSRCID: 0x%02lx\n"
+		   "\tError: %s\n",
+		   FIELD_GET(PFD_ASID, msg[1]),
+		   FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3]),
+		   FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
+		   PFD_VIRTUAL_ADDR_LO_SHIFT,
+		   FIELD_GET(PFD_FAULT_TYPE, msg[2]),
+		   FIELD_GET(PFD_ACCESS_TYPE, msg[2]),
+		   FIELD_GET(PFD_FAULT_LEVEL, msg[0]),
+		   engine_class,
+		   xe_hw_engine_class_to_str(engine_class),
+		   FIELD_GET(PFD_ENG_INSTANCE, msg[0]),
+		   FIELD_GET(PFD_SRC_ID, msg[0]),
+		   err_str);
+}
+
 static const struct xe_pagefault_ops guc_pagefault_ops = {
 	.ack_fault_begin = guc_ack_fault_begin,
 	.ack_fault = guc_ack_fault,
 	.ack_fault_end = guc_ack_fault_end,
+	.print = xe_guc_pagefault_print,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f219e9e3b73e..dbf9397938df 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -13,7 +13,6 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
-#include "xe_hw_engine.h"
 #include "xe_log.h"
 #include "xe_migrate.h"
 #include "xe_pagefault.h"
@@ -610,36 +609,10 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
 
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
-	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
-				    pf->consumer.engine_class_instance);
-	u64 addr = xe_pagefault_addr(pf);
+	enum xe_pagefault_error err = xe_pagefault_get_error(pf);
 
-	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
-		   "\tFaulted Address: 0x%08x%08x\n"
-		   "\tFaultType: %lu\n"
-		   "\tAccessType: %lu\n"
-		   "\tFaultLevel: %lu\n"
-		   "\tEngineClass: %d %s\n"
-		   "\tEngineInstance: %lu\n"
-		   "\tSRCID: 0x%02lx\n"
-		   "\tError: %s\n",
-		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
-			     pf->consumer.id),
-		   upper_32_bits(addr),
-		   lower_32_bits(addr),
-		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
-			     pf->consumer.fault_type_level),
-		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
-			     pf->consumer.access_type),
-		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
-			     pf->consumer.fault_type_level),
-		   engine_class,
-		   xe_hw_engine_class_to_str(engine_class),
-		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
-			     pf->consumer.engine_class_instance),
-		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
-			     pf->consumer.id),
-		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
+	xe_gt_assert(pf->gt, pf->producer.ops->print);
+	pf->producer.ops->print(pf, xe_pagefault_error_to_str(err));
 }
 
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 8ae6b9848bdc..ee467117afe9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -139,6 +139,16 @@ struct xe_pagefault_ops {
 	 * Page fault producer ends acknowledgment from the consumer.
 	 */
 	void (*ack_fault_end)(void *private);
+	/**
+	 * @print: Print pagefault info
+	 * @pf: Page fault
+	 * @err_str: Consumer servicing error string
+	 *
+	 * Print pagefault identification fields decoded from producer,
+	 * along with consumer-specific @err_str prints.
+	 * Must be implemented by all producers.
+	 */
+	void (*print)(struct xe_pagefault *pf, const char *err_str);
 };
 
 /**
-- 
2.43.0

