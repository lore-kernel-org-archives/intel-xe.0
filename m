Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419C0C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 21:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EFF10E0EA;
	Wed, 25 Oct 2023 21:47:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BB1010E5EC;
 Wed, 25 Oct 2023 21:47:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4930EA0BA8;
 Wed, 25 Oct 2023 21:47:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 25 Oct 2023 21:47:37 -0000
Message-ID: <169827045729.20490.15299811791223272278@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025180008.24167-1-brian.welty@intel.com>
In-Reply-To: <20231025180008.24167-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?duce_usage_of_xe=5Ftile_in_xe=5Fbo=2Ec?=
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

Series: Reduce usage of xe_tile in xe_bo.c
URL   : https://patchwork.freedesktop.org/series/125593/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f29e5a33f6376166a64264818d50456574fe248
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Oct 25 11:00:08 2023 -0700

    drm/xe: Replace usage of mem_type_to_tile
    
    Currently mem_type_to_tile() is being used to access the tile's underlying
    tile.mem.vram. However, this function makes the assumption that a mem_type
    will only ever map to a single tile. Now that the TTM vram manager contains
    a pointer to the memory_region, make use of this in xe_bo.c.
    
    As such, introduce a helper function res_to_mem_region() to get the
    ttm_vram_mgr->vram from the BO's resource, and use this to replace usage
    of mem_type_to_tile().
    
    xe_tile is still needed to choose the migration context, so this part is
    unchanged. But as this is only renaming usage, function is renamed now to
    mem_type_to_migrate().
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch bd3d7e8aa312ce25c5797388f753151f024bec02 drm-intel
7d9e2abe6 drm/xe: Replace xe_ttm_vram_mgr.tile with xe_mem_region
-:10: WARNING:TYPO_SPELLING: 'unneccesary' may be misspelled - perhaps 'unnecessary'?
#10: 
unneccesary usage of xe_tile from xe_bo.c in later patch.
^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
bad15680a drm/xe: Remove unused xe_bo_to_tile
3f29e5a33 drm/xe: Replace usage of mem_type_to_tile


