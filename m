Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FE3C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 14:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FE910F5EB;
	Thu,  9 Jul 2026 14:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfUoSHgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253210F5EB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783607287; x=1815143287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xzpEeP+LBXbIBGD7bOBJXERi41cCaWys8E5DFNjsKRg=;
 b=JfUoSHgXy/fXtnS0+HIYwnI2J0VyvqptbPkgHb9IjIuDGT3UVkns6BL3
 W1rJz9knZTRQoRajiuKQZKnfL3ekgKEeyFdQ8kRja05xClxWavQPvlCnI
 FHItFeGZ0qxhvvNlSM9kfOjTc9jhqirnwiWgi/NjNGnsurswEwbTqQotw
 z1MNafZ+Bn1grwcDSvNjX64echVKpJqJ6UslKMZzPBMrjf42+JjD1ef0u
 Kw9SPd9J1U/1MpKIToALJJQvROF6P3EomN1FSzzUJEZQp/c5EtLUQMlO7
 x8dIf2pUWZ6aVXyOeVHI0qegL8lYMWjV/KOgGTi/NBFeiFdT7/QhEoTsE g==;
X-CSE-ConnectionGUID: DGdmTUxPS+eT/a2surtbmA==
X-CSE-MsgGUID: cpdMCcw+RYCYIJRjtmpwJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84341927"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84341927"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:06 -0700
X-CSE-ConnectionGUID: 6tPTsjKySeem3UsZxVaeIA==
X-CSE-MsgGUID: QoIrMk65R5SMTNFk4d4c+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259496542"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:05 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 1/3] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
Date: Thu,  9 Jul 2026 20:09:28 +0530
Message-ID: <20260709143926.3980581-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709143926.3980581-5-badal.nilawar@intel.com>
References: <20260709143926.3980581-5-badal.nilawar@intel.com>
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

Enable loading of Ocode, the legacy OOBMSM firmware,
via the late binding flow.

V2: Added TODO comments for ocode compatibility version check

Assisted-by: GitHub-Copilot:GPT-5.3
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 68 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
 2 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..1f627cdea24e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -33,10 +33,12 @@
 
 static const u32 fw_id_to_type[] = {
 		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
+		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
 	};
 
 static const char * const fw_id_to_name[] = {
 		[XE_LB_FW_FAN_CONTROL] = "fan_control",
+		[XE_LB_FW_OCODE] = "ocode",
 	};
 
 static struct xe_device *
@@ -179,6 +181,34 @@ static const char *xe_late_bind_parse_status(uint32_t status)
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
@@ -298,7 +328,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	struct xe_late_bind_fw *lb_fw;
 	const struct firmware *fw;
 	u32 num_fans;
-	int ret;
+	int ret = 0;
 
 	if (fw_id >= XE_LB_FW_MAX_ID)
 		return -EINVAL;
@@ -320,9 +350,16 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 			return 0;
 	}
 
-	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
-		 fw_id_to_name[lb_fw->id], pdev->device,
-		 pdev->subsystem_vendor, pdev->subsystem_device);
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
+		u32 ocode_comp_v = 0;
+		/* TODO: Fetch ocode compatibility version via system controller mailbox */
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device, ocode_comp_v);
+	} else {
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device,
+			 pdev->subsystem_vendor, pdev->subsystem_device);
+	}
 
 	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
 	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
@@ -332,22 +369,15 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return 0;
 	}
 
-	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
-		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
-			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
-		release_firmware(fw);
-		return -ENODATA;
-	}
-
 	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
 	if (ret)
-		return ret;
+		goto release_fw;
 
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
-		release_firmware(fw);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto release_fw;
 	}
 
 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
@@ -355,11 +385,17 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		 lb_fw->version.major, lb_fw->version.minor,
 		 lb_fw->version.hotfix, lb_fw->version.build);
 
+	/*
+	 * TODO: Verify compatibility version in manifest header against the version
+	 * returned by the system controller.
+	 */
+
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
-	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
 
-	return 0;
+release_fw:
+	release_firmware(fw);
+	return ret;
 }
 
 static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index ee5efe60774e..e4e5fafa31d7 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -21,6 +21,8 @@
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

