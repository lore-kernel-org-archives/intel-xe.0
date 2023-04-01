Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F8FC77B60
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE9510E0A2;
	Sat,  1 Apr 2023 08:52:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C507710E0DF
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339161; x=1711875161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKuD5wsCNNTVdanSsiS0jHr5GuCq8H9XPQsOMCfXZ9Y=;
 b=lT37GriliNZWxFLJ2YJ1w5ssezlLHY5SDpNXBW85T0vsNtOH36z04BVf
 CIZGIzYoa3weWNWT7+dP4zyUvTQVwomezoO8R8uBgTdnQTqpFRgu1GEKN
 qEWrqPojQTbNsmiTjU396+MLmkzHHNvThsKcJppVB9J+pEwL0ViMpm2tL
 wNWW4CIXEIrAAUxtlhlsvbLKa+lvvWPf7qyQp2o1/ZjgvZu+wZxiTXf6g
 wTrYpMuaQtu23LLGrdzosmiQLxmA+NuhJdeyHOk47/fzrbO3Pk+xEajOy
 +86FeVgdCAnFAfFuWwv47WeuIFwIsv36TZYKV9Rc3RieTkvLDwwFdU+e6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341651174"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="341651174"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685369574"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="685369574"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  1 Apr 2023 01:51:48 -0700
Message-Id: <20230401085151.1786204-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230401085151.1786204-1-lucas.demarchi@intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/7] drm/xe: Generalize fake device creation
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of requiring tests to initialize a fake device an keep it in
sync with xe_pci.c when it's platform-dependent, export a function from
xe_pci.c to be used and piggy back on the device info creation. For
simpler tests that don't need any specific platform and just need a fake
xe device to pass around, xe_pci_fake_device_init_any() can be used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 47 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 16 +++++++++
 drivers/gpu/drm/xe/xe_pci.c            |  2 +-
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 643bddb35214..cc65ac5657b3 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -8,6 +8,7 @@
 #include "tests/xe_test.h"
 
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 struct kunit_test_data {
 	int ndevs;
@@ -60,3 +61,49 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
 
 	return ret;
 }
+
+int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
+			    enum xe_subplatform subplatform)
+{
+	const struct pci_device_id *ent = pciidlist;
+	const struct xe_device_desc *desc;
+	const struct xe_subplatform_desc *subplatform_desc;
+
+	if (platform == XE_TEST_PLATFORM_ANY) {
+		desc = (const void *)ent->driver_data;
+		subplatform_desc = NULL;
+		goto done;
+	}
+
+	for (ent = pciidlist; ent->device; ent++) {
+		desc = (const void *)ent->driver_data;
+		if (desc->platform == platform)
+			break;
+	}
+
+	if (!ent->device)
+		return -ENODEV;
+
+	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
+		subplatform_desc = desc->subplatforms;
+		goto done;
+	}
+
+	for (subplatform_desc = desc->subplatforms;
+	     subplatform_desc && subplatform_desc->subplatform;
+	     subplatform_desc++)
+		if (subplatform_desc->subplatform == subplatform)
+			break;
+
+	if (subplatform == XE_SUBPLATFORM_NONE && subplatform_desc)
+		return -ENODEV;
+
+	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
+		return -ENODEV;
+
+done:
+	xe_info_init(xe, desc, subplatform_desc);
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index de65d8c9ccb5..43294e8c62bb 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -6,10 +6,26 @@
 #ifndef _XE_PCI_TEST_H_
 #define _XE_PCI_TEST_H_
 
+#include "xe_platform_types.h"
+
 struct xe_device;
 
+/*
+ * Some defines just for clarity: these mean the test doesn't care about what
+ * platform it will get since it doesn't depend on any platform-specific bits
+ */
+#define XE_TEST_PLATFORM_ANY	XE_PLATFORM_UNINITIALIZED
+#define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
+
 typedef int (*xe_device_fn)(struct xe_device *);
 
 int xe_call_for_each_device(xe_device_fn xe_fn);
 
+int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
+			    enum xe_subplatform subplatform);
+
+#define xe_pci_fake_device_init_any(xe__)					\
+	xe_pci_fake_device_init(xe__, XE_TEST_PLATFORM_ANY,			\
+				XE_TEST_SUBPLATFORM_ANY)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 302f7f588da1..21ae5e6f8fe5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -429,7 +429,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	const struct xe_device_desc *desc = (void *)ent->driver_data;
+	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
 	struct xe_device *xe;
 	int err;
-- 
2.39.0

