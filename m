Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC94EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B1110E12A;
	Tue,  4 Jul 2023 15:33:09 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C910E12A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484787; x=1720020787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AeOxHHqe2GspVGK8bWcW8Shfwp3EsRCTbmqrjbo8k0k=;
 b=JZ8LQNjyG/e1VxRTsjcqaqQspb3J5VGL/iclYr6BCDrYeXrSb4oWL5MM
 j0+3ulRvV0HC4XUAaRMpWSH+W2OK3lVIWbkaJ9K1nduCogAjkmVf5iulu
 lRMTREmXg27P5OFrzXEKNctQFzOGNelDv9LTaUklBFv0ZZj0LOohnyx6e
 /CqZ3CNIx3ageyfe9EuSbuVI+wOmQJVmqSZYPzPrRR6vxUOzkqD8KK3zD
 TfY6iBH/CdcRs0ItpCMUcD7Hjt4n7ZVs47xwj2t06W+nOsc4YOgP2bYg/
 FkA+AYfvI0hdHQBViIKuBl1NQkx+3HD06ucWO+tp3kCw866+3WCFyekjF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393893451"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="393893451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808970267"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="808970267"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:33:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 18:32:43 +0300
Message-Id: <20230704153243.2489821-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
References: <20230704153243.2489821-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use soc/intel_pch.[ch] from i915 instead of copy-paste.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   6 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
 .../xe/compat-i915-headers/soc/intel_pch.h    |   1 +
 drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------------------
 drivers/gpu/drm/xe/display/ext/intel_pch.h    |  91 ----------
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 6 files changed, 6 insertions(+), 253 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 054cfdbd30bd..336f0eb8f91e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -145,12 +145,12 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_display_rps.o \
 	display/ext/i915_irq.o \
 	display/ext/intel_clock_gating.o \
-	display/ext/intel_device_info.o \
-	display/ext/intel_pch.o
+	display/ext/intel_device_info.o
 
 # SOC code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
-	i915-soc/intel_dram.o
+	i915-soc/intel_dram.o \
+	i915-soc/intel_pch.o
 
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 8428f15426eb..a51889af7c23 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -10,12 +10,12 @@
  * TODO: refactor i915 and xe so this can cease to exist
  */
 
