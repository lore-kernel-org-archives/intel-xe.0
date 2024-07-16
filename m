Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6FEC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B910E8E7;
	Tue, 16 Jul 2024 21:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTHyfyfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7AD10E8E6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166003; x=1752702003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hWY7j8Sqx0k44Og/gkak2T4aRzCf7vzIleT0K1y+g1I=;
 b=PTHyfyfxWXYom1hoYa3dpKDVUXI8VHdEOonGZrPcwX860CCvRNnavpgC
 zIPUiHje+l4Xkljr6hwIDMsz29T4P02QGfDsrhPKcmaCJvmLswxL44ZKe
 yYNWguCJ43OXRaHZ60TXdwsyB/pAAdEpr/7hVA7peFWp+4Jak3FfMo4tO
 01vIMJWN2ds0/KKKipAK25WkZTk+0fB9ICanNe5nqb52xVEHyLQ6Wu3Ek
 lUmriLWhDsnt7h9lSZieMdrAN82W048yOcqxIFMkMXT6m1NJIdfohgd85
 AEUV4h1Os5yQCje1hrOnRTleitBSsIQn55jWynGe2n65aMEiojNJySGnF w==;
X-CSE-ConnectionGUID: V8hWFjUtR5aLgXGxEDdy9Q==
X-CSE-MsgGUID: hiwVzXVATJ+UuL4qanmvNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063156"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063156"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:03 -0700
X-CSE-ConnectionGUID: zJm2YQFwT5uI5VpRDtfiLw==
X-CSE-MsgGUID: WmZpyeD4TuqnQqCzCInwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364433"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/7] drm/xe/tests: Convert xe_mocs live tests
Date: Tue, 16 Jul 2024 23:39:00 +0200
Message-Id: <20240716213901.398-7-michal.wajdeczko@intel.com>
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

Convert xe_mocs live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index febc1d967850..7842471859dc 100644
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
 
@@ -188,5 +193,7 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_mocs_test_suite = {
 	.name = "xe_mocs",
 	.test_cases = xe_mocs_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+	.exit = xe_kunit_helper_xe_device_live_test_exit,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
-- 
2.43.0

