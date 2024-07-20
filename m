Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F12C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BB010E263;
	Sat, 20 Jul 2024 14:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwwB/Jk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0CF10E263
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485551; x=1753021551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YR00/Oyl4Er30g8HPQcrKEq1OUUw5zCEEphtwmbzJc=;
 b=DwwB/Jk/aHcAa/rrjbxw1Zgd1yjsobOkqdqpGAaR5fwZPCnF30O0JAXR
 9D711cVPvOo0+cvHBfjT5PvwXaopW20JGuumVMN94+dE4gmal0y1C6t21
 Fs1dOK97BofTuOyslJjZdp2kQc0BAn4XvHiCK4wLkB1FYSEoHenL5BLRe
 sNjakqGvchf/aKGBorZlQ4k3uYezrgtd7k1y/PIp06qQh3Mnzbpw/+yKc
 B6UAvqB1/VIbQjcVdJvuZWZitpOOmdFPb10tby25mIYedDuuaLSYbWsFr
 UkLElA1pScvY/p1hzntD2PpQm/9md3Z/EViq6CtVeluiWVS3hX6+5pHWF g==;
X-CSE-ConnectionGUID: WtqljG/1SciuDdFHMNilBA==
X-CSE-MsgGUID: /mMZU6cRR1yasJFwzWzufA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624496"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624496"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:51 -0700
X-CSE-ConnectionGUID: USb0/tWhTq2YCdoQVpZCZw==
X-CSE-MsgGUID: S4QF6RqvQmqd5VdogmZppA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948478"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 6/7] drm/xe/tests: Convert xe_mocs live tests
Date: Sat, 20 Jul 2024 16:25:27 +0200
Message-Id: <20240720142528.530-7-michal.wajdeczko@intel.com>
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

Convert xe_mocs live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

