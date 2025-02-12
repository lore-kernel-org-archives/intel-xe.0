Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F3DC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 07:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6432A10E7D7;
	Wed, 12 Feb 2025 07:58:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CFC10E7D7;
 Wed, 12 Feb 2025 07:58:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=5Fi915=5Fprivate?=
 =?utf-8?q?_to_intel=5Fdisplay_cleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 07:58:57 -0000
Message-ID: <173934713716.1222194.902193913274437557@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212074542.3569452-1-suraj.kandpal@intel.com>
In-Reply-To: <20250212074542.3569452-1-suraj.kandpal@intel.com>
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

Series: drm_i915_private to intel_display cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/144587/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a5fe717b5665 drm-tip: 2025y-02m-12d-05h-53m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Use intel_display wherever possible
Applying: drm/i915/dpll: Change param to intel_display in for_each_shared_dpll
Applying: drm/i915/dpll: Use intel_display for dpll dump and compare hw state
Applying: drm/i915/dpll: Use intel_display possible in shared_dpll_mgr hooks
Applying: drm/i915/dpll: Use intel_display for asserting pll
Applying: drm/i915/dpll: Use intel_display for update_refclk hook
Applying: drm/i915/dpll: Accept intel_display as argument for shared_dpll_init
Applying: drm/i915/dpll: Replace all other leftover drm_i915_private


