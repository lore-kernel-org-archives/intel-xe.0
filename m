Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C279CCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDE110E200;
	Mon,  2 Sep 2024 14:58:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BD110E200;
 Mon,  2 Sep 2024 14:58:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Use_xe=5Fpm=5Fruntime=5Fget_in_xe=5Fbo=5Fmove=28?=
 =?utf-8?q?=29_if_reclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 14:58:43 -0000
Message-ID: <172528912388.907161.7973671548671169632@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138098/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4bccf6aa60de2104b559570e61fed6ff11852af
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 2 16:20:42 2024 +0200

    drm/xe: Add a xe_bo subtest for shrinking / swapping
    
    Add a subtest that tries to allocate twice the amount of
    buffer object memory available, write data to it and then read
    all the data back verifying data integrity.
    In order to be able to do this on systems that
    have no or not enough swap-space available, allocate some memory
    as purgeable, and introduce a function to purge such memory.
    
    this test is intended to add test coverage coverage to the current
    bo swap path and upcoming shrinking path.
    
    The test has previously been part of the xe bo shrinker series.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e drm-intel
2e1649625c16 drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
a4bccf6aa60d drm/xe: Add a xe_bo subtest for shrinking / swapping
-:16: WARNING:REPEATED_WORD: Possible repeated word: 'coverage'
#16: 
this test is intended to add test coverage coverage to the current

-:133: CHECK:SPACING: No space is necessary after a cast
#133: FILE: drivers/gpu/drm/xe/tests/xe_bo.c:453:
+	ram = (size_t) si.freeram * si.mem_unit;

-:313: ERROR:TRAILING_WHITESPACE: trailing whitespace
#313: FILE: drivers/gpu/drm/xe/xe_bo.c:1100:
+{^I$

total: 1 errors, 1 warnings, 1 checks, 298 lines checked


