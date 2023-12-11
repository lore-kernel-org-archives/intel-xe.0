Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C02C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 20:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6389C10E4EF;
	Mon, 11 Dec 2023 20:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5F10E4F1
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702325090; x=1733861090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNpFnyRaHP9tpEUap6TX3v8BJ/eHzjpkQB45nuvHaUk=;
 b=MMSPOY02xpfaRtels95mvGyS8Gqm/hFccrayewKfgFdS/Q6QsE5LJWI4
 eXGrXjef9XnFUT9EDf+T59Jn36Lr7FPmDuamwv5UWKIgUmvLk9YJt3DTV
 7KGXBmfvpuhkKJlt6SWgP0rxsPA9EJo1Z/xbWyvvybwZOpAuhfms+Ci1H
 2JK7rmzCRtNVAG2IKJ3X0Xz7EGDL7xW9Pm4DXD9K0FQWeg9ahu3KNRH9W
 tGdbi7JrVbtKiFmCK6Ir/pOufHDIrB25C1vG9rs+LOfBsr5SlKhC9YJeL
 3DBLBcMJRP5dyiypwEirxMFKqw4EF+7Hn90Bu+agd2zUZtxVKhlgWohpN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480900353"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="480900353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807440696"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="807440696"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:48 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 7/9] drm/xe/kunit: Use xe kunit helpers in WA test
Date: Mon, 11 Dec 2023 21:04:22 +0100
Message-Id: <20231211200424.1703-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211200424.1703-1-michal.wajdeczko@intel.com>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update local solution to use common helper code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index a53c22a19582..2ffaf9b4f989 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -9,6 +9,7 @@
 #include <kunit/test.h>
 
 #include "xe_device.h"
+#include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_tuning.h"
@@ -102,38 +103,18 @@ static int xe_wa_test_init(struct kunit *test)
 		.media_step = param->step.media,
 	};
 	struct xe_device *xe;
-	struct device *dev;
-	int ret;
 
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-
-	xe = drm_kunit_helper_alloc_drm_device(test, dev,
-					       struct xe_device,
-					       drm, DRIVER_GEM);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
-
-	test->priv = &data;
-	ret = xe_pci_fake_device_init(xe);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	xe = __xe_kunit_helper_alloc_xe_device(test, &data);
 
 	if (!param->graphics_verx100)
 		xe->info.step = param->step;
 
 	/* TODO: init hw engines for engine/LRC WAs */
-	xe->drm.dev = dev;
 	test->priv = xe;
 
 	return 0;
 }
 
-static void xe_wa_test_exit(struct kunit *test)
-{
-	struct xe_device *xe = test->priv;
-
-	drm_kunit_helper_free_device(test, xe->drm.dev);
-}
-
 static void xe_wa_gt(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
@@ -158,7 +139,6 @@ static struct kunit_case xe_wa_tests[] = {
 static struct kunit_suite xe_rtp_test_suite = {
 	.name = "xe_wa",
 	.init = xe_wa_test_init,
-	.exit = xe_wa_test_exit,
 	.test_cases = xe_wa_tests,
 };
 
-- 
2.25.1

