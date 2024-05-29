Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34486C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF08910E101;
	Wed, 29 May 2024 18:26:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E910E101;
 Wed, 29 May 2024 18:26:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915_and_drm/xe_?=
 =?utf-8?q?display_and_compat_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 18:26:25 -0000
Message-ID: <171700718504.2233681.11988473565955894688@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1717004739.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717004739.git.jani.nikula@intel.com>
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

Series: drm/i915 and drm/xe display and compat cleanups
URL   : https://patchwork.freedesktop.org/series/134197/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 55d6179b96e0 drm-tip: 2024y-05m-29d-17h-29m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: include gem/i915_gem_stolen.h where needed
Applying: drm/i915/display: include gt/intel_gt_types.h where needed
Applying: drm/i915/display: include i915_gpu_error.h where needed
Applying: drm/i915/display: include intel_uncore.h where needed
Applying: drm/i915/display: include intel_step.h where needed
Applying: drm/i915/display: include xe_bo.h, gem_object_types etc. where needed
Applying: drm/xe/display: move compat uncore stubs to the correct file
Applying: drm/xe/display: move compat runtime pm stubs to the correct file
Applying: drm/xe/display: reduce includes in compat i915_drv.h
Applying: drm/xe/display: drop i915_drv.h include from xe code


