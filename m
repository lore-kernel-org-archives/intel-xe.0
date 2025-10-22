Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD2CCF9E3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4810E6AE;
	Wed, 22 Oct 2025 05:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ+zSfrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6321A10E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWO2nj0fnmRfHrUG3nbZlPqH3wCJwE25SEjwOC32NsM=;
 b=lQ+zSfrdIW/ugkR0BPcnDSHS+Uve2Y8cLJoGZ5BXQw6VJ5IXot/9jewZ
 Cu/gEiiRTEf+1L/dDW5Fd0IxTp8CyHFPtthhXd67MmA/S8fAtC/UzHTiu
 kOU6yory0hvV2glAt9wqfv+gNJ/+ZPkS2rOmljPI/vUFmPNGIDZECVMmi
 pzBCsCBOy21bkUUuLPUGBG5JPw1BcHEa2jpjbFsXzkkUuEp7A49O/+0ie
 Hi65erD5cjOKoTRlsjc0uKi+WRZCd7xZgKHBzRaugjeQqtxt1x+kxOuVo
 GIPUgJDDqLTae/+S0ASIHkRG79vpkAHGyBcq/jPodqBoORuiEeo2It3Dk A==;
X-CSE-ConnectionGUID: 1NsIN3mzQm+uP9WGb6YzZw==
X-CSE-MsgGUID: 5sWaVCLzSjyjVXJ8Oj41zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083975"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: cCiDnwdQQseeS1sjy16Q3w==
X-CSE-MsgGUID: CWfR0ln+RfKYFpTY8S4TsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959694"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Soham Purkait <soham.purkait@intel.com>
Subject: [PATCH 05/12] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Date: Tue, 21 Oct 2025 22:17:37 -0700
Message-ID: <20251021-cri-v1-5-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Soham Purkait <soham.purkait@intel.com>

Add check to verify if CSC is a PCIe endpoint via pcode mailbox
during xe modprobe. If this mode is not supported, an auxiliary
child device for the MEI driver is created as a fallback flow.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 30 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index a415ca4887914..c2a365b7e0f6f 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -8,11 +8,15 @@
 #include <linux/pci.h>
 #include <linux/sizes.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_platform_types.h"
+#include "xe_pm.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -41,6 +45,25 @@ static int heci_gsc_irq_init(int irq)
 	return irq_set_chip_data(irq, NULL);
 }
 
+/*
+ * is_csc_pci_ep - Check whether CSC is exposed as a PCIe endpoint through
+ * pcode mailbox sub-command PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
+ */
+static bool is_csc_pci_ep(struct xe_device *xe)
+{
+	int ret = 0;
+	u32 val;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS,
+				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
+				       &val, NULL);
+	xe_pm_runtime_put(xe);
+
+	return !ret && (val & 0x1U);
+}
+
 /**
  * struct heci_gsc_def - graphics security controller heci interface definitions
  *
@@ -178,7 +201,12 @@ int xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		if (is_csc_pci_ep(xe))
+			return 0;
+
+		def = &heci_gsc_def_dg2;
+	} else if (xe->info.platform == XE_BATTLEMAGE) {
 		def = &heci_gsc_def_dg2;
 	} else if (xe->info.platform == XE_PVC) {
 		def = &heci_gsc_def_pvc;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 92bfcba51e199..bd32af0b5a23f 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,7 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
+#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4

-- 
2.51.0

