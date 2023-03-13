Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0897C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625288DE5;
	Mon, 13 Mar 2023 08:02:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D27D88DE5
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678694524; x=1710230524;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cmw40EcN2DMHyyTw6w5VwHZkaJFQ4gz8IZp9756PsIc=;
 b=NvqkSuQ+o9LN0Y+G3X8iOLYsiTqZCrN/vpt1Hv94hjO3yBpGSMFsfnOr
 SgZPJzvqjsSHMdMjuzilM0SnyOvV5PAQffaSldd+jVw+lTGEl07do1Ngf
 UDkYKZLLUXXGzVUd7SFTK6HQTGUkJtQa52h24Zi/PX+KKnSVj5oybkLEq
 PAbjw8aJJU1bD5E6+o4VIS3ChQO1qdLHaZyEfd8nbKNAHi2yJIOLzuXJH
 cem8E9CZITd7/OprLNJC8cBjecbMP8CmtHURMIiu5OLm4H+mco0onvm7V
 uU1EmHtbb2pdPAX24P5rBBeCiUn+OcMV1hhDUcmSERMJp0fHEwmsRJsEq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="339456539"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="339456539"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655894533"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="655894533"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:01:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:01:17 +0100
Message-Id: <20230313080117.2320-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Promote guc_to_gt/xe helpers to .h
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

Duplicating these helpers in almost every .c file was a bad idea.
Define them as inlines in .h file to allow proper reuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  6 ------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  6 ------
 drivers/gpu/drm/xe/xe_guc.c                 | 12 ------------
 drivers/gpu/drm/xe/xe_guc.h                 | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c         | 12 ------------
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 12 ------------
 drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ------------
 7 files changed, 11 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..2ae54fecf4ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -58,12 +58,6 @@ struct acc {
 	u8 engine_instance;
 };
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
 static bool access_is_atomic(enum access_type access_type)
 {
 	return access_type == ACCESS_TYPE_ATOMIC;
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f279e21300aa..259382d54871 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -12,12 +12,6 @@
 
 #define TLB_TIMEOUT	(HZ / 4)
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 58b9841616e4..8fb2920d96da 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,18 +22,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
-static struct xe_device *
-guc_to_xe(struct xe_guc *guc)
-{
-	return gt_to_xe(guc_to_gt(guc));
-}
-
 /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
 #define GUC_GGTT_TOP    0xFEE00000
 static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..96f6e3f46ed7 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GUC_H_
 #define _XE_GUC_H_
 
+#include "xe_gt.h"
 #include "xe_guc_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
@@ -56,4 +57,14 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 	}
 }
 
+static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
+{
+	return container_of(guc, struct xe_gt, uc.guc);
+}
+
+static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
+{
+	return gt_to_xe(guc_to_gt(guc));
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 6b72db4d5bb2..dbb3001db928 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -15,18 +15,6 @@
 #include "xe_guc_log.h"
 #include "xe_macros.h"
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
-static struct xe_device *
-guc_to_xe(struct xe_guc *guc)
-{
-	return gt_to_xe(guc_to_gt(guc));
-}
-
 static struct xe_guc *node_to_guc(struct drm_info_node *node)
 {
 	return node->info_ent->data;
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index a6982f323ed1..a89d26565fdd 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -13,18 +13,6 @@
 #include "xe_guc.h"
 #include "xe_map.h"
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
-static struct xe_device *
-guc_to_xe(struct xe_guc *guc)
-{
-	return gt_to_xe(guc_to_gt(guc));
-}
-
 static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
 {
 	u32 action[] = {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..6b3159e75be9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -32,18 +32,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-static struct xe_gt *
-guc_to_gt(struct xe_guc *guc)
-{
-	return container_of(guc, struct xe_gt, uc.guc);
-}
-
-static struct xe_device *
-guc_to_xe(struct xe_guc *guc)
-{
-	return gt_to_xe(guc_to_gt(guc));
-}
-
 static struct xe_guc *
 engine_to_guc(struct xe_engine *e)
 {
-- 
2.25.1

