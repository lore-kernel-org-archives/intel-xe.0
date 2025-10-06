Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA6CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95EA10E42C;
	Mon,  6 Oct 2025 11:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtRgREFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC910E42C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749518; x=1791285518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EugXzRDHQkYCOyK9ssk4SxaTQ0el6mxAeLuk5e+V5d8=;
 b=EtRgREFfDl22QeP2RKEc4ltWP2SMbBZDgCwrC+W+wDfZV3gzAY/ImHSi
 NF8LUVEmc3IqHasqnpHOx7rQfQfSGTkaVfJGKR8T4r2LpMTF1osuUpkwi
 i0Jt7b304en6k02MLbWUBsrhsJcFjZYKWtdu4CtHpP0gf6slqnKhS0mRY
 dBCQUBZxC44KY7f8kfeKzUhvJuPG46uEr+MRjGEHrAr54xp6VGlpnCDCD
 bXyst8PEFA7OL1L6SQqtLIcw6Oy33Ln8coHnOelrMbuWomkV0LX+Ry//k
 3tr64i6VWMCuHJjdbpByvFnllr/YbPRSX6565Ap+bP+to5sAXJLrnlJ9I w==;
X-CSE-ConnectionGUID: FGhfMUP/RsuDl6RWCCUChQ==
X-CSE-MsgGUID: K13fc59JRdaTwaXYO1j+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825464"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:37 -0700
X-CSE-ConnectionGUID: EGgn64V4TBy/vmCli5dFsg==
X-CSE-MsgGUID: XfkGbq2fQRuaedKGYDa5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216947206"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:18:32 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Mon,  6 Oct 2025 14:17:06 +0300
Message-ID: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 +++
 drivers/gpu/drm/xe/xe_eudebug_hw.c       | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h       |  4 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  4 ++
 4 files changed, 68 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
index a62c4b439888..cd4627705b56 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -12,6 +12,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_engine_regs.h"
 
+#include "abi/guc_actions_abi.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue.h"
@@ -20,6 +21,9 @@
 #include "xe_gt.h"
 #include "xe_gt_debug.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -675,6 +679,57 @@ static int xe_eu_control_stopped(struct xe_eudebug *d,
 	return xe_gt_eu_attention_bitmap(q->gt, bits, bitmask_size);
 }
 
+static int xe_guc_action_eu_kernel_debug(struct xe_device *xe,
+					 struct xe_exec_queue *q,
+					 struct xe_lrc *lrc, u32 cmd)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_EU_KERNEL_DEBUG,
+		q->guc->id,
+		cmd,
+		0, /* reserved */
+	};
+	int ret, i;
+
+	if (cmd != XE_GUC_EU_KERNEL_DEBUG_ENABLE)
+		return -EINVAL;
+
+	ret = -EINVAL;
+	for (i = 0; i < q->width; i++) {
+		if (lrc && q->lrc[i] != lrc)
+			continue;
+
+		action[1] = q->guc->id + i;
+		drm_dbg(&xe->drm, "Guc action[%u] for ctx=%d",
+			cmd, action[1]);
+
+		ret = xe_guc_ct_send(&q->gt->uc.guc.ct,
+				     action, ARRAY_SIZE(action), 0, 0);
+
+		if (ret)
+			drm_dbg(&xe->drm, "eudebug guc cmd %u failed with %d\n",
+				cmd, ret);
+	}
+
+	return ret;
+}
+
+static bool xe_guc_has_debug_contexts(struct xe_gt *gt)
+{
+	return GUC_FIRMWARE_VER(&gt->uc.guc) >=	MAKE_GUC_VER(70, 49, 0);
+}
+
+int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+
+	if (!xe_guc_has_debug_contexts(q->gt))
+		return 0;
+
+	return xe_guc_action_eu_kernel_debug(xe, q, NULL,
+					     XE_GUC_EU_KERNEL_DEBUG_ENABLE);
+}
+
 static struct xe_eudebug_eu_control_ops eu_control = {
 	.interrupt_all = xe_eu_control_interrupt_all,
 	.stopped = xe_eu_control_stopped,
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
index 8f59ec574e4e..5d1df5d7dc46 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -23,10 +23,14 @@ long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg);
 
 struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx);
 
+int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q);
+
 #else /* CONFIG_DRM_XE_EUDEBUG */
 
 static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable) { }
 
+static inline int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q) { return 0; }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif /* _XE_EUDEBUG_HW_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 16f78376f196..da264c1cfe76 100644
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
@@ -655,6 +656,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_get(q);
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		xe_eudebug_exec_queue_enable(q);
+
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_parallel(q))
-- 
2.43.0

