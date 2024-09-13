Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DDBEEEC17
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 17:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7BF10ED5B;
	Fri, 13 Sep 2024 17:35:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A74510ED5B;
 Fri, 13 Sep 2024 17:35:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Shrinker_series?=
 =?utf-8?q?_squashed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 17:35:21 -0000
Message-ID: <172624892149.997658.14435548824638168990@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913141519.3141-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240913141519.3141-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Shrinker series squashed
URL   : https://patchwork.freedesktop.org/series/138653/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7123503d5f8ed8fcbd3cceaf2412eeaa20336753
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Sep 13 16:15:19 2024 +0200

    drm/xe: Shrinker series squashed
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch df3eecb1fa97d6d35569c2fa39f0da78b9f13328 drm-intel
7123503d5f8e drm/xe: Shrinker series squashed
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

-:529: CHECK:LINE_SPACING: Please don't use multiple blank lines
#529: FILE: drivers/gpu/drm/ttm/ttm_bo_util.c:998:
+
+

-:2368: WARNING:TABSTOP: Statements should start on a tabstop
#2368: FILE: include/drm/ttm/ttm_bo.h:239:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2368: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#2368: FILE: include/drm/ttm/ttm_bo.h:239:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2368: WARNING:BRACES: braces {} are not necessary for single statement blocks
#2368: FILE: include/drm/ttm/ttm_bo.h:239:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:2409: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#2409: FILE: include/drm/ttm/ttm_bo.h:510:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:2409: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_cursor' - possible side-effects?
#2409: FILE: include/drm/ttm/ttm_bo.h:510:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:2409: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_bo' - possible side-effects?
#2409: FILE: include/drm/ttm/ttm_bo.h:510:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:2500: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'cursor' - possible side-effects?
#2500: FILE: include/drm/ttm/ttm_resource.h:477:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

-:2500: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'res' - possible side-effects?
#2500: FILE: include/drm/ttm/ttm_resource.h:477:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

total: 2 errors, 4 warnings, 5 checks, 2372 lines checked


