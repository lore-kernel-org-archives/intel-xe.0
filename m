Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4318F327D9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 17:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85A910E50E;
	Tue, 21 Apr 2026 17:37:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624D10E50E;
 Tue, 21 Apr 2026 17:37:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Convert_stolen_?=
 =?utf-8?q?memory_over_to_ttm=5Frange=5Fmanager_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Apr 2026 17:37:07 -0000
Message-ID: <177679302701.482719.11039750780056041500@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260421165047.2421231-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260421165047.2421231-2-sanjay.kumar.yadav@intel.com>
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

Series: drm/xe: Convert stolen memory over to ttm_range_manager (rev3)
URL   : https://patchwork.freedesktop.org/series/164694/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42f2d34035fe113dd5be96c0109288e45b8b6931
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Tue Apr 21 22:20:48 2026 +0530

    drm/xe: Convert stolen memory over to ttm_range_manager
    
    Stolen memory requires physically contiguous allocations for display
    scanout and compressed framebuffers. The stolen memory manager was
    sharing the gpu_buddy allocator backend with the VRAM manager, but
    buddy manages non-contiguous power-of-two blocks making it a poor fit.
    Stolen memory also has fundamentally different allocation patterns:
    
    - Allocation sizes are not power-of-two. Since buddy rounds up to the
      next power-of-two block size, a ~17MB request can fail even with
      ~22MB free, because the free space is fragmented across non-fitting
      power-of-two blocks.
    - Hardware restrictions prevent using the first 4K page of stolen for
      certain allocations (e.g., FBC). The display code sets fpfn=1 to
      enforce this, but when fpfn != 0, gpu_buddy enables
      GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
      coalescing path, further reducing allocation success.
    
    This combination caused FBC compressed framebuffer (CFB) allocation
    failures on platforms like NVL/PTL. In case of NVL where stolen memory
    is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
    leaving ~22MB for subsequent allocations.
    
    Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
    manager for stolen memory. This reuses the TTM core's ttm_range_manager
    callbacks, avoiding duplicate implementations.
    
    Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
    contiguous free hole after initial plane framebuffer allocation, and
    FBC successfully allocates its CFB from that region. The corresponding
    IGT was previously skipped and now passes.
    
    v2:
    - Clarify that stolen memory requires contiguous allocations (Matt B)
    - Properly handle xe_ttm_resource_visible() for stolen instead of
      unconditionally returning true (Matt A)
    
    v3:
    - Rebase
    - Fix xe_display_bo_fbdev_prefer_stolen() to compare in pages, since
      ttm_range_manager stores stolen->size in pages not bytes (Matt A)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 33d3b65ec51f2bddafa26a80249e26c78435f169 drm-intel
42f2d34035fe drm/xe: Convert stolen memory over to ttm_range_manager
-:50: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#50: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:50: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#50: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 247 lines checked


