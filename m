Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBD3C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 18:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6681D10E602;
	Fri,  2 Jun 2023 18:39:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D57D210E602;
 Fri,  2 Jun 2023 18:39:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CDC56AADE3;
 Fri,  2 Jun 2023 18:39:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Fri, 02 Jun 2023 18:39:45 -0000
Message-ID: <168573118580.15700.4575073846427330865@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602175444.3511273-1-jani.nikula@intel.com>
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/4=5D_Revert_=22drm/i915/display=3A?=
 =?utf-8?q?_Fix_a_use-after-free_when_intel=5Fedp=5Finit=5Fconnector_fails?=
 =?utf-8?q?=22?=
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

Series: series starting with [1/4] Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
URL   : https://patchwork.freedesktop.org/series/118794/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ef153c77d fixup! drm/xe: Apply upper limit to sg element size
=== git am output follows ===
Applying: Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
Applying: drm/i915: Flush power delayed put when connector init failed
Applying: Revert "drm/i915/display: Remove i915_drm_suspend_mode"
Applying: drm/i915: Remove i915_drm_suspend_mode


