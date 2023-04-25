Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA7BC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B486610E137;
	Tue, 25 Apr 2023 19:29:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EC2A10E137;
 Tue, 25 Apr 2023 19:29:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 58949A0BCB;
 Tue, 25 Apr 2023 19:29:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 25 Apr 2023 19:29:15 -0000
Message-ID: <168245095533.25939.7849374369049771763@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230425192624.168640-1-jose.souza@intel.com>
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Display_fixes_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Display fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/116898/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: c3d139461 drm/xe: Keep all resize bar related prints inside xe_resize_vram_bar
=== git am output follows ===
.git/rebase-apply/patch:213: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/i915/display: remove intel_display_commit_duplicated_state()
Applying: drm/i915/display: start high level display driver file
Applying: drm/i915/display: move intel_modeset_probe_defer() to intel_display_driver.[ch]
Applying: drm/i915/display: rename intel_modeset_probe_defer() -> intel_display_driver_probe_defer()
Applying: drm/i915/display: move modeset probe/remove functions to intel_display_driver.c
Applying: drm/i915/display: rename intel_display_driver_* functions
Applying: drm/i915/display: add intel_display_reset.[ch]
Applying: drm/i915/display: move display suspend/resume to intel_display_driver.[ch]
Applying: drm/i915/display: rename intel_display_driver_suspend/resume functions
Applying: drm/i915/display: add intel_display_driver_early_probe()
Applying: drm/i915: Initialize dkl_phy spin lock from display code path
Applying: squash! drm/xe/display: Implement display support
Applying: TEMPORARY: drm/xe/display: Enable modular fia in TGL
Applying: drm/xe/display: Disable PSR HW tracking by default in all display versions
Applying: drm/xe: Enable Raptorlake-P


