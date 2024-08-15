Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E1AC531DE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBE810E501;
	Thu, 15 Aug 2024 22:21:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0610E501;
 Thu, 15 Aug 2024 22:21:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B0?=
 =?utf-8?q?1/12=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 22:21:46 -0000
Message-ID: <172376050699.634935.15134137806986661232@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137360/
State : success

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
commit feb37d5be43f59720c5722a934605d8564dfe112
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Aug 15 18:07:32 2024 -0400

    drm/xe: Fix missing runtime outer protection for ggtt_remove_node
    
    Defer the ggtt node removal to a thread if runtime_pm is not active.
    
    The ggtt node removal can be called from multiple places, including
    places where we cannot protect with outer callers and places we are
    within other locks. So, try to grab the runtime reference if the
    device is already active, otherwise defer the removal to a separate
    thread from where we are sure we can wake the device up.
    
    v2: - use xe wq instead of system wq (Matt and CI)
        - Avoid GFP_KERNEL to be future proof since this removal can
        be called from outside our drivers and we don't want to block
        if atomic is needed. (Brost)
    v3: amend forgot chunk declaring xe_device.
    v4: Use a xe_ggtt_region to encapsulate the node and remova info,
        wihtout the need for any memory allocation at runtime.
    v5: Actually fill the delayed_removal.invalidate (Brost)
    v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
        - Own wq to ensures that the queued works are flushed before
          ggtt_fini (Brost)
    v7: also free ggtt_region on early !bound return (Auld)
    v8: Address the null deref (CI)
    v9: Based on the new xe_ggtt_node for the proper care of the lifetime
        of the object.
    v10: Redo the lost v5 change. (Brost)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 04b7aff6fa1bb7b6665e9e486aae4402cbc12e87 drm-intel
74800f73b109 drm/xe: Removed unused xe_ggtt_printk
4c47c4d2d1f4 drm/xe: Introduce GGTT documentation
7082a45acefc drm/xe: Remove unnecessary drm_mm.h includes
dd3e3a996a16 drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
c6727bd3a367 drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
80dcc304bcd2 drm/xe: Rename xe_ggtt_node related functions
11dbd157e9a7 drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
002cfa30586f drm/xe: Introduce xe_ggtt_largest_hole
964a5e83ecac drm/xe: Introduce xe_ggtt_print_holes
b09110fd95a8 drm/xe: Rename xe_ggtt balloon functions to make the node clear
8ed6863954bb drm/xe: Make xe_ggtt_node struct independent
feb37d5be43f drm/xe: Fix missing runtime outer protection for ggtt_remove_node


