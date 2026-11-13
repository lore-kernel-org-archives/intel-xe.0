Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006F606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PH6m9/zD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6210E7AC;
	Fri, 13 Nov 2026 11:58:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7FA112415
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571128; x=1826107128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FiOGAXiNi+lGziGu2P8lxcPoaUInxjbEWpXCtT/4gI0=;
 b=PH6m9/zDxIsJUMm9IlnSSghAzKRihftC2scUNX++KqbQrEBlcPZ/SHUk
 nUTxCGv6nCiW5/gWzdIbdg2jwI9pysNSqC9gS8+pL7lBjdkRlCsdm/uZQ
 hGifSLeXzj2Jh/Y/4jxfQdFfJ+e6r3ASvAubcXx6SlS97k3xABWHB2XwJ
 g2EF04Nw8eF415e9C+dOiqzWp25RUN0bZ9bcVye66IgP+GZ5fim0e3Wda
 BetdRJhzegjE/YOXRZ7nPGsPoUTUmcj20f70P+xAzDOpd4FTKQRN78Ljp
 2iyzqe14U+U3QS9TI+ylioMvwyBsC/+PsCYjzCEvGSrdZ0ZJI061ZIiAC w==;
X-CSE-ConnectionGUID: mT6PBBSGSb+yMLA3jUIQcQ==
X-CSE-MsgGUID: QNLCyd75RGCl5kSBoO0MyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3384391"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3384391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:58:48 -0800
X-CSE-ConnectionGUID: LGHUYG1OSou3tYD0KurawQ==
X-CSE-MsgGUID: HL7XjOgXQMSUIyT5Pq/0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8983757"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 03:58:43 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v1 1/4] drm/xe/cper: Add KUnit tests for CPER GUID mappings
Date: Fri, 13 Nov 2026 17:28:29 +0530
Message-ID: <20261113115827.1913629-7-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
References: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Verify that CRI PCI IDs and CPER GUID entries remain
in sync and detect stale mappings.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug         |  1 +
 drivers/gpu/drm/xe/tests/xe_cper_kunit.c | 76 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.c             |  4 ++
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_cper_kunit.c

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 79118d9efd93..d7712460f2d5 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -77,6 +77,7 @@ config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
 	depends on DRM_XE && KUNIT && DEBUG_FS
 	default KUNIT_ALL_TESTS
+	select UEFI_CPER if DRM_XE_KUNIT_TEST != n
 	select DRM_EXPORT_FOR_TESTS if m
 	help
 	  Choose this option to allow the driver to perform selftests under
diff --git a/drivers/gpu/drm/xe/tests/xe_cper_kunit.c b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
new file mode 100644
index 000000000000..6376f9e91d7e
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_cper_kunit.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include <drm/intel/pciids.h>
+
+/*
+ * PCI IDs for platforms that support CPER records.
+ * Must stay in sync with the xe PCI driver table.
+ */
+#define CPER_TEST_PCI_ID(id) (id)
+static const u16 cper_test_pci_ids[] = {
+	INTEL_CRI_IDS(CPER_TEST_PCI_ID),
+};
+
+#undef CPER_TEST_PCI_ID
+
+static bool cper_test_pci_id_known(u16 device_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cper_test_pci_ids); i++)
+		if (cper_test_pci_ids[i] == device_id)
+			return true;
+
+	return false;
+}
+
+static const struct xe_device_guid_entry *cper_test_guid_entry(u16 device_id)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_device_guids); i++)
+		if (xe_device_guids[i].device_id == device_id)
+			return &xe_device_guids[i];
+
+	return NULL;
+}
+
+static void cper_test_pci_ids_have_guid(struct kunit *test)
+{
+	unsigned int i;
+
+	KUNIT_ASSERT_GT(test, ARRAY_SIZE(cper_test_pci_ids), 0);
+
+	for (i = 0; i < ARRAY_SIZE(cper_test_pci_ids); i++)
+		KUNIT_EXPECT_NOT_NULL_MSG(test, cper_test_guid_entry(cper_test_pci_ids[i]),
+					  "PCI ID %#06x has no entry in xe_device_guids[]",
+					  cper_test_pci_ids[i]);
+}
+
+static void cper_test_guids_have_pci_id(struct kunit *test)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_device_guids); i++)
+		KUNIT_EXPECT_TRUE_MSG(test, cper_test_pci_id_known(xe_device_guids[i].device_id),
+				      "xe_device_guids[%u] PCI ID %#06x is not a known platform PCI ID",
+				      i, xe_device_guids[i].device_id);
+}
+
+static struct kunit_case xe_cper_test_cases[] = {
+	KUNIT_CASE(cper_test_pci_ids_have_guid),
+	KUNIT_CASE(cper_test_guids_have_pci_id),
+	{}
+};
+
+static struct kunit_suite xe_cper_suite = {
+	.name = "xe_cper",
+	.test_cases = xe_cper_test_cases,
+};
+
+kunit_test_suites(&xe_cper_suite);
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..f19e64dd5166 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -320,3 +320,7 @@ int xe_cper_sysfs_init(struct xe_device *xe)
 {
 	return devm_device_add_group(xe->drm.dev, &cper_group);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_cper_kunit.c"
+#endif
-- 
2.48.1

