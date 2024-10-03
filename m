Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C3CCF34B0
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 16:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5D010E8C1;
	Thu,  3 Oct 2024 16:56:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07B10E8C1;
 Thu,  3 Oct 2024 16:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Reduce_fli?=
 =?utf-8?q?ckering_when_inheriting_BIOS_fb=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 16:56:06 -0000
Message-ID: <172797456649.1169666.7242207155407597549@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003154421.33805-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241003154421.33805-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Reduce flickering when inheriting BIOS fb.
URL   : https://patchwork.freedesktop.org/series/139516/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 17c0158bdb23 drm-tip: 2024y-10m-03d-14h-08m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/display: Handle stolen bar readout in the same way as lmem
Applying: drm/xe: Remove double pageflip
Applying: drm/i915/display: Use async flip when available for initial plane config
Applying: drm/xe/display: Remove single wait for vblank
Applying: drm/xe: Move suballocator init to after display init
Applying: drm/xe: Use xe_ggtt_map_bo_unlocked for resume
Applying: drm/xe: Add xe_ggtt_might_lock
Applying: drm/xe: Add xe_ggtt_alloc
Applying: drm/xe: Abstract read/write functions for GGTT PTEs
Applying: drm/xe: Make xe_ggtt_pt_ops private
Applying: drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
Applying: drm/xe: Move struct xe_ggtt to xe_ggtt.c


