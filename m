Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E904CEB2CD
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 23:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265E889561;
	Mon, 30 Sep 2024 23:18:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6B910E2BC;
 Mon, 30 Sep 2024 23:18:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Use_DSB_?=
 =?utf-8?q?for_plane/color_management_commits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 23:18:40 -0000
Message-ID: <172773832041.1139389.17667706510611498610@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Use DSB for plane/color management commits
URL   : https://patchwork.freedesktop.org/series/139341/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4d7873ac76 drm-tip: 2024y-09m-30d-16h-43m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsb: Avoid reads of the DSB buffer for indexed register writes
Applying: drm/i915: Prepare clear color before wait_for_dependencies()
Applying: drm/i915/dsb: Generate the DSB buffer in commit_tail()
Applying: drm/i915/dsb: Enable programmable DSB interrupt
Applying: drm/i915/dsb: Introduce intel_dsb_vblank_evade()
Applying: drm/i915/dsb: Introduce intel_dsb_wait_usec()
Applying: drm/i915/dsb: Introduce intel_dsb_wait_vblanks()
Applying: drm/i915: Introduce intel_scanlines_to_usecs()
Applying: drm/i915/dsb: Introduce intel_dsb_wait_vblank_delay()
Applying: drm/i915: Extract intel_crtc_prepare_vblank_event()
Applying: drm/i915: Plumb 'dsb' all way to the plane hooks
Applying: drm/i915: Plumb 'dsb' all way to the color commit hooks
Applying: drm/i915/dsb: Use DSB for plane/color management updates


