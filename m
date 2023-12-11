Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF1C10DC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C22E10E3F8;
	Mon, 11 Dec 2023 10:17:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925FD10E431
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289863; x=1733825863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNpFnyRaHP9tpEUap6TX3v8BJ/eHzjpkQB45nuvHaUk=;
 b=lwk3Bj7TnaZ79MNaRah5HYQuhAoes+snFOjxMNzYqZgOLH4vC17WP/fV
 GliFSzCergCGzDvzldqZb3l2LfXhfW2Hosz5eOBPnYRfkK63oggrNtihp
 7o2XjuR6NF37Ks0IOcELauonZoHFTc3I2wPIDtyK0TYMQOu311yCt8uVg
 sNOjWyik7r+hmCwUvWNv8/wWkDi2pIC+0o5bZ/YUNZsKFeAPjlEm4GlWg
 Kp3ltAXt8RZOvgOD5cBAKqDZ25Ruhd68GiGI6Xihn5Ahw7sGrOOZTMf/i
 HM/98aPV5yf4u8XPTbduxh7mA48EkGmERlj9ZVnGMcNP319NoCJ2MFjc9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480816331"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="480816331"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766321914"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766321914"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/xe/kunit: Use xe kunit helpers in WA test
Date: Mon, 11 Dec 2023 11:17:17 +0100
Message-Id: <20231211101719.1659-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231211101719.1659-1-michal.wajdeczko@intel.com>
References: <20231211101719.1659-1-michal.wajdeczko@intel.com>
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

