Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91998F30931
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B9110E251;
	Thu,  5 Mar 2026 10:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5jkOV4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF9E10E251
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706835; x=1804242835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWBMxOjjox1m8ieBBYpX5xTyktTip6Uh2IokXwPKMak=;
 b=F5jkOV4De64LWyH0+JqLSRpWveQBWorvunlrYyiqSttEYCF2hvMN3ZhN
 DTkPoce7Ef3REyeiqS4ldFWCNBEUBj+qd50ybnSgDdPKKoG24gojvnsXg
 DYd9rLk4kgKCv8e70jqKSNf1JOLdIvBGEUQv4y30g/lehIvcR7MDn+Lam
 Lh5WQNL15ZizXDc2BYdrK9S4M0QzWxpOw3+M+9w4IMuGBpEiZrIwnQ+YV
 liHSRMxjwePOcAZE6hb/Inbrr2KQ0rCeT5ULjAwKtxFi5/jNtq5Svb4rd
 P5D85kHNvQNp4ixC1XoK1mvEybhg9xCD26Fc8rLqSX6f+OL1zvA2J3sYb w==;
X-CSE-ConnectionGUID: UESIdS49TmmDpKsXAMBV+Q==
X-CSE-MsgGUID: 6BT6YmCqThyx8x8uQ+OwFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859093"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:55 -0800
X-CSE-ConnectionGUID: GgJ2RXhJQSGLl/u0+zredg==
X-CSE-MsgGUID: tuMWxjijSo6mwHnFSr1w3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223326137"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:53 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [RFC PATCH 2/4] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware on CRI
Date: Thu,  5 Mar 2026 16:14:43 +0530
Message-ID: <20260305104441.2857181-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305104441.2857181-6-badal.nilawar@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
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

Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
loaded through late binding flow.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 49 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 5ca25186dc0cc..d3ef2926517bd 100644
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
@@ -264,7 +294,6 @@ static void xe_late_bind_work(struct work_struct *work)
 	/* Do not re-attempt fw load */
 	drmm_kfree(&xe->drm, (void *)lbfw->payload);
 	lbfw->payload = NULL;
-
 out:
 	xe_pm_runtime_put(xe);
 }
@@ -314,9 +343,14 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 			return 0;
 	}
 
-	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
-		 fw_id_to_name[lb_fw->id], pdev->device,
-		 pdev->subsystem_vendor, pdev->subsystem_device);
+	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device);
+	} else {
+		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+			 fw_id_to_name[lb_fw->id], pdev->device,
+			 pdev->subsystem_vendor, pdev->subsystem_device);
+	}
 
 	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
 	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
@@ -326,13 +360,6 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
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
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 2a8a985c37e71..a128e3f638a6c 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -20,6 +20,8 @@
 enum xe_late_bind_fw_id {
 	/** @XE_LB_FW_FAN_CONTROL: Fan control */
 	XE_LB_FW_FAN_CONTROL = 0,
+	/** @XE_LB_FW_OCODE: Ocode firmware */
+	XE_LB_FW_OCODE,
 	/** @XE_LB_FW_MAX_ID: Number of IDs */
 	XE_LB_FW_MAX_ID
 };
-- 
2.52.0

