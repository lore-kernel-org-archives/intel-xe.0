Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC6AC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B431810E31E;
	Wed,  2 Jul 2025 08:51:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CE310E31D;
 Wed,  2 Jul 2025 08:51:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleaning_up_code_related_?=
 =?utf-8?q?to_VRAM_regions_and_its_initialization_-_part_2_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 08:51:15 -0000
Message-ID: <175144627528.127011.4118269069497162238@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
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

Series: Cleaning up code related to VRAM regions and its initialization - part 2 (rev11)
URL   : https://patchwork.freedesktop.org/series/149503/
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
commit 319e4479d8b6e2f0412f8bb789f68b78ef8b0f54
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Wed Jul 2 10:44:24 2025 +0200

    drm/xe: Unify the initialization of VRAM regions
    
    Currently in the drivers we have defined VRAM regions per device and per
    tile. Initialization of these regions is done in two completely different
    ways. To simplify the logic of the code and make it easier to add new
    regions in the future, let's unify the way we initialize VRAM regions.
    
    v2:
    - fix doc comments in struct xe_vram_region
    - remove unnecessary includes (Jani)
    v3:
    - move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
      (Matthew)
    - replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
      (Matthew)
    - Replace the tile id parameter with vram region in the xe_pf_begin
      function.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b96850785acbd7f0221629625724533cefc2481e drm-intel
4a4d1fd75262 drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
303b4885378d drm/xe: Use dynamic allocation for tile and device VRAM region structures
407848b78027 drm/xe: Move struct xe_vram_region to a dedicated header
-:261: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#261: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 251 lines checked
319e4479d8b6 drm/xe: Unify the initialization of VRAM regions


