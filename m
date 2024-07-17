Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED0FC3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E1310E3D6;
	Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9xTePXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F010E166
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245933; x=1752781933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9Fkw1uh2NzlSByy9TqgihojidE+pwy0M+HfBR3+Ids=;
 b=e9xTePXgGdpX95946x0qU0KOw7fsPr9HGh4ZNPnr9VvFNnTqbhpRJ+rb
 Jvc+a9EuV8JUxmZcix2IqEdLH7lupAMoGMUIDQhp6yQiKWVYrLoONzLFs
 ISXUBxyu1OFLEixfEM+qTZGTCCr3lokjetfUyAX3I8CvwDfEgbzKRDkOE
 aFk95sCuaz/Ie6k7dVHoG1Lx9nGZ92EW9cH4WxdEROhNYn0c3P/g0Pf9f
 9M4EsH9NtCDSFhezneOZWMAnz6G1eUltEtpXLn2L71nkF5h7WwHR+sRB+
 iDFxbUMIV1nVBMXvQFpebw03ph7gXJehCLqGXHSTzFn/v61BbCzhySBvR w==;
X-CSE-ConnectionGUID: RGktQuATRTmu/iPsnRb5UA==
X-CSE-MsgGUID: AP1o4OOxTkqQNyL7XwB/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472949"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:13 -0700
X-CSE-ConnectionGUID: r/GJw/TZSzSR/fRY58b3nA==
X-CSE-MsgGUID: O9JLD1blRjS0IXKT/4NILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690448"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 6/7] drm/xe/tests: Convert xe_mocs live tests
Date: Wed, 17 Jul 2024 21:51:54 +0200
Message-Id: <20240717195155.442-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Convert xe_mocs live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index febc1d967850..19554019b255 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
@@ -135,7 +136,9 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 
 static void xe_live_mocs_kernel_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(mocs_kernel_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	mocs_kernel_test_run_device(xe);
 }
 
 static int mocs_reset_test_run_device(struct xe_device *xe)
@@ -175,12 +178,14 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 
 static void xe_live_mocs_reset_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(mocs_reset_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	mocs_reset_test_run_device(xe);
 }
 
 static struct kunit_case xe_mocs_tests[] = {
-	KUNIT_CASE(xe_live_mocs_kernel_kunit),
-	KUNIT_CASE(xe_live_mocs_reset_kunit),
+	KUNIT_CASE_PARAM(xe_live_mocs_kernel_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_live_mocs_reset_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
@@ -188,5 +193,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_mocs_test_suite = {
 	.name = "xe_mocs",
 	.test_cases = xe_mocs_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
-- 
2.43.0

