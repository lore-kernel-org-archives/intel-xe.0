Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D698C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DF410E0CE;
	Wed, 12 Feb 2025 14:30:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917F510E0CE;
 Wed, 12 Feb 2025 14:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/fbc=3A_FBC_?=
 =?utf-8?q?Dirty_rect_feature_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 14:30:23 -0000
Message-ID: <173937062359.1323172.8987441936250253210@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250212131420.60026-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: FBC Dirty rect feature support
URL   : https://patchwork.freedesktop.org/series/144723/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5bf5e8eecd1e drm-tip: 2025y-02m-12d-13h-03m-20s UTC integration manifest
=== git am output follows ===
Applying: drm/damage-helper: add const qualifier in drm_atomic_helper_damage_merged()
Applying: drm/i915/xe3: update and store the plane damage clips
Applying: drm/i915/xe3: add register definitions for fbc dirty rect support
Applying: drm/i915/xe3: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect support
Applying: drm/i915/xe3: avoid calling fbc activate if fbc is active
Applying: drm/i915/xe3: dirty rect support for FBC
Applying: drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled


