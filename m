Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E1BC624DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8808E10E154;
	Thu,  3 Sep 2026 15:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLnzgV8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCCB10E154
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447640; x=1819983640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wHDTwEWxbikUYlOEMwegGe0qIxIT3bonumpz0bb9BI=;
 b=SLnzgV8sbK+2E4JHHKylI6Eh6YLsq7yuGdsv8svP+jrAH5mbfx/lRyNp
 sgkJ5TotEvyoqPL8+oL7pn7PgkiV/NI332gBMkOl1Xiia+dtl4GSpJFzq
 WiERnTWECHSVOsCKp+OBzEJNZEWxxePywDmmkfyMbBEzj/7ctfl31+VkB
 XXQgFTeodtdFskpF+VM/74PbPyUigOVui/dwnss0lMGVt0gy0VxIvCeOX
 VCICHo1tUn06GF1puyu/U9htxkwCewTYV0oyQFTqXQq7iBQg82SsNEjlD
 6Xg/fUt8Q82vD7Lxr+rmeBuzC3sup5EZ+drc7psXGLvP5RHeOx8pXio9V g==;
X-CSE-ConnectionGUID: T7FnhUW4RRmiG1cz5mf75A==
X-CSE-MsgGUID: Wz/ZUVltS3eHGwTW/XEsfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486687"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:39 -0700
X-CSE-ConnectionGUID: 6fxsRNLJSFqa14Xn48fe9Q==
X-CSE-MsgGUID: kbqx8/kjRvqc29vStrTBpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440691"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:34 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH v10 07/27] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Thu,  3 Sep 2026 17:59:31 +0300
Message-ID: <20260903145952.848051-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Inform the GuC which contexts are debuggable, as their
handling differs from ordinary contexts.

v2: void return, use xe_gt_dbg, no need for lrc (Matt)
v3: add the workaround enabling (Daniele)
v4: version needed to 70.49.4
v5: bail out early before registering eq (Daniele)
v6: export the guc action for future (Mika)
v7: remove redundant xe_gt_info (Sashiko)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 ++++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++
 drivers/gpu/drm/xe/xe_guc.c              |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.h              |  6 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c          | 12 +++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
 9 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index f5c9b37038d4..652c4e75ed2b 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -162,6 +162,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
 	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
+	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
 	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
 	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
 	XE_GUC_ACTION_LIMIT
@@ -285,4 +286,8 @@ enum xe_guc_g2g_type {
 /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
 #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
 
+enum  xe_guc_eu_kernel_debug_request_type {
+	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 685c4ef17b73..85570453892c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -522,6 +522,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
+	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
 	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 12410646d15d..98f32c99a3a3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -19,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_guc.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_irq.h"
@@ -998,6 +999,7 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 				  u64 value)
 {
 	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+	struct xe_guc *guc = &q->gt->uc.guc;
 
 	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
 			      q->class != XE_ENGINE_CLASS_COMPUTE)))
@@ -1009,6 +1011,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 	if (XE_IOCTL_DBG(xe, !IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)))
 		return -EOPNOTSUPP;
 
+	if (XE_IOCTL_DBG(xe, !xe_guc_has_debug_contexts(guc)))
+		return -EOPNOTSUPP;
+
 	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_lr(q)))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..2a037aebf569 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1918,6 +1918,14 @@ u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
 	return hwe->logical_instance;
 }
 
+bool xe_guc_has_debug_contexts(struct xe_guc *guc)
+{
+	return GUC_FIRMWARE_VER_AT_LEAST(guc,
+					 XE_GUC_VER_DEBUG_CONTEXTS_MAJOR,
+					 XE_GUC_VER_DEBUG_CONTEXTS_MINOR,
+					 XE_GUC_VER_DEBUG_CONTEXTS_PATCH);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_g2g_test.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 61e3ee19a59b..2d1e1bfd3d3b 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -29,6 +29,11 @@
 #define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
 	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
+/* Lowest GuC version that knows how to handle debuggable contexts */
+#define XE_GUC_VER_DEBUG_CONTEXTS_MAJOR	70
+#define XE_GUC_VER_DEBUG_CONTEXTS_MINOR	49
+#define XE_GUC_VER_DEBUG_CONTEXTS_PATCH	4
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
@@ -63,6 +68,7 @@ int xe_guc_start(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
 bool xe_guc_has_paging_engine(struct xe_guc *guc);
+bool xe_guc_has_debug_contexts(struct xe_guc *guc);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ff8eee3831aa..8a6cab7bf0d4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -396,6 +396,18 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
 	}
 
+	if (IS_ENABLED(CONFIG_DRM_XE_EUDEBUG) && XE_GT_WA(gt, 14022766366)) {
+		if (xe_guc_has_debug_contexts(&gt->uc.guc)) {
+			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+					 GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH);
+		} else {
+			xe_gt_info(gt, "eudebug needs GuC version %u.%u.%u or greater\n",
+				   XE_GUC_VER_DEBUG_CONTEXTS_MAJOR,
+				   XE_GUC_VER_DEBUG_CONTEXTS_MINOR,
+				   XE_GUC_VER_DEBUG_CONTEXTS_PATCH);
+		}
+	}
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..18a3ece25c3c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1013,6 +1013,37 @@ static u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logic
 	return logical_mask;
 }
 
+int xe_guc_action_eu_kernel_debug(struct xe_guc *guc, u32 id, u32 cmd)
+{
+	const u32 action[] = {
+		XE_GUC_ACTION_EU_KERNEL_DEBUG,
+		id,
+		cmd,
+		0, /* reserved */
+	};
+
+	return xe_guc_ct_send(&guc->ct, action,
+			      ARRAY_SIZE(action), 0, 0);
+}
+
+static void set_eu_kernel_debug(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = xe_guc_action_eu_kernel_debug(guc, q->guc->id,
+					    XE_GUC_EU_KERNEL_DEBUG_ENABLE);
+
+	if (ret)
+		xe_gt_err_ratelimited(gt,
+				      "GuC ctx=%u debug enabling failed with %d",
+				      q->guc->id, ret);
+	else
+		xe_gt_dbg(gt,
+			  "GuC ctx=%u enabled for debug", q->guc->id);
+}
+
 static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1074,6 +1105,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
 	if (xe_exec_queue_is_multi_queue_secondary(q))
 		guc_exec_queue_send_cgp_sync(q, CGP_SYNC_REGISTRATION);
+
+	if (xe_exec_queue_is_debuggable(q))
+		set_eu_kernel_debug(q);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index ccade320dc69..e7a24f8ecbc5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -56,5 +56,6 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
 
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
+int xe_guc_action_eu_kernel_debug(struct xe_guc *guc, u32 id, u32 cmd);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index dd69ad07f7a9..3de46094ab5c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,3 +72,5 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
+14022766366	GRAPHICS_VERSION_RANGE(2001, 2004)
+		GRAPHICS_VERSION_RANGE(3000, 3005)
-- 
2.53.0

