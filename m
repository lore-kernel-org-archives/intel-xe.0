Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD942C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 21:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC510F20F;
	Thu, 23 Jul 2026 21:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM2TtWLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D3310F20E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784843269; x=1816379269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQt7NyCLHsL0kILOlV31I/A9pIG+/vPsp7CAGz2TJwE=;
 b=dM2TtWLxLQMaWwNuoWDjjcRI4GPHGPDYKW4fsn2vSRRO/eZ8Av3VWQ58
 n3DymzQMsX/AC5AQ5qLQRAe3UYkXPY58f//lb7I/cv6tKz1xx35ktGBaX
 hB0ngncH7NW2MdWouTg3U87VpRUzrpRwhnTYG83o/E38mXcjpiT3AGc2A
 LS+UAIVOBKQb0qlbaiccz6SMXcM6a6QWrOX6DVYozEO0hwxmyBcd+68rY
 uoC5M1kji705uJl1H/SOBiiMWoNC8Y/syNu5NcwIvz/oETSXtiZ8XScDu
 Ye+Y80uO/htSjxnPIDu4lSxf+zg8uDkMhTnD8pYlcqPfc3iDzb34NIPpj A==;
X-CSE-ConnectionGUID: DpI9ZCeFSkmXlvDdRn2ntw==
X-CSE-MsgGUID: 1mNsrdWiQpamYLkiSLxajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88050506"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="88050506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 14:47:48 -0700
X-CSE-ConnectionGUID: oDsDdQ6OSQyvchb1MiP3VA==
X-CSE-MsgGUID: YnVsybNzS/+swbcfeJlbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254593765"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 14:47:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v5 06/12] drm/xe: Engine class and instance into a u8
Date: Thu, 23 Jul 2026 14:47:37 -0700
Message-Id: <20260723214743.1498125-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723214743.1498125-1-matthew.brost@intel.com>
References: <20260723214743.1498125-1-matthew.brost@intel.com>
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

Pack the engine class and instance fields into a single u8 to save space
in struct xe_pagefault. This also makes future extensions easier.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  7 +++++--
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++----
 drivers/gpu/drm/xe/xe_vm.c              |  7 +++++--
 4 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 607e32392f46..2470faf3d5d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -89,8 +89,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 				   FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
 			FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
 				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
-	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
-	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
+	pf.consumer.engine_class_instance =
+		FIELD_PREP(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+			   FIELD_GET(PFD_ENG_CLASS, msg[0])) |
+		FIELD_PREP(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+			   FIELD_GET(PFD_ENG_INSTANCE, msg[0]));
 
 	pf.producer.private = guc;
 	pf.producer.ops = &guc_pagefault_ops;
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2322eb7369f1..0ee9b7acef41 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -262,13 +262,16 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
+	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+				    pf->consumer.engine_class_instance);
+
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
 		   "\tFaultType: %lu\n"
 		   "\tAccessType: %lu\n"
 		   "\tFaultLevel: %lu\n"
 		   "\tEngineClass: %d %s\n"
-		   "\tEngineInstance: %d\n",
+		   "\tEngineInstance: %lu\n",
 		   pf->consumer.asid,
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
@@ -278,9 +281,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 			     pf->consumer.access_type),
 		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
 			     pf->consumer.fault_type_level),
-		   pf->consumer.engine_class,
-		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
-		   pf->consumer.engine_instance);
+		   engine_class,
+		   xe_hw_engine_class_to_str(engine_class),
+		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+			     pf->consumer.engine_class_instance));
 }
 
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 64ab4ea8807b..d349d79bc95e 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -82,10 +82,12 @@ struct xe_pagefault {
 #define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
 #define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
 #define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
-		/** @consumer.engine_class: engine class */
-		u8 engine_class;
-		/** @consumer.engine_instance: engine instance */
-		u8 engine_instance;
+		/** @consumer.engine_class_instance: engine class and instance */
+		u8 engine_class_instance;
+#define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
+#define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
+		/** @pad: alignment padding */
+		u8 pad;
 		/** @consumer.reserved: reserved bits for future expansion */
 		u64 reserved;
 	} consumer;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 286aebfcc461..410fb03f1ca9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -615,10 +615,13 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
 {
 	struct xe_vm_fault_entry *e;
 	struct xe_hw_engine *hwe;
+	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+				    pf->consumer.engine_class_instance);
+	u8 engine_instance = FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+				       pf->consumer.engine_class_instance);
 
 	/* Do not report faults on reserved engines */
-	hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
-			      pf->consumer.engine_instance, false);
+	hwe = xe_gt_hw_engine(pf->gt, engine_class, engine_instance, false);
 	if (!hwe || xe_hw_engine_is_reserved(hwe))
 		return;
 
-- 
2.34.1

