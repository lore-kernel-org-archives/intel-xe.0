Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84FF3092A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5310E258;
	Thu,  5 Mar 2026 10:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrKoIQM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E210E258
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706837; x=1804242837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CdiBm4SBs61JV9y3+HudfY2qBcsA1IosXYb4n+2PyO0=;
 b=UrKoIQM/t81GchOpJSwpCOZL2qZZvEjMeC9OsUPC/ZQZz3mJ0NrxRt88
 eH8nr9dOuWFhm7HLi6KDDbCO0NfuIeLQLxQBXFakILwyCPypuNNb9ihEm
 +PbPoiIO9G8I0DYfKCoLAHC2buqjYwMz2DEKtqwKrGqwWXBK6TVZtVLrs
 Kn3u8XpWjRi8RqhPVotGLl1WKFvPA6RMpJWIfTkXgsDseGD1BPFejxAo9
 y5rNHAYTzdGNTy5pDDUifOtt+Gg3yqRmA3eI7AuRzt/iE00OZ6FSTmxy5
 +1nfHdRqGCdfqMNv/Xkhmmziq4T+NfRVRrjd+g1kifjGUayy7UrnYUIg3 Q==;
X-CSE-ConnectionGUID: VUKiRTgRQk+c2U7As2cwKA==
X-CSE-MsgGUID: 3OEHaKfdQ+6O95kUrl+p8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859094"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:57 -0800
X-CSE-ConnectionGUID: C8DbVot0SjKZ0oji5k9JrA==
X-CSE-MsgGUID: 5g2EHLxMQxSOM6P/hLAJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223326144"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:55 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [RFC PATCH 3/4] drm/xe/xe_late_bind_fw: Track firmware load status
Date: Thu,  5 Mar 2026 16:14:44 +0530
Message-ID: <20260305104441.2857181-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305104441.2857181-6-badal.nilawar@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
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

In CRI, Intel PMT depends on the ocode runtime status. Track the
late-binding firmware load status and expose an API, for xe_vsec driver,
to query it.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 68 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |  5 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 23 ++++++++
 drivers/gpu/drm/xe/xe_pm.c                 |  5 +-
 4 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index d3ef2926517bd..87137d6e4aaec 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -53,6 +53,32 @@ late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
 	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
 }
 
+static const char *xe_late_bind_fw_status_to_str(enum xe_late_bind_fw_status status)
+{
+	switch (status) {
+	case XE_LB_FW_NOT_SUPPORTED:
+		return "Not Supported";
+	case XE_LB_FW_AVAILABLE:
+		return "Available";
+	case XE_LB_FW_RUNNING:
+		return "Running";
+	case XE_LB_FW_FAILED:
+		return "Failed";
+	default:
+		return "Unknown";
+	}
+}
+
+static void xe_late_bind_change_fw_status(struct xe_late_bind_fw *lb_fw,
+					  enum xe_late_bind_fw_status status)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+
+	lb_fw->__status = status;
+	drm_dbg(&xe->drm, "%s firmware status changed to %s\n",
+		fw_id_to_name[lb_fw->id], xe_late_bind_fw_status_to_str(status));
+}
+
 /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
 static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 			    const void *data, size_t size, const char *manifest_entry)
@@ -235,6 +261,13 @@ static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bi
 			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
 				fw_id_to_name[lbfw->id]);
 			flush_work(&lbfw->work);
+
+			/*
+			 * flush is being called during component unbind, suspend etc.
+			 * So mark status XE_LB_FW_RUNNING -> XE_LB_FW_AVAILABLE
+			 */
+			if (lbfw->__status == XE_LB_FW_RUNNING)
+				xe_late_bind_change_fw_status(lbfw, XE_LB_FW_AVAILABLE);
 		}
 	}
 }
@@ -282,6 +315,7 @@ static void xe_late_bind_work(struct work_struct *work)
 	if (!ret) {
 		drm_dbg(&xe->drm, "Load %s firmware successful\n",
 			fw_id_to_name[lbfw->id]);
+		xe_late_bind_change_fw_status(lbfw, XE_LB_FW_RUNNING);
 		goto out;
 	}
 
