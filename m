Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263A4CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E4010E32F;
	Mon, 20 Oct 2025 12:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8VspDDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E77310E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964819; x=1792500819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EB+3Mwu5uVAxjNxT03/INJhtduv5MGTULXRm+c7QQ0I=;
 b=b8VspDDhJE5uqdvjW36R/Z5JldU34Jt193VNfPNa2MRacv5xcG2vomr3
 HLDv28kY4Ddi19ZK4DCySxPEGMdkNBbYG03MixNDiexyB7UX4cOPNbPhP
 +Slqg/xLOOHUxYLt5rqSQgFIBYPlWXiwbOXUjD2IIb3D97lXofJJDo4nJ
 bVpn6s5pCmMHvfbjmQCyHG0X/LvZqzlfYLTcBGpI7PdpAs9yGGi3QgidW
 6IfwvVlJVh9hnq+mH0D57FxyVMqgvIAzxCxJj3EkqRPaYXFNM1DDbkujF
 Dh+R90czmdYqSmwQ+RMdCjUyeFIR4qRuDq6jJt8HSst+beYG6WbSXTy2y g==;
X-CSE-ConnectionGUID: rcbBJH8xRvyxrecLoFtu6g==
X-CSE-MsgGUID: PWMFokqCQXSVdAFpZ8pkrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66941694"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66941694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:53:39 -0700
X-CSE-ConnectionGUID: 9gUskM3URBG6+OvyWOzq7g==
X-CSE-MsgGUID: 9V8Gg0sYTuSWhox8YmxofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="213937973"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.47])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:53:37 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Mon, 20 Oct 2025 15:53:28 +0300
Message-ID: <20251020125328.1008983-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
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

We need to inform to guc which contexts are debuggable
as their handling is different from ordinary contexts.

v2: void return, use xe_gt_dbg, no need for lrc (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 34 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 47756e4674a1..32a5f680a6d2 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -155,6 +155,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
 	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
+	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
 	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
 	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
 	XE_GUC_ACTION_LIMIT
@@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
 /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
 #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
 
+enum  xe_guc_eu_kernel_debug_request_type {
+	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ef67d3523a7..2ba576521d7a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -21,6 +21,7 @@
 #include "xe_assert.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
+#include "xe_eudebug_hw.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
@@ -651,6 +652,36 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static bool xe_guc_has_debug_contexts(struct xe_guc *guc)
+{
+	return GUC_FIRMWARE_VER(guc) >=	MAKE_GUC_VER(70, 49, 0);
+}
+
+static void xe_guc_action_eu_kernel_debug_enable(struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = q->hwe->gt;
+	u32 action[] = {
+		XE_GUC_ACTION_EU_KERNEL_DEBUG,
+		q->guc->id,
+		XE_GUC_EU_KERNEL_DEBUG_ENABLE,
+		0, /* reserved */
+	};
+	int i;
+
+	for (i = 0; i < q->width; i++) {
+		int ret;
+
+		action[1] = q->guc->id + i;
+
+		ret = xe_guc_ct_send(&q->gt->uc.guc.ct,
+				     action, ARRAY_SIZE(action), 0, 0);
+
+		if (ret)
+			xe_gt_dbg(gt, "Guc action[%u] for ctx=%d, failed with %d",
+				  action[2], action[1], ret);
+	}
+}
+
 static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -698,6 +729,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_get(q);
 
+	if (xe_exec_queue_is_debuggable(q) && xe_guc_has_debug_contexts(guc))
+		xe_guc_action_eu_kernel_debug_enable(q);
+
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_parallel(q))
-- 
2.43.0

