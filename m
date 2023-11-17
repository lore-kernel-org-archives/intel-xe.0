Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E078DC072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 23:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA110E781;
	Fri, 17 Nov 2023 23:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37210E7A0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700262866; x=1731798866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k3xMWQAnnYu5CJnqRxviamhGT9emT8iAPAB/iIYh/vo=;
 b=fbaEVlwAu24sUPXqQKi7FxDnbsh0oetjSl0UNABvnSIFT9ekGiOldfoB
 B+FhZ1LkfHX2WQY0UsaJM7YU+sM/nJrFdCT7ZBHzPY3rJqqVMb95z922q
 QmBahAjol0TOb/gUv7vkMNLxgvbRTLDs8motD6loh0U2o2bJYLD6hJzze
 RjBzp5eRQExCmLiLsZOIsBA+eVqFQJ9t/20MFJHB8FIDKITbs5JZQjQgm
 qt5fXchvaDdZ/i6su1eHPk0jo59bfmgaSDxMWFYmiRhv2bSGblWckxWc9
 PvwsuPyJB1tO6VcEUA6qEXVwzBF7TfNPiBvJqh8JW39glAiGHyAa9fo8r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371561521"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371561521"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097236233"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097236233"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 15:14:10 -0800
Message-Id: <20231117231411.631895-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117231411.631895-1-lucas.demarchi@intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/kunit: Add stub to peek_gmdid
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently it's not possible to test the WAs for platforms using gmdid
since they don't have the IP information on the descriptor struct. In
order to allow that, add a stub function for peek_gmdid() that is
activated when the test executes, replacing the iomap and read of the
real register.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 ++++++
 drivers/gpu/drm/xe/xe_pci.c            |  2 ++
 drivers/gpu/drm/xe/xe_step.h           |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index d1bc029f7a13..ef4f2ae140f5 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -9,6 +9,7 @@
 
 #include <kunit/test-bug.h>
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
 struct kunit_test_data {
@@ -107,6 +108,22 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
 
+static void fake_peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver,
+			    u32 *revid)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_pci_fake_data *data = test->priv;
+	const u32 MEDIA_BASE = 0x380000;
+
+	if (gmdid_offset & MEDIA_BASE) {
+		*ver = data->media_verx100;
+		*revid = xe_step_to_gmdid(data->media_step);
+	} else {
+		*ver = data->graphics_verx100;
+		*revid = xe_step_to_gmdid(data->graphics_step);
+	}
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -145,6 +162,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 		return -ENODEV;
 
 done:
+	kunit_activate_static_stub(test, peek_gmdid, fake_peek_gmdid);
+
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index b4b3fb2df09c..811ffe5bd9fd 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -6,6 +6,8 @@
 #ifndef _XE_PCI_TEST_H_
 #define _XE_PCI_TEST_H_
 
+#include <linux/types.h>
+
 #include "xe_platform_types.h"
 
 struct xe_device;
@@ -23,6 +25,10 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 struct xe_pci_fake_data {
 	enum xe_platform platform;
 	enum xe_subplatform subplatform;
+	u32 graphics_verx100;
+	u32 media_verx100;
+	u32 graphics_step;
+	u32 media_step;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..7c85e88f707c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -5,6 +5,7 @@
 
 #include "xe_pci.h"
 
+#include <kunit/static_stub.h>
 #include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -442,6 +443,7 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 
 static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
 {
+	KUNIT_STATIC_STUB_REDIRECT(peek_gmdid, xe, gmdid_offset, ver, revid);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
 	u32 val;
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index a384b640f2af..686cb59200c2 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -16,6 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
 struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
 				      u32 graphics_gmdid_revid,
 				      u32 media_gmdid_revid);
+static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
+
 const char *xe_step_name(enum xe_step step);
 
 #endif
-- 
2.40.1

