Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6017CC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 17:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0B10E87E;
	Wed,  2 Apr 2025 17:28:42 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB8610E87B;
 Wed,  2 Apr 2025 17:28:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Precompu?=
 =?utf-8?q?te_plane_SURF_address/etc=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 17:28:41 -0000
Message-ID: <174361492176.28827.7461936996668280782@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402172240.9275-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250402172240.9275-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Precompute plane SURF address/etc. (rev2)
URL   : https://patchwork.freedesktop.org/series/147096/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6deef7a0418b drm-tip: 2025y-04m-02d-14h-43m-47s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Precompute plane SURF address
Applying: drm/i915: Nuke intel_plane_ggtt_offset()
Applying: drm/i915: Move the intel_dpt_offset() check into intel_plane_pin_fb()
Applying: drm/i915: Use i915_vma_offset() in intel_dpt_offset()
Applying: drm/i915: Remove unused dpt_total_entries()
Applying: drm/i915: Don't pass crtc_state to foo_plane_ctl() & co.


