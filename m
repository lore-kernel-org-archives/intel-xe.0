Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D7DC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB7F10E12D;
	Mon,  8 Jul 2024 11:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLMqxRsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B5110E12D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720437145; x=1751973145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5EipTBtPVc22wtTGzrO7lcKEEiqlNWaHtCOK8B4MxDQ=;
 b=eLMqxRsH8HbyRkxoa3EHYQuhCkTfx/Nn9p880tBGihmQqDWtXVw/awxZ
 2aTDXjiwP3Bd9SNpB7icOUBSkBg/CB/1FE/35ATKrt2Wtch2He3z9iZ1u
 ofsIDevto5uYcore8Yi5VpvPPIcWhnYBpGmt9I43lB5/congGQKuHII38
 hE5eGs8wtz7LuTAWHJ7OFOmBXVGluVyuJr/e8oDxBHU7BFX5WGn53F7ZP
 Wc3qPXCwBCqm+t8idrKnAg1p2DzjvO/VayTPPj7kBIBXsVal1LYHWKtim
 9i4omgVe56RZfhXEVmzDdarMZ71HrNPdOxf9jXX/U5fmUbnjrR6/SZxPR A==;
X-CSE-ConnectionGUID: ihMnfKb3St++Id038IDt3A==
X-CSE-MsgGUID: yB6kvUG8RkahTzDY7Zx26A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17448547"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17448547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:24 -0700
X-CSE-ConnectionGUID: mJv3kmm/SZeloC4QNnqkHA==
X-CSE-MsgGUID: QZPEjzRoSWiV3CFfBtf6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47540090"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:12:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/4] drm/xe/kunit: Simplify live tests code layout
Date: Mon,  8 Jul 2024 13:12:06 +0200
Message-Id: <20240708111210.1154-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The test case logic is implemented by the functions compiled as
part of the core Xe driver module and then exported to build and
register the test suite in the live test module:

    xe.ko                         | xe_live_test.ko
    ------------------------------+-----------------------
    xe_foo.c                      | tests\xe_foo_test.c
      tests\xe_foo_test.h         |   tests\xe_foo_test.h
      tests\xe_foo.c              |   foo_suite
        foo_case_1                |     foo_case_1
        foo_case_2                |     foo_case_2
        EXPORT(foo_case_1)        |   REGISTER(foo_suite)
        EXPORT(foo_case_2)        | tests\xe_live_test.c

But we don't need to export individual test case functions, we may
just export the entire test suite. And we don't need to register
this test suite in a separate file, it can be done in the main
file of the live test module:

    xe.ko                         | xe_live_test.ko
    ------------------------------+-----------------------
    xe_foo.c                      | tests\xe_live_test.c
      tests\xe_foo.c              |   REGISTER(foo_suite)
        foo_suite                 |
	  foo_case_1              |
          foo_case_2              |
        EXPORT(foo_suite)         |  

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (4):
  drm/xe/kunit: Simplify xe_bo live tests code layout
  drm/xe/kunit: Simplify xe_dma_buf live tests code layout
  drm/xe/kunit: Simplify xe_migrate live tests code layout
  drm/xe/kunit: Simplify xe_mocs live tests code layout

 drivers/gpu/drm/xe/tests/Makefile           |  6 +-----
 drivers/gpu/drm/xe/tests/xe_bo.c            | 20 +++++++++++++++-----
 drivers/gpu/drm/xe/tests/xe_bo_test.c       | 21 ---------------------
 drivers/gpu/drm/xe/tests/xe_bo_test.h       | 14 --------------
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       | 16 +++++++++++++---
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  | 20 --------------------
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h  | 13 -------------
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 11 +++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate.c       | 16 +++++++++++++---
 drivers/gpu/drm/xe/tests/xe_migrate_test.c  | 20 --------------------
 drivers/gpu/drm/xe/tests/xe_migrate_test.h  | 13 -------------
 drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 +++++++++++++++-----
 drivers/gpu/drm/xe/tests/xe_mocs_test.c     | 21 ---------------------
 drivers/gpu/drm/xe/tests/xe_mocs_test.h     | 14 --------------
 14 files changed, 68 insertions(+), 157 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
 delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h

-- 
2.43.0

