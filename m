Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D61D15D96
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 14:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DEE10E15F;
	Mon, 21 Oct 2024 14:09:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FD510E15F;
 Mon, 21 Oct 2024 14:09:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?platform_identification_with_display-=3Eplatform=2E=3Cplatform=3E?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 14:09:22 -0000
Message-ID: <172951976208.1305498.9494675585649582886@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1729518793.git.jani.nikula@intel.com>
In-Reply-To: <cover.1729518793.git.jani.nikula@intel.com>
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

Series: drm/i915/display: platform identification with display->platform.<platform> (rev2)
URL   : https://patchwork.freedesktop.org/series/139301/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 186d247adb08 drm-tip: 2024y-10m-21d-13h-07m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: reindent subplatform initialization
Applying: drm/i915/display: use a macro to initialize subplatforms
Applying: drm/i915/display: use a macro to define platform enumerations
Applying: drm/i915/display: join the platform and subplatform enums
Applying: drm/i915/display: convert display platforms to lower case
Applying: drm/i915/display: add display platforms structure with platform members
Applying: drm/i915/display: add platform member to struct intel_display
Applying: drm/i915/display: remove the display platform enum as unnecessary
Applying: drm/i915/display: add platform group for g4x
Applying: drm/i915/display: add subplatform group for HSW/BDW ULT
Applying: drm/i915/bios: use display->platform.<platform> instead of IS_<PLATFORM>()
Applying: drm/i915/pps: use display->platform.<platform> instead of IS_<PLATFORM>()
Applying: drm/i915/tv: use display->platform.<platform> instead of IS_<PLATFORM>()
Applying: drm/i915/vga: use display->platform.<platform> instead of IS_<PLATFORM>()
Applying: drm/i915/vblank: use display->platform.<platform> instead of IS_<PLATFORM>()


