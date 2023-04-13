Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57DCC77B6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 08:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A0610EA81;
	Thu, 13 Apr 2023 08:51:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE44510EA80;
 Thu, 13 Apr 2023 08:51:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E650CAADE6;
 Thu, 13 Apr 2023 08:51:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Thu, 13 Apr 2023 08:51:15 -0000
Message-ID: <168137587594.3695.5861444067533450872@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230412142006.877109-1-jani.nikula@intel.com>
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe_=26_i915_display_integration_ifdef_cleanups=2C_part_2?=
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

Series: xe & i915 display integration ifdef cleanups, part 2
URL   : https://patchwork.freedesktop.org/series/116384/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 65c352d9134c4397b25f609de832ef2e2cae2241
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Wed Apr 12 13:58:38 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Wed Apr 12 14:00:49 2023 -0700

    fixup! drm/xe: Add Rocketlake device info
    
    Remove the continuation line that is not needed and make it follow the
    same style as the one for .cpu_transcoder_mask just above.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
=== git am output follows ===
Applying: drm/i915/display: add I915 conditional build to g4x_dp.h
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: add I915 conditional build to intel_dpio_phy.h
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: add I915 conditional build to intel_crt.h
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: add I915 conditional build to vlv_dsi.h
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
Applying: drm/i915/display: remove unnecessary i915_debugfs.h includes
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/i915/display: Remaining changes to make xe compile


