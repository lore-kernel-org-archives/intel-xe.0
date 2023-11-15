Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BEFC48BF9
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 14:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E9710E02B;
	Wed, 15 Nov 2023 14:15:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944910E02B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700057736; x=1731593736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ING7hgITKWNPfsCmwyvRPawRgNyXnOQh0Y4PNyi26is=;
 b=c/SBo8r/S8m4HgAVPJRoserMb6Of9aZEpn4BVz+5G2ieSYo1oJr9MHLS
 CXGIcfU0spD1sfCZjbmxY4E1K8kF0XWj+qRII9fFItEP5qg2iVcZK3qqi
 Pmlih0Q+0q8LEGtnDMBaWxhJIhNVYguRG9yVwHEvM4teTiaDnxaWT/ucs
 2ZYFlnCGFyecDXAE/Rp13esGBonWBazBa6oAAU2pUfGMFjqvjyYv5Lwzs
 K6mobHkdd+Qm5trkPR2izuOYn8uuZGeZxNPgBMC4vfmp1w0uFbkK9aKSJ
 d+IE06HyZOmHfRKnq4PD5QNOmAZpclBXyX0nA0dCXm43c7CdvMPaklg3E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12431782"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="12431782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6177771"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 06:15:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 15:15:23 +0100
Message-Id: <20231115141523.2037-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Promote guc_to_gt/xe helpers to .h
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Duplicating these helpers in almost every .c file is a bad idea.
Define them as inlines in .h file to allow proper reuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
Q: How many object files would get rebuilt if this header file
   was modified?

$ touch drivers/gpu/drm/xe/xe_guc.h && make | grep -c CC
12

and it is the same number as without this patch
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
index 5b3585e2c125..03c1ab0ab0ca 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -59,12 +59,6 @@ struct acc {
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
index b5c39c55e1fa..a28f31c05b1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -13,12 +13,6 @@
 
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
index 84f0b5488783..311c5d539423 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -27,18 +27,6 @@
 #include "xe_wa.h"
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
index 3addd8fc674a..d3e49e7fd7c3 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GUC_H_
 #define _XE_GUC_H_
 
+#include "xe_gt.h"
 #include "xe_guc_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
@@ -58,4 +59,14 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
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
index 167eb5593e03..ffd7d53bcc42 100644
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
index 76aed9c348ab..57d325ec8ce3 100644
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
index fbd0fd11da6a..9e9e925c7353 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -36,18 +36,6 @@
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
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
-- 
2.25.1

