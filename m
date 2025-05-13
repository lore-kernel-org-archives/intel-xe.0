Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7E8C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 15:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B34010E08A;
	Tue, 13 May 2025 15:51:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C4310E08A;
 Tue, 13 May 2025 15:51:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable/Disable_DC_ba?=
 =?utf-8?q?lance_along_with_VRR_DSB_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 15:51:10 -0000
Message-ID: <174715147017.75839.368542733022893926@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513051700.507389-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250513051700.507389-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB (rev5)
URL   : https://patchwork.freedesktop.org/series/148025/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d0d3c136f60c drm-tip: 2025y-05m-13d-14h-08m-27s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Refactor vmin/vmax stuff
Applying: drm/i915/display: Add source param for dc balance
Applying: drm/i915/display: Add pipe dmc registers and bits for DC Balance
Applying: drm/i915/display: Add VRR DC balance registers
Applying: drm/i915/vrr: Add functions to read out vmin/vmax stuff
Applying: drm/i915/vrr: Add DC Balance params to crtc_state
Applying: drm/i915/vrr: Add state dump for DC Balance params
Applying: drm/i915/vrr: Add compute config for DC Balance params
Applying: drm/i915/vrr: Write DC balance params to hw registers
Applying: drm/i915: Extract vrr_vblank_start()
Applying: drm/i915/vrr: Implement vblank evasion with DC balancing
Applying: drm/i915/dsb: Add pipedmc dc balance enable/disable
Applying: drm/i915/vrr: Restructure VRR enablement bit
Applying: drm/i915/vrr: Pause DC Balancing for DSB commits
Applying: drm/i915/vrr: Add function to check if DC Balance Possible
Applying: drm/i915/display: Add function to configure PIPEDMC_EVT_CTL
Applying: drm/i915/vrr: Enable DC Balance bit


