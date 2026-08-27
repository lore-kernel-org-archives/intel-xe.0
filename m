Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A85C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B3E10F0BA;
	Thu, 27 Aug 2026 14:49:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D110F0BA;
 Thu, 27 Aug 2026 14:49:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vram=3A_Add_early_?=
 =?utf-8?q?VRAM_health_check_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 14:49:13 -0000
Message-ID: <178784215338.92486.17685292085441701631@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827144244.477862-2-matthew.auld@intel.com>
In-Reply-To: <20260827144244.477862-2-matthew.auld@intel.com>
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

Series: drm/xe/vram: Add early VRAM health check (rev3)
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
commit 0e578e83968ea97cd93840c17fddae84821344e5
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Aug 27 15:42:45 2026 +0100

    drm/xe/vram: Add early VRAM health check
    
    DO NOT REVIEW.
    
    Use the last page as a canary for BAR sizing, CCS sizing, identity map
    setup. If something is wrong the last page is where we will likely find
    it. Hit it with everything we have.
    
    Assisted-by: Gemini:gemini-3.1-pro-preview
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 07d839d6df2fbcf4654a5ce6e65845afbe037302 drm-intel
0e578e83968e drm/xe/vram: Add early VRAM health check
-:247: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#247: FILE: drivers/gpu/drm/xe/xe_vram.c:416:
+		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
+							    vram_size - SZ_64K,

-:341: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#341: FILE: drivers/gpu/drm/xe/xe_vram.c:510:
+			scratch_bo_before = xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
+							      ttm_bo_type_kernel,

-:350: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#350: FILE: drivers/gpu/drm/xe/xe_vram.c:519:
+			scratch_bo_after = xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
+							     ttm_bo_type_kernel,

total: 0 errors, 0 warnings, 3 checks, 361 lines checked


