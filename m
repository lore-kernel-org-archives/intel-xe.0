Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75827C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 15:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52B210E0CB;
	Mon,  8 May 2023 15:20:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43ED910E0CB;
 Mon,  8 May 2023 15:20:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3901CA882E;
 Mon,  8 May 2023 15:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Mon, 08 May 2023 15:20:55 -0000
Message-ID: <168355925519.22735.4610557782595781345@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230508144618.162140-1-jani.nikula@intel.com>
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe=26i915_display_integration=3A_add_uncore_and_pcode_compat?=
 =?utf-8?q?_layers_=28rev2=29?=
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

Series: xe&i915 display integration: add uncore and pcode compat layers (rev2)
URL   : https://patchwork.freedesktop.org/series/117238/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 181b15c86 drm/xe: Print GT info on TLB inv failure
=== git am output follows ===
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Rename intel_de.h to xe_de.h
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Add more macros to remove all direct calls to uncore
Applying: fixup! drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support


