Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF53C35FF3
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 20:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31910E93E;
	Thu, 13 Mar 2025 20:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ho94GJ+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348810E93C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741898474; x=1773434474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+MRrCiBTyWSqZQV7rvoowEz12DJDVrJFw1iM6AMhWk=;
 b=ho94GJ+8/Maz2B33LhCTH9uWGS27UtBFZCgdH1eGn50zhvJefwGjjK3N
 7E3ULNu/QJ20x7Zs5L+La20V/AZ5vTGLYu1xMeplJ4gkDyVv86wvVPeAE
 KxS39Noui2mhQptNC2hmbe66YeRKNxrYiRYM/aNIrG4jbLnyHpZmxwZsQ
 4/Cfq2yqKReM3/uQKCetPGZqbtHJHGBA1iqZ6vS0EiTCpPNLvL6ss10kS
 ntqkCoG03Vc30IumRp9Tr3rIAI0ocPG9wJYsKCf9pZ+xDNMCCqlb8UsT1
 reCWxPLaYgy6jsPFWJITyqFZj4kjYI0rQg2KWKSzqi4lBv3h6qjn4FJGt w==;
X-CSE-ConnectionGUID: Htx7dotzSj2Q144ZmQrM5A==
X-CSE-MsgGUID: bBuyBdCjTYK1I3qYlmpcwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42764614"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42764614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:41:14 -0700
X-CSE-ConnectionGUID: i1zPEYyXSEyq9DIPXK+Tqg==
X-CSE-MsgGUID: jzSV9wtmTYeTgM22Yjs1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121574272"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 13:41:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 1/3] drm/xe: Move survivability back to xe
Date: Thu, 13 Mar 2025 13:40:59 -0700
Message-ID: <20250313-fix-survivability-v4-1-5e90efdede99@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
References: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
moved the survivability handling to be done entirely in the xe_pci
layer. However there are some issues with that approach:

1) Survivability mode needs at least the mmio initialized, otherwise it
   can't really read a register to decide if it should enter that state
2) SR-IOV mode should be initialized, otherwise it's not possible to
   check if it's VF

Besides, as pointed by Riana the check for
xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
not a bool return.

Fix that by moving the initialization to be entirely in the xe_device
layer, with the correct dependencies handled: only after mmio and sriov
initialization, and not triggering it on error from
wait_for_lmem_ready(). This restores the trigger behavior before that
commit. The xe_pci layer now only checks for "is it enabled?",
like it's doing in xe_pci_suspend()/xe_pci_remove(), etc.

Cc: Riana Tauro <riana.tauro@intel.com>
Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v4:
- Swap the returns for err and save_err (Riana)
- Reword commit message to detail where the behavior before commit
  d40f275d96e8 is being restored (Rodrigo)

Changes in v3:
- Stop using -ENOTRECOVERABLE as it may be confusing wrt
  critical/non-critical failure. Returning 0 is sufficient
- s/xe_survivability_mode_capable/xe_survivability_mode_requested/
  as it's not only about it being capable, but also about the type of
  error, firmware signaling it, etc.
---
 drivers/gpu/drm/xe/xe_device.c             | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
 drivers/gpu/drm/xe/xe_survivability_mode.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -
 4 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b2f656b2a563e..0e8805f93468d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -53,6 +53,7 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_shrinker.h"
+#include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -711,8 +712,20 @@ int xe_device_probe_early(struct xe_device *xe)
 	sriov_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err)
-		return err;
+	if (err) {
+		int save_err = err;
+
+		/*
+		 * Try to leave device in survivability mode if device is
+		 * possible, but still return the previous error for error
+		 * propagation
+		 */
+		err = xe_survivability_mode_enable(xe);
+		if (err)
+			return err;
+
+		return save_err;
+	}
 
 	err = wait_for_lmem_ready(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4d982a5a4ffd9..6fea3091e2348 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe_early(xe);
-
-	/*
-	 * In Boot Survivability mode, no drm card is exposed and driver is
-	 * loaded with bare minimum to allow for firmware to be flashed through
-	 * mei. If early probe fails, check if survivability mode is flagged by
-	 * HW to be enabled. In that case enable it and return success.
-	 */
 	if (err) {
-		if (xe_survivability_mode_required(xe) &&
-		    xe_survivability_mode_enable(xe))
+		/*
+		 * In Boot Survivability mode, no drm card is exposed and driver
+		 * is loaded with bare minimum to allow for firmware to be
+		 * flashed through mei. If early probe failed, but it managed to
+		 * enable survivability mode, return success.
+		 */
+		if (xe_survivability_mode_is_enabled(xe))
 			return 0;
 
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index d939ce70e6fa8..0d57ad1596edf 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
 	return xe->survivability.mode;
 }
 
-/**
- * xe_survivability_mode_required - checks if survivability mode is required
+/*
+ * xe_survivability_mode_requested - check if it's possible to enable
+ * survivability mode and requested by HW
  * @xe: xe device instance
  *
- * This function reads the boot status from Pcode
+ * This function reads the boot status from Pcode.
  *
- * Return: true if boot status indicates failure, false otherwise
+ * Return: true if boot status indicates failure, false otherwise.
  */
-bool xe_survivability_mode_required(struct xe_device *xe)
+static bool xe_survivability_mode_requested(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -208,7 +209,8 @@ bool xe_survivability_mode_required(struct xe_device *xe)
  *
  * Initialize survivability information and enable survivability mode
  *
- * Return: 0 for success, negative error code otherwise.
+ * Return: 0 if survivability mode is enabled or not requested; negative error
+ * code otherwise.
  */
 int xe_survivability_mode_enable(struct xe_device *xe)
 {
@@ -216,6 +218,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
 	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	if (!xe_survivability_mode_requested(xe))
+		return 0;
+
 	survivability->size = MAX_SCRATCH_MMIO;
 
 	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index f4df5f9025ce8..d7e64885570d4 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -12,6 +12,5 @@ struct xe_device;
 
 int xe_survivability_mode_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_enabled(struct xe_device *xe);
-bool xe_survivability_mode_required(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */

-- 
2.48.1

