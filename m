Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF884C41513
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 15:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4450010E1E9;
	Mon, 10 Jun 2024 15:28:43 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF1610E1E9;
 Mon, 10 Jun 2024 15:28:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/xe=3A_poor_man=27s_exhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 15:28:41 -0000
Message-ID: <171803332150.32193.3630487398887753847@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/3] drm/xe: poor man's exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/134682/
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
commit 1b16672f2be9014953608a0aa57d8e1fedcc413e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jun 10 17:20:17 2024 +0200

    drm/xe/xe-for-ci: Check whether oom was due to ww mutex error injection
    
    When CONFIG_DEBUG_WW_MUTEX_SLOWPATH is enabled, which it is in CI, but
    not in production kernels, an injected -EDEADLK error will, due to
    limitations in TTM, cause false OOM notifications.
    
    Check whether the OOM was likely caused by an -EDEADLK injection and in
    that case, rerun the validation.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 3d66fb77a4da62a4282f60ddaab2bc5fabfe2fec drm-intel
2232a8ec62c2 drm/xe: poor man's exhaustive eviction
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:99: CHECK:SPACING: No space is necessary after a cast
#99: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:157:
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, false);

-:117: CHECK:SPACING: No space is necessary after a cast
#117: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:526:
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, false);

-:131: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#131: 
new file mode 100644

-:136: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#136: FILE: drivers/gpu/drm/xe/xe_val_lock.c:1:
+#include <drm/drm_exec.h>

-:194: ERROR:TRAILING_WHITESPACE: trailing whitespace
#194: FILE: drivers/gpu/drm/xe/xe_val_lock.c:59:
+^I$

-:207: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#207: FILE: drivers/gpu/drm/xe/xe_val_lock.h:1:
+#ifndef _XE_VAL_LOCK_H_

-:223: CHECK:LINE_SPACING: Please don't use multiple blank lines
#223: FILE: drivers/gpu/drm/xe/xe_val_lock.h:17:
+
+

-:293: CHECK:SPACING: No space is necessary after a cast
#293: FILE: drivers/gpu/drm/xe/xe_vm.c:1056:
+	(void) xe_exec_init(&exec, 0, 0, xe, false);

total: 1 errors, 4 warnings, 4 checks, 287 lines checked
fe96e95e92a4 drm/xe: Take the validation rwsem in exclusive mode on OOM
-:70: CHECK:SPACING: No space is necessary after a cast
#70: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:157:
+	(void) xe_exec_init(&exec, 0, 0, vm->xe, exclusive);

total: 0 errors, 0 warnings, 1 checks, 149 lines checked
1b16672f2be9 drm/xe/xe-for-ci: Check whether oom was due to ww mutex error injection
-:36: WARNING:MACRO_ARG_UNUSED: Argument '_a' is not used in function-like macro
#36: FILE: drivers/gpu/drm/xe/xe_vm.c:349:
+#define xe_exec_contention_injected(_a) (false)

-:51: ERROR:TRAILING_WHITESPACE: trailing whitespace
#51: FILE: drivers/gpu/drm/xe/xe_vm.c:375:
+^Iif (err != -ENOMEM || *exclusive)^I  $

total: 1 errors, 1 warnings, 0 checks, 30 lines checked


