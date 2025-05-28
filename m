Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2875EC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 08:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3A410E592;
	Wed, 28 May 2025 08:04:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431410E592;
 Wed, 28 May 2025 08:04:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Panel_Replay_+_Adapt?=
 =?utf-8?q?ive_sync_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 08:04:18 -0000
Message-ID: <174841945880.27115.10384972707019930763@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync (rev3)
URL   : https://patchwork.freedesktop.org/series/149487/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 07b6736f75df drm-tip: 2025y-05m-27d-20h-13m-12s UTC integration manifest
=== git am output follows ===
Applying: drm/panelreplay: Panel Replay capability DPCD register definitions
Applying: drm/dp: Add Panel Replay capability bits from DP2.1 specification
Applying: drm/i915/psr: Read all Panel Replay capability registers from DPCD
Applying: drm/i915/alpm: Add PR_ALPM_CTL register definitions
Applying: drm/i915/alpm: Write PR_ALPM_CTL register
Applying: drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
Applying: drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
Applying: drm/i915/alpm: Move port alpm configuration
Applying: drm/i915/display: Add PHY_CMN1_CONTROL register definitions
Applying: drm/i915/display: Add function to configure LFPS sending
Applying: drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
Applying: drm/i915/psr: Do not disable Panel Replay in case VRR is enabled


