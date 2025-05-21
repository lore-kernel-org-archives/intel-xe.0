Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AFFC2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 18:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0664910E76E;
	Wed, 21 May 2025 18:34:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4464510E76E;
 Wed, 21 May 2025 18:34:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv2=2C01/13=5D_drm/i915/dsb=3A_Extract_intel=5Fdsb=5Fins=5Fali?=
 =?utf-8?q?gn=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 18:34:43 -0000
Message-ID: <174785248327.11141.10119581235202717687@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521181645.32737-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250521181645.32737-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [v2,01/13] drm/i915/dsb: Extract intel_dsb_ins_align()
URL   : https://patchwork.freedesktop.org/series/149343/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2d8dc23f1e6c drm-tip: 2025y-05m-21d-13h-29m-52s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsb: Extract intel_dsb_ins_align()
Applying: drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
Applying: drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
Applying: drm/i915/dsb: Extract intel_dsb_{head,tail}()
Applying: drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
Applying: drm/i915/dsb: Introduce intel_dsb_exec_time_us()
Applying: drm/i915/dmc: Define flip queue related PIPEDMC registers
Applying: drm/i915/flipq: Provide the nuts and bolts code for flip queue
Applying: drm/i915/flipq: Implement flip queue based commit path
Applying: drm/i915/flipq: Implement Wa_18034343758
Applying: drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
Applying: drm/i915/flipq: Add intel_flipq_dump()
Applying: drm/i915/flipq: Enable flipq by default for testing


