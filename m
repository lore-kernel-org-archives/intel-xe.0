Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A06C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 12:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625F310E3DC;
	Mon,  1 Jul 2024 12:01:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0645B10E3D9;
 Mon,  1 Jul 2024 12:01:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=5Fggtt_node_refactor_f?=
 =?utf-8?q?or_safer_node_removal_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 12:01:33 -0000
Message-ID: <171983529302.2136.17307480909518035601@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
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

Series: xe_ggtt node refactor for safer node removal (rev2)
URL   : https://patchwork.freedesktop.org/series/135537/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62587740bfe9f5aeea806bf12e262fce2e2f3e91
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Jun 28 15:27:53 2024 -0400

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
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
355529490c65 drm/xe: Removed unused xe_ggtt_printk
6614d5cb0cf1 drm/xe: Introduce GGTT documentation
9cc3969c0060 drm/xe: Remove unnecessary drm_mm.h includes
37034bc46f31 drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
ebfb04ab3923 drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
555fbd719724 drm/xe: Rename xe_ggtt_node related functions
647d904a64d1 drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
4b074ca8a873 drm/xe: Introduce xe_ggtt_largest_hole
6997d60389a2 drm/xe: Introduce xe_ggtt_print_holes
2eff525734e5 drm/xe: Rename xe_ggtt balloon functions to make the node clear
19d4f49a86c3 drm/xe: Make xe_ggtt_node struct independent
62587740bfe9 drm/xe: Fix missing runtime outer protection for ggtt_remove_node


