Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA97EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E9F10E438;
	Mon, 23 Feb 2026 14:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCvLakC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C1E10E42E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855445; x=1803391445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGVstV6LXLvThGCPM3oOQoajwEQj4UGbfqYmiAgyGRU=;
 b=jCvLakC5WAOGS0ilz3Y5WnIx1ZWv+8rth3BBlWXwNT3gg3zFqkQfWYHD
 m+JVZEGEoQKOayaHywOJBOcUaKBbvcFirkWqoXAB4cDIHlnIE9J9OxL4f
 ZOZ0xUZ7AOfnM8D5nIte5Bhe2sb6BQkg+ppvDXUplX1L/UIrK+tvQlS3K
 g1G8sqM2bkwATEDnkS7rj1FZF9pKftm9puUlwq1+whKt3osfHM7Tawb7S
 Be1TWuhMb74Fkr3Fmp3jtBHCmnNsSvth+XNeljvm7LMBYydKj6vbd2PUi
 CiVkg5q+2ak8Yx9GRaYzxQYkA49pnz3DB3T7AHcQ30D4Ld3FxN2GCySSM A==;
X-CSE-ConnectionGUID: QG89jIm4Ss2EqPkbxcLEmg==
X-CSE-MsgGUID: m8WYFYPtRLuRfxUTJoWUVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460864"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:05 -0800
X-CSE-ConnectionGUID: KlQL2JRBROC2HqG3Wut+Bg==
X-CSE-MsgGUID: Uh+54NhrRxGc4/el8uX1Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656333"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:00 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH 07/22] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Mon, 23 Feb 2026 16:03:02 +0200
Message-ID: <20260223140318.1822138-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
v3: add the workaround enabling (Daniele)
v4: version needed to 70.49.4
v5: bail out early before registering eq (Daniele)
v6: export the guc action for future (Mika)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 ++++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++
 drivers/gpu/drm/xe/xe_guc.c              | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.h              |  3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c          | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  3 ++-
 9 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 83a6e7794982..918247d1f526 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -161,6 +161,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
 	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
+	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
 	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
 	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
 	XE_GUC_ACTION_LIMIT
@@ -284,4 +285,8 @@ enum xe_guc_g2g_type {
 /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
 #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
 
+enum  xe_guc_eu_kernel_debug_request_type {
+	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e33bd622ab44..4970d664d5d9 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
+	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 53cb6634248e..d7931c41da90 100644
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
@@ -858,6 +859,7 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 				  u64 value)
 {
 	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+	struct xe_guc *guc = &q->gt->uc.guc;
 
 	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
 			      q->class != XE_ENGINE_CLASS_COMPUTE)))
@@ -869,6 +871,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 	if (XE_IOCTL_DBG(xe, !IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)))
 		return -EOPNOTSUPP;
 
+	if (XE_IOCTL_DBG(xe, !xe_guc_has_debug_contexts(guc)))
+		return -EOPNOTSUPP;
+
 	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_lr(q)))
 		return -EINVAL;
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..58a624dacde9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1822,6 +1822,23 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 	return GT_VER(gt) >= 35;
 }
 
+bool xe_guc_has_debug_contexts(struct xe_guc *guc)
+{
+	const struct xe_uc_fw_version required = XE_UC_FW_VERSION_DEBUG_CONTEXTS;
+	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (MAKE_GUC_VER_STRUCT(*version) < MAKE_GUC_VER_STRUCT(required)) {
+		xe_gt_info(gt,
+			   "debug context unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
+			   version->major, version->minor, version->patch, required.major,
+			   required.minor, required.patch);
+		return false;
+	}
+
+	return true;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_g2g_test.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 66e7edc70ed9..a516a479b81e 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -29,6 +29,8 @@
 #define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
 	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
+#define XE_UC_FW_VERSION_DEBUG_CONTEXTS { .major = 70, .minor = 49, .patch = 4 }
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
@@ -61,6 +63,7 @@ void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
+bool xe_guc_has_debug_contexts(struct xe_guc *guc);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..1b84f4bd4236 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -361,6 +361,23 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	if (XE_GT_WA(gt, 14022766366)) {
+		if (xe_guc_has_debug_contexts(&gt->uc.guc)) {
+			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+					 GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH);
+		} else  {
+			const struct xe_uc_fw_version required =
+				XE_UC_FW_VERSION_DEBUG_CONTEXTS;
+
+			xe_gt_info(gt, "eudebug needs GuC version %u.%u.%u or greater\n",
+				   required.major,
+				   required.minor,
+				   required.patch);
+		}
+	}
+#endif
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ca7aa4f358d0..b0035f029fcd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -964,6 +964,37 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
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
+		xe_gt_warn(gt,
+			   "GuC ctx=%u debug enabling failed with %d",
+			   q->guc->id, ret);
+	else
+		xe_gt_dbg(gt,
+			  "GuC ctx=%u enabled for debug", q->guc->id);
+}
+
 static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1024,6 +1055,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
 	if (xe_exec_queue_is_multi_queue_secondary(q))
 		xe_guc_exec_queue_group_add(guc, q);
+
+	if (xe_exec_queue_is_debuggable(q))
+		set_eu_kernel_debug(q);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..d296e30f9e39 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -55,5 +55,6 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
 
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
+int xe_guc_action_eu_kernel_debug(struct xe_guc *guc, u32 id, u32 cmd);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ac08f94f90a1..5527c2cf4f81 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -73,6 +73,7 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
-
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14022766366	GRAPHICS_VERSION_RANGE(2001, 2004)
+		GRAPHICS_VERSION_RANGE(3000, 3005)
-- 
2.43.0

