Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05C606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WOIuSIe7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3208C10E9F2;
	Fri, 27 Nov 2026 13:02:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F6F112ABD
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795784554; x=1827320554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEo5DTTSVG+vUSW0S1BaxsWL8TUC+MjlP+UbpentZQE=;
 b=WOIuSIe7ZAcAXPW9tRCoGZCl/Cg2eCNJPRvOG3ym2ma1Wy5IE4KqsLo1
 EyYO6NqN1UAfHG2JUmdRMbuOOTk86iu0mvhEtfRVt1wDha5240qBchj7i
 RvMeO4uaYe7YfP9mbnARrfZ2vRl9OOmKoEHSBeVfm1OdnP7VmvO4cwkbr
 q0bvzmSN6Lt21sPQcOaLEihahozjkkk9HiPySF+Z4X+xfkzbiAC1MgzBc
 NKQr5c9zI3bz1iZxl8JxPadSc8nj8twaggwJ3gKTGTr4n9NnF1sz3+mav
 8tWd30/oIddtX1p9aVE4Dt7h1kpq0AORAjPgdlIkXmMqo/2sVfin42i2s A==;
X-CSE-ConnectionGUID: HwTceu+YQW2WkzUdj0GKqQ==
X-CSE-MsgGUID: Ro1Vtw1aR+KKUp5IoDXS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4694558"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4694558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:02:34 -0800
X-CSE-ConnectionGUID: 1BHMGD96Qg+nSZ3nruVJdg==
X-CSE-MsgGUID: v9cWArcPT2mFdJbepbPKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12393719"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:02:33 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com, raag.jadav@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 2/2] drm/xe/vf: Support PCIe FLR
Date: Fri, 27 Nov 2026 14:02:19 +0100
Message-ID: <20261127130219.1201179-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127130219.1201179-1-lukasz.laguna@intel.com>
References: <20261127130219.1201179-1-lukasz.laguna@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Allow PCIe FLR handling for VFs on discrete platforms.

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
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: Log an error when SR-IOV post-FLR actions fail
    Improve xe_sriov_post_flr() kernel-doc
v3: Explain VF FLR flow ordering in commit message (Raag)
v4: Mention that VF FLR is supported only on discrete platforms (Piotr)
    Clarify comment about waiting for GuC in xe_sriov_post_flr()
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
index ec254b950daf..51b683abdb4a 100644
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
+		 * Wait for GuC to accept the VF state reset. This indicates that PF
+		 * completed VF FLR cleanups and it's safe to start VF re-initialization.
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

