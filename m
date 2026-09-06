Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C925FC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6932C10E1F2;
	Sun,  6 Sep 2026 17:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+vaOxfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4C10E1F2
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714562; x=1820250562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CD7hXRb5xhC+v9bm/FbgXMYlFXDagB014Yq87aF7E0s=;
 b=l+vaOxfHNQNynJo5+JBqPEHTQHXGtHol9vkb+8SfBdp8PscXwi8ENk7I
 iERWgW2SfUKP2yTf43qKP56TSjruGSoQ4n7yDNi+hxMTk6cNm5KhvwXQk
 lqS0SkEJQrCpvl7lCv9I31C6i+XKBr1b4gbeNELyytfL+UwYEgUJuxSHd
 mATz336X9nSKTzg1mzZN/bLPqZwapmR2F0mJoH695LR8LFDgN0wlHJIiK
 OiEjsb2OHSoEi4hBPIvdGeWnyhxlq2lWAsXGRYo4M5+IQgNVexi8mEBxe
 mQQMeDtLEhV6xs3Hdh6dtS+GwRO/sdzfQ8vsj5eq/HbgxJD8BAyNR+S9f g==;
X-CSE-ConnectionGUID: ROItXM5PQUanwv+bPbVYGA==
X-CSE-MsgGUID: 3+B84//fQf+hAaFdq5VVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071442"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071442"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:22 -0700
X-CSE-ConnectionGUID: qF/sE4ECQyehSdTZA9Fk4g==
X-CSE-MsgGUID: G6kFbjTuT1OoXrTP2J6+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996115"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record for
 CPER reporting
Date: Sun,  6 Sep 2026 22:56:07 +0530
Message-ID: <20260906172604.2215987-16-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Retrieve error counter record required to build a CPER record when
one not provided by the caller.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c |  15 ++++++
 drivers/gpu/drm/xe/xe_ras.c  | 100 ++++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_ras.h  |   3 ++
 3 files changed, 80 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index e8017e3ee3a0..f04a91223a43 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -9,6 +9,8 @@
 
 #include "xe_cper.h"
 #include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_ras_types.h"
 
 /**
@@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 				 struct xe_ras_get_counter_response *response)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_ras_get_counter_response local_resp = {};
+	struct xe_ras_get_counter_response *counter_response = response;
 
 	if (!xe)
 		return;
@@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
 		return;
 
+	if (!counter || !xe_ras_counter_is_valid(xe, counter))
+		return;
+
+	if (!counter_response) {
+		counter_response = &local_resp;
+		if (xe_ras_get_counter_response(xe, counter, counter_response)) {
+			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
+			return;
+		}
+	}
+
 	/* TODO */
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..0fb9065cdd76 100644
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
@@ -201,24 +199,6 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
-static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
-{
-	u8 severity = counter->common.severity;
-	u8 component = counter->common.component;
-
-	if (!in_range(severity, XE_RAS_SEV_NOT_SUPPORTED + 1, XE_RAS_SEV_MAX - 1)) {
-		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
-		return false;
-	}
-
-	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)) {
-		xe_err(xe, "sysctrl: unexpected component %u\n", component);
-		return false;
-	}
-
-	return true;
-}
-
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
@@ -284,21 +264,21 @@ static void ras_usp_aer_init(struct xe_device *xe)
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
@@ -395,6 +375,33 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+/**
+ * xe_ras_counter_is_valid() - Validate a RAS error counter
+ * @xe: Xe device instance
+ * @counter: RAS error class to validate
+ *
+ * Validate that counter represents a supported RAS error class
+ *
+ * Return: true if counter is valid, false otherwise.
+ */
+bool xe_ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
+{
+	u8 severity = counter->common.severity;
+	u8 component = counter->common.component;
+
+	if (!in_range(severity, XE_RAS_SEV_NOT_SUPPORTED + 1, XE_RAS_SEV_MAX - 1)) {
+		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
+		return false;
+	}
+
+	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)) {
+		xe_err(xe, "sysctrl: unexpected component %u\n", component);
+		return false;
+	}
+
+	return true;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -418,7 +425,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		severity = errors[id].common.severity;
 		component = errors[id].common.component;
 
-		if (!ras_counter_is_valid(xe, &errors[id]))
+		if (!xe_ras_counter_is_valid(xe, &errors[id]))
 			continue;
 
 		xe_warn(xe, "[RAS]: %s %s detected\n",
@@ -433,19 +440,30 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+/**
+ * xe_ras_get_counter_response() - Get error counter record
+ * @xe: Xe device instance
+ * @counter: ras error class
+ * @out: Counter record retrieved
+ *
+ * This function retrieves the counter record of specific error counter
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter_response(struct xe_device *xe, struct xe_ras_error_class *counter,
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
@@ -453,19 +471,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
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
+	if (!xe_ras_counter_is_valid(xe, &out->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &out->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
 	       sev_to_str(common->severity));
 
 	return 0;
@@ -534,7 +551,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			component = arr->counter.common.component;
 			severity = arr->counter.common.severity;
 
-			if (!ras_counter_is_valid(xe, &arr->counter))
+			if (!xe_ras_counter_is_valid(xe, &arr->counter))
 				continue;
 
 			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
@@ -596,12 +613,19 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
@@ -653,7 +677,7 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 
 	counter = &response.counter;
 
-	if (!ras_counter_is_valid(xe, counter))
+	if (!xe_ras_counter_is_valid(xe, counter))
 		return -EBADMSG;
 
 	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
@@ -703,7 +727,7 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!xe_ras_counter_is_valid(xe, &response.counter))
 		return -EBADMSG;
 
 	counter = &response.counter;
@@ -765,7 +789,7 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 
 	counter = &response.counter;
 
-	if (!ras_counter_is_valid(xe, counter))
+	if (!xe_ras_counter_is_valid(xe, counter))
 		return -EBADMSG;
 
 	xe_dbg(xe, "[RAS]: set threshold %u for %s %s\n", response.threshold,
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 0b8669f28d56..e83e022cd363 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -20,5 +20,8 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
+int xe_ras_get_counter_response(struct xe_device *xe, struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *out);
+bool xe_ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter);
 
 #endif
-- 
2.54.0

