Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25121D3E798
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 09:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86A110E2FD;
	Wed,  6 Nov 2024 09:46:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D2B10E2FD;
 Wed,  6 Nov 2024 09:46:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?convert_display_feature_helpers_to_struct_intel=5Fdisplay_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 09:46:48 -0000
Message-ID: <173088640866.1415808.14197746810997582098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730740629.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730740629.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert display feature helpers to struct intel_display (rev3)
URL   : https://patchwork.freedesktop.org/series/140887/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e6ccd1b8868e drm-tip: 2024y-11m-06d-06h-24m-38s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: identify discrete graphics
Applying: drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
Applying: drm/i915/display: convert HAS_4TILE() to struct intel_display
Applying: drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
Applying: drm/i915/display: convert HAS_DP20() to struct intel_display
Applying: drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
Applying: drm/i915/display: convert HAS_IPS() to struct intel_display
Applying: drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
Applying: drm/i915/display: convert HAS_SAGV() to struct intel_display
Applying: drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
Applying: drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
Applying: drm/i915/display: rename i915 parameter to __display in feature helpers
Applying: drm/i915/display: convert display device identification to struct intel_display
Applying: drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
Applying: drm/i915/display: add mobile platform group


