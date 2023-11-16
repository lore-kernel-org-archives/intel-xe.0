Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D2C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 11:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D3310E274;
	Thu, 16 Nov 2023 11:50:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3F10E274;
 Thu, 16 Nov 2023 11:50:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 925D3AA915;
 Thu, 16 Nov 2023 11:50:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Thu, 16 Nov 2023 11:50:35 -0000
Message-ID: <170013543559.3093.8196637569856834278@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116064145.3969338-1-jouni.hogander@intel.com>
In-Reply-To: <20231116064145.3969338-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Intel=5Ffb=2Ec_refactoring_=28rev2=29?=
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

Series: Intel_fb.c refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/126505/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: dd0e0baa9 mei/hdcp: Also enable for XE
=== git am output follows ===
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes"
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
Applying: drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
Applying: drm/i915/display: Split i915 specific code away from intel_fb.c
Applying: fixup! drm/xe/display: Implement display support


