Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB6DD49794
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 02:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CC310E186;
	Mon,  2 Dec 2024 02:49:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FFC10E186;
 Mon,  2 Dec 2024 02:49:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_AS=5FSDP_to_fast?=
 =?utf-8?q?set_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 02:49:01 -0000
Message-ID: <173310774141.1475915.12571503853778768072@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202024540.2578856-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241202024540.2578856-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Add AS_SDP to fastset (rev2)
URL   : https://patchwork.freedesktop.org/series/137034/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9b0aa1ea1d6b drm-tip: 2024y-12m-02d-01h-45m-24s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Add crtc_state dump for vrr.vsync params
Applying: drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
Applying: drm/i915/dp: fix the Adaptive sync Operation mode for SDP
Applying: drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
Applying: drm/i915/dp: Compute as_sdp based on if vrr possible
Applying: drm/i915/display: Move as sdp params change to fastset


