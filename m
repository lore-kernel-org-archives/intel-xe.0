Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D26C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A110E24E;
	Thu, 30 Jan 2025 05:26:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACEE10E24E;
 Thu, 30 Jan 2025 05:26:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_AS=5FSDP_to_fast?=
 =?utf-8?q?set_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 05:26:35 -0000
Message-ID: <173821479595.2729638.458210468549389516@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Add AS_SDP to fastset (rev3)
URL   : https://patchwork.freedesktop.org/series/137034/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c2a5da40b8b1 drm-tip: 2025y-01m-29d-20h-15m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Add crtc_state dump for vrr.vsync params
Applying: drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
Applying: drm/i915/dp: fix the Adaptive sync Operation mode for SDP
Applying: drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
Applying: drm/i915/dp: Compute as_sdp based on if vrr possible
Applying: drm/i915/display: Move as sdp params change to fastset


