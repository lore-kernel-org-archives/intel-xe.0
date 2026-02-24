Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54BE9B24D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FBA10E23C;
	Tue, 24 Feb 2026 10:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gg+1/pwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0F210E23C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929022; x=1803465022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jsjoK5roFay3tNgRS0RZXPf9UEsDs5D/Gg3y2P31b5Q=;
 b=gg+1/pwRbMNM+TDPTOUcIi46YBqUWqjfr+BE2vQBda9g791FSfaGk0si
 zUK00/6E6MYYJGx7x0AQbYdSV8NDdt1lszr4fMedbtChukj8XzEZyqv7o
 Pi6g9hAxfBZFWcPBHl16tOAMTSBt7hvm0wSyUvf8V0dmgsijMtE8iG6kD
 pN7MHV9Xfr8AMRGAuXcZCI+nEwr2x/fCnVwGr1d9KN8+ke/LmgwNO/iu4
 n11eJB5UGpqjnfyigSxnCuWaDEtVUoS0SNB5iV7QUcHjxp+9G66gzxJA0
 jr2duNJMj3h6hJKlLT6QnAUgpyppAR78Jfxd1h8LqVpLzp/XwWPBR9LJs w==;
X-CSE-ConnectionGUID: WsUUXHMhTiaLoNAb/rgOVg==
X-CSE-MsgGUID: eaxYw9BFS8aKibkIVoCHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046358"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046358"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:22 -0800
X-CSE-ConnectionGUID: nJZKsTZgS7yMuryssJUuYA==
X-CSE-MsgGUID: 7ZRgo9PxQv+XPRbOMVtuVw==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:19 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/6] drm/xe/uc: Introduce FLR helpers
Date: Tue, 24 Feb 2026 15:55:15 +0530
Message-ID: <20260224102618.3105171-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
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

In preparation of usecases which require preparing/re-initializing uCs
before/after FLR, introduce flr_prepare/done() helpers for respective uCs.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c  | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.h  |  2 ++
 drivers/gpu/drm/xe/xe_guc.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_huc.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_huc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h  |  2 ++
 10 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index e5c234f3d795..66741d7d27db 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -552,6 +552,21 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
+int xe_gsc_flr_done(struct xe_gsc *gsc)
+{
+	int ret;
+
+	if (!xe_uc_fw_is_loadable(&gsc->fw))
+		return 0;
+
+	ret = xe_uc_fw_copy(&gsc->fw);
+	if (ret)
+		return ret;
+
+	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOADABLE);
+	return 0;
+}
+
 void xe_gsc_stop_prepare(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index b8b8e0810ad9..8b7fd98f0be6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -13,6 +13,7 @@ struct xe_gsc;
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_gsc_flr_done(struct xe_gsc *gsc);
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..105a7f598d4c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -947,6 +947,16 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		xe_pm_runtime_put(gt_to_xe(gt));
 }
 
+void xe_gt_flr_prepare(struct xe_gt *gt)
+{
+	xe_uc_flr_prepare(&gt->uc);
+}
+
+int xe_gt_flr_done(struct xe_gt *gt)
+{
+	return xe_uc_flr_done(&gt->uc);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..5e6e4eb09efe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -63,6 +63,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
  */
 void xe_gt_record_user_engines(struct xe_gt *gt);
 
+int xe_gt_flr_done(struct xe_gt *gt);
+void xe_gt_flr_prepare(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..4fb13c2ac39e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1659,6 +1659,22 @@ void xe_guc_sanitize(struct xe_guc *guc)
 	xe_guc_submit_disable(guc);
 }
 
+int xe_guc_flr_done(struct xe_guc *guc)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	int ret;
+
+	if (!xe_uc_fw_is_loadable(&guc->fw))
+		return 0;
+
+	ret = xe_uc_fw_copy(&guc->fw);
+	if (ret)
+		return ret;
+
+	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
+	return xe_managed_bo_reinit_in_vram(tile_to_xe(tile), tile, &guc->fw.bo);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 66e7edc70ed9..ee7e8fd99b86 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -32,6 +32,7 @@
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+int xe_guc_flr_done(struct xe_guc *guc);
 int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..0e76123363ee 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,6 +296,22 @@ void xe_huc_sanitize(struct xe_huc *huc)
 	xe_uc_fw_sanitize(&huc->fw);
 }
 
+int xe_huc_flr_done(struct xe_huc *huc)
+{
+	struct xe_tile *tile = gt_to_tile(huc_to_gt(huc));
+	int ret;
+
+	if (!xe_uc_fw_is_loadable(&huc->fw))
+		return 0;
+
+	ret = xe_uc_fw_copy(&huc->fw);
+	if (ret)
+		return ret;
+
+	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
+	return xe_managed_bo_reinit_in_vram(tile_to_xe(tile), tile, &huc->fw.bo);
+}
+
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index fa1c45e70443..7600ea196908 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
 	XE_HUC_AUTH_TYPES_COUNT
 };
 
+int xe_huc_flr_done(struct xe_huc *huc);
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_init_post_hwconfig(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d9aa845a308d..ed492da26ae8 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -17,6 +17,7 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
+#include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
@@ -283,6 +284,29 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+void xe_uc_flr_prepare(struct xe_uc *uc)
+{
+	xe_gsc_wait_for_worker_completion(&uc->gsc);
+	xe_uc_reset_prepare(uc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
+}
+
+int xe_uc_flr_done(struct xe_uc *uc)
+{
+	int ret;
+
+	ret = xe_guc_flr_done(&uc->guc);
+	if (ret)
+		return ret;
+
+	ret = xe_huc_flr_done(&uc->huc);
+	if (ret)
+		return ret;
+
+	return xe_gsc_flr_done(&uc->gsc);
+}
+
 void xe_uc_suspend_prepare(struct xe_uc *uc)
 {
 	xe_gsc_wait_for_worker_completion(&uc->gsc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..1756821edea1 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -8,6 +8,8 @@
 
 struct xe_uc;
 
+int xe_uc_flr_done(struct xe_uc *uc);
+void xe_uc_flr_prepare(struct xe_uc *uc);
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
-- 
2.43.0

