Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F247CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 10:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA1110FD3B;
	Wed,  3 Apr 2024 10:58:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F0010FD3B;
 Wed,  3 Apr 2024 10:58:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Enable_dislay_suppor?=
 =?utf-8?q?t_for_Battlemage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 10:58:16 -0000
Message-ID: <171214189647.1172471.12039212854540128715@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403105123.1327669-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240403105123.1327669-1-balasubramani.vivekanandan@intel.com>
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

Series: Enable dislay support for Battlemage
URL   : https://patchwork.freedesktop.org/series/131983/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 23e6199ddb93 drm-tip: 2024y-04m-03d-07h-14m-06s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_display_device.c:768
error: drivers/gpu/drm/i915/display/intel_display_device.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/display: Prepare to handle new C20 PLL register address
Applying: drm/xe/bmg: Add BMG platform definition
Applying: drm/xe/bmg: Define IS_BATTLEMAGE macro
Applying: drm/i915/bmg: Define IS_BATTLEMAGE macro
Applying: drm/i915/xe2: Skip CCS modifiers for Xe2 platforms
Applying: drm/i915/xe2hpd: Initial cdclk table
Applying: Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"
Applying: drm/i915/bmg: Extend DG2 tc check to future
Applying: drm/i915/xe2hpd: Properly disable power in port A
Applying: drm/i915/xe2hpd: Add new C20 PLL register address
Applying: drm/i915/xe2hpd: Add support for eDP PLL configuration
Applying: drm/i915/xe2hpd: update pll values in sync with Bspec
Applying: drm/i915/xe2hpd: Add display info
Patch failed at 0013 drm/i915/xe2hpd: Add display info
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


