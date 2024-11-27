Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EE0D609A8
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 07:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87D510E9E2;
	Wed, 27 Nov 2024 07:14:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FE410E9E2;
 Wed, 27 Nov 2024 07:14:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Refactor_VRR_for_dif?=
 =?utf-8?q?ferent_VRR_timing_generator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 07:14:42 -0000
Message-ID: <173269168259.3641940.1122856739292404288@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127071136.1017190-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241127071136.1017190-1-ankit.k.nautiyal@intel.com>
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

Series: Refactor VRR for different VRR timing generator
URL   : https://patchwork.freedesktop.org/series/141819/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 241f1fd26b38 drm-tip: 2024y-11m-27d-03h-24m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Refactor VRR Timing Computation
Applying: drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
Applying: drm/i915/vrr: Introduce new field for VRR mode
Applying: drm/i915/vrr: Fill VRR timing generator mode for CMRR and VRR
Applying: drm/i915/display: Remove vrr.enable and instead check vrr.mode != NONE
Applying: drm/i915/display: Absorb cmrr attributes into vrr struct
Applying: drm/i915/display: Add vrr mode to crtc_state dump


