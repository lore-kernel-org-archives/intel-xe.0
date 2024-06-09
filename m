Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100C7C27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 18:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CE010E239;
	Sun,  9 Jun 2024 18:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="be95Abtv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D010E1F3
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 18:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717957191; x=1749493191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wPHZrJUrbaMGMRPoPSdLTRYF6Q2PedCU2QzyougSVY=;
 b=be95AbtvxHoGinLNYdwLDufkjrMJSyPD1vqCBlktIk+yZlrjmRYmejf2
 BUu2ItGGd3ZRW5xMcslpCdmN4CVfxvwxlrSAaKM0yEwsbD08fiBDL/CYZ
 9wPyLY80045YNZGL4aN+Wpg0Vk9u30azUcggfqP0uUzJSAaHZDIdM89/b
 f9Dmb2DJceL75KsLxMepHh4s5G/xqqqLxIHihA7gYwDsq7J7COOnD9LGo
 jhjFhws1ira/cydppaKYr3yak57uqlfwwKjJhZ+XNWjZduqULt69iXoMj
 jbzMOFLYDo9DtGL7RyjkdBnuc/Ke7OIwLf63XfEq4meWXd9Zpc+5uvA3A w==;
X-CSE-ConnectionGUID: HC2jXe0QSOigRLKbmEa4Yw==
X-CSE-MsgGUID: haZkENJ4TtqEly9FLWWazw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25192325"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="25192325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:51 -0700
X-CSE-ConnectionGUID: 9yLJ3nN4Rn6vrKcrah87/w==
X-CSE-MsgGUID: cWwS5IUgQr+Dm+NXNd7X2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="38969122"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Add pc_to_ct() helper
Date: Sun,  9 Jun 2024 20:19:30 +0200
Message-Id: <20240609181931.1724-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240609181931.1724-1-michal.wajdeczko@intel.com>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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

We are converting xe_guc_pc to xe_guc_ct few times already.
Add simple helper function to avoid code duplication.
While at it, simplify other helper functions and fix order
of local variables to match the guideline.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 37 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index b57207bb1f11..2eb8584566eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -19,6 +19,7 @@
 #include "xe_gt_idle.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_types.h"
+#include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -66,29 +67,27 @@
  *
  */
 
-static struct xe_guc *
-pc_to_guc(struct xe_guc_pc *pc)
+static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
 {
 	return container_of(pc, struct xe_guc, pc);
 }
 
-static struct xe_device *
-pc_to_xe(struct xe_guc_pc *pc)
+static struct xe_guc_ct *pc_to_ct(struct xe_guc_pc *pc)
 {
-	struct xe_guc *guc = pc_to_guc(pc);
-	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
+	return &pc_to_guc(pc)->ct;
+}
 
-	return gt_to_xe(gt);
+static struct xe_gt *pc_to_gt(struct xe_guc_pc *pc)
+{
+	return guc_to_gt(pc_to_guc(pc));
 }
 
-static struct xe_gt *
-pc_to_gt(struct xe_guc_pc *pc)
+static struct xe_device *pc_to_xe(struct xe_guc_pc *pc)
 {
-	return container_of(pc, struct xe_gt, uc.guc.pc);
+	return guc_to_xe(pc_to_guc(pc));
 }
 
-static struct iosys_map *
-pc_to_maps(struct xe_guc_pc *pc)
+static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 {
 	return &pc->bo->vmap;
 }
@@ -129,14 +128,14 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
 
 static int pc_action_reset(struct xe_guc_pc *pc)
 {
-	struct  xe_guc_ct *ct = &pc_to_guc(pc)->ct;
-	int ret;
+	struct xe_guc_ct *ct = pc_to_ct(pc);
 	u32 action[] = {
 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
 		SLPC_EVENT(SLPC_EVENT_RESET, 2),
 		xe_bo_ggtt_addr(pc->bo),
 		0,
 	};
+	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
@@ -147,14 +146,14 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 
 static int pc_action_query_task_state(struct xe_guc_pc *pc)
 {
-	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
-	int ret;
+	struct xe_guc_ct *ct = pc_to_ct(pc);
 	u32 action[] = {
 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
 		xe_bo_ggtt_addr(pc->bo),
 		0,
 	};
+	int ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
 		return -EAGAIN;
@@ -170,14 +169,14 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 {
-	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
-	int ret;
+	struct xe_guc_ct *ct = pc_to_ct(pc);
 	u32 action[] = {
 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
 		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
 		id,
 		value,
 	};
+	int ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
 		return -EAGAIN;
@@ -192,7 +191,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 
 static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
 {
-	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
+	struct xe_guc_ct *ct = pc_to_ct(pc);
 	u32 action[] = {
 		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
 		mode,
-- 
2.43.0

