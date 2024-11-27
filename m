Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E31FD6ACC3
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 12:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABC10E279;
	Wed, 27 Nov 2024 12:20:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9C10E279;
 Wed, 27 Nov 2024 12:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_prunue_audio_frequen?=
 =?utf-8?q?cies_based_on_bw_limits_for_DP2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 12:20:37 -0000
Message-ID: <173271003749.3703865.2627692413193571287@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127120715.185348-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241127120715.185348-1-vinod.govindapillai@intel.com>
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

Series: prunue audio frequencies based on bw limits for DP2
URL   : https://patchwork.freedesktop.org/series/141839/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e5e3c93cf64 drm-tip: 2024y-11m-27d-11h-14m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: create a common function to check validity of ELD
Applying: drm/i915/display: update call to intel_dp_audio_compute_config
Applying: drm/i915/display: check and prune audio frequencies based on bw limits in DP2.0
Applying: drm/i915/display: iterate through channels if no feasible frequencies
Applying: drm/i915/display: update audio support based on the available frequencies
Applying: drm/i915/display: update audio bw calculations for MTL


