Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72741C761A6
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C6710E0A7;
	Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74B10E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436380; x=1710972380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iMKDgZwNTlSvSdPuSsD4Z2epHRnHXJZuOs2X1SwtTJc=;
 b=H1mpyyr+PTlaLloZ5CWplZsCjBt04Vd3Ibopd88aD/8lnl6xvsNVYtzo
 k8fpU0bpZlZ5BAr+U3Oi9DAAWirYltnEBSKRzfzpMZeQ443Y1aR+7A5xQ
 OKsLo6Ql//HIo0ddcqbetVD6TmceCEqgyNciFEQ4XrJOVX+7dsKJWbar/
 t9+/a2McH98G85RdtsMuZxyoiju5IiZszTzh+Qb0IWEhBgV9rigtkXJaU
 YFxB0i3Bv7QKEjS3KstGWQoV6NBYRCxwZELrSWU7EEsKwp7ZsJgQc8pEl
 lTB+N6+pTjuBOiSU/m9YgrG8FOs6a594hDKGz2Hl3/TPmhw/s8XaQ40WP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109501"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109501"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065709"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065709"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:25 -0700
Message-Id: <20230321220527.595462-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/xe: Generalize fake device creation
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of requiring tests to initialize a fake device an keep it in
sync with xe_pci.c when it's platform-dependent, export a function from
xe_pci.c to be used and piggy back on the device info creation. This
migrates the xe_rtp tests to use this new helper.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 46 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 16 +++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 11 +++---
 drivers/gpu/drm/xe/xe_pci.c            |  2 +-
 4 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 643bddb35214..81723b8c3aef 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -60,3 +60,49 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
 
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
+EXPORT_SYMBOL_NS_GPL(xe_pci_fake_device_init, XE_KUNIT);
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
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index bb633dd09a76..37d3cd1a43fc 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -11,16 +11,13 @@
 #include <kunit/test.h>
 
 #include "xe_device_types.h"
-
-static void xe_fake_device_init(struct xe_device *xe)
-{
-	xe->gt[0].xe = xe;
-}
+#include "xe_pci_test.h"
 
 static int xe_rtp_test_init(struct kunit *test)
 {
 	struct xe_device *xe;
 	struct device *dev;
+	int ret;
 
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
@@ -30,7 +27,9 @@ static int xe_rtp_test_init(struct kunit *test)
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 
-	xe_fake_device_init(xe);
+	ret = xe_pci_fake_device_init_any(xe);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	xe->drm.dev = dev;
 	test->priv = xe;
 
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

