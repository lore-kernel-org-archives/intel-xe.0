Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3298C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E3E10E0DB;
	Thu,  1 Jun 2023 00:06:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECE0710E0DB;
 Thu,  1 Jun 2023 00:06:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E62B5AADE3;
 Thu,  1 Jun 2023 00:06:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 01 Jun 2023 00:06:51 -0000
Message-ID: <168557801191.16229.10597867151117850470@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Separate_GT_and_tile_=28rev5=29?=
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

Series: Separate GT and tile (rev5)
URL   : https://patchwork.freedesktop.org/series/117614/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a00a92181 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
=== git am output follows ===
Applying: drm/xe/mtl: Disable media GT
Applying: drm/xe: Introduce xe_tile
Applying: drm/xe: Add backpointer from gt to tile
Applying: fixup! drm/xe: keep pulling mem_access_get further back
Applying: drm/xe: Add for_each_tile iterator
Applying: drm/xe: Move register MMIO into xe_tile
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Move GGTT from GT to tile
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Move VRAM from GT to tile
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Memory allocations are tile-based, not GT-based
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Move migration from GT to tile
Applying: drm/xe: Clarify 'gt' retrieval for primary tile
Applying: drm/xe: Drop vram_id
Applying: drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE
Applying: drm/xe: Allocate GT dynamically
Applying: drm/xe: Add media GT to tile
Applying: drm/xe: Move display IRQ postinstall out of GT function
Applying: drm/xe: Interrupts are delivered per-tile, not per-GT
Applying: drm/xe/irq: Handle ASLE backlight interrupts at same time as display
Applying: drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt mask
Applying: drm/xe/irq: Untangle postinstall functions
Applying: drm/xe: Replace xe_gt_irq_postinstall with xe_irq_enable_hwe
Applying: drm/xe: Invalidate TLB on all affected GTs during GGTT updates
Applying: drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
Applying: drm/xe: Allow GT looping and lookup on standalone media
Applying: drm/xe: Update query uapi to support standalone media
Applying: drm/xe: Reinstate media GT support
Applying: drm/xe: Add kerneldoc description of multi-tile devices


