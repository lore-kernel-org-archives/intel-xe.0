Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A493606A321
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKz7M2rP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48F10E537;
	Fri, 30 Oct 2026 14:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F28610E537
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793371566; x=1824907566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9jA9GYgf794sxA45swXu/k46mlYpv9VuXeIyQ/l1Z0=;
 b=CKz7M2rPqhs2dWVad7pfgfdbdwVNaElGcZka4TD40AdzK/FGhO9QRUZa
 AWmfCbskOqEVox5V6+aC1wGDl+orAmftIzoBYWYel3j37fYiCTcHNAVDr
 jhxEvYs3aMBtp0J6wabvv+NZsaSaj8eiE1eIeyFRxV+A95kBPTZbvxwZY
 NxhmB/iwS3Zi9GCpXdDdKbY28Ijhs09kE996he5UPAZFlqsOSKzD7nwMy
 LoG7Pyxy0sV1AhAEJq8mZgQvkCvIqmVaCsNipqVUaLIMo03WNo8NRdx5K
 NJKKLFK8oP6rcIPsO9lHqrHv/Ygk8CL//swO7MKsm7clRbVhKJvLwgWDo A==;
X-CSE-ConnectionGUID: ntrvGHggQmiKbdDvSOCKqQ==
X-CSE-MsgGUID: 52aq8dOZQbq0EbQaOQsBNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2012671"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2012671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:46:06 -0700
X-CSE-ConnectionGUID: IeB1L254QTi0bpghxXZ0vA==
X-CSE-MsgGUID: NlPXcYTJTu6OejVr9mud+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5588640"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 07:46:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v6 4/6] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
Date: Fri, 30 Oct 2026 20:15:52 +0530
Message-ID: <20261030144547.2532309-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030144547.2532309-8-badal.nilawar@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
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

Enable loading of Ocode, the legacy OOBMSM firmware, through the
late binding flow. The payload size check is no longer needed as
late binding supports larger payloads.

Ocode may not remain backward compatible across IFWI updates. Query
the SDK API version from the System Controller mailbox and load the
corresponding xe/cri_ocode_<ver>.bin. Skip loading the firmware if
the SDK API version in its manifest does not match.

v2:
  - Make sdk_api_version part of ip_specific_data union (Daniele)

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/uc_fw_abi.h            | 11 ++++-
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 48 +++++++++++++++----
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  6 ++-
 drivers/gpu/drm/xe/xe_sysctrl.c               | 32 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 12 +++++
 6 files changed, 97 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
index 198e949660e0..59699ba4def5 100644
--- a/drivers/gpu/drm/xe/abi/uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
@@ -316,6 +316,11 @@ struct gsc_cpd_entry {
 	u8 reserved[4];
 } __packed;
 
+struct ocode_manifest_data {
+	u16 sdk_api_version;
+	u8 reserved[22];
+} __packed;
+
 struct gsc_manifest_header {
 	u32 header_type; /* 0x4 for manifest type */
 	u32 header_length; /* in dwords */
@@ -331,7 +336,11 @@ struct gsc_manifest_header {
 	struct gsc_version meu_kit_version;
 	u32 meu_manifest_version;
 	u8 general_data[4];
-	u8 reserved3[56];
+	union {
+		u8 ip_specific_data[24];
+		struct ocode_manifest_data ocode_data;
+	};
+	u8 reserved3[32];
 	u32 modulus_size; /* in dwords */
 	u32 exponent_size; /* in dwords */
 } __packed;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index c5f3a3b8d404..b62a4c15c738 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -17,6 +17,12 @@
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
+
+/*
+ * TODO: Add MODULE_FIRMWARE() for xe/cri_ocode_<ver>.bin once the
+ *       Ocode firmware binary is available upstream.
+ */
 
 /*
  * The component should load quite quickly in most cases, but it could take
@@ -33,10 +39,12 @@
 
 static const u32 fw_id_to_type[] = {
 		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
+		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
 	};
 
 static const char * const fw_id_to_name[] = {
 		[XE_LB_FW_FAN_CONTROL] = "fan_control",
+		[XE_LB_FW_OCODE] = "ocode",
 	};
 
 static struct xe_device *
@@ -104,6 +112,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	manifest = data + offset;
 
 	lb_fw->version = manifest->fw_version;
+	lb_fw->sdk_api_version = manifest->ocode_data.sdk_api_version;
 
 	return 0;
 }
@@ -324,6 +333,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	struct xe_late_bind_fw *lb_fw;
 	const struct firmware *fw;
 	u32 num_fans;
+	u16 sdk_ver = 0;
 	int ret;
 
 	if (fw_id >= XE_LB_FW_MAX_ID)
@@ -346,9 +356,23 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 			return 0;
 	}
 
-	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
-		 fw_id_to_name[lb_fw->id], pdev->device,
-		 pdev->subsystem_vendor, pdev->subsystem_device);
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
+		/* Get SDK API version */
+		ret = xe_sysctrl_sdk_api_version(xe, &sdk_ver);
+		if (ret) {
+			drm_warn(&xe->drm, "Failed to get OCODE SDK API version: %pe\n",
+				 ERR_PTR(ret));
+			return 0;
+		}
+
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
+			 "xe/cri_ocode_%u.bin", sdk_ver);
+	} else {
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
+			 "xe/%s_8086_%04x_%04x_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device,
+			 pdev->subsystem_vendor, pdev->subsystem_device);
+	}
 
 	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
 	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
