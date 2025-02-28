Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1589C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 11:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBBB10E093;
	Fri, 28 Feb 2025 11:13:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF87310E093;
 Fri, 28 Feb 2025 11:13:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/fbc=3A_FBC_?=
 =?utf-8?q?Dirty_rect_feature_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 11:13:37 -0000
Message-ID: <174074121771.3196042.2041695615097814861@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support (rev4)
URL   : https://patchwork.freedesktop.org/series/144723/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4a83bc30b7 drm-tip: 2025y-02m-28d-10h-14m-07s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fbc: remove one duplicate forward declaration
Applying: drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
Applying: drm/i915/display: update and store the plane damage clips
Applying: drm/i915/fbc: add register definitions for fbc dirty rect support
Applying: drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
Applying: drm/i915/fbc: avoid calling fbc activate if fbc is active
Applying: drm/i915/fbc: dirty rect support for FBC
Applying: drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
Applying: drm/i915/fbc: handle dirty rect coords for the first frame


