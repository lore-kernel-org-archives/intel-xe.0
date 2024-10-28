Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BADD5B845
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 22:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8010E1A6;
	Mon, 28 Oct 2024 22:26:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4A210E1A6;
 Mon, 28 Oct 2024 22:26:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/display=3A_?=
 =?utf-8?q?bunch_of_struct_intel=5Fdisplay_conversions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 22:26:43 -0000
Message-ID: <173015440305.1357055.7942524242652623807@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730146000.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730146000.git.jani.nikula@intel.com>
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

Series: drm/i915/display: bunch of struct intel_display conversions (rev3)
URL   : https://patchwork.freedesktop.org/series/140323/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 810b65a3bab4 drm-tip: 2024y-10m-28d-20h-55m-14s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_dp_hdcp.c:780
error: drivers/gpu/drm/i915/display/intel_dp_hdcp.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/gmbus: convert to struct intel_display
Applying: drm/i915/cx0: remove unnecessary includes
Applying: drm/i915/cx0: convert to struct intel_display
Applying: drm/i915/dpio: convert to struct intel_display
Applying: drm/i915/hdcp: further conversion to struct intel_display
Applying: drm/i915/dp/hdcp: convert to struct intel_display
Patch failed at 0006 drm/i915/dp/hdcp: convert to struct intel_display
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


