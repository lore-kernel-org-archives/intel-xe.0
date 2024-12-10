Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A0E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08610E822;
	Tue, 10 Dec 2024 08:37:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55CD10E159;
 Tue, 10 Dec 2024 08:37:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_GuC_changes_for_flic?=
 =?utf-8?q?ker-free_boot=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 08:37:37 -0000
Message-ID: <173381985780.777753.5312618551370209225@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210083111.230484-1-dev@lankhorst.se>
In-Reply-To: <20241210083111.230484-1-dev@lankhorst.se>
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

Series: GuC changes for flicker-free boot.
URL   : https://patchwork.freedesktop.org/series/142338/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bb4897e2c04e drm-tip: 2024y-12m-10d-01h-24m-12s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/display: Add intel_plane_initial_vblank_wait
Applying: drm/xe: Remove double pageflip
Applying: drm/xe: Move suballocator init to after display init
Applying: drm/xe: Defer irq init until after xe_display_init_noaccel
Applying: drm/xe/display: Use a single early init call for display
Applying: drm/xe: Defer memirq init until needed
Applying: drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
Applying: drm/xe: Simplify GuC early initialisation
Applying: drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
Applying: drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
Applying: drm/xe: Do not attempt to bootstrap VF in execlists mode