@@ -358,17 +382,17 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return 0;
 	}
 
-	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
-		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
-			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
-		ret = -ENODATA;
-		goto release_fw;
-	}
-
 	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
 	if (ret)
 		goto release_fw;
 
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE && lb_fw->sdk_api_version != sdk_ver) {
+		drm_warn(&xe->drm, "%s late binding fw: SDK API version mismatch %u != %u\n",
+			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version, sdk_ver);
+		ret = 0;
+		goto release_fw;
+	}
+
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
@@ -381,6 +405,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		 lb_fw->version.major, lb_fw->version.minor,
 		 lb_fw->version.hotfix, lb_fw->version.build);
 
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE)
+		drm_info(&xe->drm, "%s firmware SDK API version %u\n",
+			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version);
+
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ee5efe60774e..c7b3ffc743cf 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -13,14 +13,14 @@
 
 #include "abi/uc_fw_abi.h"
 
-#define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
-
 /**
  * enum xe_late_bind_fw_id - enum to determine late binding fw index
  */
 enum xe_late_bind_fw_id {
 	/** @XE_LB_FW_FAN_CONTROL: Fan control */
 	XE_LB_FW_FAN_CONTROL = 0,
+	/** @XE_LB_FW_OCODE: Ocode firmware */
+	XE_LB_FW_OCODE,
 	/** @XE_LB_FW_MAX_ID: Number of IDs */
 	XE_LB_FW_MAX_ID
 };
@@ -45,6 +45,8 @@ struct xe_late_bind_fw {
 	struct work_struct work;
 	/** @version: late binding blob manifest version */
 	struct gsc_version version;
+	/** @sdk_api_version: late binding blob manifest SDK API version */
+	u16 sdk_api_version;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 4067e1dfdcd5..27a59e8e4487 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -217,3 +217,35 @@ bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
 	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
 	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
 }
+
+/**
+ * xe_sysctrl_sdk_api_version - Get SDK API version
+ * @xe: Xe device
+ * @version: SDK API version
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
+{
+	struct xe_sysctrl_sdk_api_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	int ret;
+
+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_SDK_API_VERSION,
+				  0, 0, &resp, sizeof(resp));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	if (ret)
+		return ret;
+
+	if (out_len != sizeof(resp)) {
+		xe_err(xe, "sysctrl: unexpected SDK API version length %zu (expected %zu)\n",
+		       out_len, sizeof(resp));
+		return -EPROTO;
+	}
+
+	*version = resp.sdk_api_version;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index b69a3f474236..c0b6d4330c88 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -22,5 +22,6 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
 bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
 bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
+int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 1f3f782d770e..cdacceebca06 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -57,10 +57,12 @@ enum xe_sysctrl_gfsp_cmd {
  *
  * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
  * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
+ * @XE_SYSCTRL_CMD_SDK_API_VERSION: Get SDK API version
  */
 enum xe_sysctrl_core_cmd {
 	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
 	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
+	XE_SYSCTRL_CMD_SDK_API_VERSION			= 0x06,
 };
 
 /**
@@ -126,6 +128,16 @@ enum xe_sysctrl_fw_status {
 	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
 };
 
+/**
+ * struct xe_sysctrl_sdk_api_resp - Get sdk api version response
+ */
+struct xe_sysctrl_sdk_api_resp {
+	/** @sdk_api_version: SDK API version */
+	u16 sdk_api_version;
+	/** @reserved: Reserved for future use */
+	u16 reserved;
+} __packed;
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.56.0

