Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB46C3DA64
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F710E264;
	Sat, 20 Jul 2024 14:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pxl5CM9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD7F10E263
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485549; x=1753021549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wc4636XfgB/k74s8UUoCK6+cHMdh+y0vGHD4JqEhxbs=;
 b=Pxl5CM9Xpm9Gbfee4YctZx0X7hJcv3WK2Q0D3oAL2fCsosCR0YbdFU9F
 901ywhtbX/4W/qbj5BjFfjkvCCXMkMC5bxHytPrmGd71MNmDtJZk9oOJP
 U5NedF4XVIqsTLuoPMYNDxth3oVd+uObTVedXO86KKKB0M/qbiGpumHqt
 oXiA0MB+wW5CWmoxYyGc4XVQOkT41wGRB6J/8SBnOiTihSX7S+8k5SIgO
 hX7tIEEKf/MNLHFNvkiyer6e2oM86OrgA8CCyheey0ncGsMxvIcnCNj7i
 1z58FJ6/zB+htTiH0YEw2DQZWxkd0znVZJtCI+IoAuh/B7XMrUUPRWwQ6 w==;
X-CSE-ConnectionGUID: iwhSMQFTQc2ML04dJl52RA==
X-CSE-MsgGUID: 9mjNy2O7TxGOI0iD5xNmRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624494"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:49 -0700
X-CSE-ConnectionGUID: EVEnYPWDTUexyjWhfD1g3Q==
X-CSE-MsgGUID: pvnutpSJTJyBDBNpd71A1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948474"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/7] drm/xe/tests: Convert xe_migrate live tests
Date: Sat, 20 Jul 2024 16:25:26 +0200
Message-Id: <20240720142528.530-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240720142528.530-1-michal.wajdeczko@intel.com>
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
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

Convert xe_migrate live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: rebase/simplify kunit_skip() messages
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 48bf7e831014..4344a1724029 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
@@ -355,7 +356,9 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 static void xe_migrate_sanity_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(migrate_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	migrate_test_run_device(xe);
 }
 
 static struct dma_fence *blt_copy(struct xe_tile *tile,
@@ -731,13 +734,12 @@ static int validate_ccs_test_run_device(struct xe_device *xe)
 	int id;
 
 	if (!xe_device_has_flat_ccs(xe)) {
-		kunit_info(test, "Skipping non-flat-ccs device.\n");
+		kunit_skip(test, "non-flat-ccs device\n");
 		return 0;
 	}
 
 	if (!(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))) {
-		kunit_info(test, "Skipping non-xe2 discrete device %s.\n",
-			   dev_name(xe->drm.dev));
+		kunit_skip(test, "non-xe2 discrete device\n");
 		return 0;
 	}
 
@@ -753,12 +755,14 @@ static int validate_ccs_test_run_device(struct xe_device *xe)
 
 static void xe_validate_ccs_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(validate_ccs_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	validate_ccs_test_run_device(xe);
 }
 
 static struct kunit_case xe_migrate_tests[] = {
-	KUNIT_CASE(xe_migrate_sanity_kunit),
-	KUNIT_CASE(xe_validate_ccs_kunit),
+	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_validate_ccs_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
@@ -766,5 +770,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_migrate_test_suite = {
 	.name = "xe_migrate",
 	.test_cases = xe_migrate_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_migrate_test_suite);
-- 
2.43.0

