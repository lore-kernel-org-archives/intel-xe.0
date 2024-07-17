Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88556C3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3869110E3D0;
	Wed, 17 Jul 2024 19:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akLz9uTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FB210E3CF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245932; x=1752781932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFLeWxTIvyH+/m0GB6f/cr3aNoPEwJ5yV0cd9Xt0RPU=;
 b=akLz9uTlkEIlrvTXMGoiZ6XJDrm+HSeLqt5JtdJdV2zvex462sSSRNlb
 nYsP7b6E7DYK/Frw4FHpCoit0nJ+4AxbiuJo9oTCzDyQRAU1sJhWog9Q1
 Q9EyrkkG4bt1PbYkhiWNjP8O+smdYBSGN3AFzWueENzqlHKobVKx0rMuX
 e+BcNoaV/vQmdfgDwalCvOLlm35aHVKbA0sUa+rr/0b2O1LWSuonZpGDM
 qu9/64uP6zjtdYaSkgLAAs7qGKGBXqH7iKIUZ7nyigRyp2lJiaIrNSAYA
 b1grRJB8/JU+6is78WH8YHqEKqQR0YKSgT+N1gUJ4xtKtCMPuWdnsRORj w==;
X-CSE-ConnectionGUID: +UEEh9yMTQCa9PQhFchByA==
X-CSE-MsgGUID: Uk2AZ57WQaeMzmulWeTtSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472946"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:12 -0700
X-CSE-ConnectionGUID: m7FGPFUrSOmoFv3VzdUy2Q==
X-CSE-MsgGUID: 6MDNNOMcRDGx0T/a3yiqjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690425"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 5/7] drm/xe/tests: Convert xe_migrate live tests
Date: Wed, 17 Jul 2024 21:51:53 +0200
Message-Id: <20240717195155.442-6-michal.wajdeczko@intel.com>
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

Convert xe_migrate live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0de0e0c66623..5b4f7db004f4 100644
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
 
@@ -367,5 +370,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_migrate_test_suite = {
 	.name = "xe_migrate",
 	.test_cases = xe_migrate_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_migrate_test_suite);
-- 
2.43.0

