Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F62FC2BA1B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9310E103;
	Tue, 11 Mar 2025 18:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftLEmUZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734D10E103
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741718125; x=1773254125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kK5XPnsiXMqlwvi/ZTXHRdMOY6iOx2Fi8aSy/c871U8=;
 b=ftLEmUZ0Ioki+eZQUW0F+HMN4qO95lBMqRRhOv9NMkrGCZxQ658vu/yg
 RDNeywGQNlsfsrEm93T/WpjPaOAIUssLh5SB/RvEVCqq370PNBHfy4l+b
 U6SDv7L/1jsUabTP3kpm6ou2Swsv/sSLPSwpOJbJja/cpK8JAETTm/ALK
 W2Nv3FUQXSsB34zcXUtNWiEaGpgIO0dfwFfiL+Oy5A7yJ4gmWaHb4+vTu
 JW9mTBsqkzRdKZGAkV++CLsAMDfto3VAuPzLh0g2iWoBK2VAiuDBAwXDo
 sCBJ/DdsoiR31M9O/ju90TbaosstTaKJeRUbJq9qQ0ubn2uDxqgGj3oOw w==;
X-CSE-ConnectionGUID: Wtx6vySeRFGIQfhqYJMrGQ==
X-CSE-MsgGUID: n7ydF1DnQxuNKU+RPkqUpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983302"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42983302"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:24 -0700
X-CSE-ConnectionGUID: lxquV1fqQsmLeYD/pmZI4w==
X-CSE-MsgGUID: 22VkTrNRRX6Ot98YTJPVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121301498"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Move survivability back to xe
Date: Tue, 11 Mar 2025 11:34:55 -0700
Message-ID: <20250311-fix-survivability-v2-1-729ce081155e@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
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
layer, with the correct dependencies handled. The xe_pci now only checks
for "is it enabled?", like it's doing in
xe_pci_suspend()/xe_pci_remove(), etc.

Cc: Riana Tauro <riana.tauro@intel.com>
Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
 drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5d79b439dd625..023290e5be392 100644
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
@@ -705,8 +706,19 @@ int xe_device_probe_early(struct xe_device *xe)
 	sriov_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err)
+	if (err) {
+		int save_err = err;
+
+		/*
+		 * Try to leave device in survivability mode if device is
+		 * capable
+		 */
+		err = xe_survivability_mode_enable(xe);
+		if (!err || err == -ENOTRECOVERABLE)
+			return save_err;
+
 		return err;
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
index d939ce70e6fa8..153b8d598a270 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
 	return xe->survivability.mode;
 }
 
-/**
- * xe_survivability_mode_required - checks if survivability mode is required
+/*
+ * xe_survivability_mode_capable - checks if it's possible to enable
+ * survivability mode
  * @xe: xe device instance
  *
- * This function reads the boot status from Pcode
+ * This function reads the boot status from Pcode.
  *
- * Return: true if boot status indicates failure, false otherwise
+ * Return: true if boot status indicates failure, false otherwise.
  */
-bool xe_survivability_mode_required(struct xe_device *xe)
+static bool xe_survivability_mode_capable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -216,6 +217,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
 	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	if (!xe_survivability_mode_capable(xe))
+		return -ENOTRECOVERABLE;
+
 	survivability->size = MAX_SCRATCH_MMIO;
 
 	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),

-- 
2.48.1

