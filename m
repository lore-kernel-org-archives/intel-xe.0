Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E247C5ACB3
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 23:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D2E10E79F;
	Fri, 17 Nov 2023 23:14:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465A110E79F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700262866; x=1731798866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mRp9C080280FZMCK+f5N2ejZ7sEBvBkUnaQ1t3pBlFA=;
 b=JDTjW9U3sQYDIRVz6xb45tDOdX+ShUfKs0YTp7MblGnRwHP5BUXBZgyB
 bew2T6yEZcDM2oAqO25nZ5bWb44DYbkimInFmivgaq2frJ7uI+VJqOj49
 LPjm5d+kH5aRrHZvuQaA87LTTT/BAD2h8s+AReFCraHiBXWNYPGFwfO+/
 Th3Ysy7MkU+MAYaNb0fQ/Ns+fpzvRaEm8tVB/zhbUZSVfXOpw4EIUcfTD
 M/AmG7aUhEyTpHFl99CTqDSWMUKYFr9Kl6LiMDMNtz6xrDD6TkGqqo8/V
 HnO170sZypgwIarj/vfCSAVzVaXLkKoWKzBLjzIG2bR/b2pHWxZq0w7Tl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371561520"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371561520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097236230"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097236230"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 15:14:09 -0800
Message-Id: <20231117231411.631895-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117231411.631895-1-lucas.demarchi@intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/kunit: Move fake pci data to test-priv
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

Instead of passing as parameter to xe_pci_fake_device_init(), use
test->priv to pass parameters down the call stack. The main advantage is
that then the data is readily available on other functions by using
kunit_get_current_test().

This is a preparation to fix the initialization of fake devices when
they were supposed to be using GMD_ID.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 16 +++++++++-------
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 17 +++++------------
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  4 +++-
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |  7 ++++++-
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a40879da2fbe..d1bc029f7a13 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -7,6 +7,7 @@
 
 #include "tests/xe_test.h"
 
+#include <kunit/test-bug.h>
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
@@ -106,14 +107,15 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
 
-int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
-			    enum xe_subplatform subplatform)
+int xe_pci_fake_device_init(struct xe_device *xe)
 {
+	struct kunit *test = kunit_get_current_test();
+	struct xe_pci_fake_data *data = test->priv;
 	const struct pci_device_id *ent = pciidlist;
 	const struct xe_device_desc *desc;
 	const struct xe_subplatform_desc *subplatform_desc;
 
-	if (platform == XE_TEST_PLATFORM_ANY) {
+	if (!data) {
 		desc = (const void *)ent->driver_data;
 		subplatform_desc = NULL;
 		goto done;
@@ -121,14 +123,14 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 
 	for (ent = pciidlist; ent->device; ent++) {
 		desc = (const void *)ent->driver_data;
-		if (desc->platform == platform)
+		if (desc->platform == data->platform)
 			break;
 	}
 
 	if (!ent->device)
 		return -ENODEV;
 
-	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
+	if (data->subplatform == XE_SUBPLATFORM_UNINITIALIZED) {
 		subplatform_desc = desc->subplatforms;
 		goto done;
 	}
@@ -136,10 +138,10 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 	for (subplatform_desc = desc->subplatforms;
 	     subplatform_desc && subplatform_desc->subplatform;
 	     subplatform_desc++)
-		if (subplatform_desc->subplatform == subplatform)
+		if (subplatform_desc->subplatform == data->subplatform)
 			break;
 
-	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
+	if (data->subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
 		return -ENODEV;
 
 done:
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index cc0f1d141a4d..b4b3fb2df09c 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -12,13 +12,6 @@ struct xe_device;
 struct xe_graphics_desc;
 struct xe_media_desc;
 
-/*
- * Some defines just for clarity: these mean the test doesn't care about what
- * platform it will get since it doesn't depend on any platform-specific bits
- */
-#define XE_TEST_PLATFORM_ANY	XE_PLATFORM_UNINITIALIZED
-#define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
-
 typedef int (*xe_device_fn)(struct xe_device *);
 typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
 typedef void (*xe_media_fn)(const struct xe_media_desc *);
@@ -27,11 +20,11 @@ int xe_call_for_each_device(xe_device_fn xe_fn);
 void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
 void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 
-int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
-			    enum xe_subplatform subplatform);
+struct xe_pci_fake_data {
+	enum xe_platform platform;
+	enum xe_subplatform subplatform;
+};
 
-#define xe_pci_fake_device_init_any(xe__)					\
-	xe_pci_fake_device_init(xe__, XE_TEST_PLATFORM_ANY,			\
-				XE_TEST_SUBPLATFORM_ANY)
+int xe_pci_fake_device_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index b2beba0019cd..5610051591e7 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -281,7 +281,9 @@ static int xe_rtp_test_init(struct kunit *test)
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 
-	ret = xe_pci_fake_device_init_any(xe);
+	/* Initialize an empty device */
+	test->priv = NULL;
+	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	xe->drm.dev = dev;
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 6e1127b276ea..9185e520af58 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -75,6 +75,10 @@ KUNIT_ARRAY_PARAM(platform, cases, platform_desc);
 static int xe_wa_test_init(struct kunit *test)
 {
 	const struct platform_test_case *param = test->param_value;
+	struct xe_pci_fake_data data = {
+		.platform = param->platform,
+		.subplatform = param->subplatform,
+	};
 	struct xe_device *xe;
 	struct device *dev;
 	int ret;
@@ -87,7 +91,8 @@ static int xe_wa_test_init(struct kunit *test)
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 
-	ret = xe_pci_fake_device_init(xe, param->platform, param->subplatform);
+	test->priv = &data;
+	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	xe->info.step = param->step;
-- 
2.40.1

