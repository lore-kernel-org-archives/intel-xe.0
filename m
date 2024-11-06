Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35654D44D57
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 14:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44F10E1FB;
	Wed,  6 Nov 2024 14:43:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EC810E1FB;
 Wed,  6 Nov 2024 14:43:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5B01/10=5D_drm/xe=3A_Remove_double_pageflip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 14:43:36 -0000
Message-ID: <173090421660.1417155.14783148838654693308@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106143837.195642-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241106143837.195642-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [01/10] drm/xe: Remove double pageflip
URL   : https://patchwork.freedesktop.org/series/141007/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 49ab426a2349 drm-tip: 2024y-11m-06d-14h-30m-54s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:415
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Remove double pageflip
Applying: drm/xe/display: Add intel_plane_initial_vblank_wait
Applying: drm/xe: Move suballocator init to after display init
Applying: drm/xe: Defer irq init until after xe_display_init_noaccel
Applying: drm/xe/display: Use a single early init call for display
Applying: drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
Applying: drm/xe: Simplify GuC early initialisation
Applying: drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
Applying: drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
Patch failed at 0009 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


