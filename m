Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CC1CD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F3112FC5;
	Mon,  1 Jun 2026 08:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJvp0aJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFB9112FC5
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780303343; x=1811839343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3U3xHsthligUBz+s6oyIGfrR959NhYFrnOTsPRAQPOo=;
 b=bJvp0aJa4e2uchA2bJLAmw4aDdDe/DH7P3QHUgabQYPHWOKUj8ENqFZZ
 +9dRkBoGp/tC0FxMSckuzyDbHsZveyN6VLF/J9ZuwrLsbPL8Q6qSRND1t
 UKGCod29yFSjK+epF7zeJx/QVck0DJz1TkztGHs8puFFNxSgiYsVIiKhx
 7JgwOcsD1WHyE/vH7Nwa0fRfiZh9xAeC1KN4Sv6Z/Yzu/sT2v71xIk+UO
 QEa/nAEQvUlSfaC9Qpa3E6Zsf+SWN0j4rDAkMfZB9zziP60uLVS1pJMxv
 hV4BQu8/p6Cy2xKMlyyTVwIo6gFfhflMPONxxYSByXG3r2E09AiDTqcG4 A==;
X-CSE-ConnectionGUID: 097YdE4yTsSXGoZpdPV60A==
X-CSE-MsgGUID: mp78dcjoQSOmZCVS+5JVhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91629535"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="91629535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:42:23 -0700
X-CSE-ConnectionGUID: yON4vOXnSkqnttUvrWcLLw==
X-CSE-MsgGUID: sbvhPj6/Ss+PjbyJo+9nYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="240525269"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:42:20 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 3/6] drm/xe/xe_ras: Add support to clear error counter value
Date: Mon,  1 Jun 2026 14:11:50 +0530
Message-ID: <20260601084146.3808639-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260601084146.3808639-8-riana.tauro@intel.com>
References: <20260601084146.3808639-8-riana.tauro@intel.com>
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

Add structures and helper function to clear error counter value.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: add status codes (Aravind)
    fix log message
    squash structure patch (Raag)

v3: rename function
    add comma to enum members to avoid
    redundant churn
    align with tabs (Raag)

v4: rebase

v5: move header prepare function to sysctrl layer
    rename error_class to counter
    add a debug log (Raag)
    change error codes to -ENOSPC and -EIO
    print actual response status (Mallesh)

v6: use switch for error status
    simplify structure member names
    use -EPROTO for default case
    modify log (Raag)

v7: use %#x format specifier
    modify log 
    remove err (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 86 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
 4 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0b76467566cc..7a7dde9a68a8 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -34,6 +34,17 @@ enum xe_ras_component {
 	XE_RAS_COMP_MAX
 };
 
+/* RAS response status codes */
+enum xe_ras_response_status {
+	XE_RAS_STATUS_SUCCESS = 0,
+	XE_RAS_STATUS_INVALID_PARAM,
+	XE_RAS_STATUS_OP_NOT_SUPPORTED,
+	XE_RAS_STATUS_TIMEOUT,
+	XE_RAS_STATUS_HARDWARE_FAILURE,
+	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
+	XE_RAS_STATUS_MAX
+};
+
 static const char *const xe_ras_severities[] = {
 	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
 	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
@@ -83,6 +94,26 @@ static u8 drm_to_xe_ras_component(u8 component)
 	}
 }
 
+static int ras_status_to_errno(u32 status)
+{
+	switch (status) {
+	case XE_RAS_STATUS_SUCCESS:
+		return 0;
+	case XE_RAS_STATUS_INVALID_PARAM:
+		return -EINVAL;
+	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case XE_RAS_STATUS_TIMEOUT:
+		return -ETIMEDOUT;
+	case XE_RAS_STATUS_HARDWARE_FAILURE:
+		return -EIO;
+	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
+		return -ENOSPC;
+	default:
+		return -EPROTO;
+	}
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -182,3 +213,58 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 	guard(xe_pm_runtime)(xe);
 	return get_counter(xe, &counter, value);
 }
+
+/**
+ * xe_ras_clear_counter() - Clear error counter value
+ * @xe: Xe device instance
+ * @severity: Error severity to be cleared (&enum drm_xe_ras_error_severity)
+ * @component: Error component to be cleared (&enum drm_xe_ras_error_component)
+ *
+ * This function clears the value of a specific error counter based on
+ * the error severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
+{
+	struct xe_ras_clear_counter_response response = {0};
+	struct xe_ras_clear_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_error_class *counter;
+	size_t rlen;
+	int ret;
+
+	counter = &request.counter;
+	counter->common.severity = drm_to_xe_ras_severity(severity);
+	counter->common.component = drm_to_xe_ras_component(component);
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_CLEAR_COUNTER,
+				  &request, sizeof(request), &response, sizeof(response));
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected clear counter response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_err(xe, "sysctrl: clear counter command failed with status %#x\n",
+		       response.status);
+		return ret;
+	}
+
+	counter = &response.counter;
+
+	xe_dbg(xe, "[RAS]: clear counter value for %s %s\n", comp_to_str(counter->common.component),
+	       sev_to_str(counter->common.severity));
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 317b877e375d..637956a33a19 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -14,5 +14,6 @@ struct xe_sysctrl_event_response;
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
+int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fdfebaeb5ed2..6688e11f57a8 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -96,4 +96,29 @@ struct xe_ras_get_counter_response {
 	u32 reserved[57];
 } __packed;
 
+/**
+ * struct xe_ras_clear_counter_request - Request structure for clear counter
+ */
+struct xe_ras_clear_counter_request {
+	/** @counter: Counter class to be cleared */
+	struct xe_ras_error_class counter;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_clear_counter_response - Response structure for clear counter
+ */
+struct xe_ras_clear_counter_response {
+	/** @counter: Counter class that was cleared */
+	struct xe_ras_error_class counter;
+	/** @reserved: Reserved */
+	u32 reserved;
+	/** @timestamp: Timestamp when the counter was cleared */
+	u64 timestamp;
+	/** @status: Status of the clear operation */
+	u32 status;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[3];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index b315847cbf64..6e3753554510 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -23,10 +23,12 @@ enum xe_sysctrl_group {
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
+ * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
+	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 };
 
-- 
2.47.1

