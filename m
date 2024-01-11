Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C24C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 03:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B09110E070;
	Thu, 11 Jan 2024 03:16:20 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FF310E070;
 Thu, 11 Jan 2024 03:16:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_bounds_chec?=
 =?utf-8?q?king_in_=5F=5Fxe=5Fbo=5Fplacement=5Ffor=5Fflags=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Thu, 11 Jan 2024 03:16:19 -0000
Message-ID: <170494297981.270358.7721179829294678665@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111002111.10190-1-brian.welty@intel.com>
In-Reply-To: <20240111002111.10190-1-brian.welty@intel.com>
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

Series: drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
URL   : https://patchwork.freedesktop.org/series/128463/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit becc4a0f33d43a5a3020b83aced68ad91a4c2b67
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Jan 10 16:21:11 2024 -0800

    drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
    
    Requesting all memory regions on PVC will fill bo->placements up to
    XE_BO_MAX_PLACEMENTS. The subsequent call to try_add_stolen() will trip
    over the bounds checking even though XE_PL_STOLEN is not expected to
    be used in this case.
    
    This is hit with igt@xe_exec_fault_mode@once-basic-prefetch:
        xe 0000:8c:00.0: [drm] Assertion `*c < (sizeof(bo->placements) / sizeof((bo->placements)[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((bo->placements)), typeof(&(bo->placements)[0])))); }))))` failed!
        WARNING: CPU: 30 PID: 6161 at drivers/gpu/drm/xe/xe_bo.c:203 __xe_bo_placement_for_flags+0x218/0x240 [xe]
    
    Is fixed here by moving the bounds checks closer to where we actually
    write into the bo->placement array.
    
    Fixes: 8c54ee8a8606 ("drm/xe: Ensure that we don't access the placements array out-of-bounds")
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch bda9437030d914aefcbc145d3be1a9f5f05ea693 drm-intel
becc4a0f3 drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
    xe 0000:8c:00.0: [drm] Assertion `*c < (sizeof(bo->placements) / sizeof((bo->placements)[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((bo->placements)), typeof(&(bo->placements)[0])))); }))))` failed!

-:18: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8c54ee8a8606', maybe rebased or not pulled?
#18: 
Fixes: 8c54ee8a8606 ("drm/xe: Ensure that we don't access the placements array out-of-bounds")

total: 0 errors, 2 warnings, 0 checks, 38 lines checked


