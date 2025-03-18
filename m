Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6DC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 13:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A653410E48F;
	Tue, 18 Mar 2025 13:44:29 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F74B10E48B;
 Tue, 18 Mar 2025 13:44:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Underrun_on_idle_PSR?=
 =?utf-8?q?_workaround_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Mar 2025 13:44:29 -0000
Message-ID: <174230546918.48652.17162866023610304503@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317081905.3683654-1-jouni.hogander@intel.com>
In-Reply-To: <20250317081905.3683654-1-jouni.hogander@intel.com>
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

Series: Underrun on idle PSR workaround (rev5)
URL   : https://patchwork.freedesktop.org/series/145987/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a958e31a81b3 drm-tip: 2025y-03m-15d-18h-50m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add new interface for getting dc_state
Applying: drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
Applying: drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
Applying: drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
Applying: drm/i915/psr: Write PIPEDMC_BLOCK_PKGC_SW when enabling PSR
Applying: drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
Applying: drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
Applying: drm/i915/psr: Add interface to notify PSR of vblank enable/disable
Applying: drm/i915/psr: Apply underrun on PSR idle workaround
Applying: drm/i915/display: Rename intel_psr_needs_block_dc_vblank
Applying: drm/i915/display: Rename vblank DC workaround functions and variables


