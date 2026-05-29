Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB180CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 16:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790B01121EA;
	Fri, 29 May 2026 16:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KI78HF09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78311121EE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780071176; x=1811607176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iN48hEcmdgKou45j7x6qsE/afVCAxJuMzNAs5HYGY2k=;
 b=KI78HF09YmbTUxHpbd5zkScd9oE/3ZcQDDC96y13j/tFI9SvzNDFWJl3
 xZVKczrUlFOqfBhX3+LszPcHaltfLiPtxOR0TTcH4CPJYAFYS6jjC8Dnk
 MOM5Uv2grjVGCWjhT/GD1oJ/mQh80gTP4VZzt+KzIuccxtVxY1m7M84JY
 R6t60nOj8mI/B6BwL3HnURteY7XE7lpILHiJQzfsMmwfBguF3ho1l0mR6
 teQhbqj8XUoFNf2t19hh4u9EtTXhn9YMSKR0VS4eVPRaT6BZ2efnZdGQT
 683h3WOyOsTfkRwsDcZrxfZ6qzu97Q8cTvTGdYoxNaYcMWAMQtVWVgz44 A==;
X-CSE-ConnectionGUID: Ghv7/nz+Qi6EMLk85Je90A==
X-CSE-MsgGUID: +RJDaMX8TYqN1wYziG7U6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91498682"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="91498682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:55 -0700
X-CSE-ConnectionGUID: 614/xGlQS6OP780Kkee6tg==
X-CSE-MsgGUID: V+Lyk01LTvWI5gC36A7mGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="273201723"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 09:12:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v2 3/3] drm/xe/xe_late_bind_fw: Refactor pm flow
Date: Fri, 29 May 2026 21:53:52 +0530
Message-ID: <20260529162349.1939301-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529162349.1939301-5-badal.nilawar@intel.com>
References: <20260529162349.1939301-5-badal.nilawar@intel.com>
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

Refactor late binding flow across suspend/resume by adding dedicated
pm functions.

Assisted-by: GitHub-Copilot:GPT-5.3
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v2: Drop xe_late_bind_ prefix from xe_late_bind_wait_for_worker_completion (Rodrigo)
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 36 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  4 ++--
 drivers/gpu/drm/xe/xe_pm.c           |  6 ++---
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 753b05e4c1609..6d880da6e50c9 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -223,7 +223,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
 }
 
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+static void wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
@@ -299,18 +299,12 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_pm_runtime_put(xe);
 }
 
-int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
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
@@ -430,7 +424,7 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component.ops = NULL;
 }
@@ -445,7 +439,7 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component_added = false;
 
@@ -456,6 +450,28 @@ static void xe_late_bind_remove(void *arg)
 	}
 }
 
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added)
+		return;
+
+	if (late_bind->disable)
+		return;
+
+	wait_for_worker_completion(late_bind);
+}
+
+void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added)
+		return;
+
+	if (late_bind->disable)
+		return;
+
+	xe_late_bind_fw_load(late_bind);
+}
+
 /**
  * xe_late_bind_init() - add xe mei late binding component
  * @late_bind: pointer to late bind structure.
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 07e4373905395..8896fea3068e5 100644
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
index 99562f691080b..25e7ac5b62c6d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -184,7 +184,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+	xe_late_bind_pm_suspend(&xe->late_bind);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -288,7 +288,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-	xe_late_bind_fw_load(&xe->late_bind);
+	xe_late_bind_pm_resume(&xe->late_bind);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
@@ -728,7 +728,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_sriov_vf_ccs_register_context(xe);
 
 	if (xe->d3cold.allowed)
-		xe_late_bind_fw_load(&xe->late_bind);
+		xe_late_bind_pm_resume(&xe->late_bind);
 
 out:
 	xe_rpm_lockmap_release(xe);
-- 
2.54.0

