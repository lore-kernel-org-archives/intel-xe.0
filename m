Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89273C531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497FB10E88A;
	Tue, 28 Jul 2026 16:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2yugXL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174F10E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255075; x=1816791075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B+T2GYzRgJ9qcn0DlB7tSNbizsvhsjlRZkHeu2f5Lz0=;
 b=A2yugXL/6a2aTcvgvdbmM7//hNO46ClTmoyt2tzoGLqfCP4R2Wp/u4EO
 4EFpCfDjU2I09MvSsELTtgVcBJ2i2jFEqq/6WW39Fet5CxHJQwq7mXGs4
 qD1267hJy5tYdlSTnJaujDg8sS5Igr1phRi+0pHd1C5iL33vYIRcHkLTH
 XCou+D34oCUOcDMqDJFKQvNISIdQSrufbcjt2oTYAC0S6+id1xs1KB7pI
 MmOuTDVbaZ7Pi7MsKQBs8gOHXyYNXRMNOM/Zt9HxPSFaZhb/ufbUo1GJ4
 Ylpj1DlI+hglXGcDWIz2cu9b24cKMzn7Kqb1h1TIukhvQVm57U/tQangl w==;
X-CSE-ConnectionGUID: 8AhDOpjISHCHOkEf2mKqRA==
X-CSE-MsgGUID: 1dGi0zkpRWGZLIgTUrNfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386254"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386254"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:15 -0700
X-CSE-ConnectionGUID: oBWRXAcuS5KQStt4zFHfhQ==
X-CSE-MsgGUID: bh/Ym/Q0QA+4JfnaSiznEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819288"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 04/22] drm/xe/log: Add component/location decorations to
 dmesg
Date: Tue, 28 Jul 2026 18:10:19 +0200
Message-ID: <20260728161039.579-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

While we can't directly use our xe_tile|gt_err|info helpers to get
nice Tile/GT decorations, we can still add them manually based on
the structured location parameter. Similarly, we can add component
name prefix based on the component identifier.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.c | 82 +++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 70a41bdf1a01..a4f4f2d4e250 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -3,6 +3,9 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "abi/xe_log_abi.h"
+
+#include "xe_device.h"
 #include "xe_log.h"
 #include "xe_printk.h"
 
@@ -13,6 +16,65 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 	/* TODO */
 }
 
+static const char *log_component_prefix(u32 component)
+{
+	switch (component) {
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";
+	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_CASE_PREFIX)
+#undef MAKE_XE_LOG_COMPONENT_CASE_PREFIX
+	}
+	return "";
+}
+
+static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return xe ? xe_device_get_gt(xe, id) : NULL;
+}
+
+static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	return xe && id < XE_MAX_TILES_PER_DEVICE ? &xe->tiles[id] : NULL;
+}
+
+static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
+{
+	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
+	u32 id = FIELD_GET(XE_LOG_LOCATION_ID_MASK, location);
+
+	if (!location || type == XE_LOG_LOCATION_TYPE_DEVICE) {
+		if (id)
+			goto unrecognized;
+		strscpy(buf, "", size);
+	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
+		struct xe_tile *tile = get_tile_safe(pdev, id);
+
+		if (!tile)
+			goto unrecognized;
+		snprintf(buf, size, "Tile%u: ", id);
+	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
+		struct xe_gt *gt = get_gt_safe(pdev, id);
+
+		if (!gt)
+			goto unrecognized;
+		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
+	} else {
+		goto unrecognized;
+	}
+
+	return buf;
+
+unrecognized:
+	pci_WARN(pdev, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+		 "LOG: malformed location %#x\n", location);
+	snprintf(buf, size, "LOC%u? ID%u? ", type, id);
+	return buf;
+}
+
 static bool is_hw_sigid(enum xe_sigid sigid)
 {
 	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
@@ -71,20 +133,24 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
 			   u32 component, u32 location, const void *data, size_t len,
 			   struct va_format *vaf)
 {
+	char buf[32];
+	const char *loc_prefix = log_location_prefix(pdev, location, buf, sizeof(buf));
+	const char *comp_prefix = log_component_prefix(component);
 	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
 	const char *sev_prefix = log_sev_prefix(cper_sev);
 
-	/* TODO: add component/location details */
-
 	if (IS_ERR(data))
-		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
-				 sigid, sev_prefix, data, hwe_prefix, vaf);
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%s%s%pV",
+				 sigid, sev_prefix, data, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
 	else if (data && len)
-		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
-				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%s%s%pV",
+				 sigid, sev_prefix, (int)len, data, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
 	else
-		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
-				 sigid, sev_prefix, hwe_prefix, vaf);
+		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%s%s%pV",
+				 sigid, sev_prefix, hwe_prefix,
+				 loc_prefix, comp_prefix, vaf);
 }
 
 /**
-- 
2.47.1

