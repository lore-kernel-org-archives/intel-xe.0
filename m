Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7F3C48295
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 00:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B1110E907;
	Sat,  3 Feb 2024 00:33:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031B10E907;
 Sat,  3 Feb 2024 00:33:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_=28stole?=
 =?utf-8?q?n=29_memory_region_related_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 Feb 2024 00:33:12 -0000
Message-ID: <170692039226.953177.3445024177527354365@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: (stolen) memory region related fixes
URL   : https://patchwork.freedesktop.org/series/129498/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 40994da55 drm-tip: 2024y-02m-02d-22h-08m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Use struct resource for memory region IO as well
Applying: drm/i915: Print memory region info during probe
Applying: drm/i915: Remove ad-hoc lmem/stolen debugs
Applying: drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
Applying: drm/i915: Disable the "binder"
Applying: drm/i915: Rename the DSM/GSM registers
Applying: drm/i915: Fix PTE decode during initial plane readout
Applying: drm/i915: Fix region start during initial plane readout
Applying: drm/i915: Fix MTL initial plane readout
Applying: drm/i915: s/phys_base/dma_addr/
Applying: drm/i915: Split the smem and lmem plane readout apart
Applying: drm/i915: Simplify intel_initial_plane_config() calling convention
Applying: drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
Applying: drm/i915: Tweak BIOS fb reuse check
Applying: drm/i915: Try to relocate the BIOS fb to the start of ggtt
Applying: drm/i915: Annotate more of the BIOS fb takeover failure paths


