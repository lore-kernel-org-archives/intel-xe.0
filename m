Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CABC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB03C89233;
	Mon,  8 Jul 2024 11:18:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AA89233;
 Mon,  8 Jul 2024 11:18:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/kunit=3A_Simplify_?=
 =?utf-8?q?live_tests_code_layout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 11:18:35 -0000
Message-ID: <172043751545.49182.1205510070316770749@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240708111210.1154-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/kunit: Simplify live tests code layout
URL   : https://patchwork.freedesktop.org/series/135839/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0484df0e00d607dd7529398d21309c69c38adb69
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jul 8 13:12:10 2024 +0200

    drm/xe/kunit: Simplify xe_mocs live tests code layout
    
    The test case logic is implemented by the functions compiled as
    part of the core Xe driver module and then exported to build and
    register the test suite in the live test module.
    
    But we don't need to export individual test case functions, we may
    just export the entire test suite. And we don't need to register
    this test suite in a separate file, it can be done in the main
    file of the live test module.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 414cc5961337b50dd261349b4ed7aa0013044ccf drm-intel
c3ff109865a6 drm/xe/kunit: Simplify xe_bo live tests code layout
-:78: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#78: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
45cab2497780 drm/xe/kunit: Simplify xe_dma_buf live tests code layout
-:64: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#64: 
deleted file mode 100644

-:116: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#116: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:9:
+extern struct kunit_suite xe_dma_buf_test_suite;

total: 0 errors, 2 warnings, 0 checks, 45 lines checked
6ae39c3dc2ee drm/xe/kunit: Simplify xe_migrate live tests code layout
-:37: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#37: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:10:
+extern struct kunit_suite xe_migrate_test_suite;

-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 46 lines checked
0484df0e00d6 drm/xe/kunit: Simplify xe_mocs live tests code layout
-:39: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#39: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:11:
+extern struct kunit_suite xe_mocs_test_suite;

-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 62 lines checked


