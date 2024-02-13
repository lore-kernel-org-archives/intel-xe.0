Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2546C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 12:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6C10E15B;
	Tue, 13 Feb 2024 12:28:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C99D10E15B;
 Tue, 13 Feb 2024 12:28:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/mst=3A_enab?=
 =?utf-8?q?le_MST_mode_for_128b/132b_single-stream_sideband?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 12:28:21 -0000
Message-ID: <170782730111.1201024.5711156141589677503@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1707823736.git.jani.nikula@intel.com>
In-Reply-To: <cover.1707823736.git.jani.nikula@intel.com>
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

Series: drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
URL   : https://patchwork.freedesktop.org/series/129828/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7c8e91355 drm-tip: 2024y-02m-13d-12h-10m-52s UTC integration manifest
=== git am output follows ===
Applying: drm/mst: read sideband messaging cap
Applying: drm/i915/mst: improve debug logging of DP MST mode detect
Applying: drm/i915/mst: abstract choosing the MST mode to use
Applying: drm/i915/mst: use the MST mode detected previously
Applying: drm/i915/mst: add intel_dp_mst_disconnect()
Applying: drm/i915/mst: enable MST mode for 128b/132b single-stream sideband


