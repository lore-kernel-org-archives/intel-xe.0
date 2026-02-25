Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F191FD45F5
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AFD10E878;
	Wed, 25 Feb 2026 20:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkGYcOto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9413B10E82C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051269; x=1803587269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=txdP7yXsIzL4CDIvvL9okq5zu+CKQO1EG1sjrGOsIgY=;
 b=VkGYcOtom7RLKejmryj95u5Nloq5b1ZGJfmdf1v5laNU1gFEUuzy/gn3
 Po1PQYcmw5oexJs/2wVUf35c6wWrQ7Bg0HxZSW2MXpcLYofeunuJSsyqj
 xXjRqX8bLW74K2hp2Xsby063TXUAx4E1OIqvHYtQaovwYsic7odo00B+d
 1/4ztQtwr1Gd0heWPkplzJpfMSF5CgoWVLmkJbn4WGC+TrYiIaLkkdbk8
 i8xqa+0cnyb5meW+XNvW0WWSKBSpFS8tXbK16D6Q2ppHNx41aCs93+Hqd
 nNtAs2QfHYVhB77MJaIRizmyC5UsHoUU5KxUwHJlRyX+tJyoruYu32R5m Q==;
X-CSE-ConnectionGUID: 3gu8uHErS8O94DT0WYyufg==
X-CSE-MsgGUID: sBO81g65QtCf3qo6YtgStQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90515165"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="90515165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
X-CSE-ConnectionGUID: nwL0cQNEQ6CzFLvEIJhGXg==
X-CSE-MsgGUID: jocUYZwNQEyHYI5lOEhDow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220845135"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 06/12] drm/xe: Engine class and instance into a u8
Date: Wed, 25 Feb 2026 12:27:30 -0800
Message-Id: <20260225202736.2723250-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225202736.2723250-1-matthew.brost@intel.com>
References: <20260225202736.2723250-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  7 +++++--
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++----
 3 files changed, 19 insertions(+), 10 deletions(-)

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
index 64b1dc574ab7..a6fa790774c5 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -245,13 +245,16 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 
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
@@ -261,9 +264,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
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
 
 static void xe_pagefault_queue_work(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 45065c25c25f..75bc53205601 100644
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
 		/** consumer.reserved: reserved bits for future expansion */
 		u64 reserved;
 	} consumer;
-- 
2.34.1

