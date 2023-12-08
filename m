Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B11C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 01:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACA610E9CC;
	Fri,  8 Dec 2023 01:11:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 279B410E9CA;
 Fri,  8 Dec 2023 01:11:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1FA2BA7DFF;
 Fri,  8 Dec 2023 01:11:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Intel=5Ffb=2Ec_refac?=
 =?utf-8?q?toring_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Fri, 08 Dec 2023 01:11:34 -0000
Message-ID: <170199789412.7327.6133409027016795779@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207155815.2467082-1-jouni.hogander@intel.com>
In-Reply-To: <20231207155815.2467082-1-jouni.hogander@intel.com>
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

Series: Intel_fb.c refactoring (rev8)
URL   : https://patchwork.freedesktop.org/series/126505/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 2fb92bd63 drm/xe: Rename info.supports_* to info.has_*
=== git am output follows ===
Applying: Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes"
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
Applying: drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
Applying: drm/i915/display: Handle invalid fb_modifier in intel_fb_modifier_to_tiling
Applying: drm/i915/display: Split i915 specific code away from intel_fb.c
Applying: drm/i915/display: Add intel_fb_bo_framebuffer_fini
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support


