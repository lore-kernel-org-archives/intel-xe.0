Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FB4E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 07:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFF310ECFD;
	Thu,  9 Jan 2025 07:46:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1E10ECFD;
 Thu,  9 Jan 2025 07:46:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PSR_DSB_support_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 07:46:08 -0000
Message-ID: <173640876842.1554074.15096960569080807919@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109073137.1977494-1-jouni.hogander@intel.com>
In-Reply-To: <20250109073137.1977494-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev3)
URL   : https://patchwork.freedesktop.org/series/142521/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9e5828f71dbb drm-tip: 2025y-01m-08d-23h-05m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
Applying: drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_update
Applying: drm/i915/psr: Split setting sff and cff bits away from intel_psr_force_update
Applying: drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL registers
Applying: drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
Applying: drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
Applying: drm/i915/psr: Changes for PSR2_MAN_TRK_CTL handling when DSB is in use
Applying: drm/i915/psr: Add intel_psr_is_psr_mode_changing
Applying: drm/i915/display: Don't use DSB if psr mode changing
Applying: drm/i915/psr: Allow DSB usage when PSR is enabled


