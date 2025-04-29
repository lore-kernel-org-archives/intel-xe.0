Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C029C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 07:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CF210E391;
	Tue, 29 Apr 2025 07:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5Tb6Nyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77A110E3C4
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745912182; x=1777448182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4C6WCm1RZahbAL9C3ikuD0/FIV3G/3jSXkBh//tXFI=;
 b=b5Tb6Nyh+hyBQT+dTVo9iCDwqEf+wbGRK2Ow/kwthqGX1BxEnzZ8sAvF
 vMVutVBGvOJP+HPgqTOmsO89nYpIYNNlEoe0NMkCHkhr9phjZYKhDm2lC
 LdDasHqGIFo938tYD/rUWRpA6dNL9xpmn7fe8a+7EhbL/l1NOd7s0Mao5
 dcZ2uM3/2/swT2lnjgqQbErbIToAvNEJolXKJseYM5axpec6WTMgU2eRW
 /AopWtNzy8m79FClUijoJYypfo70cBIYoK6zX2wEf9kjpT58Up809IJI3
 ebscf5Isa+qV/6Mjh/k4eMFSpYcpn9kSSNmY5uAsNPMc3+qKEutOC7ExM w==;
X-CSE-ConnectionGUID: ehFGBjBpTrCAbl+nHsbSiw==
X-CSE-MsgGUID: H23DwRSgQ0C0EzEa9WgeKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58178179"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58178179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 00:36:21 -0700
X-CSE-ConnectionGUID: hAkt9UDzTaG+kkrlnryY4Q==
X-CSE-MsgGUID: 944kxCfcRjaI62QGglZIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138559833"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:36:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedeskop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org
Subject: [RFC 5/9] drm/xe/xe_late_bind_fw: Load late binding firmware
Date: Tue, 29 Apr 2025 13:08:00 +0530
Message-Id: <20250429073804.972137-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
References: <20250429073804.972137-1-badal.nilawar@intel.com>
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

Load late binding firmware

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 91 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  1 +
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d83864e7189c..30a416323b37 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -894,6 +894,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_late_bind_fw_init(&xe->late_bind);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 297238fd3d16..7d2bc959027d 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -16,6 +16,16 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
+
+/*
+ * The component should load quite quickly in most cases, but it could take
+ * a bit. Using a very big timeout just to cover the worst case scenario
+ */
+#define LB_INIT_TIMEOUT_MS 20000
+
+#define LB_FW_LOAD_RETRY_MAXCOUNT 40
+#define LB_FW_LOAD_RETRY_PAUSE_MS 50
 
 static const char * const fw_id_to_name[] = {
 		[FAN_CONTROL_ID] = "fan_control",
@@ -45,6 +55,78 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
+static void late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw[lbfw->id]);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	if (!late_bind->component_added)
+		return;
+
+	if (!lbfw->valid)
+		return;
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component)
+			break;
+		msleep(100);
+	}
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&late_bind->mutex);
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
+
+	do {
+		ret = late_bind->component->ops->push_config(late_bind->component->mei_dev,
+							     lbfw->type, lbfw->flags,
+							     lbfw->payload, lbfw->payload_size);
+		if (!ret)
+			break;
+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
+	} while (--retry && ret == -EAGAIN);
+
+	if (ret)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
+			fw_id_to_name[lbfw->id], ret);
+	else
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int id;
+
+	if (!late_bind->component_added)
+		return -EINVAL;
+
+	for (id = 0; id < MAX_ID; id++) {
+		lbfw = &late_bind->late_bind_fw[id];
+		if (lbfw->valid) {
+			drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+			queue_work(late_bind->wq, &lbfw->work);
+		}
+	}
+	return 0;
+}
+
+/**
+ * late_bind_fw_init() - initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
 static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
@@ -93,6 +175,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
 
 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, late_bind_work);
 	lb_fw->valid = true;
 
 	return 0;
@@ -108,12 +191,17 @@ int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
 	int id;
 	int ret;
 
+	late_bind->wq = create_singlethread_workqueue("late-bind-ordered-wq");
+	if (!late_bind->wq)
+		return -ENOMEM;
+
 	for (id = 0; id < MAX_ID; id++) {
 		ret = late_bind_fw_init(late_bind, id);
 		if (ret)
 			return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 static int xe_late_bind_component_bind(struct device *xe_kdev,
@@ -179,7 +267,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	}
 
 	late_bind->component_added = true;
-	/* the component must be removed before unload, so can't use drmm for cleanup */
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index e88c637b15a6..edd0e4c0650e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -13,5 +13,6 @@ struct xe_late_bind;
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 void xe_late_bind_remove(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
 
 #endif
-- 
2.34.1

