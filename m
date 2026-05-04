Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EB3CD3423
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 06:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3583B10E257;
	Mon,  4 May 2026 06:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF7zthT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763910E257
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 06:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777875797; x=1809411797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GdoC3/ORCdcHqMg5/JEfWl+wTS95qMjR/nTW1yUDX50=;
 b=GF7zthT1lHWlf6qCUX0pKsL8WHsz5AtFHTVy/elU5dw2Fg3DfQAcVq97
 WZnP4MORAgNXwXhaYq0zBKkFc87i5HUMfI/xGXxEcbwQtNsGvAyLzEmNa
 xE+NlmYCKlWuZ9bpaTte6zR1ztCUTSElAgDy3WQh1/9L7ibfU4ROnbnky
 R5VLBynQWuzprMhpOv8olR2xEHdeMCIeaarnriYO3todv2jhc5PIvyw/V
 B0tSJZlaIa+FybvdoDNJqyy2i32hJxsDLyKBjxq+wkFVt8f1vtTtiqplR
 xJq4bvvIiiHp0Bnx9k4bjcR6Wy8az04iHOX53DpFkYtWf9lG43diWmIPS A==;
X-CSE-ConnectionGUID: s5vObyvlQKWN7NaX94Pzzg==
X-CSE-MsgGUID: 2P0rIDWeRRWS1F/6MLGzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78592336"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78592336"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:23:17 -0700
X-CSE-ConnectionGUID: JKcx0pf/SEmxAXMgp9jrXg==
X-CSE-MsgGUID: 1MzyC+WvTlWK/1BfqtH5+w==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:23:14 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
Date: Mon,  4 May 2026 12:26:18 +0530
Message-ID: <20260504065614.3832331-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260504065614.3832331-8-riana.tauro@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
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

v4: rebase
---
 drivers/gpu/drm/xe/xe_ras.c                   | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
 4 files changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 47a58ce3b3ca..07f6837694e7 100644
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
+	XE_RAS_STATUS_UNKNOWN_ERROR
+};
+
 static const char *const xe_ras_severities[] = {
 	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
 	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
@@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
 };
 static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
 
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
 /* Mapping from drm_xe_ras_error_component to xe_ras_component */
 static const int drm_to_xe_ras_component[] = {
 	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
@@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
 };
 static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
 
+static int ras_status_to_errno(enum xe_ras_response_status status)
+{
+	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
+		status = XE_RAS_STATUS_UNKNOWN_ERROR;
+
+	return ras_status_to_errno_map[status];
+}
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
 	guard(xe_pm_runtime)(xe);
 	return get_counter(xe, &error_class, value);
 }
+
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
+	int ret;
+
+	error_class = &request.error_class;
+	error_class->common.severity = drm_to_xe_ras_severity[severity];
+	error_class->common.component = drm_to_xe_ras_component[error_id];
+
+	prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
+			    &response, sizeof(response));
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
+	if (ret)
+		xe_err(xe, "sysctrl: clear counter command failed with status %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 74582c911b02..bbb9d42bd128 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
 		       u32 error_id, u32 *value);
+int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			 u32 error_id);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 74d85875cd63..44369fc8ef03 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
 	u32 reserved1[56];
 } __packed;
 
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

