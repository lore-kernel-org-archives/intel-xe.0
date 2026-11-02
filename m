Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC409606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 17:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWywsvmw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3810E6A5;
	Mon,  2 Nov 2026 17:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A51F10E6A5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793640350; x=1825176350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fz7a0+SuDUCGeGs2F4YggLZI004Lh8wq4tnE7VBr/jw=;
 b=NWywsvmwnRJo4yTMov0uv7dhWB9v4z8Q06wLO3r96E5YqpQYYUREO6bl
 0+PsODWSBkAPhMR0OGOuP1SB+3jHxNP+tpVvEt/gZKRb+3LMWjWg/OEcx
 1s0yF3r1Hk6EUq/hNDnZt5yHXTuHGnDWOw93CZ2KytCPTTbqc/GHCGNir
 ebhvwqWDaVQzqxii5DSZ0y3V5O0xRZjNIdIWlTmh8IkJR/k4wBX5Vi59G
 rtEXgwJHmorfAiUITtAsBVYELXpEIP/O9cjjv437ts5+/OQNLUdeDu9+H
 voub0mXvNS9+tgwenPSAZ61AWk1nfHGw86ubduE9vwyGjJIFRswlEKcC2 Q==;
X-CSE-ConnectionGUID: CRE8b0urTE6Pfqt6+mjhkQ==
X-CSE-MsgGUID: xBIgnUGFS3OK5IJ4OZ8UmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359694"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359694"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:50 -0800
X-CSE-ConnectionGUID: ETe7ZK2YSzmEQU86dO9Ofw==
X-CSE-MsgGUID: 7302UexoTvyVt+UqQxs/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6091285"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:47 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v7 6/6] drm/xe/xe_late_bind_fw: Refactor pm flow
Date: Mon,  2 Nov 2026 22:55:34 +0530
Message-ID: <20261102172527.2794537-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172527.2794537-8-badal.nilawar@intel.com>
References: <20261102172527.2794537-8-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Refactor late binding flow across suspend/resume by adding dedicated
pm functions.

v2: Flush on suspend even if disabled, work may already be in flight

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 43 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  4 +--
 drivers/gpu/drm/xe/xe_pm.c           |  6 ++--
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index d3a5f09dcd58..5aafe21d731b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -230,7 +230,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
 }
 
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+static void wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
@@ -306,18 +306,12 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_pm_runtime_put(xe);
 }
 
-int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
 	int fw_id;
 
-	if (!late_bind->component_added)
-		return -ENODEV;
-
-	if (late_bind->disable)
-		return 0;
-
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->payload) {
@@ -325,7 +319,6 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 			queue_work(late_bind->wq, &lbfw->work);
 		}
 	}
-	return 0;
 }
 
 static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
@@ -458,7 +451,7 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component.ops = NULL;
 }
@@ -473,7 +466,7 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component_added = false;
 
@@ -497,6 +490,30 @@ static bool late_bind_mei_enabled(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_INTEL_MEI_CSC);
 }
 
+/**
+ * xe_late_bind_pm_suspend() - Wait for pending late binding fw loads
+ * @late_bind: pointer to late bind structure.
+ */
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added)
+		return;
+
+	wait_for_worker_completion(late_bind);
+}
+
+/**
+ * xe_late_bind_pm_resume() - Reload late binding fw after resume
+ * @late_bind: pointer to late bind structure.
+ */
+void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added || late_bind->disable)
+		return;
+
+	xe_late_bind_fw_load(late_bind);
+}
+
 /**
  * xe_late_bind_init() - add xe mei late binding component
  * @late_bind: pointer to late bind structure.
@@ -533,5 +550,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	if (err)
 		return err;
 
-	return xe_late_bind_fw_load(late_bind);
+	xe_late_bind_fw_load(late_bind);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 07e437390539..8896fea3068e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -11,7 +11,7 @@
 struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
-int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
+void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5a562d8daeb9..f483b565d323 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -186,7 +186,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+	xe_late_bind_pm_suspend(&xe->late_bind);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -290,7 +290,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-	xe_late_bind_fw_load(&xe->late_bind);
+	xe_late_bind_pm_resume(&xe->late_bind);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
@@ -751,7 +751,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_sriov_vf_ccs_register_context(xe);
 
 	if (xe->d3cold.allowed)
-		xe_late_bind_fw_load(&xe->late_bind);
+		xe_late_bind_pm_resume(&xe->late_bind);
 
 out:
 	xe_rpm_lockmap_release(xe);
-- 
2.56.0