+#include "soc/intel_pch.h"
 #include "xe_device.h"
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 #include "i915_reg_defs.h"
-#include "intel_pch.h"
 #include "i915_utils.h"
 #include "intel_uncore.h"
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
new file mode 100644
index 000000000000..823803f7e853
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
@@ -0,0 +1 @@
+#include "../../../i915/soc/intel_pch.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.c b/drivers/gpu/drm/xe/display/ext/intel_pch.c
deleted file mode 100644
index dc2b15b5c4be..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_pch.c
+++ /dev/null
@@ -1,157 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright 2019 Intel Corporation.
- */
-
-#include "i915_drv.h"
-#include "i915_utils.h"
-#include "intel_pch.h"
-
-/* Map PCH device id to PCH type, or PCH_NONE if unknown. */
-static enum intel_pch
-intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
-{
-	switch (id) {
-	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_JSL_EHL(dev_priv));
-		/* MCC is TGP compatible */
-		return PCH_TGP;
-	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
-	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_TIGERLAKE(dev_priv) &&
-			    !IS_ROCKETLAKE(dev_priv) &&
-			    !IS_GEN9_BC(dev_priv));
-		return PCH_TGP;
-	case INTEL_PCH_ADP_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP2_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP3_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP4_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Alder Lake PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_ALDERLAKE_S(dev_priv) &&
-			    !IS_ALDERLAKE_P(dev_priv));
-		return PCH_ADP;
-	case INTEL_PCH_MTP_DEVICE_ID_TYPE:
-	case INTEL_PCH_MTP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Meteor Lake PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_METEORLAKE(dev_priv));
-		return PCH_MTP;
-	default:
-		return PCH_NONE;
-	}
-}
-
-static bool intel_is_virt_pch(unsigned short id,
-			      unsigned short svendor, unsigned short sdevice)
-{
-	return (id == INTEL_PCH_P2X_DEVICE_ID_TYPE ||
-		id == INTEL_PCH_P3X_DEVICE_ID_TYPE ||
-		(id == INTEL_PCH_QEMU_DEVICE_ID_TYPE &&
-		 svendor == PCI_SUBVENDOR_ID_REDHAT_QUMRANET &&
-		 sdevice == PCI_SUBDEVICE_ID_QEMU));
-}
-
-static void
-intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
-		      unsigned short *pch_id, enum intel_pch *pch_type)
-{
-	unsigned short id = 0;
-
-	/*
-	 * In a virtualized passthrough environment we can be in a
-	 * setup where the ISA bridge is not able to be passed through.
-	 * In this case, a south bridge can be emulated and we have to
-	 * make an educated guess as to which PCH is really there.
-	 */
-
-	if (IS_METEORLAKE(dev_priv))
-		id = INTEL_PCH_MTP_DEVICE_ID_TYPE;
-	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
-		id = INTEL_PCH_ADP_DEVICE_ID_TYPE;
-	else if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
-		id = INTEL_PCH_TGP_DEVICE_ID_TYPE;
-	else BUG_ON(1);
-
-	if (id)
-		drm_dbg_kms(&dev_priv->drm, "Assuming PCH ID %04x\n", id);
-	else
-		drm_dbg_kms(&dev_priv->drm, "Assuming no PCH\n");
-
-	*pch_type = intel_pch_type(dev_priv, id);
-
-	/* Sanity check virtual PCH id */
-	if (drm_WARN_ON(&dev_priv->drm,
-			id && *pch_type == PCH_NONE))
-		id = 0;
-
-	*pch_id = id;
-}
-
-void intel_detect_pch(struct drm_i915_private *dev_priv)
-{
-	struct pci_dev *pch = NULL;
-	unsigned short id;
-	enum intel_pch pch_type;
-
-	/* DG1 has south engine display on the same PCI device */
-	if (IS_DG1(dev_priv)) {
-		dev_priv->pch_type = PCH_DG1;
-		return;
-	} else if (IS_DG2(dev_priv)) {
-		dev_priv->pch_type = PCH_DG2;
-		return;
-	}
-
-	/*
-	 * The reason to probe ISA bridge instead of Dev31:Fun0 is to
-	 * make graphics device passthrough work easy for VMM, that only
-	 * need to expose ISA bridge to let driver know the real hardware
-	 * underneath. This is a requirement from virtualization team.
-	 *
-	 * In some virtualized environments (e.g. XEN), there is irrelevant
-	 * ISA bridge in the system. To work reliably, we should scan trhough
-	 * all the ISA bridge devices and check for the first match, instead
-	 * of only checking the first one.
-	 */
-	while ((pch = pci_get_class(PCI_CLASS_BRIDGE_ISA << 8, pch))) {
-		if (pch->vendor != PCI_VENDOR_ID_INTEL)
-			continue;
-
-		id = pch->device & INTEL_PCH_DEVICE_ID_MASK;
-
-		pch_type = intel_pch_type(dev_priv, id);
-		if (pch_type != PCH_NONE) {
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-			break;
-		} else if (intel_is_virt_pch(id, pch->subsystem_vendor,
-					     pch->subsystem_device)) {
-			intel_virt_detect_pch(dev_priv, &id, &pch_type);
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-			break;
-		}
-	}
-
-	/*
-	 * Use PCH_NOP (PCH but no South Display) for PCH platforms without
-	 * display.
-	 */
-	if (pch && !HAS_DISPLAY(dev_priv)) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Display disabled, reverting to NOP PCH\n");
-		dev_priv->pch_type = PCH_NOP;
-		dev_priv->pch_id = 0;
-	} else if (!pch) {
-		if (i915_run_as_guest() && HAS_DISPLAY(dev_priv)) {
-			intel_virt_detect_pch(dev_priv, &id, &pch_type);
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-		} else {
-			drm_dbg_kms(&dev_priv->drm, "No PCH found.\n");
-		}
-	}
-
-	pci_dev_put(pch);
-}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.h b/drivers/gpu/drm/xe/display/ext/intel_pch.h
deleted file mode 100644
index 32aff5a70d04..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_pch.h
+++ /dev/null
@@ -1,91 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright 2019 Intel Corporation.
- */
-
-#ifndef __INTEL_PCH__
-#define __INTEL_PCH__
-
-struct drm_i915_private;
-
-/*
- * Sorted by south display engine compatibility.
- * If the new PCH comes with a south display engine that is not
- * inherited from the latest item, please do not add it to the
- * end. Instead, add it right after its "parent" PCH.
- */
-enum intel_pch {
-	PCH_NOP = -1,	/* PCH without south display */
-	PCH_NONE = 0,	/* No PCH present */
-	PCH_IBX,	/* Ibexpeak PCH */
-	PCH_CPT,	/* Cougarpoint/Pantherpoint PCH */
-	PCH_LPT,	/* Lynxpoint/Wildcatpoint PCH */
-	PCH_SPT,        /* Sunrisepoint/Kaby Lake PCH */
-	PCH_CNP,        /* Cannon/Comet Lake PCH */
-	PCH_ICP,	/* Ice Lake/Jasper Lake PCH */
-	PCH_TGP,	/* Tiger Lake/Mule Creek Canyon PCH */
-	PCH_ADP,	/* Alder Lake PCH */
-	PCH_MTP,	/* Meteor Lake PCH */
-
-	/* Fake PCHs, functionality handled on the same PCI dev */
-	PCH_DG1 = 1024,
-	PCH_DG2,
-};
-
-#define INTEL_PCH_DEVICE_ID_MASK		0xff80
-#define INTEL_PCH_IBX_DEVICE_ID_TYPE		0x3b00
-#define INTEL_PCH_CPT_DEVICE_ID_TYPE		0x1c00
-#define INTEL_PCH_PPT_DEVICE_ID_TYPE		0x1e00
-#define INTEL_PCH_LPT_DEVICE_ID_TYPE		0x8c00
-#define INTEL_PCH_LPT_LP_DEVICE_ID_TYPE		0x9c00
-#define INTEL_PCH_WPT_DEVICE_ID_TYPE		0x8c80
-#define INTEL_PCH_WPT_LP_DEVICE_ID_TYPE		0x9c80
-#define INTEL_PCH_SPT_DEVICE_ID_TYPE		0xA100
-#define INTEL_PCH_SPT_LP_DEVICE_ID_TYPE		0x9D00
-#define INTEL_PCH_KBP_DEVICE_ID_TYPE		0xA280
-#define INTEL_PCH_CNP_DEVICE_ID_TYPE		0xA300
-#define INTEL_PCH_CNP_LP_DEVICE_ID_TYPE		0x9D80
-#define INTEL_PCH_CMP_DEVICE_ID_TYPE		0x0280
-#define INTEL_PCH_CMP2_DEVICE_ID_TYPE		0x0680
-#define INTEL_PCH_CMP_V_DEVICE_ID_TYPE		0xA380
-#define INTEL_PCH_ICP_DEVICE_ID_TYPE		0x3480
-#define INTEL_PCH_ICP2_DEVICE_ID_TYPE		0x3880
-#define INTEL_PCH_MCC_DEVICE_ID_TYPE		0x4B00
-#define INTEL_PCH_TGP_DEVICE_ID_TYPE		0xA080
-#define INTEL_PCH_TGP2_DEVICE_ID_TYPE		0x4380
-#define INTEL_PCH_JSP_DEVICE_ID_TYPE		0x4D80
-#define INTEL_PCH_ADP_DEVICE_ID_TYPE		0x7A80
-#define INTEL_PCH_ADP2_DEVICE_ID_TYPE		0x5180
-#define INTEL_PCH_ADP3_DEVICE_ID_TYPE		0x7A00
-#define INTEL_PCH_ADP4_DEVICE_ID_TYPE		0x5480
-#define INTEL_PCH_MTP_DEVICE_ID_TYPE		0x7E00
-#define INTEL_PCH_MTP2_DEVICE_ID_TYPE		0xAE00
-#define INTEL_PCH_P2X_DEVICE_ID_TYPE		0x7100
-#define INTEL_PCH_P3X_DEVICE_ID_TYPE		0x7000
-#define INTEL_PCH_QEMU_DEVICE_ID_TYPE		0x2900 /* qemu q35 has 2918 */
-
-#define INTEL_PCH_TYPE(dev_priv)		((dev_priv)->pch_type)
-#define INTEL_PCH_ID(dev_priv)			((dev_priv)->pch_id)
-#define HAS_PCH_MTP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_MTP)
-#define HAS_PCH_DG2(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_DG2)
-#define HAS_PCH_ADP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_ADP)
-#define HAS_PCH_DG1(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_DG1)
-#define HAS_PCH_TGP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_TGP)
-#define HAS_PCH_ICP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_ICP)
-#define HAS_PCH_CNP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_CNP)
-#define HAS_PCH_SPT(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_SPT)
-#define HAS_PCH_LPT(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_LPT)
-#define HAS_PCH_LPT_LP(dev_priv) \
-	(INTEL_PCH_ID(dev_priv) == INTEL_PCH_LPT_LP_DEVICE_ID_TYPE || \
-	 INTEL_PCH_ID(dev_priv) == INTEL_PCH_WPT_LP_DEVICE_ID_TYPE)
-#define HAS_PCH_LPT_H(dev_priv) \
-	(INTEL_PCH_ID(dev_priv) == INTEL_PCH_LPT_DEVICE_ID_TYPE || \
-	 INTEL_PCH_ID(dev_priv) == INTEL_PCH_WPT_DEVICE_ID_TYPE)
-#define HAS_PCH_CPT(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_CPT)
-#define HAS_PCH_IBX(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_IBX)
-#define HAS_PCH_NOP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_NOP)
-#define HAS_PCH_SPLIT(dev_priv)			(INTEL_PCH_TYPE(dev_priv) != PCH_NONE)
-
-void intel_detect_pch(struct drm_i915_private *dev_priv);
-
-#endif /* __INTEL_PCH__ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2fc24eac0775..26a8de77138a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -19,7 +19,7 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "ext/intel_device_info.h"
-#include "ext/intel_pch.h"
+#include "soc/intel_pch.h"
 #include "intel_display_core.h"
 #include "intel_display_device.h"
 #endif
-- 
2.39.2

