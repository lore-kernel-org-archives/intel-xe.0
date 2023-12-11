Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5817EC10F07
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 10:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521110E418;
	Mon, 11 Dec 2023 10:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777A10E431
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702289861; x=1733825861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MlQ6+sv9I8Koe4wGaiUbsIPQy6UV9q924jMQrSWXGao=;
 b=Whcu6zz84CWkY2QGzyNSJhSVfJx7MdNT9D1EGM/0NXeqGEt+oauCjn+7
 7kDRBOwYuVUtWJtHZjyDV0rEjAbUs0xWdNqefDVb2rAZBh4Es7WD0pn7u
 RXlRIjrcF/hHSpZmLBqro/dskeFYi86qJElatlizs8qJOtpJJ4c+Ny4XF
 OE/fISgUYzgH9dlRpdHtFWhGUB1WdHcsWYxE3xmx+KX+Z5UOwhGX4r3M4
 7CIag+WqICRzNNZEfFnqgIpQ17O7J6NSMxGwTz0mztxUl5ANase5eDzoy
 gDSYdz8uFVekplJZbwFjk3HWRJMXF9aXH0PACdTBnGfFsRIDLUhjLLmEy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="480816328"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="480816328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766321908"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766321908"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 02:17:39 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/xe/kunit: Use xe kunit helpers in RTP test
Date: Mon, 11 Dec 2023 11:17:16 +0100
Message-Id: <20231211101719.1659-7-michal.wajdeczko@intel.com>
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

Replace local solution with common helper code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 36 ++------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 4a6972897675..1c4693ec94b8 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -15,6 +15,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -267,38 +268,6 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
 
 KUNIT_ARRAY_PARAM(rtp, cases, rtp_desc);
 
-static int xe_rtp_test_init(struct kunit *test)
-{
-	struct xe_device *xe;
-	struct device *dev;
-	int ret;
-
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-
-	xe = drm_kunit_helper_alloc_drm_device(test, dev,
-					       struct xe_device,
-					       drm, DRIVER_GEM);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
-
-	/* Initialize an empty device */
-	test->priv = NULL;
-	ret = xe_pci_fake_device_init(xe);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	xe->drm.dev = dev;
-	test->priv = xe;
-
-	return 0;
-}
-
-static void xe_rtp_test_exit(struct kunit *test)
-{
-	struct xe_device *xe = test->priv;
-
-	drm_kunit_helper_free_device(test, xe->drm.dev);
-}
-
 static struct kunit_case xe_rtp_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
 	{}
@@ -306,8 +275,7 @@ static struct kunit_case xe_rtp_tests[] = {
 
 static struct kunit_suite xe_rtp_test_suite = {
 	.name = "xe_rtp",
-	.init = xe_rtp_test_init,
-	.exit = xe_rtp_test_exit,
+	.init = xe_kunit_helper_xe_device_test_init,
 	.test_cases = xe_rtp_tests,
 };
 
-- 
2.25.1

