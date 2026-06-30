Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A1C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 20:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B01110E1BD;
	Tue, 30 Jun 2026 20:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSnhtItX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84DB10E1BD
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782849701; x=1814385701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5L8xK/QpG8rcQBtLyCX/Ydfu1mt1vAiXEG39J4OrmQ=;
 b=VSnhtItX71PyA+/9B8rzTDhBcjkhamaCGfrC37ZHf4t9bh4KHgdjYbo/
 c69+fx11oAdFcNF8UwxXZBlm/R1GtEHn7VJp//gZgleYG2iYA/tA6lrLy
 JNwsymfcYLP1uCTynNrkSKUcr/FaRiWR5F4krdFGcjf8HY0T6q7b3Ztx9
 RR2gOTToE3ZsCDayhSQ+t68w+cHHlo77AisSzS1XkghJxU0iAtXG1F7XH
 5E6fOQsEWlmZavkCNpceTcg0okApqh6wBnWbOPoUrNXK8hXXlBNVHKZ4T
 VlgCIFSj517OZVHU7DMlhtMm3CU1wK2HfI/m2BIhO+W/+/vqANeVfU7OX A==;
X-CSE-ConnectionGUID: 2VRplF5KTmua1hil5C0ibw==
X-CSE-MsgGUID: gz0EK4q5QeCkGcbkMvXuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87408877"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="87408877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 13:01:41 -0700
X-CSE-ConnectionGUID: IxR/Z+lCR8WUaTYqTZ2ntg==
X-CSE-MsgGUID: SiMfaPjgSsy4fNZT03DUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="290476052"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 13:01:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 1/1] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
Date: Tue, 30 Jun 2026 16:01:39 -0400
Message-Id: <20260630200139.2750152-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the GuC uncorrectable local error G2H notification and
opt in to the feature when the submission ABI exposes it.

When the notification targets a known exec queue, treat it like an
engine reset request and route it through the existing timeout cleanup
path. This keeps the queue teardown, pending job cancellation and error
capture in one place instead of open-coding a parallel recovery flow.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
History:
v4: Optimized GT and silicon version check.
    Remove wedged mode==2 handling, which is handled by other feature
v3: Remove not used flag bit and timeout worker check (Daniele)
    Remove wedged mode==2 check, which will be handled in separate patch(Daniele)
v2: Opt in for Xe3p only, excluding media GTs on NovaLake-P which don't support the feature
    Remove timeout bypass, which is outside the scope of this patch and can be added separately
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c              | 11 ++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  3 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
 7 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 83a6e7794982..f5c9b37038d4 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -152,6 +152,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
 	XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY = 0x6004,
+	XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR = 0x6005,
 	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
 	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
 	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..5c428f02a642 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -154,6 +154,11 @@ enum  {
  *      (instead of waiting the full timeslice duration). The bit is instead set
  *      to one if a single context is queued on the engine, to avoid it being
  *      switched out if there isn't another context that can run in its place.
+ *
+ * _`GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION` : 0x4004
+ *      This flag will enable notification from GuC to KMD via G2H message
+ *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
+ *      same interrupt from the CS.
  */
 
 #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
@@ -162,6 +167,9 @@ enum  {
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
 
+#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
+#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
+
 /**
  * DOC: GuC Scheduling Policies KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..6814714f3939 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -12,6 +12,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_errors_abi.h"
+#include "abi/guc_klvs_abi.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
@@ -641,6 +642,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
 
+	/*
+	 * The uncorrectable local error notification opt-in was added in
+	 * GuC v70.38.0, which maps to compatibility version v1.18.0.
+	 */
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 0) &&
+	    ((xe_gt_is_main_type(guc_to_gt(guc)) && GRAPHICS_VER(xe) >= 35) ||
+	     (xe_gt_is_media_type(guc_to_gt(guc)) && MEDIA_VER(xe) >= 35)))
+		klvs[count++] =
+			PREP_GUC_KLV_TAG(OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION);
+
 	if (supports_dynamic_ics(guc))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21e0dad9a481..fe6a55fe7fb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1661,6 +1661,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_exec_queue_memory_cat_error_handler(guc, payload,
 								 adj_len);
 		break;
+	case XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR:
+		ret = xe_guc_uncorrectable_error_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b29cc08e6291..29ccabc4b7a4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -9,6 +9,7 @@
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_managed.h>
 
@@ -2997,6 +2998,38 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	return 0;
 }
 
+int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id;
+
+	if (unlikely(!len || len > 2))
+		return -EPROTO;
+
+	guc_id = msg[0];
+
+	if (guc_id == GUC_ID_UNKNOWN) {
+		xe_gt_err(gt, "GuC: Uncorrectable local error! guc_id=%d\n", guc_id);
+		return 0;
+	}
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	xe_gt_err(gt,
+		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+
+	trace_xe_guc_uncorrectable_error(q);
+
+	/* Treat the same as engine reset */
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
+
+	return 0;
+}
+
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..ccade320dc69 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -34,6 +34,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
+int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 750fa32c13b2..2fe8f89a1e34 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -213,6 +213,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_guc_uncorrectable_error,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.34.1

