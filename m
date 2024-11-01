Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86332E6F06C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 15:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519C110E2F7;
	Fri,  1 Nov 2024 15:52:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E94B10E2F7;
 Fri,  1 Nov 2024 15:52:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Restore_system_memory_GGTT_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 15:52:49 -0000
Message-ID: <173047636931.1388188.7734357399486119712@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101154724.203525-3-matthew.auld@intel.com>
In-Reply-To: <20241101154724.203525-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe: Restore system memory GGTT mappings
URL   : https://patchwork.freedesktop.org/series/140819/
State : warning

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
commit 6b70ad19710578734e2395ad20692185f493abeb
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Nov 1 15:47:26 2024 +0000

    drm/xe: improve hibernation on igpu
    
    The GGTT looks to be stored inside stolen memory on igpu which is not
    treated as normal RAM.  The core kernel skips this memory range when
    creating the hibernation image, therefore when coming back from
    hibernation the GGTT programming is lost. This seems to cause issues
    with broken resume where GuC FW fails to load:
    
    [drm] *ERROR* GT0: load failed: status = 0x400000A0, time = 10ms, freq = 1250MHz (req 1300MHz), done = -1
    [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01
    [drm] *ERROR* GT0: firmware signature verification failed
    [drm] *ERROR* CRITICAL: Xe has declared device 0000:00:02.0 as wedged.
    
    Current GGTT users are kernel internal and tracked as pinned, so it
    should be possible to hook into the existing save/restore logic that we
    use for dgpu, where the actual evict is skipped but on restore we
    importantly restore the GGTT programming.  This has been confirmed to
    fix hibernation on at least ADL and MTL, though likely all igpu
    platforms are affected.
    
    This also means we have a hole in our testing, where the existing s4
    tests only really test the driver hooks, and don't go as far as actually
    rebooting and restoring from the hibernation image and in turn powering
    down RAM (and therefore losing the contents of stolen).
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3275
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 1f43c3e0b6e59a28f62c32fab537ad6b5c91d065 drm-intel
2155f6a2430e drm/xe: Restore system memory GGTT mappings
-:33: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around bo->placements[0]
#33: FILE: drivers/gpu/drm/xe/xe_bo.c:942:
+	struct ttm_place *place = &(bo->placements[0]);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
6b70ad197105 drm/xe: improve hibernation on igpu
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[drm] *ERROR* GT0: load failed: status = 0x400000A0, time = 10ms, freq = 1250MHz (req 1300MHz), done = -1

-:55: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around bo->placements[0]
#55: FILE: drivers/gpu/drm/xe/xe_bo.c:1776:
+	struct ttm_place *place = &(bo->placements[0]);

-:90: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around bo->placements[0]
#90: FILE: drivers/gpu/drm/xe/xe_bo.c:1868:
+	struct ttm_place *place = &(bo->placements[0]);

total: 0 errors, 1 warnings, 2 checks, 91 lines checked


