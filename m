Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887FCC0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 16:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184310E5AC;
	Mon, 10 Feb 2025 16:17:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521A410E5AC;
 Mon, 10 Feb 2025 16:17:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/vrr=3A_Fix_?=
 =?utf-8?q?DSB+VRR_usage_for_PTL+_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 16:17:38 -0000
Message-ID: <173920425833.391597.12042869449197477622@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/vrr: Fix DSB+VRR usage for PTL+ (rev3)
URL   : https://patchwork.freedesktop.org/series/144152/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ac4a840cc627 drm-tip: 2025y-02m-10d-16h-05m-46s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsb: Move the +1 usec adjustment into dsb_wait_usec()
Applying: drm/i915/vrr: Don't send push for legacy cursor updates
Applying: drm/i915/vrr: Account for TRANS_PUSH delay
Applying: drm/i915/dsb: Compute use_dsb earlier
Applying: drm/i915/dsb: Introduce intel_dsb_poll()
Applying: drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
Applying: drm/i915/vrr: Check that the push send bit is clear after delayed vblank
Applying: drm/i915/dsb: Decode DSB error interrupts


