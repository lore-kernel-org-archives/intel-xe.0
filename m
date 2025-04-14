Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D97FC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 11:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC6410E51A;
	Mon, 14 Apr 2025 11:08:56 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3230410E51A;
 Mon, 14 Apr 2025 11:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Underrun_on_idle_PSR?=
 =?utf-8?q?_workaround_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 11:08:55 -0000
Message-ID: <174462893520.896.11209106547341027170@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414100508.1208774-1-jouni.hogander@intel.com>
In-Reply-To: <20250414100508.1208774-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround (rev6)
URL   : https://patchwork.freedesktop.org/series/145987/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7fabc0c4629f drm-tip: 2025y-04m-14d-10h-52m-16s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add new interface for getting dc_state
Applying: drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
Applying: drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
Applying: drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
Applying: drm/i915/dmc: Add interface to block PKG C-state
Applying: drm/i915/psr: Block PKG C-State when enabling PSR
Applying: drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
Applying: drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
Applying: drm/i915/psr: Add interface to notify PSR of vblank enable/disable
Applying: drm/i915/dmc: Add interface to control start of PKG C-state exit
Applying: drm/i915/psr: Apply underrun on PSR idle workaround
Applying: drm/i915/display: Rename intel_psr_needs_block_dc_vblank
Applying: drm/i915/display: Rename vblank DC workaround functions and variables


