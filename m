Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F0C3271E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 15:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE710EC17;
	Fri,  5 Jul 2024 15:43:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88310EC14;
 Fri,  5 Jul 2024 15:43:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_TTM_LRU-walk_cherry-picks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 15:43:38 -0000
Message-ID: <172019421862.31461.10214143639405273219@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM LRU-walk cherry-picks
URL   : https://patchwork.freedesktop.org/series/135801/
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
commit d357200824ab4047e19cbf37038298822a9f5eb9
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jul 5 17:32:06 2024 +0200

    drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
    
    Make the interface more symmetric by providing and using a
    ttm_resource_cursor_init().
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch cdd1a80a2d16d5213af20a29eb7570a7651db7dc drm-intel
089afb4f8e1d drm/ttm: Allow TTM LRU list nodes of different types
0f055d806500 drm/ttm: Slightly clean up LRU list iteration
74f759dc4e7f drm/ttm: Use LRU hitches
be6ddb6f31a2 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
09a0acb0944e drm/ttm: Provide a generic LRU walker helper
eb4ac3426020 drm/ttm: Use the LRU walker helper for swapping
1075fe9d6706 drm/ttm: Use the LRU walker for eviction
d357200824ab drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
-:157: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'cursor' - possible side-effects?
#157: FILE: include/drm/ttm/ttm_resource.h:477:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

-:157: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'res' - possible side-effects?
#157: FILE: include/drm/ttm/ttm_resource.h:477:
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))

total: 0 errors, 0 warnings, 2 checks, 121 lines checked


