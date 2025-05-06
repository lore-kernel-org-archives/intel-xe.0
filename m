Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA90C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D110E59E;
	Tue,  6 May 2025 07:05:15 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEAC10E59E;
 Tue,  6 May 2025 07:05:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable/Disable_DC_ba?=
 =?utf-8?q?lance_along_with_VRR_DSB_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:05:14 -0000
Message-ID: <174651511422.50100.5189214288745991622@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428062058.2811655-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250428062058.2811655-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev3)
URL   : https://patchwork.freedesktop.org/series/148025/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1a6c04fe7312 drm-tip: 2025y-05m-06d-06h-41m-00s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Fix the adjustment for the fixed rr vtotal for Display < 13
Applying: drm/i915/vrr: Refactor vmin/vmax stuff
Applying: drm/i915/display: Add source param for dc balance
Applying: drm/i915/display: Add registers and bits for DC Balance
Applying: drm/i915/vrr: Add functions to read out vmin/vmax stuff
Applying: drm/i915/vrr: Add state checker for dc balance params
Applying: drm/i915/vrr: Add state dump for dc balance params
Applying: drm/i915/vrr: Add compute config for DC balance params
Applying: drm/i915/vrr: Write DC balance params to hw registers
Applying: drm/i915: Extract vrr_vblank_start()
Applying: drm/i915/vrr: Implement vblank evasion with DC balancing
Applying: drm/i915/dsb: Add pipedmc dc balance enable/disable
Applying: drm/i915/vrr: Restructure VRR enablement bit
Applying: drm/i915/vrr: Pause DC balancing for DSB commits
Applying: drm/i915/vrr: enable dc balance bit


