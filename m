Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF468F44873
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 14:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9406610E962;
	Fri, 10 Apr 2026 14:07:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4008D10E962;
 Fri, 10 Apr 2026 14:07:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Convert_stolen_?=
 =?utf-8?q?memory_over_to_ttm=5Frange=5Fmanager?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 14:07:46 -0000
Message-ID: <177583006624.451491.1490657416122538402@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
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

Series: drm/xe: Convert stolen memory over to ttm_range_manager
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
commit d32a45df9a779e467a6842b77e0db2cf3df5b948
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Fri Apr 10 17:36:02 2026 +0530

    drm/xe: Convert stolen memory over to ttm_range_manager
    
    The stolen memory manager was sharing the gpu_buddy allocator backend
    with the VRAM manager. However, stolen memory has fundamentally
    different allocation patterns that make the buddy allocator a poor fit.
    
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
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
+ /mt/dim checkpatch 00494f7cc0daee7d5119d6e86682ab6fa3fdfcb8 drm-intel
d32a45df9a77 drm/xe: Convert stolen memory over to ttm_range_manager
-:38: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#38: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:38: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#38: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 205 lines checked


