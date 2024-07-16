Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B63C3DA61
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A12810E8E0;
	Tue, 16 Jul 2024 21:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcBiAKvV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F14510E8E0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165999; x=1752701999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J8uQkLn9WWvqPNCGiLL1Tp2c2o7A6W+c/wnBoOoShyA=;
 b=XcBiAKvVQcoyPA4Fd1Vw6ITkL4gKag8CAOM+sMkVoWZw8qxwCIHHtBbQ
 Qwoa3OKIctnYmPgUv175V0UCTfIojl4qS0I39INyw6LSo/MGPfx/RyrcJ
 3wgcsU2Vfvgf3p9QIU7DQfdhLyAf6qw+p48CdXmRCcuAzxUYQEXm0ATLO
 yUVVohDwafzD8hAQPyvQNSM41xEPtDgCf4pyjdJSjjGf0afvzqmM/7dtq
 4h9s6qYbTLQLjVnf+Z+EUsHVJfLu+Tw/CZQ4u/eKnlNFgVXME5QgD56BF
 3zprcYwmaf+y0sUaFykFbDkuk16LH6Ed2NVxlaY+nRb+gaUztcMA3oSdI g==;
X-CSE-ConnectionGUID: 5zPRkPfOT6Wpk5WVwXZ2Bg==
X-CSE-MsgGUID: R321lKxmT42yfSLwG3Izag==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063151"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063151"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:59 -0700
X-CSE-ConnectionGUID: 1COJkq4sTqSUy0Q2BTivNA==
X-CSE-MsgGUID: b4io7KAbQmazrRN/BxkIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364368"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/7] drm/xe/tests: Convert xe_bo live tests
Date: Tue, 16 Jul 2024 23:38:57 +0200
Message-Id: <20240716213901.398-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
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

Convert xe_bo live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 692e1b46b9cf..53bb4686fa73 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
@@ -158,7 +159,7 @@ static int ccs_test_run_device(struct xe_device *xe)
 	int id;
 
 	if (!xe_device_has_flat_ccs(xe)) {
-		kunit_info(test, "Skipping non-flat-ccs device.\n");
+		kunit_skip(test, "Skipping non-flat-ccs device.\n");
 		return 0;
 	}
 
@@ -178,7 +179,9 @@ static int ccs_test_run_device(struct xe_device *xe)
 
 static void xe_ccs_migrate_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(ccs_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	ccs_test_run_device(xe);
 }
 
 static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
@@ -328,7 +331,7 @@ static int evict_test_run_device(struct xe_device *xe)
 	int id;
 
 	if (!IS_DGFX(xe)) {
-		kunit_info(test, "Skipping non-discrete device %s.\n",
+		kunit_skip(test, "Skipping non-discrete device %s.\n",
 			   dev_name(xe->drm.dev));
 		return 0;
 	}
@@ -345,12 +348,14 @@ static int evict_test_run_device(struct xe_device *xe)
 
 static void xe_bo_evict_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(evict_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	evict_test_run_device(xe);
 }
 
 static struct kunit_case xe_bo_tests[] = {
-	KUNIT_CASE(xe_ccs_migrate_kunit),
-	KUNIT_CASE(xe_bo_evict_kunit),
+	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
@@ -358,5 +363,7 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_bo_test_suite = {
 	.name = "xe_bo",
 	.test_cases = xe_bo_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+	.exit = xe_kunit_helper_xe_device_live_test_exit,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
-- 
2.43.0

