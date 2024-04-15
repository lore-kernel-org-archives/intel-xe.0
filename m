Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86422C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 13:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B66A112574;
	Mon, 15 Apr 2024 13:16:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EC3112574;
 Mon, 15 Apr 2024 13:16:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_i915=5Fr?=
 =?utf-8?q?eg=2Eh_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 13:16:30 -0000
Message-ID: <171318699047.1404431.6008861127233139556@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712933479.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712933479.git.jani.nikula@intel.com>
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

Series: drm/i915: i915_reg.h cleanups
URL   : https://patchwork.freedesktop.org/series/132380/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: dae2a18d3c7c drm-tip: 2024y-04m-15d-12h-54m-00s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/audio: move LPE audio regs to intel_audio_regs.h
Applying: drm/i915/color: move palette registers to intel_color_regs.h
Applying: drm/i915/display: split out intel_fbc_regs.h from i915_reg.h
Applying: drm/i915/display: split out intel_sprite_regs.h from i915_reg.h
Applying: drm/i915/display: split out intel_dpio_regs.h from i915_reg.h
Applying: drm/i915/display: split out bxt_phy_regs.h from i915_reg.h