@@ -294,10 +328,23 @@ static void xe_late_bind_work(struct work_struct *work)
 	/* Do not re-attempt fw load */
 	drmm_kfree(&xe->drm, (void *)lbfw->payload);
 	lbfw->payload = NULL;
+	xe_late_bind_change_fw_status(lbfw, XE_LB_FW_FAILED);
 out:
 	xe_pm_runtime_put(xe);
 }
 
+static void  xe_late_bind_fw_stop(struct xe_late_bind *late_bind)
+{
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload && lbfw->status == XE_LB_FW_RUNNING)
+			xe_late_bind_change_fw_status(lbfw, XE_LB_FW_AVAILABLE);
+	}
+}
+
 static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -331,6 +378,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	lb_fw->id = fw_id;
 	lb_fw->type = fw_id_to_type[lb_fw->id];
 	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
+	xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_NOT_SUPPORTED);
 
 	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
 		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
@@ -379,6 +427,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
+	xe_late_bind_change_fw_status(lb_fw, XE_LB_FW_AVAILABLE);
 
 	return 0;
 }
@@ -445,15 +494,30 @@ static void xe_late_bind_remove(void *arg)
 	}
 }
 
-void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
+/**
+ * xe_late_bind_ocode_status() - get ocode late bind firmware status
+ * @xe: pointer to xe device.
+ *
+ * Return: 0 if unsupported, 1 if available, 2 if running, 3 if failed.
+ */
+int xe_late_bind_ocode_status(struct xe_device *xe)
+{
+	struct xe_late_bind_fw *lbfw = &xe->late_bind.late_bind_fw[XE_LB_FW_OCODE];
+
+	return lbfw->status;
+}
+
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool is_runtime)
 {
 	if (!late_bind->component_added)
 		return;
 
 	if (late_bind->disable)
 		return;
+	if (!is_runtime)
+		xe_late_bind_wait_for_worker_completion(late_bind);
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	xe_late_bind_fw_stop(late_bind);
 }
 
 void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 8896fea3068e5..b441f5789f24b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -9,9 +9,10 @@
 #include <linux/types.h>
 
 struct xe_late_bind;
+struct xe_device;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
-void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind, bool is_runtime);
 void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
-
+int xe_late_bind_ocode_status(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index a128e3f638a6c..4cdbd775b103e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -26,6 +26,20 @@ enum xe_late_bind_fw_id {
 	XE_LB_FW_MAX_ID
 };
 
+/**
+ * enum xe_late_bind_fw_status - enum to determine late binding fw status
+ */
+enum xe_late_bind_fw_status {
+	/** @XE_LB_FW_NOT_SUPPORTED: firmware not available/supported */
+	XE_LB_FW_NOT_SUPPORTED,
+	/** @XE_LB_FW_AVAILABLE: firmware found and copied to memory */
+	XE_LB_FW_AVAILABLE,
+	/** @XE_LB_FW_RUNNING: firmware is running */
+	XE_LB_FW_RUNNING,
+	/** @XE_LB_FW_FAILED: firmware load is failed */
+	XE_LB_FW_FAILED,
+};
+
 /**
  * struct xe_late_bind_fw
  */
@@ -46,6 +60,15 @@ struct xe_late_bind_fw {
 	struct work_struct work;
 	/** @version: late binding blob manifest version */
 	struct gsc_version version;
+	union {
+		/** @status: firmware load status */
+		const enum xe_late_bind_fw_status status;
+		/**
+		 * @__status: private firmware load status - only to be used
+		 * by firmware loading code
+		 */
+		enum xe_late_bind_fw_status __status;
+	};
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f85b12c1a85d2..9aa873f57b5ad 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -182,7 +182,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_late_bind_pm_suspend(&xe->late_bind);
+	xe_late_bind_pm_suspend(&xe->late_bind, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -612,6 +612,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 			goto out_resume;
 	}
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_pm_suspend(&xe->late_bind, true);
+
 	xe_irq_suspend(xe);
 
 	xe_display_pm_runtime_suspend_late(xe);
-- 
2.52.0

