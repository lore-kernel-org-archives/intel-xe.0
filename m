Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA98C4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2D10E33E;
	Sun, 10 Dec 2023 18:07:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FB310E32F
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702231670; x=1733767670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MlQ6+sv9I8Koe4wGaiUbsIPQy6UV9q924jMQrSWXGao=;
 b=T88ONlLd6bFET01DCUa5+UR0YuoBMcc2LOmhoAjcajmdSZJ+oSfdKNup
 blSW7lAnBIISsz+yFk8WnAoeEVv9DLR+Np2XB4gh74GQjnm+ih2Seyl8w
 EWqlMAJQmo++/1CdxjLvyDmbK9PtjFEkJUafrTH8JIeHG5gNNdd343UmF
 u/krFkM8p8On8BZV5CPHo5Pl61MREnphcXuryRvd71JgntxO0aif+PKYl
 hPojDKftXCykrpbX7JnoZX4+TWGFuJfvriaIMKbw2ibQSzCC6s4N4QI1r
 RmKPgPxVAk8U0HRWztBDBBEwORmdq18USxgzimQ9ZTTdEX9wA740mdUyq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1437965"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1437965"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843229551"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; d="scan'208";a="843229551"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:48 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/8] drm/xe/kunit: Use xe kunit helpers in RTP test
Date: Sun, 10 Dec 2023 19:06:57 +0100
Message-Id: <20231210180659.1615-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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

