Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF26CFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 12:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB9510E08C;
	Mon,  7 Oct 2024 12:29:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9310E08C;
 Mon,  7 Oct 2024 12:29:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/tests=3A_Fix_the_s?=
 =?utf-8?q?hrinker_test_compiler_warnings=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 12:29:19 -0000
Message-ID: <172830415992.1198163.6428218373826625315@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004141121.186177-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241004141121.186177-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/tests: Fix the shrinker test compiler warnings. (rev2)
URL   : https://patchwork.freedesktop.org/series/139558/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 341bb856e476bb327d5e2ae8bdfd6ea6454028cd
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Oct 4 16:11:20 2024 +0200

    drm/xe/tests: Fix the shrinker test compiler warnings.
    
    The xe_bo_shrink_kunit test has an uninitialized value and illegal
    integer size conversions on 32-bit. Fix.
    
    v2:
    - Use div64_u64 to ensure the u64 division compiles everywhere. (Matt Auld)
    
    Reported-by: Nathan Chancellor <nathan@kernel.org>
    Closes: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
    Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
    Cc: dri-devel@lists.freedesktop.org
    Cc: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 9d79cb6da4e37d5ed37db2917b0b69c3f58cf845 drm-intel
341bb856e476 drm/xe/tests: Fix the shrinker test compiler warnings.


