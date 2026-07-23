Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67330C531C7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2179210E568;
	Thu, 23 Jul 2026 08:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVwaVHCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0B110F006
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795142; x=1816331142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6U+tOuMGm6TIUZ95o375ghpMdDdZqqm3RJyEMboUUS0=;
 b=kVwaVHCin8M8DEpOc+M8m5xQdQXNFfye8d6Xtl2CI91iVoFwZG8d/FHP
 Yd36+K/Q2kCrA6RY2kDFSSy7R2VFTVzkd/iNsuSMQY+qOYALYUY2+ubXr
 J7fv0hRlVtVbU4dJKQhlqiO7gnDVxcWcxzOh3oeJBYmxHwdi+iC1hEXol
 hXTpuP9wHRQiBdR387xkzwnLyfZUQjbnmzfYN3A9w4aqC5q84+NwYMHOL
 rghB9JWKTkphgcJDlmeCRsK/9LxcDKDtofW06njBT2AWFrG+PXRUsalVD
 i2Ab7VynCNBymIy6t2Bzb/LcBokzX3ZklTJRcAuC+N3+R/5Ko2Vz0rnBP Q==;
X-CSE-ConnectionGUID: ABJW+dneTIiU7USU0mNtxg==
X-CSE-MsgGUID: sZoClS89SOqUw/Bw4eiLng==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85389088"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85389088"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:42 -0700
X-CSE-ConnectionGUID: igb0ZevoQ6KF2wQSQ6cdHg==
X-CSE-MsgGUID: 5K+7qLFxQtm/3PUHZcx/Fg==
X-ExtLoop1: 1
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:39 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, anthony.giardina@intel.com
Subject: [PATCH v4 3/5] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
Date: Thu, 23 Jul 2026 14:07:03 +0530
Message-ID: <20260723083659.716683-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
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

Enable loading of Ocode, the legacy OOBMSM firmware, via the
late binding flow. Payload size check is not needed any more
as late binding support bigger payloads.

v2:
  - Added TODO comments for Ocode compatibility version check through
    sysctrl mailbox as Ocode may not remain backward compatible across
    the IFWI update.
  - The current firmware naming scheme uses ocode_8086_<devid>.bin.
    Once compatibility version checking is implemented, the firmware name
    will be extended to ocode_8086_<devid>_<comp_ver>.bin.
  - Declare the Ocode firmware dependancy with MODULE_FIRMWARE (Daniele)

Assisted-by: GitHub-Copilot:GPT-5.3
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v3: Describe need for Ocode compatibility version checks (Daniele)
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 67 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  4 +-
 2 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 8f3be55060f1..62b779942b88 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -18,6 +18,13 @@
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
 
+/*
+ * Current firmware name format: xe/ocode_8086_<devid>.bin
+ * TODO: Once System Controller support ocode compatibility version
+ *	 check via mailbox, add the <comp_ver> suffix to the filename.
+ */
+MODULE_FIRMWARE("xe/ocode_8086_674c.bin");
+
 /*
  * The component should load quite quickly in most cases, but it could take
  * a bit. Using a very big timeout just to cover the worst case scenario
@@ -33,10 +40,12 @@
 
 static const u32 fw_id_to_type[] = {
 		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
+		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
 	};
 
 static const char * const fw_id_to_name[] = {
 		[XE_LB_FW_FAN_CONTROL] = "fan_control",
+		[XE_LB_FW_OCODE] = "ocode",
 	};
 
 static struct xe_device *
@@ -179,6 +188,34 @@ static const char *xe_late_bind_parse_status(uint32_t status)
 		return "Invalid Payload";
 	case INTEL_LB_STATUS_TIMEOUT:
 		return "Timeout";
+	case INTEL_LB_STATUS_INTERNAL_ERROR:
+		return "Internal Error";
+	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
+		return "Invalid FPT Table";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
+		return "Signed Payload Verification Error";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
+		return "Signed Payload Invalid CPD";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
+		return "Signed Payload FW Version Mismatch";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
+		return "Signed Payload Invalid Manifest";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
+		return "Signed Payload Invalid Hash";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
+		return "Signed Payload Binding type Mismatch";
+	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
+		return "Signed Payload Handle SVN Failed";
+	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
+		return "Destination MBOX Failure";
+	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
+		return "Missing Loading Patch";
+	case INTEL_LB_STATUS_INVALID_COMMAND:
+		return "Invalid Command";
+	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
+		return "Invalid HECI Header";
+	case INTEL_LB_STATUS_IP_ERROR_START:
+		return "IP Error Start";
 	default:
 		return "Unknown error";
 	}
@@ -298,7 +335,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	struct xe_late_bind_fw *lb_fw;
 	const struct firmware *fw;
 	u32 num_fans;
-	int ret;
+	int ret = 0;
 
 	if (fw_id >= XE_LB_FW_MAX_ID)
 		return -EINVAL;
@@ -320,9 +357,18 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 			return 0;
 	}
 
-	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
-		 fw_id_to_name[lb_fw->id], pdev->device,
-		 pdev->subsystem_vendor, pdev->subsystem_device);
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
+		/*
+		 * TODO: Fetch ocode compatibility version via System Controller mailbox
+		 *       and include it in file name xe/ocode_8086_<devid>_<comp_ver>.bin.
+		 */
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device);
+	} else {
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device,
+			 pdev->subsystem_vendor, pdev->subsystem_device);
+	}
 
 	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
 	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
@@ -332,13 +378,6 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
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
@@ -355,8 +394,12 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		 lb_fw->version.major, lb_fw->version.minor,
 		 lb_fw->version.hotfix, lb_fw->version.build);
 
+	/*
+	 * TODO: Verify compatibility version in manifest header against the version
+	 *       returned by the system controller.
+	 */
+
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
-	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
 release_fw:
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ee5efe60774e..b7120592aaa0 100644
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
-- 
2.54.0

