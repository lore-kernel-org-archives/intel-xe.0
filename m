Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47F3C54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 12:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A2A10F178;
	Mon, 26 Feb 2024 12:54:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBB810F178;
 Mon, 26 Feb 2024 12:54:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=2Cv2=5D_drm/xe/kunit=3A_fix_link_failure_with_built-in_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 12:54:01 -0000
Message-ID: <170895204112.299440.4079756507616583496@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226124736.1272949-1-arnd@kernel.org>
In-Reply-To: <20240226124736.1272949-1-arnd@kernel.org>
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

Series: series starting with [1/3,v2] drm/xe/kunit: fix link failure with built-in xe
URL   : https://patchwork.freedesktop.org/series/130384/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2dd5e5410a50454ac218b0f2bba00b8fb983ae6a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3459f120897f20d33b4dc98225eb7bd470d673e3
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Feb 26 13:46:38 2024 +0100

    drm/xe/xe2: fix 64-bit division in pte_update_size
    
    This function does not build on 32-bit targets when the compiler
    fails to reduce DIV_ROUND_UP() into a shift:
    
    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by xe_migrate.c
    >>>               drivers/gpu/drm/xe/xe_migrate.o:(pte_update_size) in archive vmlinux.a
    
    There are two instances in this function. Change the first to
    use an open-coded shift with the same behavior, and the second
    one to a 32-bit calculation, which is sufficient here as the size
    is never more than 2^32 pages (16TB).
    
    Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 54533144f8021809789e706762d3550c9f18c2c0 drm-intel
583436740b31 drm/xe/kunit: fix link failure with built-in xe
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
4eabbca56e84 drm/xe/mmio: fix build warning for BAR resize on 32-bit
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
clang complains about a nonsensical test on builds with a 32-bit phys_addr_t,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
3459f120897f drm/xe/xe2: fix 64-bit division in pte_update_size
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
>>>               drivers/gpu/drm/xe/xe_migrate.o:(pte_update_size) in archive vmlinux.a

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


