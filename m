Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A424C47DAF
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 22:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9087210E8B4;
	Wed, 17 Jan 2024 22:01:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7FA10E88E;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BKSeHJDGyz7jVv6YZ2avbckqVGlW+UjqVbfpUtytUW4=;
 b=WjkZofVbC2qH8+dBDsl6iLyzM7j1AueerAVBUd+qa6vnG+fcn/gquAXA
 lPrMfa8/2THZSPowbWiEtYHWc/HBlhc00xOOqtgOJGQRtML6EDssyniKY
 Z63B2qBH/wrXpH2aA0JRRYfuRzs7Ihm7a9ZmjE1deMrZ5d97vEouJDtPO
 p+61Od3L8hS9bk/N7Drfi/Cv01cFgBy65mukI5Y6fGjs+7oAN+HUFkaww
 ojoiQJZOyLzTfqgMPOp834gRIEoYCGQ9k5AU5hNtNAKoXS7h56qd4rANI
 W0YBraOBxC/zqtq0I249QcdOo3nyHnBq93jVrmkV6vAUAzfs5oeoPthlm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657631"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089270"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089270"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 18/23] drm/xe/svm: Move a few structures to xe_gt.h
Date: Wed, 17 Jan 2024 17:12:18 -0500
Message-Id: <20240117221223.18540-19-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move access_type and pagefault struct to header file so it
can be shared with svm sub-system. This is preparation work
for enabling page fault for svm.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h           | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 21 ---------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4486e083f5ef..51dd288cf1cf 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,6 +17,26 @@
 			  xe_hw_engine_is_valid((hwe__)))
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+enum access_type {
+	ACCESS_TYPE_READ = 0,
+	ACCESS_TYPE_WRITE = 1,
+	ACCESS_TYPE_ATOMIC = 2,
+	ACCESS_TYPE_RESERVED = 3,
+};
+
+struct pagefault {
+	u64 page_addr;
+	u32 asid;
+	u16 pdata;
+	u8 vfid;
+	u8 access_type;
+	u8 fault_type;
+	u8 fault_level;
+	u8 engine_class;
+	u8 engine_instance;
+	u8 fault_unsuccessful;
+	bool trva_fault;
+};
 
 #ifdef CONFIG_FAULT_INJECTION
 #include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5c2603075af9..467d68f8332e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,27 +23,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-struct pagefault {
-	u64 page_addr;
-	u32 asid;
-	u16 pdata;
-	u8 vfid;
-	u8 access_type;
-	u8 fault_type;
-	u8 fault_level;
-	u8 engine_class;
-	u8 engine_instance;
-	u8 fault_unsuccessful;
-	bool trva_fault;
-};
-
-enum access_type {
-	ACCESS_TYPE_READ = 0,
-	ACCESS_TYPE_WRITE = 1,
-	ACCESS_TYPE_ATOMIC = 2,
-	ACCESS_TYPE_RESERVED = 3,
-};
-
 enum fault_type {
 	NOT_PRESENT = 0,
 	WRITE_ACCESS_VIOLATION = 1,
-- 
2.26.3

