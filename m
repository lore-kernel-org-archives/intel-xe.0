Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E1E68955
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 11:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C560C10E061;
	Thu, 31 Oct 2024 11:44:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE5310E061;
 Thu, 31 Oct 2024 11:44:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?make_all_i915=5Fdrv=2Eh_includes_explicit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 11:44:43 -0000
Message-ID: <173037508323.1378613.13695878577753682713@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730374470.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730374470.git.jani.nikula@intel.com>
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

Series: drm/i915/display: make all i915_drv.h includes explicit
URL   : https://patchwork.freedesktop.org/series/140765/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d9e9e1b912c1 drm-tip: 2024y-10m-31d-10h-12m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/gvt: always pass struct intel_display * to register macros
Applying: drm/i915: extract intel_uncore_trace.[ch]
Applying: drm/i915/display: add intel_display_conversion.c to hide stuff better
Applying: drm/i915/uncore: add to_intel_uncore() and use it
Applying: drm/i915/display: add struct drm_device to struct intel_display conversion function
Applying: drm/i915/display: drop i915_drv.h include from intel_display_trace.h


