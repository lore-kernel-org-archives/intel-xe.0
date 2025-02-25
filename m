Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E412FC021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93310E67E;
	Tue, 25 Feb 2025 13:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDh4sWQx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FE10E4D9
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489835; x=1772025835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MCBGaGLE/Yd2mGp7Z0pgi5QakU3h+GThCc6lp0e6vNQ=;
 b=mDh4sWQxOA7BPLdGsGtnN4X7kohSE4Dlv5qHHEQ3+iZ73BxxFU9COI+e
 PJ5nj5XSNilhk2RStKh3HGp7dXX34iRTNDGtI1oTzaBVtU+/F1rFPzFKr
 qNCnKTtgnJD+yuKNtRkb2eeBnL/36KsG/dDZ7L12IYQ8kLguQpBrsLrgz
 y2OyjnLz29cdAua4Rte+rh6pAh9oABx0LhvNh9XeXoRy4UrVPFmQJJMtk
 96NVGCTyKmLnjBbptPRV3xYLzZDi1/z2ahyuji5u8RG4Nj3G8LwiUPDNi
 +dyUavEywtd8VR7lZCjEpxmpYS6ZBjKw3ZsFMZd4UPaGmGXaQ8y0R3MC4 A==;
X-CSE-ConnectionGUID: 1n4zhPBoSUurpyReMQSj2Q==
X-CSE-MsgGUID: Y+Djs+DBQc6b7RgvZp4xQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40530482"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40530482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:55 -0800
X-CSE-ConnectionGUID: kg0vtg4nQimgoQAKOE24jw==
X-CSE-MsgGUID: WPJsX7ERQzaVRMmhZBD7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="120998279"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:53 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 1/3] drm/xe/uc: Add helpers to set firmware version
Date: Tue, 25 Feb 2025 14:23:35 +0100
Message-Id: <20250225132337.6508-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250225132337.6508-1-lukasz.laguna@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
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

Introduce a helper functions to set the found and compatibility firmware
version, allowing reuse in different parts of the driver.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 6195e353f269..feffa06fb968 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -188,6 +188,34 @@ static inline u32 xe_uc_fw_get_upload_size(struct xe_uc_fw *uc_fw)
 	return __xe_uc_fw_get_upload_size(uc_fw);
 }
 
+/**
+ * xe_uc_fw_set_found_ver - Set FW found version.
+ * @uc_fw: uC firmware
+ * @type: firmware version type
+ * @ver: pointer storing version to be set
+ *
+ * Set uC FW found version of given type.
+ */
+static inline void xe_uc_fw_set_found_ver(struct xe_uc_fw *uc_fw,
+					  enum xe_uc_fw_version_types type,
+					  const struct xe_uc_fw_version *ver)
+{
+	uc_fw->versions.found[type] = *ver;
+}
+
+/**
+ * xe_uc_fw_set_compatibility_ver - Set FW compatibility version.
+ * @uc_fw: uC firmware
+ * @ver: pointer storing version to be set
+ *
+ * Set uC FW found compatibility version.
+ */
+static inline void xe_uc_fw_set_compatibility_ver(struct xe_uc_fw *uc_fw,
+						  const struct xe_uc_fw_version *ver)
+{
+	xe_uc_fw_set_found_ver(uc_fw, XE_UC_FW_VER_COMPATIBILITY, ver);
+}
+
 #define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
 #endif
-- 
2.40.0

