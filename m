Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21232C46CD2
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 00:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE410E3C1;
	Sun, 17 Dec 2023 00:50:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850010E3C9
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702774255; x=1734310255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wt5V7wfasIU3S3jPhGooaYmu87vu6t7ybyApr30FycY=;
 b=KWpDonDyNv2DzL8h16ivNuUGMoI/J8lhRIZs3QcfCqZo61uW1pEFmInO
 YFCAFd5BVvyHijnxxxCqBN262k7MO0IUAa+spmiNMNre9+knb3j0rhB/H
 SIKL2cKr/JaRQhThmJKesYdVQBtXhJbI3BDuulXMz9tMdBB9GUUrE1Nyr
 mafFM9H+TNVRrj3iKxiPpLtuEj9CO/665q/pADzsay3ls5pxMG1xFqeP9
 GFptdsdslGnMdw8rSuuZohBu4q6WdqBr+xnYghKlelRla2ovyFLYF8ooA
 Dw+yVYmypccWSRfZ83SpacHHNwT2dXddUglCJYOe4pAU3xkDCsNrn7hiu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14074773"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="14074773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768387066"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="768387066"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Add kernel-doc for CCS mode selection
Date: Sat, 16 Dec 2023 13:41:18 -0800
Message-ID: <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move all CCS mode documentation including that of sysfs
interfaces to a single kernel-doc section.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/xe/index.rst       |  1 +
 Documentation/gpu/xe/xe_ccs_mode.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 28 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  7 +------
 4 files changed, 38 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_ccs_mode.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index c224ecaee81e1..1db8d20942b4e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
    xe_mm
    xe_map
    xe_migrate
+   xe_ccs_mode
    xe_cs
    xe_pm
    xe_pcode
diff --git a/Documentation/gpu/xe/xe_ccs_mode.rst b/Documentation/gpu/xe/xe_ccs_mode.rst
new file mode 100644
index 0000000000000..9ff07706f9739
--- /dev/null
+++ b/Documentation/gpu/xe/xe_ccs_mode.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=========
+CCS mode
+=========
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+   :doc: CCS mode
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 173b119a21c00..d338b0859728a 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -12,6 +12,27 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 
+/**
+ * DOC: CCS mode
+ *
+ * CCS mode setting allows fixed mapping of available compute slices to
+ * compute engines. By default only the first available compute engine is
+ * enabled and all available compute slices are allocated to it.
+ *
+ * Below per-tile sysfs interfaces help user to change the CCS mode setting.
+ *
+ * 'num_cslices' - This read-only interface returns the number of compute
+ * slices available.
+ *
+ * 'ccs_mode' - Allows user to set the number of compute hardware engines
+ * to be enabled and to which allocate the available compute slices. This
+ * user configuration change triggers a gt reset and it is expected that
+ * there are no open drm clients while doing so. The user configuration
+ * must allow equal distribution of available compute slices to enabled
+ * compute hardware engines. Reading it returns the number of compute
+ * hardware engines currently enabled.
+ */
+
 #define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
 #define CCS_MODE_CSLICE(cslice, ccs)	\
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
@@ -174,12 +195,7 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
  * xe_gt_ccs_mode_sysfs_init - Initialize CCS mode sysfs interfaces
  * @gt: GT structure
  *
- * Through a per-gt 'ccs_mode' sysfs interface, the user can enable a fixed
- * number of compute hardware engines to which the available compute slices
- * are to be allocated. This user configuration change triggers a gt reset
- * and it is expected that there are no open drm clients while doing so.
- * The number of available compute slices is exposed to user through a per-gt
- * 'num_cslices' sysfs interface.
+ * Create per-tile CCS mode sysfs interfaces.
  */
 void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f746846604759..9cee17506f8bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,12 +185,7 @@ struct xe_gt {
 		spinlock_t lock;
 	} tlb_invalidation;
 
-	/**
-	 * @ccs_mode: Number of compute engines enabled.
-	 * Allows fixed mapping of available compute slices to compute engines.
-	 * By default only the first available compute engine is enabled and all
-	 * available compute slices are allocated to it.
-	 */
+	/** @ccs_mode: Number of compute engines enabled */
 	u32 ccs_mode;
 
 	/** @usm: unified shared memory state */
-- 
2.43.0

