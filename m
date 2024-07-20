Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1BC3DA7E
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF05910E256;
	Sat, 20 Jul 2024 14:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa6xQAB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CFB10E057
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485546; x=1753021546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E+iucekRTiKVVycB1vCk3QJHyyaDeLyRljWva4vMDfI=;
 b=fa6xQAB7xO+w1UcJXrApyyRz/9rG7jJuc01Nf0LhZTHvL/Sfi1vr2gVF
 GhVNz+yu6mF4uMkt2rsLoG0EaDuTsQtIjNR1F8kOugkVeOsgV9WkDEXRp
 +L0EN8vNdNwHG/PA520ZzZYwLtmCWdpR2YcFTkRKsaX5HlVut9TrANEeo
 x+dTD7a7llS/lxDCPC/ZJQq1/FKniGGijyC1ai+y5Nj+DnftG7aELrXuD
 cmm7s77HFoFWFJTQk7sV+397p3dbSHt+5eQR1iG8YySO0QU0hV5cW1Xyi
 A1sMuHwYHRAj7gPKJ8cKupf119BMU76xB8DtppGk0CKpYFpThJ3s4zBWq A==;
X-CSE-ConnectionGUID: N50hJPtVTwmTmpxd5S1r8g==
X-CSE-MsgGUID: l07JEvLkTmiWM8VZTV5NIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624491"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:46 -0700
X-CSE-ConnectionGUID: wxBhf4F6Re2vUiYW0h25gA==
X-CSE-MsgGUID: 0bgtHirOTnOGcLwUl3q7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948463"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 3/7] drm/xe/tests: Convert xe_bo live tests
Date: Sat, 20 Jul 2024 16:25:24 +0200
Message-Id: <20240720142528.530-4-michal.wajdeczko@intel.com>
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

Convert xe_bo live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: simplify kunit_skip() messages
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index e2e0ea24757a..1768483da1b7 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
@@ -158,13 +159,13 @@ static int ccs_test_run_device(struct xe_device *xe)
 	int id;
 
 	if (!xe_device_has_flat_ccs(xe)) {
-		kunit_info(test, "Skipping non-flat-ccs device.\n");
+		kunit_skip(test, "non-flat-ccs device\n");
 		return 0;
 	}
 
 	/* For xe2+ dgfx, we don't handle ccs metadata */
 	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe)) {
-		kunit_info(test, "Skipping on xe2+ dgfx device.\n");
+		kunit_skip(test, "xe2+ dgfx device\n");
 		return 0;
 	}
 
@@ -184,7 +185,9 @@ static int ccs_test_run_device(struct xe_device *xe)
 
 static void xe_ccs_migrate_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(ccs_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	ccs_test_run_device(xe);
 }
 
 static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
@@ -334,8 +337,7 @@ static int evict_test_run_device(struct xe_device *xe)
 	int id;
 
 	if (!IS_DGFX(xe)) {
-		kunit_info(test, "Skipping non-discrete device %s.\n",
-			   dev_name(xe->drm.dev));
+		kunit_skip(test, "non-discrete device\n");
 		return 0;
 	}
 
@@ -351,12 +353,14 @@ static int evict_test_run_device(struct xe_device *xe)
 
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
 
@@ -364,5 +368,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_bo_test_suite = {
 	.name = "xe_bo",
 	.test_cases = xe_bo_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
-- 
2.43.0

