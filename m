Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5923CC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2142910E6A6;
	Wed, 21 Aug 2024 19:45:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102E310E6A6;
 Wed, 21 Aug 2024 19:45:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B0?=
 =?utf-8?q?1/12=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 19:45:47 -0000
Message-ID: <172426954706.722512.10989312264824734127@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/137588/
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
commit 61d9dd33b09950d72759587d5889e416c70d083a
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Aug 21 15:38:42 2024 -0400

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
+ /mt/dim checkpatch ddbda36f876f53498924155abfa1cd4c58517903 drm-intel
aaea59a3625d drm/xe: Removed unused xe_ggtt_printk
faaa4aa755f8 drm/xe: Introduce GGTT documentation
b11842250fc9 drm/xe: Remove unnecessary drm_mm.h includes
5240eb84ad06 drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
b3a3dc32e7ba drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
3013095a7ebc drm/xe: Rename xe_ggtt_node related functions
36c8f6d1fab7 drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
bc4879dcbed9 drm/xe: Introduce xe_ggtt_largest_hole
89b10c45fdc2 drm/xe: Introduce xe_ggtt_print_holes
55fb30abbfe0 drm/xe: Refactor xe_ggtt balloon functions to make the node clear
f1f956608b16 drm/xe: Make xe_ggtt_node struct independent
61d9dd33b099 drm/xe: Fix missing runtime outer protection for ggtt_remove_node


