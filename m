Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80988C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 03:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EC210E1E7;
	Tue, 13 Feb 2024 03:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1IrF1e+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637BB10E1E7
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 03:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707795360; x=1739331360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zccdu+rNcPAcmGkJBexwwa89uHB1J3NLULoYwgvtdXw=;
 b=g1IrF1e+RI+G73aB/K6pXXL3wv4aNus25QdAg+zPDanUcoZmBVmdOSyF
 7zebQqU16vf1isBeDPwbMQ+lICCkGge6Tcc1XVlP27qUhCJk5oufHRf3v
 h5SKUBuM2WjLYHpNOL96SUDaggmoUjnwKj2jw7U+jzX1hkwmSfOFvz3mt
 vRzlh0y/1IjfLt1vwbKlgqJzyukjllPR5+ass2O0urd9xjYA+ucYAGTxH
 M9VS2v673vYgyL1GlcewFjc645NHzcZkig6cte9UJ5P7ByRKhLCr3FQLp
 Xq+00i8Bdt9X/wK6q+rvUTTdRP2JLNVRVMZyvZgSh8nbgSVF+GVbQi8w2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24263009"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="24263009"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 19:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7414207"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 19:35:54 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ruthuvikas.ravikumar@intel.com
Subject: [PATCH] drm/xe: Fix modpost warning on xe_mocs kunit module
Date: Mon, 12 Feb 2024 19:35:48 -0800
Message-ID: <20240213033548.76219-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

$ make W=1 -j100 M=drivers/gpu/drm/xe
MODPOST drivers/gpu/drm/xe/Module.symvers
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_mocs_test.o

Fix is identical to '1d425066f15f ("drm/xe: Fix modpost warning on kunit
modules")'.

Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
index 4f62e7a4270bd..ee40f31e1e12c 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -22,4 +22,5 @@ kunit_test_suite(xe_mocs_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_mocs kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.41.0

