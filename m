Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC7BFF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905D710E26E;
	Wed, 29 Apr 2026 05:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3ogjXrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061510EE56
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777439932; x=1808975932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5MSGzJBKx8BJ0xh0lm63VVeT1KFUVkBEGH675zKbgsk=;
 b=l3ogjXrOD5GUW9oq20V9ajkOuII+Pc2fL+rjjZFTLfMfYRetISwgvgf2
 kXgGbgpWn6Ulu8ATQ1pSZgZXQxrEj7FwrfrSGHOwjiy0ttpjyTdgSl34M
 pI+eXZLOR3hByw/bPywmeK6kWlruuaskwGUZvjMUg/rDCMGdkWASJ+5YK
 qNvfVBeBp7alQZZwDI6sTA0gXAfqnQf8auPJO8PAIxu8FIl8rW7iP4/MQ
 GUmSocfzvgUUAYyML2LoVl207lueXrGq8ongg+/DzJMj3+LlO+dly6DG6
 sLMZEB39QwtQha9SoR0BsDHm5M6WAFNrFjmZl5CNh2yEu6GNKrw6UF2Ss w==;
X-CSE-ConnectionGUID: gbTHviGwSm2YbePingDURg==
X-CSE-MsgGUID: 3ii/IFRhSd2dWgSrwiv+pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82217504"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82217504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:52 -0700
X-CSE-ConnectionGUID: Ci5N1j3pQpCPKBKVbLb9Nw==
X-CSE-MsgGUID: fi9NhhjfSAqi9721hrWjsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239153867"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:18:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 3/6] drm/xe/xe_ras: Add helper to clear error counter
Date: Wed, 29 Apr 2026 11:21:47 +0530
Message-ID: <20260429055147.1579576-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
References: <20260429055147.1579576-8-riana.tauro@intel.com>
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
---
v2: add status codes (Aravind)
    fix log message
    squash structure patch (Raag)

v3: rename function
    add comma to enum members to avoid
    redundant churn
    align with tabs (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 80 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 26 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
 4 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1b1903afd53e..bb01c4c2f688 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -32,6 +32,17 @@ enum xe_ras_component {
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
+	XE_RAS_STATUS_UNKNOWN_ERROR
+};
+
 /* Mapping from drm_xe_ras_error_component to xe_ras_component */
 static const int drm_to_xe_ras_component[] = {
 	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
@@ -49,6 +60,24 @@ static const int drm_to_xe_ras_severity[] = {
 };
 static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
 
+static const int ras_status_to_errno_map[] = {
+	[XE_RAS_STATUS_SUCCESS]			= 0,
+	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
+	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
+	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
+	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
+	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
+	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA
+};
+
+static int ras_status_to_errno(enum xe_ras_response_status status)
+{
+	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
+		status = XE_RAS_STATUS_UNKNOWN_ERROR;
+
+	return ras_status_to_errno_map[status];
+}
+
 static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 				    u32 cmd, void *request, size_t request_len,
 				    void *response, size_t response_len)
@@ -120,3 +149,54 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
 	return get_counter(xe, &error_class, value);
 }
 
+/**
+ * xe_ras_clear_counter() - Clear error counter value
+ * @xe: xe device instance
+ * @severity: Error severity level to be cleared
+ * @error_id: Error component to be cleared
+ *
+ * This function clears the value of a specific error counter based on
+ * the error severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			 u32 error_id)
+{
+	struct xe_ras_clear_counter_response response = {0};
+	struct xe_ras_clear_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_error_class *error_class;
+	size_t rlen;
+	u32 status;
+	int ret;
+
+	error_class = &request.error_class;
+	error_class->common.severity = drm_to_xe_ras_severity[severity];
+	error_class->common.component = drm_to_xe_ras_component[error_id];
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
+				&response, sizeof(response));
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
+	status = ras_status_to_errno(response.status);
+	if (status) {
+		xe_err(xe, "sysctrl: clear counter command failed with status %d\n", status);
+		return status;
+	}
+
+	return 0;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 637897a40275..5b46d586be19 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -12,5 +12,7 @@ struct xe_device;
 
 int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
 		       u32 error_id, u32 *value);
+int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			 u32 error_id);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a13bd3886dcf..94dfaa836ea8 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -87,4 +87,30 @@ struct xe_ras_get_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[56];
 } __packed;
+
+/**
+ * struct xe_ras_clear_counter_request - Request for clearing an error counter
+ */
+struct xe_ras_clear_counter_request {
+	/** @error_class: Counter class to be cleared */
+	struct xe_ras_error_class error_class;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_clear_counter_response - Response after clearing an error counter
+ */
+struct xe_ras_clear_counter_response {
+	/** @error_class: Counter class that was cleared */
+	struct xe_ras_error_class error_class;
+	/** @previous_counter_value: Counter value before clearing */
+	u32 previous_counter_value;
+	/** @clear_timestamp: Timestamp when the counter was cleared */
+	u64 clear_timestamp;
+	/** @status: Status of the clear operation */
+	u32 status;
+	/** @reserved: Reserved for future use */
+	u32 reserved[3];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 7a21a751a149..93d61739fb63 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -14,9 +14,11 @@
  * enum xe_sysctrl_gfsp_cmd - Sysctrl Command ID's for GFSP group
  *
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
+ * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  */
 enum xe_sysctrl_gfsp_cmd  {
 	XE_SYSCTRL_CMD_GET_COUNTER			= 0x03,
+	XE_SYSCTRL_CMD_CLEAR_COUNTER			= 0x04,
 };
 
 /**
-- 
2.47.1

