Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6AC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE1510E12E;
	Tue, 20 Aug 2024 21:40:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAE210E12E;
 Tue, 20 Aug 2024 21:40:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B01/12=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 21:40:49 -0000
Message-ID: <172419004943.716736.11140291682511802076@2413ebb6fbb6>
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0729ba6a553a drm-tip: 2024y-08m-20d-21h-22m-32s UTC integration manifest
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
Applying: drm/xe: Refactor xe_ggtt balloon functions to make the node clear
Applying: drm/xe: Make xe_ggtt_node struct independent
Applying: drm/xe: Fix missing runtime outer protection for ggtt_remove_node


