Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B7CC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 10:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07D210E678;
	Thu, 13 Jul 2023 10:37:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FE9810E683;
 Thu, 13 Jul 2023 10:37:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7BB93ACC1F;
 Thu, 13 Jul 2023 10:37:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 13 Jul 2023 10:37:56 -0000
Message-ID: <168924467650.14985.10373678215973218730@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713094125.326709-5-matthew.auld@intel.com>
In-Reply-To: <20230713094125.326709-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/4=5D_drm/xe/selftests=3A_hold_rpm_for_e?=
 =?utf-8?q?vict=5Ftest=5Frun=5Fdevice=28=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/4] drm/xe/selftests: hold rpm for evict_test_run_device()
URL   : https://patchwork.freedesktop.org/series/120661/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9ae9e42dcc7b75049bd01a58a4bc065f71c4578f
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jul 13 10:41:29 2023 +0100

    drm/xe: add missing bulk_move reset
    
    It looks like bulk_move is set during object construction, but is only
    removed on object close, however in various places we might not yet have
    an actual fd to close, like on the error paths for the gem_create ioctl,
    and also one internal user for the evict_test_run_gt() selftest. Try to
    handle those cases by manually resetting the bulk_move. This should
    prevent triggering:
    
    WARNING: CPU: 7 PID: 8252 at drivers/gpu/drm/ttm/ttm_bo.c:327
    ttm_bo_release+0x25e/0x2a0 [ttm]
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ccde558371c92a1f8b3707fe7cf274e388c434dd drm-intel
7160a185c drm/xe/selftests: hold rpm for evict_test_run_device()
d2520795b drm/xe/selftests: hold rpm for ccs_test_migrate()
d8dc588b9 drm/xe/selftests: restart GT after xe_bo_restore_kernel()
9ae9e42dc drm/xe: add missing bulk_move reset


