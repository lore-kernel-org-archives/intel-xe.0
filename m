Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB48C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 23:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228610F347;
	Fri, 31 Mar 2023 23:09:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD0C10F347
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 23:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680304165; x=1711840165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k9BmDxXRRB2LJYGlVsE9nyL1738r97YW4WePVpA9o8I=;
 b=OooFR7C81zUa9EBS9BzMIgihDHB+3Vy1lbvZZbKYo0oxJ307X/FJguBj
 AYCWOFQeaAXHxMVbIHGcgLVKWpA140KCRSI3iTlYIj8JMEVzDQBvVudP2
 HPzuNH/aL2cPA18LemLCfDrI/Kwtf9v2Cay6eJf89TkR2TPUjBSdg8OZ+
 SvJkBV+Fgj/hB9Ua7Kxa957mbhfCGfJiocVmA2QlowAyYAeQJ7Yke8tux
 YCpRbsc2cusKsyVuYWTU/hf1g2izZVq3BWPeCLHVmECuS426ny/MZozfG
 YfX7epQUbZD/rFcDteBrwBGaCUBQyXX3FzlvOxTnSC6/mTtk2lZ96bsaU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325556851"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325556851"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 16:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="754543804"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="754543804"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 16:09:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 16:09:02 -0700
Message-Id: <20230331230902.1603294-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Fix platform order
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Platform order in enum xe_platform started to be used by some parts of
the code, like the GuC/HuC firmware loading logic. The order itself is
not very important, but it's better to follow a convention: as was
documented in the comment above the enum, reorder the platforms by
graphics version. While at it, remove the gen terminology.

v2:
  - Use "graphics version" instead of chronological order (Matt Roper)
  - Also change pciidlist to follow the same order
  - Remove "gen" from comments around enum xe_platform

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            |  4 ++--
 drivers/gpu/drm/xe/xe_platform_types.h | 12 +++++++-----
 drivers/gpu/drm/xe/xe_uc_fw.c          |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e..1844cff8fba8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -286,11 +286,11 @@ __diag_pop();
  */
 static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
+	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
+	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
-	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	{ }
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 72612c832e88..80c19bffe79c 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -6,27 +6,29 @@
 #ifndef _XE_PLATFORM_INFO_TYPES_H_
 #define _XE_PLATFORM_INFO_TYPES_H_
 
-/* Keep in gen based order, and chronological order within a gen */
+/*
+ * Keep this in graphics version based order and chronological order within a
+ * version
+ */
 enum xe_platform {
 	XE_PLATFORM_UNINITIALIZED = 0,
-	/* gen12 */
 	XE_TIGERLAKE,
 	XE_ROCKETLAKE,
+	XE_ALDERLAKE_S,
+	XE_ALDERLAKE_P,
 	XE_DG1,
 	XE_DG2,
 	XE_PVC,
-	XE_ALDERLAKE_S,
-	XE_ALDERLAKE_P,
 	XE_METEORLAKE,
 };
 
 enum xe_subplatform {
 	XE_SUBPLATFORM_UNINITIALIZED = 0,
 	XE_SUBPLATFORM_NONE,
+	XE_SUBPLATFORM_ADLP_RPLU,
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
-	XE_SUBPLATFORM_ADLP_RPLU,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2c982b37e87..d1d2e6f0820d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -43,11 +43,11 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
  */
 #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
 	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
-	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
-	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
 	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
 	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
 	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
+	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
+	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
 	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
-- 
2.39.0

