Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F91CD37B2
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 19:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506268902A;
	Fri,  8 May 2026 19:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByduNTrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA688867
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778269477; x=1809805477;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ha1/YkT3Ro6A/pKlqw3VMv7cnbrVEdrTeQ+2CZDp4bM=;
 b=ByduNTrnr2OBE4tgrGMsRF0GZTosA12SDW85sZjNgaTFMVRHbUGiJv4M
 h8WR+NGq9Vs07jxFZvtgPE1Xv6AQulGUvshBmYrvQe8By6tPCZyP533DL
 RyEGLMBYbo8bbk3JDRIGeiz1TMft4xFj/WnME/mfA/NCXlNl+qRN05co1
 KiP3VgpDfu65j0K9cpCXnikZuh4xjjpe1c8qUO0cSzBPt2RXIMVP92jKe
 b6OFfE2xN9VOQCcsL2cjJB0pz3AMauvDfqbl62nE7b53RzGsHNvvASfyj
 ldSVLewNV18L0KalVnSRg58ATZBewbCiBe1DbJpi1ZgB2o1ljqPZQX8SD A==;
X-CSE-ConnectionGUID: e+vWt0BfSZ2D4Y6uSUhn/A==
X-CSE-MsgGUID: b8RTJX4RQjiUT+9kllDLWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66776803"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="66776803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
X-CSE-ConnectionGUID: +r3lVJJ6THC8lZaGvJUuhg==
X-CSE-MsgGUID: Us0+aX96SeGdTsChdiHSzw==
X-ExtLoop1: 1
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/multi_queue: Refactor CGP_SYNC send path
Date: Fri,  8 May 2026 12:44:29 -0700
Message-ID: <20260508194428.61819-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
References: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
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

Factor the repeated CGP_SYNC action build-and-send sequence into a new
helper guc_exec_queue_send_cgp_sync(). Drop the redundant guc parameter
from __register_exec_queue_group() since it can be derived via
exec_queue_to_guc(q). Remove xe_guc_exec_queue_group_add() which is now
identical to the helper and replace its call site directly.

No functional change.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++++++++-------------------
 1 file changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 104e65913dff..4171eff4e8ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -852,10 +852,27 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
 }
 
-static void __register_exec_queue_group(struct xe_guc *guc,
-					struct xe_exec_queue *q,
+static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
+{
+#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE	(2)
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
+	int len = 0;
+
+	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
+	action[len++] = group->primary->guc->id;
+
+	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
+#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
+
+	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
+}
+
+static void __register_exec_queue_group(struct xe_exec_queue *q,
 					struct guc_ctxt_registration_info *info)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
 #define MAX_MULTI_QUEUE_REG_SIZE	(8)
 	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
 	int len = 0;
@@ -880,29 +897,6 @@ static void __register_exec_queue_group(struct xe_guc *guc,
 	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
 }
 
-static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
-					struct xe_exec_queue *q)
-{
-#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
-	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
-	int len = 0;
-
-	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
-
-	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
-	action[len++] = q->multi_queue.group->primary->guc->id;
-
-	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
-#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
-
-	/*
-	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
-	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
-	 * from guc.
-	 */
-	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
-}
-
 static void __register_mlrc_exec_queue(struct xe_guc *guc,
 				       struct xe_exec_queue *q,
 				       struct guc_ctxt_registration_info *info)
@@ -1028,7 +1022,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_multi_queue_primary(q))
-		__register_exec_queue_group(guc, q, &info);
+		__register_exec_queue_group(q, &info);
 	else if (xe_exec_queue_is_parallel(q))
 		__register_mlrc_exec_queue(guc, q, &info);
 	else if (!xe_exec_queue_is_multi_queue_secondary(q))
@@ -1038,7 +1032,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 		init_policies(guc, q);
 
 	if (xe_exec_queue_is_multi_queue_secondary(q))
-		xe_guc_exec_queue_group_add(guc, q);
+		guc_exec_queue_send_cgp_sync(q);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
@@ -1887,21 +1881,8 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 {
 	struct xe_exec_queue *q = msg->private_data;
 
-	if (guc_exec_queue_allowed_to_change_state(q)) {
-#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE        (2)
-		struct xe_guc *guc = exec_queue_to_guc(q);
-		struct xe_exec_queue_group *group = q->multi_queue.group;
-		u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
-		int len = 0;
-
-		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
-		action[len++] = group->primary->guc->id;
-
-		xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
-#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
-
-		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
-	}
+	if (guc_exec_queue_allowed_to_change_state(q))
+		guc_exec_queue_send_cgp_sync(q);
 
 	kfree(msg);
 }
-- 
2.43.0

