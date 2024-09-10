Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EAECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 08:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40A910E6A0;
	Tue, 10 Sep 2024 08:51:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4641E10E6A0;
 Tue, 10 Sep 2024 08:51:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_a_xe=5Fbo_s?=
 =?utf-8?q?ubtest_for_shrinking_/_swapping_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 08:51:03 -0000
Message-ID: <172595826328.979556.2015323443785648382@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909085654.5064-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240909085654.5064-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Add a xe_bo subtest for shrinking / swapping (rev3)
URL   : https://patchwork.freedesktop.org/series/138262/
State : success

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
commit 656476b70d88e63e970ec29d14135faae004d1fc
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 9 10:56:54 2024 +0200

    drm/xe: Add a xe_bo subtest for shrinking / swapping
    
    Add a subtest that tries to allocate twice the amount of
    buffer object memory available, write data to it and then read
    all the data back verifying data integrity.
    In order to be able to do this on systems that
    have no or not enough swap-space available, allocate some memory
    as purgeable, and introduce a function to purge such memory from
    the TTM swap_notify path.
    
    this test is intended to add test coverage to the current
    bo swap path and upcoming shrinking path.
    
    The test has previously been part of the xe bo shrinker series.
    
    v2:
    - Skip test if the execution time is expected to be too long.
    - Minor code cleanups.
    
    v3:
    - Print random seed. (Matthew Auld)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
656476b70d88 drm/xe: Add a xe_bo subtest for shrinking / swapping


