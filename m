Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7844C77B78
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820D010E478;
	Mon, 24 Apr 2023 16:54:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B26810E478;
 Mon, 24 Apr 2023 16:54:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7230AAADE6;
 Mon, 24 Apr 2023 16:54:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 24 Apr 2023 16:54:17 -0000
Message-ID: <168235525746.1231.7949886594176010055@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230424165135.132494-1-jose.souza@intel.com>
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Display_fixes?=
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

Series: Display fixes
URL   : https://patchwork.freedesktop.org/series/116898/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3cf57993a fixup! drm/xe/display: Implement display support
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


