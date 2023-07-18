Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E901BEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 10:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A767110E1C3;
	Tue, 18 Jul 2023 10:46:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9D9E10E1C3;
 Tue, 18 Jul 2023 10:46:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C62FBAA01E;
 Tue, 18 Jul 2023 10:46:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 18 Jul 2023 10:46:49 -0000
Message-ID: <168967720980.22205.9769076719285881565@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230717133159.47980-6-matthew.auld@intel.com>
In-Reply-To: <20230717133159.47980-6-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=5Fbo_selftest_fixes_=28rev2=29?=
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

Series: xe_bo selftest fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/120849/
State : warning

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
commit 2ab611547cb164df57e9bf78c092acaf8986b788
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jul 17 14:32:04 2023 +0100

    drm/xe: add missing bulk_move reset
    
    It looks like bulk_move is set during object construction, but is only
    removed on object close, however in various places we might not yet have
    an actual fd to close, like on the error paths for the gem_create ioctl,
    and also one internal user for the evict_test_run_gt() selftest. Try to
    handle those cases by manually resetting the bulk_move. This should
    prevent triggering:
    
    WARNING: CPU: 7 PID: 8252 at drivers/gpu/drm/ttm/ttm_bo.c:327
    ttm_bo_release+0x25e/0x2a0 [ttm]
    
    v2 (Nirmoy):
      - It should be safe to just unconditionally call __xe_bo_unset_bulk_move().
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch a43fd52b7ab2009631518ead5ca0afe9bc44515a drm-intel
49aa1eddc drm/xe/selftests: hold rpm for evict_test_run_device()
8d88d18e7 drm/xe/selftests: hold rpm for ccs_test_migrate()
f90c8166d drm/xe/selftests: restart GT after xe_bo_restore_kernel()
2ab611547 drm/xe: add missing bulk_move reset
-:17: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#17: 
  - It should be safe to just unconditionally call __xe_bo_unset_bulk_move().

total: 0 errors, 1 warnings, 0 checks, 75 lines checked


