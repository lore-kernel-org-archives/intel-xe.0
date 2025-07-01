Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C01C8303F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11F910E2E7;
	Tue,  1 Jul 2025 20:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3oC1Gem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11C310E63C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoXlRtQkf6AOs5J9y5hOJQ2B5a9oTo9WWL66J1suhzY=;
 b=F3oC1GemP1VnbA+9GiWKm3gFAbTjnBb/tpP4DKlqIoUye375RZ1lUibc
 GplzfMNOOr4NxLYBlt6PQpkw4izu+eK1cgIK1FZdy8xbm7enLgDH49A50
 1sbgnMwpaqF8Yh2jJFd44pLHxB/N4ZFCDla11mFB6BTbDWArrs7svQXTG
 W2wReDa9K0VdHyuEKUlmqWMb9tZGbPddlrURfJaV0+oXI4yfGqmg8yV73
 MMoS1DeXPCFlOrRkal67+PDBegYz0uEiKzkJi74Hi9Gk5weaAfZf1jYCq
 kgKparGlX1MnynEdk4l5VXDDktEeQn9nL+CLV8OEfzFjQNlSvcZYoDcDZ A==;
X-CSE-ConnectionGUID: eveyv+aWRtK6HLaN81Tgmg==
X-CSE-MsgGUID: AhwFho0WSXWT3tTa7zWGLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545995"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:32 -0700
X-CSE-ConnectionGUID: WVcM3ynCQUmPtvB6sYX5fA==
X-CSE-MsgGUID: xJEgWJCtQWCk9rF9UY6XxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539677"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH v4 4/7] drm/xe/tests/pci: Ensure all platforms have a valid
 GT/tile count
Date: Tue,  1 Jul 2025 13:13:25 -0700
Message-ID: <20250701201320.2514369-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a simple kunit test to ensure each platform's GT per tile count is
non-zero and does not exceed the global XE_MAX_GT_PER_TILE definition.

We need to move 'struct xe_subplatform_desc' from the .c file to the
types header to ensure it is accessible from the kunit test.

v2:
 - Rebase on latest xe_pci test rework from Michal and convert to
   a parameterized test that runs on each PCI ID supported by the
   driver.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 31 +++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 12 ++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c            | 39 ------------------------
 drivers/gpu/drm/xe/xe_pci_types.h      | 41 ++++++++++++++++++++++++++
 5 files changed, 85 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index baccb657bd05..9c715e59f030 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -21,6 +21,18 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
 KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
 KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
 
+static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
+{
+	const struct xe_device_desc *dev_desc =
+		(const struct xe_device_desc *)param->driver_data;
+
+	if (dev_desc)
+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "0x%X (%s)",
+			 param->device, dev_desc->platform_name);
+}
+
+KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
+
 /**
  * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip parameters
  * @prev: the pointer to the previous parameter to iterate from or NULL
@@ -55,6 +67,25 @@ const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 
+/**
+ * xe_pci_id_gen_param - Generate struct pci_device_id parameters
+ * @prev: the pointer to the previous parameter to iterate from or NULL
+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
+ *
+ * This function prepares struct pci_device_id parameter.
+ *
+ * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
+ *
+ * Return: pointer to the next parameter or NULL if no more parameters
+ */
+const void *xe_pci_id_gen_param(const void *prev, char *desc)
+{
+	const struct pci_device_id *pci = pci_id_gen_params(prev, desc);
+
+	return pci->driver_data ? pci : NULL;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
+
 static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			    u32 *ver, u32 *revid)
 {
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 95fed41f7ff2..37b344df2dc3 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -44,9 +44,21 @@ static void check_media_ip(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
+static void check_platform_gt_count(struct kunit *test)
+{
+	const struct pci_device_id *pci = test->param_value;
+	const struct xe_device_desc *desc =
+		(const struct xe_device_desc *)pci->driver_data;
+	int max_gt = desc->max_gt_per_tile;
+
+	KUNIT_ASSERT_GT(test, max_gt, 0);
+	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
+}
+
 static struct kunit_case xe_pci_tests[] = {
 	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
 	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
+	KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 3a1df7a5e291..ce4d2b86b778 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -27,6 +27,7 @@ int xe_pci_fake_device_init(struct xe_device *xe);
 
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
 const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
+const void *xe_pci_id_gen_param(const void *prev, char *desc);
 const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 316031854c26..658bfbddf9a8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -38,45 +38,6 @@ enum toggle_d3cold {
 	D3COLD_ENABLE,
 };
 
-struct xe_subplatform_desc {
-	enum xe_subplatform subplatform;
-	const char *name;
-	const u16 *pciidlist;
-};
-
-struct xe_device_desc {
-	/* Should only ever be set for platforms without GMD_ID */
-	const struct xe_ip *pre_gmdid_graphics_ip;
-	/* Should only ever be set for platforms without GMD_ID */
-	const struct xe_ip *pre_gmdid_media_ip;
-
-	const char *platform_name;
-	const struct xe_subplatform_desc *subplatforms;
-
-	enum xe_platform platform;
-
-	u8 dma_mask_size;
-	u8 max_remote_tiles:2;
-	u8 max_gt_per_tile:2;
-
-	u8 require_force_probe:1;
-	u8 is_dgfx:1;
-
-	u8 has_display:1;
-	u8 has_fan_control:1;
-	u8 has_gsc_nvm:1;
-	u8 has_heci_gscfi:1;
-	u8 has_heci_cscfi:1;
-	u8 has_llc:1;
-	u8 has_mbx_power_limits:1;
-	u8 has_pxp:1;
-	u8 has_sriov:1;
-	u8 needs_scratch:1;
-	u8 skip_guc_pc:1;
-	u8 skip_mtcfg:1;
-	u8 skip_pcode:1;
-};
-
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ca6b10d35573..4de6f69ed975 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -8,6 +8,47 @@
 
 #include <linux/types.h>
 
+#include "xe_platform_types.h"
+
+struct xe_subplatform_desc {
+	enum xe_subplatform subplatform;
+	const char *name;
+	const u16 *pciidlist;
+};
+
+struct xe_device_desc {
+	/* Should only ever be set for platforms without GMD_ID */
+	const struct xe_ip *pre_gmdid_graphics_ip;
+	/* Should only ever be set for platforms without GMD_ID */
+	const struct xe_ip *pre_gmdid_media_ip;
+
+	const char *platform_name;
+	const struct xe_subplatform_desc *subplatforms;
+
+	enum xe_platform platform;
+
+	u8 dma_mask_size;
+	u8 max_remote_tiles:2;
+	u8 max_gt_per_tile:2;
+
+	u8 require_force_probe:1;
+	u8 is_dgfx:1;
+
+	u8 has_display:1;
+	u8 has_fan_control:1;
+	u8 has_gsc_nvm:1;
+	u8 has_heci_gscfi:1;
+	u8 has_heci_cscfi:1;
+	u8 has_llc:1;
+	u8 has_mbx_power_limits:1;
+	u8 has_pxp:1;
+	u8 has_sriov:1;
+	u8 needs_scratch:1;
+	u8 skip_guc_pc:1;
+	u8 skip_mtcfg:1;
+	u8 skip_pcode:1;
+};
+
 struct xe_graphics_desc {
 	u8 va_bits;
 	u8 vm_max_level;
-- 
2.49.0

