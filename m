Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDBBC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808510E166;
	Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UF0BP7uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2910E166
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245930; x=1752781930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4AFKIX6vi2155diHkztUNnhYLwIWoU6MV6AeMfRqy8=;
 b=UF0BP7uywrrHpd4G2u1GJcMvTlzpZ6cUzPaVzKFLCQzdRfRTCpp312a5
 YTXgxw8Xwod+E6m4jTSKO67FXh8zbfWiY071bt8gX0XgoPBsuHbvAqTyZ
 brI/oNenIGoJoz4Q+Y9W9+/wb1zoRjAjTELQCkXlJ3IvDVd2ewpc6pCWL
 JC7KtDYSgd4MjJfDoBnxEdsb29pEyyp/j6CurNuBj/IlvTKryb45ANFFR
 DTkY8DG+pO1KP+xW3qMjCaMsx07TEM+Pzwo3trNy8+34o8s6Wa9ZEKsXP
 F2AwT7JA3ibj3TpX9GJZUXNv9OAn72WFJxNXzQeYmjbJreHeLvt4XNdEA Q==;
X-CSE-ConnectionGUID: YUM7QUc2TW29iD/DSRP45A==
X-CSE-MsgGUID: wJD3x2x8Tcas0m7J77XNlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472940"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:10 -0700
X-CSE-ConnectionGUID: GUXTxLZ5TWSxs6R1iJTAJQ==
X-CSE-MsgGUID: 22rN3xHGQEWnauBahll9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690404"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
Date: Wed, 17 Jul 2024 21:51:52 +0200
Message-Id: <20240717195155.442-5-michal.wajdeczko@intel.com>
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

Convert xe_dma_buf live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 4f9dc41e13de..c24c8509227e 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
@@ -275,11 +276,13 @@ static int dma_buf_run_device(struct xe_device *xe)
 
 static void xe_dma_buf_kunit(struct kunit *test)
 {
-	xe_call_for_each_device(dma_buf_run_device);
+	struct xe_device *xe = test->priv;
+
+	dma_buf_run_device(xe);
 }
 
 static struct kunit_case xe_dma_buf_tests[] = {
-	KUNIT_CASE(xe_dma_buf_kunit),
+	KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
@@ -287,5 +290,6 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_dma_buf_test_suite = {
 	.name = "xe_dma_buf",
 	.test_cases = xe_dma_buf_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_test_suite);
-- 
2.43.0

