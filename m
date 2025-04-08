Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28ABC369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E1D10E6AA;
	Tue,  8 Apr 2025 13:45:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330910E6AA;
 Tue,  8 Apr 2025 13:45:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/wm=3A_conve?=
 =?utf-8?q?rt_to_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 13:45:18 -0000
Message-ID: <174411991833.48086.7522830020021188540@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744119460.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744119460.git.jani.nikula@intel.com>
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

Series: drm/i915/wm: convert to struct intel_display (rev2)
URL   : https://patchwork.freedesktop.org/series/147192/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 584c899a45c3 drm-tip: 2025y-04m-08d-13h-12m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/wm: convert intel_wm.h external interfaces to struct intel_display
Applying: drm/i915/wm: convert intel_wm.c internally to struct intel_display
Applying: drm/i915/wm: convert skl_watermark.h external interfaces to struct intel_display
Applying: drm/i915/wm: convert skl_watermarks.c internally to struct intel_display
Applying: drm/i915/wm: convert i9xx_wm.h external interfaces to struct intel_display
Applying: drm/i915/wm: convert i9xx_wm.c to intel_de_*() register interface
Applying: drm/i915/wm: convert i9xx_wm.c internally to struct intel_display


