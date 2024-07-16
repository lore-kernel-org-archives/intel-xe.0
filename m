Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03D9C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3491810E8E6;
	Tue, 16 Jul 2024 21:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ2eHiRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665A10E8E5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166002; x=1752702002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1fH3rO1AD5Xp5OOKi2kWECkLRSesGeXUrdSiNJ+DWg=;
 b=MQ2eHiRjomCP36zBXSuNrFLNCUff0hcFsNzkkzxFN2c200Okw6641DJ4
 hftF258OPVJ1zPghFhJWi8bGk5lvC2A+ybTxsmQra5wMYaveWQ9Up27IF
 G7cGxqCsJRrY+5f7hILolYrC2B9/5pAgNGSLngGQD4A7fGdMOuwXvwOyu
 4oiezGtvQtsNUKa3BtYsdbXz5dIrzvqPyYKZBS8DNkDStbuvW14DZv0Z1
 sKgpi09k3bQGg3u0O594tjzHCBMt5xmtCB2WmkbZh5gfn+a/8jZiP97cK
 i2xqZYNNgBY33wEJLEWiQjrDAbAWqfTVY2N+DF0YXT0jxy4lDtPNpGeEf g==;
X-CSE-ConnectionGUID: 8aw3kyP8QVSV1/oTOCdKMw==
X-CSE-MsgGUID: uVqOhl4CTQ6b3e0/Qf+Kag==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063153"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:01 -0700
X-CSE-ConnectionGUID: 5M1m/sAeROmCAeX3HX3vgw==
X-CSE-MsgGUID: DfO1HeegRbGFNR+X29o9qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364386"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/7] drm/xe/tests: Convert xe_migrate live tests
Date: Tue, 16 Jul 2024 23:38:59 +0200
Message-Id: <20240716213901.398-6-michal.wajdeczko@intel.com>
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

Convert xe_migrate live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0de0e0c66623..53130630a83c 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
@@ -355,11 +356,13 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 static void xe_migrate_sanity_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(migrate_test_run_device);
+	struct xe_device *xe = test->priv;
+
+	migrate_test_run_device(xe);
 }
 
 static struct kunit_case xe_migrate_tests[] = {
-	KUNIT_CASE(xe_migrate_sanity_kunit),
+	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
@@ -367,5 +370,7 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_migrate_test_suite = {
 	.name = "xe_migrate",
 	.test_cases = xe_migrate_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+	.exit = xe_kunit_helper_xe_device_live_test_exit,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_migrate_test_suite);
-- 
2.43.0

