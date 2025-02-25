Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1BC021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 11:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117FC10E63F;
	Tue, 25 Feb 2025 11:26:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FD910E63F;
 Tue, 25 Feb 2025 11:26:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_display_?=
 =?utf-8?q?reset_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 11:26:41 -0000
Message-ID: <174048280158.1947185.8295026407961619811@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740481927.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740481927.git.jani.nikula@intel.com>
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

Series: drm/i915: display reset cleanups
URL   : https://patchwork.freedesktop.org/series/145394/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d5debc4841e6 drm-tip: 2025y-02m-25d-10h-43m-41s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: convert display reset to struct intel_display *
Applying: drm/i915: move pending_fb_pin to struct intel_display
Applying: drm/i915/reset: add intel_gt_gpu_reset_clobbers_display() helper
Applying: drm/i915/reset: add intel_display_reset_test()
Applying: drm/i915/reset: add wrappers for display reset calls
Applying: drm/i915/reset: move gt related stuff out of display reset
Applying: drm/i915/reset: pass test only parameter to intel_display_reset_finish()
Applying: drm/i915/reset: add modeset_stuck callback to intel_display_reset_prepare()


