Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C2606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LNvnfN2l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EB910E130;
	Tue, 24 Nov 2026 15:24:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718AC10E130
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795533839; x=1827069839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbpBAXKOBFGvc1D1NCo9YG5OuSXFykVYLXH6l7l42Kg=;
 b=LNvnfN2llO0MuQabeGFX6f6f9IjxcEACVN4BwIzWF1D/bqZjnZ2mK3Y/
 EwF+Z9/y6PseYken+3roe97dFPm+ZgcFZHMYP4j8mHxoi8FVc+v8ENxn5
 k4V/LYlkXpXdTEPkWVGy9ZnDxS85jru2m1kyjR59vtfb3tY4DRx8Ux5w8
 4GMplCssFvk7dlahsiE0x++eO6l/0HcJs1CUEIKBKY9W9ZVM3CN4j+hF2
 /cmyJ/nCvusbcgjgbDOo0nu2jMJ3JPnqlAMvW/LGTrlQtR0aWnB+3//xY
 I93irLuIvm1AloZ5ghYNLILCAUajGkRuIq2kdJS8fArap6EHURm/Zw/hO A==;
X-CSE-ConnectionGUID: 5Ny4TiFQTk+FQ8eduES8AA==
X-CSE-MsgGUID: 5ASEohS7QWmqZFsP54vm3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4271565"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4271565"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:16:50 -0800
X-CSE-ConnectionGUID: 7IsOKrRDQ/2UYkRK8hf0/w==
X-CSE-MsgGUID: /1UqXUZUQjSlrxQlT4i4+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13383015"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:16:48 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/vf: Support PCIe FLR
Date: Tue, 24 Nov 2026 16:16:45 +0100
Message-ID: <20261124151645.411812-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

After VF FLR, GuC remains unresponsive for VF until PF completes VF
cleanup. Before proceeding with VF re-initialization, reset GuC VF state
over MMIO until GuC becomes responsive.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c |  6 +++++-
 drivers/gpu/drm/xe/xe_sriov.c     | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h     |  1 +
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index fc6ff71d84a0..a1def9a14310 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -16,6 +16,7 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_sriov.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_survivability_mode.h"
 #include "xe_wa.h"
@@ -234,7 +235,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 
 static inline bool xe_pci_reset_skip(struct xe_device *xe)
 {
-	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
+	return !IS_DGFX(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
 }
 
 static void xe_pci_reset_prepare(struct pci_dev *pdev)
@@ -293,6 +294,9 @@ static void xe_pci_reset_done(struct pci_dev *pdev)
 	/* Unprepare early in case we fail */
 	xe->flr_prepared = false;
 
+	if (xe_sriov_post_flr(xe))
+		goto out;
+
 	/*
 	 * We already have the data structures intact, so try to re-initialize the device.
 	 * This will be similar to system resume flow, except we'll also need to recreate
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index ec254b950daf..3fe3d41066c4 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -11,6 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -174,3 +175,32 @@ int xe_sriov_init_late(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_post_flr() - Perform SR-IOV specific post-FLR actions.
+ * @xe: the &xe_device
+ *
+ * Perform SR-IOV specific actions required after PCIe FLR.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_post_flr(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	int err;
+	u8 id;
+
+	if (IS_SRIOV_VF(xe)) {
+		/*
+		 * Wait for GuC to become responsive. This indicates that PF completed
+		 * VF FLR cleanups and it's safe to start VF re-initialization.
+		 */
+		for_each_gt(gt, xe, id) {
+			err = xe_gt_sriov_vf_reset(gt);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 72e55543c30e..444d1ad74926 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -19,6 +19,7 @@ void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
 int xe_sriov_init_late(struct xe_device *xe);
+int xe_sriov_post_flr(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
-- 
2.43.0

