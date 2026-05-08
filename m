Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC828CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8255210F60A;
	Fri,  8 May 2026 21:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bomyWbUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CC210F608
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276576; x=1809812576;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bmbB6RlJ8XPHq1LhJeLqU7G8QaiYGgYfLtWbk5rGKco=;
 b=bomyWbUvJeIrnJHp2ETCrloN5IwUM/yfiu+SSlSpdWjE5ogCrruNklHt
 QHSBjDqJcghJlzix8P3a1Ni0+Wur+6HmjIekFVnv7KHNQi2/Co0m9HDg+
 +yncqgkVm6PevxKDV4NKy7TV+s3oxxdtYF4ExWDld8mQaf/4xVlHvTB7i
 CaXXBYgt7EguJAYI5GPL1FDfGkYwIWGc09U+fIW+LdOavoZ9KRwjkEapB
 TUt3vDCyCbjmQefW+IIxhn6W40UidyguW8YpO4zW4DUVhrCkjGuqLszJy
 g+ApjJaBiy0s3qbCKCsb8AGwZWmGZGOd+9dxCDuupX3FM+2aRkvw83/pH w==;
X-CSE-ConnectionGUID: MdVq1H0lS1ujSMwwjHemDw==
X-CSE-MsgGUID: X2znUeq/Qj2PF6j3wjAKHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635992"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:55 -0700
X-CSE-ConnectionGUID: 52F4cVkaSrS4OIb49vQn+g==
X-CSE-MsgGUID: fiG2a+vTQy24EBM0drW8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244244"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:54 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 08 May 2026 18:42:34 -0300
Subject: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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
live KUnit tests.  Add the function xe_kunit_helper_is_live_test() for
that purpose.

Note that this is implemented in a rather hackish way, by leveraging
KUnit's static stubbing functionality.  A better approach would be to
store a boolean somewhere in test->priv that would tell if a test is a
live one, however that's not quite feasible today given the inconsistent
usage of test->priv (there is not a single uniform type of data assigned
to it across existing test).

v2:
  - s/xe_kunit_helper_is_live_test/xe_kunit_helper_is_live_test/
    (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..d2f654f53cc7 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -16,6 +16,18 @@
 #include "xe_device_types.h"
 #include "xe_pm.h"
 
+/**
+ * xe_kunit_helper_is_live_test - Return true if @test is a live test.
+ * @test: the &kunit test
+ *
+ * Return: True for a live test and false otherwise.
+ */
+bool xe_kunit_helper_is_live_test(struct kunit *test)
+{
+	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
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
@@ -116,6 +133,15 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 {
 	struct xe_device *xe = xe_device_const_cast(test->param_value);
 
+	/*
+	 * FIXME: This is a hack and a better solution is to have the "priv"
+	 * member of tests have a boolean to tell if a test is a live one.
+	 * Unfortunately that can't be done today because "priv" does not point
+	 * to a single unified type across existing tests.
+	 */
+	kunit_activate_static_stub(test, xe_kunit_helper_is_live_test,
+				   xe_kunit_is_live_test_indeed);
+
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 	kunit_info(test, "running on %s device\n", xe->info.platform_name);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
index 83665f7b1254..71cfeb2d4efb 100644
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
 
+bool xe_kunit_helper_is_live_test(struct kunit *test);
+
 struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 						  struct device *dev);
 int xe_kunit_helper_xe_device_test_init(struct kunit *test);

-- 
2.53.0

