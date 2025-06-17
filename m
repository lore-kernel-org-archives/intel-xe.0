Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26FEC71159
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 02:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882CC10E2AB;
	Tue, 17 Jun 2025 02:16:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297B410E2AB;
 Tue, 17 Jun 2025 02:16:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Future-proof_for_multi-ti?=
 =?utf-8?q?le_+_multi-GT_cases_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 02:16:09 -0000
Message-ID: <175012656916.84054.4157227980729177539@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617020906.1719276-7-matthew.d.roper@intel.com>
In-Reply-To: <20250617020906.1719276-7-matthew.d.roper@intel.com>
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

Series: Future-proof for multi-tile + multi-GT cases (rev2)
URL   : https://patchwork.freedesktop.org/series/150192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e22f9ec125d19353d6479a2f0fda97e0ef6a3c25
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Jun 16 19:09:12 2025 -0700

    drm/xe: Don't compare GT ID to GT count when determining valid GTs
    
    On current platforms with multiple GTs, all of the GT IDs are
    consecutive; as a result we know that the GT IDs range from 0 to
    gt_count-1 and can determine if a GT ID is valid by comparing against
    the count.  The consecutive nature of GT IDs may not hold true on future
    platforms if/when we have platforms that are both multi-tile and have
    multiple GTs within each tile.  Once such platforms exist, it's quite
    possible that we could wind up with something like a GT list composed of
    IDs 0, 2, and 3 with no GT 1 (which would be a 2-tile platform with
    media only on the second tile).
    
    To future-proof the code we should stop comparing against the GT count
    to determine whether a GT ID is valid or not.  Instead we should do an
    actual lookup of the ID to determine whether the GT exists.  This also
    means that our GT loop macro should not end at the GT count, but should
    rather examine the entire space up to (# of tiles) * (max GT per tile)
    to ensure it doesn't stop prematurely.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 6f72990d9e0fe084afe257621edd730444a8bc52 drm-intel
fca05c6071bd drm/xe: Export xe_step_name for kunit tests
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
  ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
93e18324e827 drm/xe: Track maximum GTs per tile on a per-platform basis
00dc331e4da6 drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
4d65e1df3957 drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
e22f9ec125d1 drm/xe: Don't compare GT ID to GT count when determining valid GTs
-:40: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#40: FILE: drivers/gpu/drm/xe/xe_device.h:131:
+	for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \

total: 0 errors, 1 warnings, 0 checks, 50 lines checked


