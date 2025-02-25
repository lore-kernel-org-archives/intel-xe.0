Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83883C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 18:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E936110E7A6;
	Tue, 25 Feb 2025 18:52:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751C10E7A6;
 Tue, 25 Feb 2025 18:52:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_struct_i?=
 =?utf-8?q?ntel=5Fdisplay_conversions=2C_part_2434235?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 18:52:21 -0000
Message-ID: <174050954109.2042575.4265466617037660308@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740502116.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740502116.git.jani.nikula@intel.com>
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

Series: drm/i915: struct intel_display conversions, part 2434235
URL   : https://patchwork.freedesktop.org/series/145418/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 533a24b8fa29 drm-tip: 2025y-02m-25d-16h-47m-50s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: remove leftover struct drm_i915_private forward declarations
Applying: drm/i915/debugfs: continue display debugfs struct intel_display conversion
Applying: drm/i915/tdf: convert intel_tdf.[ch] to struct intel_display
Applying: drm/i915/snps: convert intel_snps_phy.[ch] to struct intel_display
Applying: drm/i915/dkl: convert intel_dkl_phy.[ch] to struct intel_display
Applying: drm/i915/drrs: convert intel_drrs.[ch] to struct intel_display
Applying: drm/i915/display: convert the M/N functions to struct intel_display
Applying: drm/i915/dpt: convert intel_dpt.[ch] interfaces to struct intel_display
Applying: drm/i915/fbc: convert intel_fbc.[ch] to struct intel_display
Applying: drm/i915/rps: convert intel_display_rps.[ch] to struct intel_display
Applying: drm/i915/ddi: convert intel_wait_ddi_buf_idle() to struct intel_display
Applying: drm/i915/fdi: convert intel_fdi.[ch] to struct intel_display


