Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59153C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9E10E96B;
	Wed, 19 Apr 2023 12:43:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 565D410E96B;
 Wed, 19 Apr 2023 12:43:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4B823AADE8;
 Wed, 19 Apr 2023 12:43:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 19 Apr 2023 12:43:22 -0000
Message-ID: <168190820227.10529.14409849732074429273@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230419123947.543175-1-jani.nikula@intel.com>
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe_=26_i915_display_integration_cleanups?=
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

Series: xe & i915 display integration cleanups
URL   : https://patchwork.freedesktop.org/series/116692/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: daab2a455 drm/xe/tlb: fix expected_seqno calculation
=== git am output follows ===
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
Applying: drm/i915/display: add I915 conditional build to i9xx_wm.h
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915: use explicit includes for i915_reg.h and i915_irq.h
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile


