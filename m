Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B081606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VghiQqao
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5E10E29B;
	Wed, 25 Nov 2026 08:06:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9510E29B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795594004; x=1827130004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejAampjIIzBTdtn9dTACcBpu+8J9xfdMTcTTbnc8W30=;
 b=VghiQqaoXvRaaXgVYHJVpElBMgaEttMIrhIbBYANScBDa/S7SLtmsOPP
 faMK00xD4k7PymYNo0dUJRPCLSWtibV11VFa7I/5DKZgnB9tYlfdV7qsG
 MNIKn/Tcpf6PLY2vpsnGa3Ozrh+ixqiwWivhRJX60jdLwpBCR7jAKgICV
 KWleevxjny2Aja4M4w+ZVZEQ9b3qQ3gSCUsLoDAnKOvM11rimx+3s5QA2
 dlO5Hh61PUdg06K2f1spP9+VnVaenK/pXBOmwp9HMTP7vX7N0+ZGK9o8Z
 fZCXgXJK9CVmzrq+w/dXZqNSZL36oWPLcvecl8QBX3BrokjI4UL+wwREK A==;
X-CSE-ConnectionGUID: uXFuNA9JSYGlaointpIUpA==
X-CSE-MsgGUID: RLdwe5S9QhmMOEcoIw1Nig==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4460171"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4460171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:44 -0800
X-CSE-ConnectionGUID: whCXaPd1Q8C5k4qkzgLWlA==
X-CSE-MsgGUID: h8MQfLvGR92w57paFQr4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11692764"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:06:43 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 2/2] drm/xe/vf: Support PCIe FLR
Date: Wed, 25 Nov 2026 09:06:20 +0100
Message-ID: <20261125080621.599255-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125080621.599255-1-lukasz.laguna@intel.com>
References: <20261125080621.599255-1-lukasz.laguna@intel.com>
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

Allow PCIe FLR handling on VFs.

VF FLR isn't complete when the PCIe FLR finishes. The PF still has to
sanitize the VF resources: it resets the VF GGTT entries and clears the
VF LMEM. Once done, it notifies GuC with FLR_FINISH. Until then, GuC
asks the VF to retry its requests.

Re-initialization after FLR assumes that the FLR has already completed
and that hardware state and VRAM contents are gone. It restores GGTT
mappings of kernel BOs and rebuilds the migrate page tables, so if it
started before the PF finished its cleanup, that cleanup could wipe
the restored state.

Add an SR-IOV post-FLR step to the reset handler, called before device
re-initialization. On a VF, it resets the GuC VF state over MMIO until
GuC accepts the request, which means the PF has completed the VF FLR
cleanup.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: Log an error when SR-IOV post-FLR actions fail
    Improve xe_sriov_post_flr() kernel-doc
v3: Explain VF FLR flow ordering in commit message (Raag)
---
 drivers/gpu/drm/xe/xe_pci_error.c |  9 ++++++++-
 drivers/gpu/drm/xe/xe_sriov.c     | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h     |  1 +
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index fc6ff71d84a0..9b54ae2d392f 100644
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
@@ -293,6 +294,12 @@ static void xe_pci_reset_done(struct pci_dev *pdev)
 	/* Unprepare early in case we fail */
 	xe->flr_prepared = false;
 
+	err = xe_sriov_post_flr(xe);
+	if (err) {
+		xe_err(xe, "PCI reset: SR-IOV post-FLR actions failed\n");
+		goto out;
+	}
+
 	/*
 	 * We already have the data structures intact, so try to re-initialize the device.
 	 * This will be similar to system resume flow, except we'll also need to recreate
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index ec254b950daf..506f5a7bb335 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -11,6 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -174,3 +175,33 @@ int xe_sriov_init_late(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_post_flr() - Perform SR-IOV specific post-FLR actions.
+ * @xe: the &xe_device
+ *
+ * This function should be called after PCIe FLR, before the device is
+ * re-initialized.
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

