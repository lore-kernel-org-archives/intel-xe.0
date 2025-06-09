Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0CBC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 19:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FDB10E43F;
	Mon,  9 Jun 2025 19:22:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C984710E428;
 Mon,  9 Jun 2025 19:22:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/flipq=3A_Ro?=
 =?utf-8?q?ugh_flip_queue_implementation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 19:22:41 -0000
Message-ID: <174949696182.61787.6887823038637327043@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/flipq: Rough flip queue implementation (rev6)
URL   : https://patchwork.freedesktop.org/series/149109/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 52ecbb6a6878 drm-tip: 2025y-06m-09d-17h-17m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
Applying: drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
Applying: drm/i915/dsb: Introduce intel_dsb_exec_time_us()
Applying: drm/i915/dsb: Garbage collect the MMIO DEwake stuff
Applying: drm/i915/dsb: Move the DSB_PMCTRL* reset out of intel_dsb_finish()
Applying: drm/i915/dsb: Disable the GOSUB interrupt
Applying: drm/i915/dmc: Limit PIPEDMC clock gating w/a to just ADL/DG2/MTL
Applying: drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
Applying: drm/i915: Set PKG_C_LATENCY.added_wake_time to 0
Applying: drm/i915: Try to program PKG_C_LATENCY more correctly
Applying: drm/i915/dmc: Shuffle code around
Applying: drm/i915/dmc: Reload PIPEDMC MMIO registers for pipe C/D on PTL+
Applying: drm/i915/dmc: Assert DMC is loaded harder
Applying: drm/i915/dmc: Define flip queue related PIPEDMC registers
Applying: drm/i915/flipq: Provide the nuts and bolts code for flip queue
Applying: drm/i915/flipq: Implement flip queue based commit path
Applying: drm/i915/flipq: Implement Wa_18034343758
Applying: drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
Applying: drm/i915/flipq: Add intel_flipq_dump()
Applying: drm/i915/flipq: Enable flipq by default for testing
Applying: drm/i915/flipq: Disable PSR for extra flip queue coverage


