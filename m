Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D48ECAC5AB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 22:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358AD10E02A;
	Tue, 17 Sep 2024 22:22:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF1F10E02A;
 Tue, 17 Sep 2024 22:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Defer_gt-=3Emmi?=
 =?utf-8?q?o_initialization_until_after_multi-tile_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 22:22:04 -0000
Message-ID: <172661172418.1023938.12967478653345059041@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917221615.875962-2-matthew.d.roper@intel.com>
In-Reply-To: <20240917221615.875962-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Defer gt->mmio initialization until after multi-tile setup
URL   : https://patchwork.freedesktop.org/series/138788/
State : warning

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
commit 79c19d8efd2428c3d1efb286296bbcf16d1b14ce
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Sep 17 15:16:16 2024 -0700

    drm/xe: Defer gt->mmio initialization until after multi-tile setup
    
    With the recent xe_mmio redesign, tiles and GTs each have their own MMIO
    accessor, with the GT inheriting some of the information (such as the
    iomap pointer) from their containing tile.  Given that non-root tiles
    get initialized later than the root tile (and currently after the point
    at which GT MMIO is initialized for _all_ GTs), we wind up incorrectly
    inheriting uninitialized pointers for the initialization of GT MMIO for
    GTs that reside on non-root tiles.  This causes a driver crash on
    multi-tile PVC platforms.
    
    With the general xe_mmio redesign, it's now only necessary to do the
    GT-level MMIO setup before the point we start reading/writing GT
    registers.  Move initialization of gt->mmio out of xe_info_init (which
    runs before non-root tiles are initialized) and to the beginning of
    where we start actually accessing the GTs themselves.
    
    The high-level initialization flow now boils down to:
     - General device init, software-only setup
     - (no register access possible yet)
     - Root tile initialization
     - (access to device/tile0 registers possible via xe_root_tile_mmio())
     - Initialization of non-root tiles
     - (access to any tile's registers possible via tile->mmio)
     - GT MMIO initialization, inheriting iomap from each GT's tile
     - (access to any GT's registers possible via gt->mmio)
    
    Fixes: fa599b8c95a7 ("drm/xe: Populate GT's mmio iomap from tile during init")
    Reported-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
79c19d8efd24 drm/xe: Defer gt->mmio initialization until after multi-tile setup
-:33: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#33: 
Reported-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

total: 0 errors, 1 warnings, 0 checks, 74 lines checked


