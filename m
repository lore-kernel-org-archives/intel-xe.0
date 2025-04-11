Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C511C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 04:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174910EAC3;
	Fri, 11 Apr 2025 04:36:17 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F327010EAC3;
 Fri, 11 Apr 2025 04:36:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Modify_drm_helpers_t?=
 =?utf-8?q?o_use_luminance?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 04:36:16 -0000
Message-ID: <174434617699.2539.11420617041017510987@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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

Series: Modify drm helpers to use luminance
URL   : https://patchwork.freedesktop.org/series/147565/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9337ad48531f drm-tip: 2025y-04m-11d-00h-43m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Introduce new member in drm_backlight_info
Applying: drm/dp: Add argument in drm_edp_backlight_init
Applying: drm/dp: Add argument for luminance range info in drm_edp_backlight_init
Applying: drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
Applying: drm/dp: Change current_level argument type to u32
Applying: drm/dp: Modify drm_edp_probe_state
Applying: drm/dp: Change argument type for drm_edp_backlight_set_level
Applying: drm/dp: Modify drm_edp_backlight_set_level
Applying: drm/dp: Change argument type of drm_edp_backlight_enable
Applying: drm/dp: Enable backlight control using luminance
Applying: drm/i915/backlight: Use drm helper to initialize edp backlight
Applying: drm/i915/backlight: Use drm helper to set edp backlight
Applying: drm/i915/backlight: Use drm_edp_backlight_enable


