Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D10CC41513
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931610E3DC;
	Wed, 17 Jul 2024 19:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2FnyJCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2F10E3CE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245929; x=1752781929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYSnhtt6IvlxiXhP/S9geDmW8TB4Xu7An50SY078z4Y=;
 b=V2FnyJCHYP4ele9QuxcmZrA0O+N8mdO84Dw+VoXI2BetiQoETMdWic2U
 LnLAMd4eY99qZ00TNVxsT9aBybrQXE1JJTf7m/na4t1OIU/W+GxEWz8Bg
 YAuZPQ2j46GiWlg5MaHJB7oxNg55mlTPntsBhqZoiY/NKB+OnTp08mhWo
 VpCcJ8OyPVKUF865mebFzdkr3noTH/CmWiFDyn9OuxeoLd+78qGAZ6S7M
 s8Af6Rb0LWP1/b1RSPVGF7Lk/aUypmyJDKRs4xK+kleZR9O5AToiTIAUk
 R0ucUwmv6jWxhY2r2WqIMUumh/7e4DEFMBoR56EsZ/y8TbXaMC3uEdSQ1 Q==;
X-CSE-ConnectionGUID: NQsy+GcmTvqOyisSh56RIw==
X-CSE-MsgGUID: 5fH/GhEgQsOGQTqwcBvgfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472933"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472933"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:09 -0700
X-CSE-ConnectionGUID: UUXSWpZTREK9BwK3vAlGNg==
X-CSE-MsgGUID: 4o4wegydRc6mCuMKtWpcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690392"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/7] drm/xe/tests: Convert xe_bo live tests
Date: Wed, 17 Jul 2024 21:51:51 +0200
Message-Id: <20240717195155.442-4-michal.wajdeczko@intel.com>
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

Convert xe_bo live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 692e1b46b9cf..9620408f227f 100644
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
 
@@ -358,5 +363,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_bo_test_suite = {
 	.name = "xe_bo",
 	.test_cases = xe_bo_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
-- 
2.43.0

