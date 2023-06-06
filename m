Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128FC7EE37
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BB610E06E;
	Tue,  6 Jun 2023 23:55:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2340910E06E;
 Tue,  6 Jun 2023 23:55:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1C474AADD6;
 Tue,  6 Jun 2023 23:55:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 06 Jun 2023 23:55:48 -0000
Message-ID: <168609574808.22671.8794884644248553572@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Utilize_i915_display_probing_=28rev2=29?=
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

Series: Utilize i915 display probing (rev2)
URL   : https://patchwork.freedesktop.org/series/118675/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: a17ea8317 drm/xe: REBAR resize should be best effort
=== git am output follows ===
Applying: drm/i915/display: Move display device info to header under display/
Applying: drm/i915: Convert INTEL_INFO()->display to a pointer
Applying: drm/i915/display: Move display runtime info to display structure
Applying: drm/i915/display: Make display responsible for probing its own IP
Applying: drm/i915/display: Handle GMD_ID identification in display code
Applying: drm/i915/display: Move feature test macros to intel_display_device.h
Applying: drm/i915/display: Include of display limits doesn't need 'display/'
Applying: drm/i915: Fix error handling if driver creation fails during probe
Applying: drm/i915/display: Extract display init from intel_device_info_runtime_init
Applying: fixup! drm/xe/display: Implement display support


