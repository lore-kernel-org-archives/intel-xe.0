Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7E1CA601C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60720112050;
	Fri,  9 Oct 2026 10:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmegN9Gt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CD511204D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541758; x=1823077758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1a84RlvQ69jNJbQ3rssJ/CCiPxQvW3ZCcPDx/6TV3QM=;
 b=VmegN9Gt+jCKcRWoMSApJOmF32JNAtY4X5fEA807Dv1GmbNIO7auAfR8
 d5R1kl0Z6VYUCqzX0GAPdzbKOnEMv0ZkCBkd+bwKb9a7bQGmt9L5wu00I
 qONjX1DeaqnHxNieYZM3k+wlhqWo+jpvMHw7VU4rB5OgGqQa3nLyQcWtt
 nijdb/+VZbH76d1VUYBqS8MI7jIvAx7PlXliTC4D8oH5k+f/NvwdaYNb7
 6MTBmwYydigE0lg+q/hBcA20vSmQy+tP8iJF42VhH+AFBI68wj4AyxupH
 +yqFuKY0iyYll8tdBt7g/wp2mYmj6WRti6lArRSjNdAnePLr515igh1OH w==;
X-CSE-ConnectionGUID: 6+seAq4sR/u6FBXmfOIcaw==
X-CSE-MsgGUID: vqO/98pDSUSGKRAVPyJycQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344070"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344070"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:18 -0700
X-CSE-ConnectionGUID: tb2nsosCS7iYzd74Ko46Uw==
X-CSE-MsgGUID: Ju8s+k8aSA+3rlNaYEvffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025554"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:14 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 02/12] drm/xe/cper: Retrieve the error counter record for
 CPER reporting
Date: Fri,  9 Oct 2026 16:16:05 +0530
Message-ID: <20261009104602.1075405-16-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

Retrieve error counter record required to build a CPER record.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
  - Drop redundant xe_ras_counter_is_valid() check (Raag)
  - Add might_sleep() to assert that the caller is in a sleepable
    context (sashiko)
  - Add xe_device_assert_mem_access() to assert the outer runtime PM
    wake reference requirement (sashiko)
---
 drivers/gpu/drm/xe/xe_cper.c | 14 ++++++++++-
 drivers/gpu/drm/xe/xe_ras.c  | 45 ++++++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_ras.h  |  2 ++
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index c5caa0e8f496..4f0ed5096aac 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -4,10 +4,13 @@
  */
 
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/minmax.h>
 
 #include "xe_cper.h"
 #include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_ras_types.h"
 
 static bool is_hw_sigid(enum xe_sigid sigid)
@@ -18,7 +21,16 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 				const struct xe_ras_error_class *error_class)
 {
-	/* TODO */
+	struct xe_ras_get_counter_response local_resp;
+
+	/* Fetching the counter sends a sysctrl command */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	if (xe_ras_get_counter_response(xe, error_class, &local_resp)) {
+		xe_err(xe, "CPER: failed to get counter, skipping record\n");
+		return;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..5cfc9beff8c1 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -103,8 +103,6 @@ static const char * const gpu_health_states[] = {
 };
 static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
-
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
 	switch (severity) {
@@ -284,21 +282,21 @@ static void ras_usp_aer_init(struct xe_device *xe)
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
 	u8 drm_severity, drm_component;
-	u32 value;
 	int ret;
 
 	counter.common.severity = severity;
 	counter.common.component = component;
 
-	ret = get_counter(xe, &counter, &value);
+	ret = xe_ras_get_counter_response(xe, &counter, &response);
 	if (ret)
 		return;
 
 	drm_severity = xe_to_drm_ras_severity(severity);
 	drm_component = xe_to_drm_ras_component(component);
 
-	xe_drm_ras_event(xe, drm_component, drm_severity, value);
+	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
 }
 
 static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
@@ -433,19 +431,30 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+/**
+ * xe_ras_get_counter_response() - Get error counter record
+ * @xe: Xe device instance
+ * @counter: RAS error class
+ * @out: Counter record retrieved
+ *
+ * Retrieve the counter record of a specific error class from firmware.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *out)
 {
-	struct xe_ras_get_counter_response response = {0};
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_error_common *common;
 	size_t rlen;
 	int ret;
 
+	memset(out, 0, sizeof(*out));
 	request.counter = *counter;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
-				  &request, sizeof(request), &response, sizeof(response));
+				  &request, sizeof(request), out, sizeof(*out));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
@@ -453,19 +462,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return ret;
 	}
 
-	if (rlen != sizeof(response)) {
+	if (rlen != sizeof(*out)) {
 		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
-		       rlen, sizeof(response));
+		       rlen, sizeof(*out));
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!ras_counter_is_valid(xe, &out->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &out->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
 	       sev_to_str(common->severity));
 
 	return 0;
@@ -596,12 +604,19 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
+	int ret;
 
 	counter.common.severity = drm_to_xe_ras_severity(severity);
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+	ret = xe_ras_get_counter_response(xe, &counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.value;
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 0b8669f28d56..84700ea63394 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -20,5 +20,7 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *out);
 
 #endif
-- 
2.54.0

