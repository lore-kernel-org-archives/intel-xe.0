Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30421C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D231E10E079;
	Fri, 25 Sep 2026 23:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLhraNXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E810E079
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 23:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790378879; x=1821914879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HP5a3+SL+lTowT5zPmj+Sx7VW8e2db8Ja32O0LhCvK4=;
 b=aLhraNXy8fl33LIqF3UbmSdhNqOjvyl2yMQrF/I94CDIV2504VP1d7Sb
 bNfd9tDgfQJzkB3YDXZ9oPl0SlCcQeZsNgc08mvHh/p+Oz26VurAfn9vI
 KeghQfurcP+qNoWcVgXbFJndjY1t7dHcDk7Vk0fLmSHizFyyIPuRyid1t
 DF9bAKtf4m/HEa7l6EtFvlBW6lHcNvLBtILTLaBeG305ki+Kf7r8Mx1Zh
 Ejt+vR6NstEcpZzPmB7MWhuEaqFt4y19ihJxldtBOP8RkOg6tmuL5tzsz
 dNe0bTo5TaSSGQEjRVHlytb0ZCzrBvH30Psh9xPnL5ViP/QIL0o1NR+zF Q==;
X-CSE-ConnectionGUID: HdLIvGsYQEK65FiHpCTkTA==
X-CSE-MsgGUID: bOeRAWytREakdP8jL2eKVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112956620"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="112956620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:27:59 -0700
X-CSE-ConnectionGUID: sPMETqDmTRqwiSZEM3CuUQ==
X-CSE-MsgGUID: HYffet23RKGr0dvtjqSADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="278256400"
Received: from dut6290acmr.fm.intel.com ([10.36.24.111])
 by orviesa005.jf.intel.com with ESMTP; 25 Sep 2026 16:27:58 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 matthew.d.roper@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH] drm/xe: Implement print vfunc for page fault info logging
Date: Fri, 25 Sep 2026 23:27:58 +0000
Message-ID: <20260925232757.3456172-2-brian3.nguyen@intel.com>
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

Consumer-specific prints are handled separately outside of the vfunc.

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c       | 33 +++--------------------
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 ++++++
 3 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index df237fd40551..7e4f0df1444b 100644
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
 
@@ -68,10 +70,43 @@ static void guc_ack_fault_end(void *private)
 	xe_guc_ct_unlock(&guc->ct);
 }
 
+static void xe_guc_pagefault_print(struct xe_pagefault *pf)
+{
+	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+				    pf->consumer.engine_class_instance);
+	u64 addr = xe_pagefault_addr(pf);
+
+	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
+		   "\tFaulted Address: 0x%08x%08x\n"
+		   "\tFaultType: %lu\n"
+		   "\tAccessType: %lu\n"
+		   "\tFaultLevel: %lu\n"
+		   "\tEngineClass: %d %s\n"
+		   "\tEngineInstance: %lu\n"
+		   "\tSRCID: 0x%02lx\n",
+		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
+			     pf->consumer.id),
+		   upper_32_bits(addr),
+		   lower_32_bits(addr),
+		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
+			     pf->consumer.fault_type_level),
+		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
+			     pf->consumer.access_type),
+		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
+			     pf->consumer.fault_type_level),
+		   engine_class,
+		   xe_hw_engine_class_to_str(engine_class),
+		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+			     pf->consumer.engine_class_instance),
+		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
+			     pf->consumer.id));
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
index f9e5bd41cfd1..298a67268c0d 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -13,7 +13,6 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
-#include "xe_hw_engine.h"
 #include "xe_log.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
@@ -607,35 +606,9 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
 
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
-	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
-				    pf->consumer.engine_class_instance);
-	u64 addr = xe_pagefault_addr(pf);
-
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
+	xe_gt_assert(pf->gt, pf->producer.ops->print);
+	pf->producer.ops->print(pf);
+	xe_gt_info(pf->gt, "\tError: %s\n",
 		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 8ae6b9848bdc..72568ab9686a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -139,6 +139,14 @@ struct xe_pagefault_ops {
 	 * Page fault producer ends acknowledgment from the consumer.
 	 */
 	void (*ack_fault_end)(void *private);
+	/**
+	 * @print: Print pagefault info
+	 * @pf: Page fault
+	 *
+	 * Print pagefault identification fields for the fault.
+	 * Must be implemented by all producers.
+	 */
+	void (*print)(struct xe_pagefault *pf);
 };
 
 /**
-- 
2.43.0

