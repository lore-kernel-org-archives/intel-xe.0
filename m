Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E84C3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 10:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B36C10E181;
	Fri,  2 May 2025 10:16:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427EB10E181;
 Fri,  2 May 2025 10:16:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Panel_Replay_+_Adapt?=
 =?utf-8?q?ive_sync?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 10:16:47 -0000
Message-ID: <174618100727.34761.14997699015492638899@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502085902.154740-1-jouni.hogander@intel.com>
In-Reply-To: <20250502085902.154740-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync
URL   : https://patchwork.freedesktop.org/series/148540/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b99e82e12d60 drm-tip: 2025y-05m-02d-10h-00m-48s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add Panel Replay capability bits from DP2.1 specification
Applying: drm/i915/psr: Read both Panel Replay capability registers from DPCD
Applying: drm/i915/alpm: Add PR_ALPM_CTL register definitions
Applying: drm/i915/alpm: Write PR_ALPM_CTL register
Applying: drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
Applying: drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
Applying: drm/i915/alpm: Move port alpm configuration
Applying: drm/i915/display: Add PHY_CMN1_CONTROL register definitions
Applying: drm/i915/display: Add function to configure LFPS sending
Applying: drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
Applying: drm/i915/psr: Do not disable Panel Replay in case VRR is enabled


