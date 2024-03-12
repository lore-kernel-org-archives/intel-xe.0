Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9549DC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 17:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1010F0F9;
	Tue, 12 Mar 2024 17:49:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318CA10E37B;
 Tue, 12 Mar 2024 17:49:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_LNL_display_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 17:49:58 -0000
Message-ID: <171026579820.695179.4711774618902032782@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312163639.172321-1-gustavo.sousa@intel.com>
In-Reply-To: <20240312163639.172321-1-gustavo.sousa@intel.com>
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

Series: Enable LNL display (rev2)
URL   : https://patchwork.freedesktop.org/series/130688/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1dfbf3ced622 drm-tip: 2024y-03m-12d-14h-18m-23s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/cdclk: Rename lnl_cdclk_table to xe2lpd_cdclk_table
Applying: drm/i915/cdclk: Add and use mdclk_source_is_cdclk_pll()
Applying: drm/i915/cdclk: Only compute squash waveform when necessary
Applying: drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
Applying: drm/i915: Add mdclk_cdclk_ratio to intel_dbuf_state
Applying: drm/i915/xe2lpd: Support MDCLK:CDCLK ratio changes
Applying: drm/i915/xe2lpd: Load DMC
Applying: drm/xe/lnl: Enable display support


