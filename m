Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C3C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151310E3FD;
	Tue, 20 Aug 2024 21:41:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CD310E3FD;
 Tue, 20 Aug 2024 21:41:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B0?=
 =?utf-8?q?1/12=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 21:41:20 -0000
Message-ID: <172419008068.716728.14826282115956689507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/137537/
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
commit 45fffa6530c8cb76d30de6a0faada7267612371a
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Aug 20 16:25:47 2024 -0400

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
    v11: Simplify the invalidate_on_remove (Lucas)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0729ba6a553ae595a4092ceb27300ea218c2efae drm-intel
f47c20026346 drm/xe: Removed unused xe_ggtt_printk
04eda124b8cf drm/xe: Introduce GGTT documentation
b8277000b186 drm/xe: Remove unnecessary drm_mm.h includes
e688e7401a41 drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
5e4e5089ff92 drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
b2de25b0a81b drm/xe: Rename xe_ggtt_node related functions
8436bb45742f drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
6814d0607bc9 drm/xe: Introduce xe_ggtt_largest_hole
df57168028b2 drm/xe: Introduce xe_ggtt_print_holes
8ef4940d2c5e drm/xe: Refactor xe_ggtt balloon functions to make the node clear
10f152fa459d drm/xe: Make xe_ggtt_node struct independent
-:715: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#715: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:548:
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0],
 						  start, end);

-:724: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#724: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:557:
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1],
 						  start, end);

total: 0 errors, 0 warnings, 2 checks, 631 lines checked
45fffa6530c8 drm/xe: Fix missing runtime outer protection for ggtt_remove_node


