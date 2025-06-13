Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA56C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 17:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3608E10E183;
	Fri, 13 Jun 2025 17:15:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA5210E183;
 Fri, 13 Jun 2025 17:15:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=2C_drm/xe=3A_Cons?=
 =?utf-8?q?olidate_the_Buffer_Object_LRU_walks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 17:15:00 -0000
Message-ID: <174983490004.78228.13651268318377469236@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm, drm/xe: Consolidate the Buffer Object LRU walks
URL   : https://patchwork.freedesktop.org/series/150242/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ca1f80a2063b9ff68502846af167af83e39e516
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 13 17:18:24 2025 +0200

    drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
    
    To avoid duplicating the tricky bo locking implementation,
    Implement ttm_lru_walk_for_evict() using the guarded bo LRU iteration.
    
    To facilitate this, support ticketlocking from the guarded bo LRU
    iteration.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 4d016d6e602638e0ebc3895331224e057508c07a drm-intel
62fb3ea5091c drm/ttm: Use a struct for the common part of struct ttm_lru_walk and struct ttm_bo_lru_cursor.
-:205: ERROR:TRAILING_WHITESPACE: trailing whitespace
#205: FILE: include/drm/ttm/ttm_bo.h:220:
+^I$

total: 1 errors, 0 warnings, 0 checks, 194 lines checked
3426ec02d6f5 drm/ttm, drm/xe: Modify the struct ttm_bo_lru_walk_cursor initialization
-:126: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#126: FILE: include/drm/ttm/ttm_bo.h:533:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
 		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
 		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_cursor' - possible side-effects?
#126: FILE: include/drm/ttm/ttm_bo.h:533:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
 		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
 		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_bo' - possible side-effects?
#126: FILE: include/drm/ttm/ttm_bo.h:533:
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
 		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
 		     (_bo) = ttm_bo_lru_cursor_next(_cursor))

total: 1 errors, 0 warnings, 2 checks, 94 lines checked
7ca1f80a2063 drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration


