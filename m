Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F287C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 17:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6410E1A1;
	Wed, 26 Mar 2025 17:45:25 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0710E1A1;
 Wed, 26 Mar 2025 17:45:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_sagv/bw_?=
 =?utf-8?q?cleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 17:45:23 -0000
Message-ID: <174301112396.5929.13515004661290074888@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326162544.3642-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250326162544.3642-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: sagv/bw cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/146013/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 14c330bc015d drm-tip: 2025y-03m-26d-04h-35m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Drop the cached per-pipe min_cdclk[] from bw state
Applying: drm/i915: s/intel_crtc_bw/intel_dbuf_bw/
Applying: drm/i915: Extract intel_dbuf_bw_changed()
Applying: drm/i915: Pass intel_dbuf_bw to skl_*_calc_dbuf_bw() explicitly
Applying: drm/i915: Avoid triggering unwanted cdclk changes due to dbuf bandwidth changes
Applying: drm/i915: Do more bw readout
Applying: drm/i915: Flag even inactive crtcs as "inherited"
Applying: drm/i915: Drop force_check_qgv
Applying: drm/i915: Extract intel_bw_modeset_checks()
Applying: drm/i915: Extract intel_bw_check_sagv_mask()
Applying: drm/i915: Make intel_bw_check_sagv_mask() internal to intel_bw.c
Applying: drm/i915: Make intel_bw_modeset_checks() internal to intel_bw_atomic_check()
Applying: drm/i915: Skip bw stuff if per-crtc sagv state doesn't change
Applying: drm/i915: Eliminate intel_compute_sagv_mask()


