Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E08CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 17:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC04610E2D3;
	Fri, 22 May 2026 17:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOzWEr/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799DA10E25D
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779470816; x=1811006816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QEt1GrcFaq73WNtju2iDd/sMwhM/6rtxDW28kBBHEf4=;
 b=SOzWEr/wN9C744hobTUe8JXqSUC9Y0ER/Klr/Ah0kgJfHKQWONv6zwln
 VRZWRthX7mRKwXE+mHAx9BQllzdxWLToJ0bdEyuJXqOLRPiq+/52dwcpH
 DgqgByK4nilA9d82c22pnw7tumJ7Pam5RrYUMOF8Y+/A5+DbYfxYNVS1s
 TeVJ/GmPQHnGAN3R7IjpLHuFvp9GElVoBYl2DJ2/0LuirZumdoMAK0AZf
 Ie4h6Qe+ocsNU1M/8Kk1xerZGQyahWkRsO8LzztBAxzLsbm0L0PZD7rVO
 0cnpju6C1ZMVpC3p97eodOXEkjlEWNBqA4h2TqBPMY2Or2pS49mpD5mBW w==;
X-CSE-ConnectionGUID: 8pDJa4SVQlmkfqNhhDf1sw==
X-CSE-MsgGUID: QJdn69OPSISMtZ55LoLQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80436567"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80436567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:56 -0700
X-CSE-ConnectionGUID: LT/jEAQKTjC0rnZ8Vv6/OQ==
X-CSE-MsgGUID: Zjgubj9FQUKLtsSnq2SHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246044079"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 10:26:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com
Subject: [PATCH 1/2] drm/xe/pagefault: Add SRCID to pagefault struct
Date: Sat, 23 May 2026 01:26:44 +0800
Message-ID: <20260522172645.3503927-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522172645.3503927-1-jonathan.cavitt@intel.com>
References: <20260522172645.3503927-1-jonathan.cavitt@intel.com>
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

Add SRCID information to pagefault struct.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 6 ++++--
 drivers/gpu/drm/xe/xe_pagefault_types.h | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 607e32392f46..17cb7f359261 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -91,6 +91,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
 	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
 	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
+	pf.consumer.srcid = FIELD_GET(PFD_SRC_ID, msg[0]);
 
 	pf.producer.private = guc;
 	pf.producer.ops = &guc_pagefault_ops;
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..42b682ba5f9b 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -248,7 +248,8 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		   "\tAccessType: %lu\n"
 		   "\tFaultLevel: %lu\n"
 		   "\tEngineClass: %d %s\n"
-		   "\tEngineInstance: %d\n",
+		   "\tEngineInstance: %d\n"
+		   "\tSRCID: 0x%02x\n",
 		   pf->consumer.asid,
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
@@ -260,7 +261,8 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 			     pf->consumer.fault_type_level),
 		   pf->consumer.engine_class,
 		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
-		   pf->consumer.engine_instance);
+		   pf->consumer.engine_instance,
+		   pf->consumer.srcid);
 }
 
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index c4ee625b93dd..60cc269aeea3 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -86,8 +86,10 @@ struct xe_pagefault {
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
+		/** @consumer.srcid: ID of hardware unit producing fault */
+		u8 srcid;
 		/** @consumer.reserved: reserved bits for future expansion */
-		u64 reserved;
+		u8 reserved[7];
 	} consumer;
 	/**
 	 * @producer: State for the producer (i.e., HW/FW interface). Populated
-- 
2.53.0

