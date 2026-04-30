Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A07FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692BE10F2E3;
	Thu, 30 Apr 2026 10:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCjZRerr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023A610F308
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546350; x=1809082350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPt3xF/sWm/WlcN19YnhbHxHu7RJ76cwNzTHMbZJUbw=;
 b=DCjZRerrZ3qVFUi+2LYG0CE8aqnIfFewKad7EhcyLUq79VaSrNoBtYd6
 5UkzmNP52EcV/myN/tKNqbLjN7e4qu7lEg1SpTxSoLk4e0OyZ2eqgLS7R
 73suFBzoFNoQCnpfh9eON6dcYkyOLXuXWx8eeQxN09CAvdJzBYvrVV+g4
 JO7D20IO3RPIHF3c4UqYPcvjxpJ0FKGOX2vm1PVJsR/xbHjgWLXU67ng5
 B0FPSruUFc8tg6Bocm9er+sZ1XNE5ISPmNzktGuiJ6bqQPZCFHZMTs5Rd
 5hH5Db7rCzT7CUfFCN2ahlpmmmY6VVoxH8afLC2r/jg4X94LieODZ6fif w==;
X-CSE-ConnectionGUID: Ia+DSQB/Rn6vKg2sBR/iyQ==
X-CSE-MsgGUID: 4sDpsqt5QBOOcGR/BKkk9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585924"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:30 -0700
X-CSE-ConnectionGUID: FJZWHml2So658fQY1oeEcw==
X-CSE-MsgGUID: 2CLsBdhyTO6ks9FK2O2I7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518564"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:24 -0700
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
Subject: [PATCH 07/24] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Thu, 30 Apr 2026 13:51:03 +0300
Message-ID: <20260430105121.712843-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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
index 644f5a4226d7..4cca653e37a1 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -504,6 +504,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
+	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d2b6203aef11..d0164fb795ad 100644
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
@@ -1000,6 +1001,7 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 				  u64 value)
 {
 	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+	struct xe_guc *guc = &q->gt->uc.guc;
 
 	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
 			      q->class != XE_ENGINE_CLASS_COMPUTE)))
@@ -1011,6 +1013,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
 	if (XE_IOCTL_DBG(xe, !IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)))
 		return -EOPNOTSUPP;
 
+	if (XE_IOCTL_DBG(xe, !xe_guc_has_debug_contexts(guc)))
+		return -EOPNOTSUPP;
+
 	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_lr(q)))
 		return -EINVAL;
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e468b638271b..8fae93d5755e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1846,6 +1846,23 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
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
index 02514914f404..9c6b3845d0bc 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -29,6 +29,8 @@
 #define GUC_FIRMWARE_VER_AT_LEAST(guc, ver...) \
 	xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
 
+#define XE_UC_FW_VERSION_DEBUG_CONTEXTS { .major = 70, .minor = 49, .patch = 4 }
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
@@ -62,6 +64,7 @@ void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
+bool xe_guc_has_debug_contexts(struct xe_guc *guc);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ce651da6f318..9574d0567701 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -364,6 +364,23 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
 
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
index b1222b42174c..69973eb6e978 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -979,6 +979,37 @@ static void __register_exec_queue(struct xe_guc *guc,
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
@@ -1039,6 +1070,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
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
index f8a185103b80..445ba0d19051 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -62,6 +62,7 @@
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

