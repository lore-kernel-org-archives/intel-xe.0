Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB59C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 14:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ED81122E8;
	Tue, 28 May 2024 14:32:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D91122E8;
 Tue, 28 May 2024 14:32:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_mem/fsb/?=
 =?utf-8?q?rawclk_freq_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 14:32:07 -0000
Message-ID: <171690672795.2216896.9012367080269627774@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716906179.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716906179.git.jani.nikula@intel.com>
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

Series: drm/i915: mem/fsb/rawclk freq cleanups
URL   : https://patchwork.freedesktop.org/series/134144/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 19284ac03993 drm-tip: 2024y-05m-28d-14h-14m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/wm: rename intel_get_cxsr_latency -> pnv_get_cxsr_latency
Applying: drm/i915/wm: clarify logging on not finding CxSR latency config
Applying: drm/i915/dram: separate fsb freq detection from mem freq
Applying: drm/i915/dram: split out pnv DDR3 detection
Applying: drm/i915/dram: rearrange mem freq init
Applying: drm/i915: convert fsb_freq and mem_freq to kHz
Applying: drm/i915: extend the fsb_freq initialization to more platforms
Applying: drm/i915: use i9xx_fsb_freq() for GT clock frequency
Applying: drm/i915/cdclk: use i9xx_fsb_freq() for rawclk_freq initialization
Applying: drm/i915: move rawclk init to intel_cdclk_init()
Applying: drm/i915: move rawclk from runtime to display runtime info
Applying: drm/xe/display: drop unused rawclk_freq and RUNTIME_INFO()


