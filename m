Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15E8C98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD4710E110;
	Fri, 16 Jan 2026 22:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM8qley7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6937110E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601565; x=1800137565;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Zmh7Af1eK7ZMGT8fXqI8as71yiV9yR/PLWhD+Xca93k=;
 b=HM8qley7b1nO3103GVrDyCjxzAzXFdNirHYOSCrVD7EF//6KbN4pbXqp
 YXOoCN/Og6wDo2/BE8XBBC3i5WnhOF1rqDhx4TnaT1W43Tf2iLu3kF7rd
 PfUq3c3V+I1McST8tfSC+pDh3uBuBYAOQkb3gA/sCiRL8TYmp+WS4r86M
 7vEvI1JNK9yoXJzyHN85JmOxQcRjPthOJDysHYGZ6/rP/BBBxsbOb8e73
 xFCqDPY41xxX4tphK/sY4UQa0HPtNzcvNNAfh37fazj0qFt8tJcrcFUhK
 KJ0iaKniXrAF568FJgLB3IK1lOYQpXNwRQtGv8yNXlxDVvzOvG7pt7QhP Q==;
X-CSE-ConnectionGUID: BE26e3ihRqyyUFTiiNyg8g==
X-CSE-MsgGUID: LkPMNsJJQzmKfOLaxtc87A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123023"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:45 -0800
X-CSE-ConnectionGUID: oaj72oRVTii8Of1weXMbHw==
X-CSE-MsgGUID: pk+lRMzRSbyGM9XqjWAegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961785"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:45 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:12 -0300
Subject: [PATCH 04/12] drm/xe/kunit: Add xe_kunit_is_live_test()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-4-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

In upcoming changes we will need to differentiate between regular and
live KUnit tests.  Add the function xe_kunit_is_live_test() for that
purpose.

Note that this is implemented in a rather hackish way, by leveraging
KUnit's static stubbing functionality.  A better approach would be to
store a boolean somewhere in test->priv that would tell if a test is a
live one, however that's not quite feasible today given the inconsistent
usage of test->priv (there is not a single uniform type of data assigned
to it across existing test).

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..369b26b3a32c 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -16,6 +16,18 @@
 #include "xe_device_types.h"
 #include "xe_pm.h"
 
+/**
+ * xe_kunit_is_live_test - Return true if @test is a live test.
+ * @test: the &kunit test
+ *
+ * Return: True for a live test and false otherwise.
+ */
+bool xe_kunit_is_live_test(struct kunit *test)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_is_live_test, test);
+	return false;
+}
+
 /**
  * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
  * @test: the &kunit where this &xe_device will be used
@@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
 
 KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
 
+static bool xe_kunit_is_live_test_indeed(struct kunit *test)
+{
+	return true;
+}
+
 /**
  * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
  *                                            use in a live KUnit test.
@@ -116,6 +133,14 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 {
 	struct xe_device *xe = xe_device_const_cast(test->param_value);
 
+	/*
+	 * FIXME: This is a hack and a better solution is to have the "priv"
+	 * member of tests have a boolean to tell if a test is a live one.
+	 * Unfortunately that can't be done today because "priv" does not point
+	 * to a single unified type across existing tests.
+	 */
+	kunit_activate_static_stub(test, xe_kunit_is_live_test, xe_kunit_is_live_test_indeed);
+
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 	kunit_info(test, "running on %s device\n", xe->info.platform_name);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
index 83665f7b1254..4b846cfb1f40 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -6,10 +6,14 @@
 #ifndef _XE_KUNIT_HELPERS_H_
 #define _XE_KUNIT_HELPERS_H_
 
+#include <linux/types.h>
+
 struct device;
 struct kunit;
 struct xe_device;
 
+bool xe_kunit_is_live_test(struct kunit *test);
+
 struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 						  struct device *dev);
 int xe_kunit_helper_xe_device_test_init(struct kunit *test);

-- 
2.52.0

