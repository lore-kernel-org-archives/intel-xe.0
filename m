Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B5C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 14:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D6A10E3A9;
	Mon, 16 Sep 2024 14:57:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E61110E3AA;
 Mon, 16 Sep 2024 14:57:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_shrinker_helpers_and_?=
 =?utf-8?q?xe_buffer_object_shrinker_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Sep 2024 14:57:11 -0000
Message-ID: <172649863105.1018818.9613307168733492971@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev9)
URL   : https://patchwork.freedesktop.org/series/131815/
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
commit 8a3085a7b959e7205a933412abfd25f2f3e1d9cf
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 16 16:51:12 2024 +0200

    drm/xe: Increase the XE_PL_TT watermark
    
    The XE_PL_TT watermark was set to 50% of system memory.
    The idea behind that was unclear since the net effect is that
    TT memory will be evicted to TTM_PL_SYSTEM memory if that
    watermark is exceeded, requiring PPGTT rebinds and dma
    remapping. But there is no similar watermark for TTM_PL_1SYSTEM
    memory.
    
    The TTM functionality that tries to swap out system memory to
    shmem objects if a 50% limit of total system memory is reached
    is orthogonal to this, and with the shrinker added, it's no
    longer in effect.
    
    Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
    allowing all graphics memory to be bound to the device unless it
    has been swapped out by the shrinker.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cb4252b3107f36d565422099fdde8d7e34ffbf1d drm-intel
2cc2ddc967e0 drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
-:154: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'cursor' - possible side-effects?
#154: FILE: include/drm/ttm/ttm_resource.h:476:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

-:154: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'res' - possible side-effects?
#154: FILE: include/drm/ttm/ttm_resource.h:476:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

total: 0 errors, 0 warnings, 2 checks, 114 lines checked
d0c6dc9a050e drm/ttm: Add a virtual base class for graphics memory backup
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 284 lines checked
6795df468384 drm/ttm/pool: Provide a helper to shrink pages
9c6a83b480b1 drm/ttm: Use fault-injection to test error paths
29b82d1c4289 drm/ttm: Add a shrinker helper and a macro to perform LRU iteration
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

-:331: WARNING:TABSTOP: Statements should start on a tabstop
#331: FILE: include/drm/ttm/ttm_bo.h:523:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:331: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#331: FILE: include/drm/ttm/ttm_bo.h:523:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:331: WARNING:BRACES: braces {} are not necessary for single statement blocks
#331: FILE: include/drm/ttm/ttm_bo.h:523:
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },

-:357: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#357: FILE: include/drm/ttm/ttm_bo.h:549:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:357: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_cursor' - possible side-effects?
#357: FILE: include/drm/ttm/ttm_bo.h:549:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:357: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_bo' - possible side-effects?
#357: FILE: include/drm/ttm/ttm_bo.h:549:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))

total: 2 errors, 3 warnings, 2 checks, 320 lines checked
ec366ca8adc3 drm/xe: Add a shrinker for xe bos
-:531: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#531: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 695 lines checked
8a3085a7b959 drm/xe: Increase the XE_PL_TT watermark


