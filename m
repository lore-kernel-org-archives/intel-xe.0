Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91205C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 12:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D2710E97C;
	Wed, 26 Aug 2026 12:59:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E05B10E97C;
 Wed, 26 Aug 2026 12:59:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vram=3A_Add_early_?=
 =?utf-8?q?VRAM_health_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 12:59:30 -0000
Message-ID: <178774917044.85743.15862099067375569559@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826125304.378173-2-matthew.auld@intel.com>
In-Reply-To: <20260826125304.378173-2-matthew.auld@intel.com>
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

Series: drm/xe/vram: Add early VRAM health check
URL   : https://patchwork.freedesktop.org/series/172786/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4805e9ac8af8ad4b3a8a101e9cbed3cb1edb573
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Aug 26 13:53:05 2026 +0100

    drm/xe/vram: Add early VRAM health check
    
    DO NOT REVIEW.
    
    Use the last page as a canary for BAR sizing, CCS sizing, identity map
    setup. If something is wrong the last page is where we will find it. Hit
    it with everything we have. Test here should be non-destructive and fast.
    
    Assisted-by: Gemini:gemini-3.1-pro-preview
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 drm-intel
a4805e9ac8af drm/xe/vram: Add early VRAM health check
-:49: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#49: FILE: drivers/gpu/drm/xe/xe_migrate.c:2638:
+void xe_migrate_debug_ccs_overlap(struct xe_migrate *m, struct xe_bo *last_page_bo, struct xe_bo *scratch_bo)

-:112: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#112: FILE: drivers/gpu/drm/xe/xe_migrate.h:186:
+void xe_migrate_debug_ccs_overlap(struct xe_migrate *m, struct xe_bo *last_page_bo, struct xe_bo *scratch_bo);

-:174: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#174: FILE: drivers/gpu/drm/xe/xe_vram.c:407:
+			drm_info(&xe->drm, "Tile %d: Small-BAR system detected, skipping VRAM memtest\n", id);

-:181: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#181: FILE: drivers/gpu/drm/xe/xe_vram.c:414:
+		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
+							    vram_size - SZ_64K,

-:218: WARNING:MEMORY_BARRIER: memory barrier without comment
#218: FILE: drivers/gpu/drm/xe/xe_vram.c:451:
+		wmb();

-:219: WARNING:MEMORY_BARRIER: memory barrier without comment
#219: FILE: drivers/gpu/drm/xe/xe_vram.c:452:
+		rmb();

-:246: WARNING:MEMORY_BARRIER: memory barrier without comment
#246: FILE: drivers/gpu/drm/xe/xe_vram.c:479:
+		rmb();

-:261: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#261: FILE: drivers/gpu/drm/xe/xe_vram.c:494:
+							       XE_BO_FLAG_VRAM_IF_DGFX(tile), false);

-:270: WARNING:MEMORY_BARRIER: memory barrier without comment
#270: FILE: drivers/gpu/drm/xe/xe_vram.c:503:
+			wmb();

-:275: WARNING:MEMORY_BARRIER: memory barrier without comment
#275: FILE: drivers/gpu/drm/xe/xe_vram.c:508:
+			rmb();

total: 0 errors, 9 warnings, 1 checks, 286 lines checked


