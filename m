Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA56C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 13:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AA0113518;
	Wed, 17 Apr 2024 13:26:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91CC113518;
 Wed, 17 Apr 2024 13:26:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_better_h?=
 =?utf-8?q?igh_level_abstraction_for_display_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 13:26:03 -0000
Message-ID: <171336036375.1465249.17281567221717023505@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713358679.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713358679.git.jani.nikula@intel.com>
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

Series: drm/i915: better high level abstraction for display (rev3)
URL   : https://patchwork.freedesktop.org/series/130804/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 17eca6d8a1f3 drm-tip: 2024y-04m-17d-13h-23m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: add intel_display -> drm_device backpointer
Applying: drm/i915/display: add generic to_intel_display() macro
Applying: drm/i915: add generic __to_intel_display()
Applying: drm/i915/display: accept either i915 or display for feature tests
Applying: drm/i915/quirks: convert struct drm_i915_private to struct intel_display
Applying: drm/i915/display: rename __intel_wait_for_register_nowl() to indicate intel_de_
Applying: drm/i915/dmc: convert dmc wakelock interface to struct intel_display
Applying: drm/i915/de: allow intel_display and drm_i915_private for de functions
Applying: drm/i915/dmc: use struct intel_display more


