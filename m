Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B05CDE03D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 22:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F210E322;
	Thu, 26 Sep 2024 22:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1wmGq+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A7210E322
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727389208; x=1758925208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJEW9Knbz7NlCmY5OA05/TdKd+3/jHhprMcgWDFc6jM=;
 b=V1wmGq+B6/gHG6hUpx87Y1COjGcvwnD7Z39XvF7iW79sirMDt//hOb4r
 lI1Of/RPxGZW82GmnkHUEfDBAyEPj79oGW2f6ZW2CAh4EeC0bjepp9e7v
 S/9a1OhNWDfEToKT36motqW1GjuD0h+bLLJdABw84VK35qP+mHu/pjzGy
 tKQp2f1BJEeh41am19lTZqUC/g3wV9xvfiBpOkxd3NVp9Jkxsn+Iqj0tX
 JQHxlG6hVkL1WaMAImB76pOxtxj5XmbFzBcqZkbbAPfON3c/oivRIJw20
 l7KV7L5AWiDO6nM/uKlJFARODw1K0sKxz+N2UfHywANzYK1k4I/k4pnD1 Q==;
X-CSE-ConnectionGUID: NEY3U2M7TUi+6QJhICet6w==
X-CSE-MsgGUID: NPiNgs5QSLKsq0VHP8KKjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26617035"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26617035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 15:20:08 -0700
X-CSE-ConnectionGUID: 2epiaoYUTOe2b27HWcnRsA==
X-CSE-MsgGUID: QfcHOQE8ThOAEIQtOboZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72636204"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2024 15:20:07 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/4] drm/xe/vf: Send RESFIX_DONE message at end of VF
 restore
Date: Fri, 27 Sep 2024 00:20:02 +0200
Message-Id: <20240926222004.2462345-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926222004.2462345-1-tomasz.lis@intel.com>
References: <20240926222004.2462345-1-tomasz.lis@intel.com>
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

After restore, GuC will not answer to any messages from VF KMD until
fixups are applied. When that is done, VF KMD sends RESFIX_DONE
message to GuC, at which point GuC resumes normal operation.

This patch implements sending the RESFIX_DONE message at end of
post-migration recovery.

v2: keep pm ref during whole recovery, style fixes (Michal)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 36 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c                   |  3 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
 5 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index b6a1852749dd..0b28659d94e9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -501,6 +501,44 @@
 #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_NOTIFY_RESFIX_DONE
+ *
+ * This action is used by VF to notify the GuC that the VF KMD has completed
+ * post-migration recovery steps.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
+
+#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+
 /**
  * DOC: VF2GUC_QUERY_SINGLE_KLV
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8b8074e8e949..88cf3ca3e75d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -224,6 +224,42 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 	return 0;
 }
 
+static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+{
+	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+	};
+	int ret;
+
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+
+	return ret > 0 ? -EPROTO : ret;
+}
+
+/**
+ * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
+ * @gt: the &xe_gt struct instance linked to target GuC
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	err = guc_action_vf_notify_resfix_done(guc);
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
+				ERR_PTR(err));
+
+	return err;
+}
+
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
 				       u32 *value, u32 value_len)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9959a296b221..912d20814261 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fb5704526954..e563fd2f818f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -939,7 +939,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
+	/* this call can happen with CTB enabled during VF migration */
+	xe_assert(xe, IS_SRIOV_VF(xe) || !xe_guc_ct_enabled(&guc->ct));
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0192b9a0ef7a..bb3eab30cd43 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -8,6 +8,8 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_sriov_printk.h"
@@ -23,10 +25,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
+/*
+ * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
+ * @xe: the &xe_device struct instance
+ */
+static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err, num_sent = 0;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_vf_notify_resfix_done(gt);
+		if (!err)
+			num_sent++;
+	}
+	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
+}
+
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
+	xe_pm_runtime_get(xe);
 	/* FIXME: add the recovery steps */
+	vf_post_migration_notify_resfix_done(xe);
+	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
 }
 
-- 
2.25.1

