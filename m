Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEBBC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F363E10E351;
	Fri,  6 Jun 2025 13:09:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9F10EACB;
 Fri,  6 Jun 2025 13:07:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Add_drm?=
 =?utf-8?q?=5Fpanic_support_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 13:07:54 -0000
Message-ID: <174921527489.56091.12805753807723962922@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606120519.753928-1-jfalempe@redhat.com>
In-Reply-To: <20250606120519.753928-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev8)
URL   : https://patchwork.freedesktop.org/series/141937/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8c96c8b7753f drm-tip: 2025y-06m-06d-12h-40m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fbdev: Add intel_fbdev_get_map()
Applying: drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
Applying: drm/i915/display: Add a disable_tiling() for skl planes
Applying: drm/ttm: Add ttm_bo_kmap_try_from_panic()
Applying: drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
Applying: drm/i915/display: Add drm_panic support
Applying: drm/i915/display: Add drm_panic support for Y-tiling with DPT
Applying: drm/i915/display: Add drm_panic support for 4-tiling with DPT
Applying: drm/i915/psr: Add intel_psr2_panic_force_full_update


