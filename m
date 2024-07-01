Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE4FC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 12:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447D10E3DC;
	Mon,  1 Jul 2024 12:01:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180BA10E3DC;
 Mon,  1 Jul 2024 12:01:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_xe=5Fggtt_node_refac?=
 =?utf-8?q?tor_for_safer_node_removal_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 12:01:01 -0000
Message-ID: <171983526109.2136.10325918121626183309@2413ebb6fbb6>
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

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 886eeb6d89b5 drm-tip: 2024y-06m-28d-10h-30m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Removed unused xe_ggtt_printk
Applying: drm/xe: Introduce GGTT documentation
Applying: drm/xe: Remove unnecessary drm_mm.h includes
Applying: drm/{i915, xe}: Avoid direct inspection of dpt_vma from outside dpt
Applying: drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
Applying: drm/xe: Rename xe_ggtt_node related functions
Applying: drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
Applying: drm/xe: Introduce xe_ggtt_largest_hole
Applying: drm/xe: Introduce xe_ggtt_print_holes
Applying: drm/xe: Rename xe_ggtt balloon functions to make the node clear
Applying: drm/xe: Make xe_ggtt_node struct independent
Applying: drm/xe: Fix missing runtime outer protection for ggtt_remove_node


