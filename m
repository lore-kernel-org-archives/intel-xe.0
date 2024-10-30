Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61D2D5CC9B
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 11:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9BD10E786;
	Wed, 30 Oct 2024 11:33:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCB510E786;
 Wed, 30 Oct 2024 11:33:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_=28CI=29_drm/xe=3A_F?=
 =?utf-8?q?ix_initial_framebuffer_handover=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 11:33:08 -0000
Message-ID: <173028798823.1363581.1677538057327116990@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
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

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev3)
URL   : https://patchwork.freedesktop.org/series/140671/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: dc3552b1791e drm-tip: 2024y-10m-30d-10h-11m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove double pageflip
Applying: drm/i915/display: Use async flip when available for initial plane config
Applying: drm/xe: Move suballocator init to after display init
Applying: drm/xe: Defer irq init until after xe_display_init_noaccel
Applying: drm/xe/display: Use a single early init call for display
Applying: drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
Applying: drm/xe: Simplify GuC early initialisation
Applying: drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


