Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB37E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 13:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E879010E0E2;
	Wed, 18 Dec 2024 13:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+mqh0tB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79C10E0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734530145; x=1766066145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VAMRqULBsZ49s27HNcG+7rbBoA/XYs41NdBmxkyHMwI=;
 b=m+mqh0tBrJvb5iclZhTy9psdDKoN4FQZaSEG1aZpuo7iGyO0VxJtTDLF
 Y4s9nzBGSaFsVQ/8WGnGdHTfIGe0tmRm0hrxFfvrNcDgID4wLapby5nRL
 MAb8h1usn9Ug1m6QiJg1vD8Qqu7ug4bGeBu4BPQV1uXVgy/XG3nfsPTV3
 XNUzyJDgs0N2Um5poeAe85pt0GzcZ5c1Dp7hCPzwAxYm2Ty6iNI5W+UEA
 LP3uZoO3ArmALMsN1gjMUuH5d4FKgNBQXx01YVc2cTVgiJdA3YLZMXT8Q
 1IxfbZkgs1R3qVJ/B+9XBjcp/mbnWSROgVzy/gaoUkhWkoJAtYLV8GfKa w==;
X-CSE-ConnectionGUID: scpjGfDLQVSTn5O43B24wA==
X-CSE-MsgGUID: M28Hoar6T96XdJNxcYk98g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35037361"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35037361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 05:55:45 -0800
X-CSE-ConnectionGUID: bnId6bPEROqHzFegnvaSRg==
X-CSE-MsgGUID: wAQE1qm0QDqO68tRAGeiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128853088"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 05:55:43 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe/tests: Move shrink test out of xe_bo
Date: Wed, 18 Dec 2024 15:14:47 +0100
Message-ID: <20241218141447.2528530-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

The subtest typically has an execution time long enough to motivate a
separate test so that it can be easily excluded if needed.

v2: reword commit message(Thomas)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c            | 16 ++++++++++++++--
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index c9ec7a313c6b..405ff904153e 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -606,8 +606,6 @@ static void xe_bo_shrink_kunit(struct kunit *test)
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
-	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
-			      {.speed = KUNIT_SPEED_SLOW}),
 	{}
 };
 
@@ -618,3 +616,17 @@ struct kunit_suite xe_bo_test_suite = {
 	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
+
+static struct kunit_case xe_bo_shrink_test[] = {
+	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
+			      {.speed = KUNIT_SPEED_SLOW}),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_bo_shrink_test_suite = {
+	.name = "xe_bo_shrink",
+	.test_cases = xe_bo_shrink_test,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 0d36ab864ec0..81277c77016d 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -6,11 +6,13 @@
 #include <kunit/test.h>
 
 extern struct kunit_suite xe_bo_test_suite;
+extern struct kunit_suite xe_bo_shrink_test_suite;
 extern struct kunit_suite xe_dma_buf_test_suite;
 extern struct kunit_suite xe_migrate_test_suite;
 extern struct kunit_suite xe_mocs_test_suite;
 
 kunit_test_suite(xe_bo_test_suite);
+kunit_test_suite(xe_bo_shrink_test_suite);
 kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
-- 
2.46.0

