Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A79BC3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4BC10E267;
	Sat, 20 Jul 2024 14:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAWDb1zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6E10E263
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485548; x=1753021548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2rYhaUO7qNTEGcFWJDj7nhuTeaYGh76FN7bnI/qYeg=;
 b=PAWDb1zsMLayNBI/Jr5GmJwXnk9LrKfYsL/7fUlSAmiGzXVgJJjxfoIG
 D1MZX50I9KB4iqMSnBFOJopeCBSR82BUgQcDoe9tpn9vI/zSYDSrhNskn
 /5uenkaPE3ynawg+ivfN+sq/aT67LpT7mCvERntxahnWi6rkv8SjowoEO
 6hpqca/Ntz/2mK2ncD7grlyskC2X3Whyciw36vOQAygEPRxbMF4MMlYMj
 M/gqqkBKtRrx/ljgjjtOURDGu6wiVZ6ZojXWoCn/0rmIuLG297nBiyTH8
 iYiG1fZMlRrkgHJ+h6u3j7yfCZexkFJ7/lqfead312tGSZhdKiQnCEDQL Q==;
X-CSE-ConnectionGUID: 3kURwNLySlWHkWb/ckztQA==
X-CSE-MsgGUID: vRwy15ogRxC3/APIL1rgIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624493"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624493"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:48 -0700
X-CSE-ConnectionGUID: Olo+i8zzSwS0cSH5p5ZjiA==
X-CSE-MsgGUID: DSzo8I0iR+CKEZMMEKXziA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948468"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/7] drm/xe/tests: Convert xe_dma_buf live tests
Date: Sat, 20 Jul 2024 16:25:25 +0200
Message-Id: <20240720142528.530-5-michal.wajdeczko@intel.com>
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

Convert xe_dma_buf live tests to parameterized style.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

