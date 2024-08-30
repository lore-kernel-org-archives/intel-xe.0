Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707ACCA1009
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 18:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA8A10EACF;
	Fri, 30 Aug 2024 18:41:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D110EACE;
 Fri, 30 Aug 2024 18:41:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_missing_runtime_reference_to_wedged_upon_gt?=
 =?utf-8?q?=5Freset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 18:41:39 -0000
Message-ID: <172504329974.855577.4504771385983955724@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830183507.298351-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240830183507.298351-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/xe: Add missing runtime reference to wedged upon gt_reset
URL   : https://patchwork.freedesktop.org/series/138032/
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
commit 655133a2d1dfda225d603a2183b34afa5a934268
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Aug 30 14:35:07 2024 -0400

    drm/xe/display: Avoid encoder_suspend at runtime suspend
    
    Fix circular locking dependency on runtime suspend.
    
    <4> [74.952215] ======================================================
    <4> [74.952217] WARNING: possible circular locking dependency detected
    <4> [74.952219] 6.10.0-rc7-xe #1 Not tainted
    <4> [74.952221] ------------------------------------------------------
    <4> [74.952223] kworker/7:1/82 is trying to acquire lock:
    <4> [74.952226] ffff888120548488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_modeset_lock_all+0x40/0x1e0 [drm]
    <4> [74.952260]
    but task is already holding lock:
    <4> [74.952262] ffffffffa0ae59c0 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at: xe_pm_runtime_suspend+0x2f/0x340 [xe]
    <4> [74.952322]
    which lock already depends on the new lock.
    
    The commit b1d90a86 ("drm/xe: Use the encoder suspend helper also used
    by the i915 driver") didn't do anything wrong. It actually fixed a
    critical bug, because the encoder_suspend was never getting actually
    called because it was returning if (has_display(xe)) instead of
    if (!has_display(xe)). However, this ended up introducing the encoder
    suspend calls in the runtime routines as well, causing the circular
    locking dependency.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2304
    Fixes: b1d90a862c89 ("drm/xe: Use the encoder suspend helper also used by the i915 driver")
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e3078a80279e2dc32694f2b6da75742786487339 drm-intel
9c5e54a23e67 drm/xe: Add missing runtime reference to wedged upon gt_reset
655133a2d1df drm/xe/display: Avoid encoder_suspend at runtime suspend
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
<4> [74.952226] ffff888120548488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_modeset_lock_all+0x40/0x1e0 [drm]

-:20: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b1d90a862c89 ("drm/xe: Use the encoder suspend helper also used by the i915 driver")'
#20: 
The commit b1d90a86 ("drm/xe: Use the encoder suspend helper also used
by the i915 driver") didn't do anything wrong. It actually fixed a

total: 1 errors, 1 warnings, 0 checks, 13 lines checked


