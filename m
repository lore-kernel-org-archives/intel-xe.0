Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52198C61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDB010E907;
	Tue, 25 Aug 2026 06:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkkF/vy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55710E905
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639815; x=1819175815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qvtdCLVWnIkj940xeMvv5pfHcnTNXDgDbeWFjfpuSKE=;
 b=hkkF/vy1+5nbPAqIn/TwXyp624RFxIGxLLbcLbhNY1nPOKL6Qs1tKuiA
 C5wyLRO0+Y8M64N8lHo9S2a0kz6T/fq4EIJq9X6eBzfVVdTbatDHYCac5
 L3azQ0LMpQ1C9wmTxlx6x7I9MIlTevm9AaVOLfyPj6AbK2hIE3EgjlGtW
 FU9uAknX7bM69Q/LsnDc81FSZrI+gPup7EyDhuBMn+7VvHv05K9/2rYP+
 eEhHz80At0G1UuVXcB3VAaoaCude9+0YrrWEY0WyNBGqYXmKzAhpCux/t
 L07PdJ4tMcK7OaIHeE7UtzdcfhzL1Fpj1wfAx/So9utapzBkCYBUSFiW8 g==;
X-CSE-ConnectionGUID: zpSdGaHNSZ6sdJBIWgQfTQ==
X-CSE-MsgGUID: xLykwko7Q/ek8yOpVU+ZMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226109"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:55 -0700
X-CSE-ConnectionGUID: 110RhrpZRkuw90yn9HBCVA==
X-CSE-MsgGUID: eCjX1nbQTkWUEnmTW5R27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265429031"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 4/5] drm/xe/xe_ras: Add function to get maximum pages firmware
 can store
Date: Tue, 25 Aug 2026 12:06:19 +0530
Message-ID: <20260825063615.3697317-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825063615.3697317-7-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
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

Add function to get maximum number of pages that firmware can store for
offline tracking. This will be used in sysfs while reporting bad pages.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_ras.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h          |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h    | 13 +++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1494f3a6c62b..99ac8e81bc2e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,6 +21,7 @@
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
+#include "xe_ras_types.h"
 #include "xe_sriov_pf_types.h"
 #include "xe_sriov_types.h"
 #include "xe_sriov_vf_types.h"
@@ -553,6 +554,9 @@ struct xe_device {
 	/** @drm_ras: drm-ras structure for device */
 	struct xe_drm_ras drm_ras;
 
+	/** @ras: RAS structure for device */
+	struct xe_ras ras;
+
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 441462a36dbc..ca6d55907626 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -380,6 +380,7 @@ static void get_offlined_list(struct xe_device *xe)
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_offline_list_response response = {0};
 	struct xe_ras_offline_list_request request = {0};
+	struct xe_ras *ras = &xe->ras;
 	u32 count = 0;
 	size_t rlen;
 	int ret, i;
@@ -411,6 +412,9 @@ static void get_offlined_list(struct xe_device *xe)
 		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
 			handle_page_offline(xe, response.page_addresses[i], false);
 
+		if (!ras->max_pages)
+			ras->max_pages = response.max_entries;
+
 		count += response.pages_returned;
 		if (!response.pages_returned)
 			break;
@@ -1001,6 +1005,20 @@ static const struct attribute_group gpu_health_group = {
 	.attrs = gpu_health_attrs,
 };
 
+/**
+ * xe_ras_get_max_pages() - Get maximum pages
+ * @xe: Xe device instance
+ *
+ * This function returns the maximum number of pages that can be stored
+ * by firmware in flash
+ *
+ * Return: Maximum number of pages that can be stored by firmware in flash
+ */
+u32 xe_ras_get_max_pages(struct xe_device *xe)
+{
+	return xe->ras.max_pages;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 618364734043..1510edeb7c73 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -18,5 +18,6 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
+u32 xe_ras_get_max_pages(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index cddcfa656d9f..2b0c6ef8c8a4 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -364,4 +364,17 @@ struct xe_ras_set_health_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[2];
 } __packed;
+
+/* Driver RAS structures */
+
+/**
+ * struct xe_ras - Device RAS structure
+ *
+ * This structure has the data cached from the firmware
+ */
+struct xe_ras {
+	/** @max_pages: Total number of pages that can be stored by firmware */
+	u32 max_pages;
+};
+
 #endif
-- 
2.47.1

