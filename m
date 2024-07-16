Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27EFC41513
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A702110E8E5;
	Tue, 16 Jul 2024 21:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYus+/9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5737C10E8E0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166000; x=1752702000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wk2IfpEdYPKbquAIs63gOqw2FH34tNFNI3FDMOTET8g=;
 b=eYus+/9Ur15J7t0vxiwvhVt0+r0LKbBn1ZcmJpA9Y8jPeYUZde7VrZnp
 TBGbH1dELq5StrOueOO1PpHOojISArlMCvbNVtSxiu07kapmqm//A5kkD
 22D4HbWQ7Br2XaqToKRShiMSnAy0AV0iAMTz7l7oHcuVlpB4kyMeqxkli
 hpgdOM6BHjjXTgYn23Odc1hlP/9n/sFFkRkP4OXQgRgKDJrCqrLTqyR5X
 Vc+h7zfSOHEPCAws7LDyZu+4eoL1AHHT/QmjXlJDmtw8DMZCIxNavK/42
 Qb6XTLtThOMm/YsbMhzRfr/aF2rdzXUujXfkQ1XmIPpz6ku77iCE68Hjd w==;
X-CSE-ConnectionGUID: Yp4z6TXaQi+PtWaPf9VLOw==
X-CSE-MsgGUID: +3royYsfTGaV4U3XFfzSBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063152"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:00 -0700
X-CSE-ConnectionGUID: 90qYPvSkQ8SsUbWtvmqrnA==
X-CSE-MsgGUID: 9sKZ41QPRaiXib+2aC90CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364379"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/7] drm/xe/tests: Convert xe_dma_buf live tests
Date: Tue, 16 Jul 2024 23:38:58 +0200
Message-Id: <20240716213901.398-5-michal.wajdeczko@intel.com>
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

Convert xe_dma_buf live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 4f9dc41e13de..0f8c6b987c91 100644
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
 
@@ -287,5 +290,7 @@ VISIBLE_IF_KUNIT
 struct kunit_suite xe_dma_buf_test_suite = {
 	.name = "xe_dma_buf",
 	.test_cases = xe_dma_buf_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+	.exit = xe_kunit_helper_xe_device_live_test_exit,
 };
 EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_test_suite);
-- 
2.43.0

