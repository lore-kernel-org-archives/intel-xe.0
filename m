Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE1EEA84E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 20:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0DA10E2AF;
	Thu, 12 Feb 2026 20:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfO/lU5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580310E2AA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 20:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770928961; x=1802464961;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cIPJiCGJqmQ7w03x9PBNVG/QGK/6gjDoyBGXKGtNMlw=;
 b=IfO/lU5lbr98eJFiL8tursSb1nJIpOz2IGzC00nViI8Lae7bjM7qIGhH
 G5tt90SNZXvjWrCFefQtadJDS2tnf4gIXT1ZS7oFTdPK5QBREbuK74tCz
 3EydSEWZYCDyivVmKXKMPY2WmlCWNvsOcTizhMeeUlj8LRc+bE7L+qPfT
 7BecdPyUZmiGo0+nTdOet9ZSFiGq3DcyR8A7yzU8PItwhDNfqZ0d2I05E
 qJKex7YGhvHKpjYyHbbLsjCXkpLlExc/5NbW5twJB8rPqgWobZ3Zj6P0D
 RYdGFyBYdakZ7cT2NOgoDWFGJeJhYpoHwjyusD03+XvLewUlVBsPjrQix A==;
X-CSE-ConnectionGUID: RMFweOzISw2gBrYFq7OZoA==
X-CSE-MsgGUID: ADDKZLKdTQCh8EJNJV5mqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89696423"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89696423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
X-CSE-ConnectionGUID: II5CKPONQUqXnsRmfPJw6Q==
X-CSE-MsgGUID: e9MTPoA6QBSq2wW52vQfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211527615"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Pack fault type and level into a u8
Date: Thu, 12 Feb 2026 12:42:26 -0800
Message-Id: <20260212204227.2764054-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212204227.2764054-1-matthew.brost@intel.com>
References: <20260212204227.2764054-1-matthew.brost@intel.com>
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

Pack the fault type and level fields into a single u8 to save space in
struct xe_pagefault. This also makes future extensions easier.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  9 ++++++---
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++++++-----
 drivers/gpu/drm/xe/xe_pagefault_types.h | 14 +++++++-------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 719a18187a31..1166b0a5fa21 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -76,11 +76,14 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		 PFD_VIRTUAL_ADDR_LO_SHIFT);
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
-	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
-		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
+		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
 	else
-		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
+		pf.consumer.fault_type_level =
+			FIELD_PREP(XE_PAGEFAULT_LEVEL_MASK,
+				   FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
+			FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
+				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
 	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
 	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6bee53d6ffc3..72f589fd2b64 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -164,7 +164,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	bool atomic;
 
 	/* Producer flagged this fault to be nacked */
-	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
+	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
 	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
@@ -225,17 +225,19 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
-		   "\tFaultType: %d\n"
+		   "\tFaultType: %lu\n"
 		   "\tAccessType: %d\n"
-		   "\tFaultLevel: %d\n"
+		   "\tFaultLevel: %lu\n"
 		   "\tEngineClass: %d %s\n"
 		   "\tEngineInstance: %d\n",
 		   pf->consumer.asid,
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
-		   pf->consumer.fault_type,
+		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
+			     pf->consumer.fault_type_level),
 		   pf->consumer.access_type,
-		   pf->consumer.fault_level,
+		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
+			     pf->consumer.fault_type_level),
 		   pf->consumer.engine_class,
 		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
 		   pf->consumer.engine_instance);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..0e378f41ede6 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -73,19 +73,19 @@ struct xe_pagefault {
 		 */
 		u8 access_type;
 		/**
-		 * @consumer.fault_type: fault type, u8 rather than enum to
-		 * keep size compact
+		 * @consumer.fault_type_level: fault type and level, u8 rather
+		 * than enum to keep size compact
 		 */
-		u8 fault_type;
-#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
-		/** @consumer.fault_level: fault level */
-		u8 fault_level;
+		u8 fault_type_level;
+#define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
+#define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
+#define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
 		/** @consumer.engine_class: engine class */
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
 		/** consumer.reserved: reserved bits for future expansion */
-		u8 reserved[7];
+		u64 reserved;
 	} consumer;
 	/**
 	 * @producer: State for the producer (i.e., HW/FW interface). Populated
-- 
2.34.1

