Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E2AF8FA80
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03FB10ECC2;
	Tue, 21 Apr 2026 14:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKdYDJI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49A10EB39
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776781098; x=1808317098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXcCcrFuGBBnnavBcbInA8xUrEsD8S45XIXOqFE+csU=;
 b=iKdYDJI7XttOKEPmAZ49vFjO7XTClSR2e1Jf8DCN1E9K3BT8Dw+rMimg
 bYjVfTdFiwyvpUxgrpy9p0BcsAKxg9dZ+co59QsN0d+exLtL0nc9FOA+l
 NRXDb6KnwzfOmfBDwHbmlxMNGtAMwk7mArMa2Q9lYiHNOBW/vecwJxWPb
 ki0wcKWuHnCEyoxf1vC5Ad8OOd08RiiX8pGUpPW8dL5dQZ4EOvIg/4HZp
 BW+Bq3mFLjZdUBQlcVc4JrQfUi5iiWzKrmd3L8lp0QmBE8fjxBYkcN/Hq
 0Du3D36jTqmzYE0Iy95VNwaHTPjFPBbPaveJuBKqwOqCltsGZA7hF4Sdt A==;
X-CSE-ConnectionGUID: P04RKmDFT/O+QNO6qu9Ksg==
X-CSE-MsgGUID: 8DoggQl7QuqnsuJKByNbmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95272273"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="95272273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:18 -0700
X-CSE-ConnectionGUID: NWx8KBI4TP6kqOi5WAqsUQ==
X-CSE-MsgGUID: MvFdDDONTE2eE7Od9+Lg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="233829079"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:18:15 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 3/5] drm/xe/xe_ras: Add helper to clear error counter
Date: Tue, 21 Apr 2026 20:20:59 +0530
Message-ID: <20260421145056.253300-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260421145056.253300-7-riana.tauro@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
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
Note: This will be integrated with drm_ras implementation once
clear-error-counter patch https://patchwork.freedesktop.org/series/164601/
is merged.

v2: add status codes (Aravind)
    fix log message
    squash structure patch (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 72 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 26 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +-
 4 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c79c4c873fb7..92f7a204e3e6 100644
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
@@ -49,6 +60,16 @@ static const int drm_to_xe_ras_severity[] = {
 };
 static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
 
+static const int xe_ras_status_to_errno[] = {
+	[XE_RAS_STATUS_SUCCESS]			= 0,
+	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
+	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
+	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
+	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
+	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
+	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA
+};
+
 static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 				    u32 cmd_mask, void *request, size_t request_len,
 				    void *response, size_t response_len)
@@ -120,3 +141,54 @@ int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severit
 	guard(xe_pm_runtime)(xe);
 	return get_error_counter(xe, &error_class, value);
 }
+
+/**
+ * xe_ras_clear_error_counter() - Clear error counter value
+ * @xe: xe device instance
+ * @severity: Error severity level to be cleared
+ * @error_id: Error component to be cleared
+ *
+ * This function clears the value of a specific RAS error counter based on
+ * the provided severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_clear_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			       u32 error_id)
+{
+	struct xe_ras_clear_counter_response response = {0};
+	struct xe_ras_clear_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_error_class *error_class = &request.error_class;
+	enum xe_sysctrl_gfsp_cmd cmd = XE_SYSCTRL_CMD_CLEAR_COUNTER;
+	size_t rlen;
+	u32 status;
+	int ret;
+
+	error_class->common.severity = drm_to_xe_ras_severity[severity];
+	error_class->common.component = drm_to_xe_ras_component[error_id];
+
+	prepare_sysctrl_command(&command, cmd, &request, sizeof(request),
+				&response, sizeof(response));
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: cmd %d error ret %d\n", cmd, ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: cmd %d response size mismatch. Expected %zu, got %zu\n",
+		       cmd, sizeof(response), rlen);
+		return -EIO;
+	}
+
+	status = xe_ras_status_to_errno[response.status];
+	if (status) {
+		xe_err(xe, "sysctrl: cmd %d failed %d\n", cmd, status);
+		return status;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1de59b5c4bfe..959eed919da4 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -12,5 +12,7 @@ struct xe_device;
 
 int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
 			     u32 error_id, u32 *value);
+int xe_ras_clear_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
+			       u32 error_id);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4a36bc2f5e2b..b5c96e814907 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -89,4 +89,30 @@ struct xe_ras_get_counter_response {
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
index 3376e0fa1b02..0ca9bebfdc6c 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -14,9 +14,11 @@
  * enum xe_sysctrl_gfsp_cmd  - Sysctrl Command ID's for GFSP group
  *
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
+ * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  */
 enum xe_sysctrl_gfsp_cmd  {
-	XE_SYSCTRL_CMD_GET_COUNTER = 0x03
+	XE_SYSCTRL_CMD_GET_COUNTER = 0x03,
+	XE_SYSCTRL_CMD_CLEAR_COUNTER = 0x04
 };
 
 enum xe_sysctrl_group {
-- 
2.47.1

