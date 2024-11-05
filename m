Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDCCD2C122
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 15:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7713910E5C7;
	Tue,  5 Nov 2024 15:16:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776C310E5C7;
 Tue,  5 Nov 2024 15:16:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/9=5D_drm/xe=3A_Remove_double_pageflip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 15:16:10 -0000
Message-ID: <173081977048.1412794.17629772252672098935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105121857.17389-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241105121857.17389-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/9] drm/xe: Remove double pageflip
URL   : https://patchwork.freedesktop.org/series/140944/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b925cb281e79 drm-tip: 2024y-11m-05d-14h-00m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove double pageflip
Applying: drm/xe/display: Add intel_plane_initial_vblank_wait
Applying: drm/xe: Move suballocator init to after display init
Applying: drm/xe: Defer irq init until after xe_display_init_noaccel
Applying: drm/xe/display: Use a single early init call for display
Applying: drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
Applying: drm/xe: Simplify GuC early initialisation
Applying: drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
Applying: drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


