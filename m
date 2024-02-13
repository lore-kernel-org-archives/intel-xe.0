Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F6FC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134810E90D;
	Tue, 13 Feb 2024 21:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeyUvF2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C69B10E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707858356; x=1739394356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jkz7ja9Uc9tfDW8qOrObjNlAg4OYOd+i4UC4AhEO74s=;
 b=EeyUvF2wMj2D2/OkxGjOn841afJXbn1+gryFWo/6/Jt5JkGJ7K4aifjm
 4x6kNkRksW6JUWZJj+66VUfLEPvPVFVGiyD27IO9AjVwwemuyVlYgLH57
 +cu1jvYnyZlxOvlTTmlx/VfmOhc2GeqBa1Xt7mOLYZBs55McGEgROgLOa
 A+ImelBIB9+qsxNcT4LoDo5OOg5bDYWINTzDw+C9oDSJXyJHdKIfI2a/k
 2FjDpb4wmO2BSxHhVLmmB3jS6gXxaxCflMa18z4drUJVUu6G0bPbHKUkI
 sKHGMZAd6xGMcJfoksotyMzbArjWwilyvsOM2wlbQtwFgjzBC9ksI1tEX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5721051"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="5721051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="40479776"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:05:53 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Promote make_u64 macro to .h file
Date: Tue, 13 Feb 2024 22:05:43 +0100
Message-Id: <20240213210543.1265-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We shouldn't hide generic macros inside .c files as this may lead
to unnecessary code duplication if similar functionality is needed
elsewhere.  Promote make_u64 to .h as soon we will want to reuse it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 --
 drivers/gpu/drm/xe/xe_macros.h       | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c26e4fcca01e..76a018ec8136 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -557,8 +557,6 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	return ret;
 }
 
-#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
-
 #define ACC_MSG_LEN_DW        4
 
 static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..b79d775c737e 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -7,6 +7,7 @@
 #define _XE_MACROS_H_
 
 #include <linux/bug.h>
+#include <linux/types.h>
 
 #define XE_WARN_ON WARN_ON
 
@@ -15,4 +16,11 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+/**
+ * make_u64 - make u64 value from two u32 values
+ * @hi__: value representing upper 32 bits
+ * @lo__: value representing lower 32 bits
+ */
+#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
+
 #endif
-- 
2.43.0

