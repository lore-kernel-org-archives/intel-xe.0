Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF3C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 17:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B237210EBB5;
	Thu, 22 Aug 2024 17:47:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D184610EBB6;
 Thu, 22 Aug 2024 17:47:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Align_all_VRAM_?=
 =?utf-8?q?scanout_buffers_to_64k_physical_pages_when_needed=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 17:47:54 -0000
Message-ID: <172434887485.726612.14305400030378065154@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822174202.827626-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240822174202.827626-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Align all VRAM scanout buffers to 64k physical pages when needed.
URL   : https://patchwork.freedesktop.org/series/137662/
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
commit d0bec512b621d4d84b3414e0f09f9a40f9167a03
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Aug 22 19:42:02 2024 +0200

    drm/xe: Align all VRAM scanout buffers to 64k physical pages when needed.
    
    For CCS formats on affected platforms, CCS can be used freely, but
    display engine requires a multiple of 64k physical pages. No other
    changes are needed.
    
    At the BO creation time we don't know if the BO will be used for CCS
    or not. If the scanout flag is set, and the BO is a multiple of 64k,
    we take the safe route and force the physical alignment of 64k pages.
    
    If the BO is not a multiple of 64k, or the scanout flag was not set
    at BO creation, we reject it for usage as CCS in display. The physical
    pages are likely not aligned correctly, and this will cause corruption
    when used as FB.
    
    This is a slightly different approach from my previous patch. Instead
    of requiring a scanout flag at FB creation, we now make all buffers of
    the right size physically aligned correctly, so no change from userspace
    is needed.
    
    Inspired by Zbigniews patch.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
+ /mt/dim checkpatch 882c26c7017bdcc4eca493c7bf1ffb034d40be02 drm-intel
d0bec512b621 drm/xe: Align all VRAM scanout buffers to 64k physical pages when needed.
-:31: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#31: 
Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:33:
+	if (XE_IOCTL_DBG(xe, mode_cmd->modifier[0] == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
+			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))

total: 0 errors, 1 warnings, 1 checks, 33 lines checked


