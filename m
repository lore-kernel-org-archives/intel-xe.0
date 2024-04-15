Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543F110E3EA;
	Mon, 15 Apr 2024 19:43:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0B110F889;
 Mon, 15 Apr 2024 19:43:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_display_suppo?=
 =?utf-8?q?rt_for_Battlemage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 19:43:21 -0000
Message-ID: <171321020165.1423804.6460245105110214791@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
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

Series: Enable display support for Battlemage
URL   : https://patchwork.freedesktop.org/series/132430/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1bfe3965a846 drm-tip: 2024y-04m-15d-18h-46m-59s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/display: Lane reversal requires writes to both context lanes
Applying: drm/i915/display: Enable RM timeout detection
Applying: drm/i915/bmg: Define IS_BATTLEMAGE macro
Applying: drm/i915/xe2hpd: Skip CCS modifiers
Applying: drm/i915/xe2hpd: Initial cdclk table
Applying: drm/i915/bmg: Extend DG2 tc check to future
Applying: drm/i915/xe2hpd: Properly disable power in port A
Applying: drm/i915/xe2hpd: Add new C20 PHY SRAM address
Applying: drm/i915/xe2hpd: Add support for eDP PLL configuration
Applying: drm/i915/xe2hpd: update pll values in sync with Bspec
Applying: drm/i915/xe2hpd: Add display info
Applying: drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes
Applying: drm/i915/xe2hpd: Add max memory bandwidth algorithm
Applying: drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
Applying: drm/i915/bmg: BMG should re-use MTL's south display logic
Applying: Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"
Applying: drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
Applying: drm/xe/gt_print: add xe_gt_err_once()
Applying: drm/xe/device: implement transient flush
Applying: drm/i915/display: perform transient flush
Applying: drm/xe/bmg: Enable the display support


