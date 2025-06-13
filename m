Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822DAC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 00:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7210E35E;
	Fri, 13 Jun 2025 00:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDgW21D9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB50610E1E2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773693; x=1781309693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRbm+9F2jT253ywwXrn3Hu3kIFm/Q/YQkNyW7xoJmKs=;
 b=MDgW21D9y/JsdF6Mm6yDE77+uuQom0CPR47k77LmNxGO8zHfFeyP0Yq/
 6w7qWOVflb2CqVoKek+XLaX7O8c8PjIsTlCc7XXRniNNnvU7d/nBpSEkn
 lhj81XrC8QPGqMUwDSzvUfrUDanh0uxx551lfZP8vnUihB8LaEI9s+pHn
 tE4WXvB1Jmwh6qAT65tGQLzAROYBZMJB0cjJE4VhV4PTOy64Decn9zGfL
 m5e8Du8de+79z47wJTgbHgu5KZ9e5JC7jkKv6+i7ezZieAo9Nwd3cjVGE
 k5+jHXejULqglOn8DLtLmhdYqnynD1mn6a0kZlGTOXhQr10cCQfaMuEW+ Q==;
X-CSE-ConnectionGUID: 0LZj3TmLQHCPPzj9d7kKxQ==
X-CSE-MsgGUID: qy49rIZmT/q+fmLX37x+nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51204674"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51204674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
X-CSE-ConnectionGUID: xDsbaBqXQVu32CwZTrKfcA==
X-CSE-MsgGUID: EGOIXkGDSAO9AqRcpeSnwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="151491071"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 3/5] drm/xe/tests/pci: Ensure all platforms have a valid
 GT/tile count
Date: Thu, 12 Jun 2025 17:14:42 -0700
Message-ID: <20250613001438.678728-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613001438.678728-7-matthew.d.roper@intel.com>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 24 ++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 15 ++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  3 ++
 drivers/gpu/drm/xe/xe_pci.c            | 38 ------------------------
 drivers/gpu/drm/xe/xe_pci_types.h      | 40 ++++++++++++++++++++++++++
 5 files changed, 82 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1d3e2e50c355..f8858e193213 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -56,6 +56,30 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
 
+/**
+ * xe_call_for_each_platform - Iterate over all recognized platforms
+ * @xe_fn: Function to call for each device.
+ *
+ * This function iterates over the descriptors for all platforms recognized
+ * by the driver and calls @xe_fn: for each one of them.
+ */
+void xe_call_for_each_platform(xe_platform_fn xe_fn)
+{
+	const struct xe_device_desc *desc, *last = NULL;
+
+	for (int i = 0; i < ARRAY_SIZE(pciidlist); i++) {
+		desc = (const struct xe_device_desc *)pciidlist[i].driver_data;
+		if (!desc)
+			break;
+		if (desc == last)
+			continue;
+
+		xe_fn(desc);
+		last = desc;
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_platform);
+
 static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			    u32 *ver, u32 *revid)
 {
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 744a37583d2d..a401a91af555 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -42,6 +42,15 @@ static void check_media_ip(const struct xe_media_desc *media)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
+static void check_platform_gt_count(const struct xe_device_desc *platform)
+{
+	struct kunit *test = kunit_get_current_test();
+	int max_gt = platform->max_gt_per_tile;
+
+	KUNIT_ASSERT_GT(test, max_gt, 0);
+	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
+}
+
 static void xe_gmdid_graphics_ip(struct kunit *test)
 {
 	xe_call_for_each_graphics_ip(check_graphics_ip);
@@ -52,9 +61,15 @@ static void xe_gmdid_media_ip(struct kunit *test)
 	xe_call_for_each_media_ip(check_media_ip);
 }
 
+static void xe_platform_gt_count(struct kunit *test)
+{
+	xe_call_for_each_platform(check_platform_gt_count);
+}
+
 static struct kunit_case xe_pci_tests[] = {
 	KUNIT_CASE(xe_gmdid_graphics_ip),
 	KUNIT_CASE(xe_gmdid_media_ip),
+	KUNIT_CASE(xe_platform_gt_count),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index ede46800aff1..5abbf522f7a8 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -14,13 +14,16 @@
 struct xe_device;
 struct xe_graphics_desc;
 struct xe_media_desc;
+struct xe_device_desc;
 
 typedef int (*xe_device_fn)(struct xe_device *);
 typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
 typedef void (*xe_media_fn)(const struct xe_media_desc *);
+typedef void (*xe_platform_fn)(const struct xe_device_desc *);
 
 void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
 void xe_call_for_each_media_ip(xe_media_fn xe_fn);
+void xe_call_for_each_platform(xe_platform_fn xe_fn);
 
 struct xe_pci_fake_data {
 	enum xe_sriov_mode sriov_mode;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3b997c941bbc..a4885f64c2c4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -38,44 +38,6 @@ enum toggle_d3cold {
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
index ca6b10d35573..e4bfbafa6809 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -8,6 +8,46 @@
 
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

