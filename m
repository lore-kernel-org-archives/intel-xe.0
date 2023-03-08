Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859ABC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 10:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C99910E10A;
	Wed,  8 Mar 2023 10:44:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BCF810E10A;
 Wed,  8 Mar 2023 10:44:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 64119AADE3;
 Wed,  8 Mar 2023 10:44:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 08 Mar 2023 10:44:13 -0000
Message-ID: <167827225337.20397.4026805963264771508@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230303105222.3550161-1-jani.nikula@intel.com>
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_clean_up_i915_includes_both_sides_=28rev2=29?=
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

Series: drm/xe: clean up i915 includes both sides (rev2)
URL   : https://patchwork.freedesktop.org/series/114573/
State : failure

== Summary ==

error: patch failed: drivers/gpu/drm/i915/display/intel_backlight.c:19
error: drivers/gpu/drm/i915/display/intel_backlight.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_bw.c:15
error: drivers/gpu/drm/i915/display/intel_bw.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_cdclk.c:32
error: drivers/gpu/drm/i915/display/intel_cdclk.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_display_power.c:16
error: drivers/gpu/drm/i915/display/intel_display_power.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_gmbus.c:39
error: drivers/gpu/drm/i915/display/intel_gmbus.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_opregion.c:37
error: drivers/gpu/drm/i915/display/intel_opregion.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/skl_watermark.c:16
error: drivers/gpu/drm/i915/display/skl_watermark.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915/display: don't use relative ../i915 includes
Patch failed at 0001 drm/i915/display: don't use relative ../i915 includes
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


