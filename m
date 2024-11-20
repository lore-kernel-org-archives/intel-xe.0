Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562AAD63934
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 12:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CFF10E118;
	Wed, 20 Nov 2024 12:24:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A910E118;
 Wed, 20 Nov 2024 12:24:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?make_all_i915=5Fdrv=2Eh_includes_explicit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 12:24:34 -0000
Message-ID: <173210547433.711907.17551995647603316882@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732104170.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732104170.git.jani.nikula@intel.com>
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

Series: drm/i915/display: make all i915_drv.h includes explicit (rev2)
URL   : https://patchwork.freedesktop.org/series/140765/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6992ee4b9cd5 drm-tip: 2024y-11m-20d-11h-47m-34s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/gvt: always pass struct intel_display * to register macros
Applying: drm/i915: extract intel_uncore_trace.[ch]
Applying: drm/i915/display: add intel_display_conversion.c to hide stuff better
Applying: drm/i915/uncore: add to_intel_uncore() and use it
Applying: drm/i915/display: add struct drm_device to struct intel_display conversion function
Applying: drm/i915/display: drop i915_drv.h include from intel_display_trace.h


