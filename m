Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB225C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 13:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743E310E90F;
	Wed, 26 Feb 2025 13:16:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69010E90F;
 Wed, 26 Feb 2025 13:16:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/pfit=3A_pan?=
 =?utf-8?q?el_fitter_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 13:16:15 -0000
Message-ID: <174057577590.2338787.3130293130452548662@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740564009.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740564009.git.jani.nikula@intel.com>
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

Series: drm/i915/pfit: panel fitter refactors
URL   : https://patchwork.freedesktop.org/series/145470/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5bcb67a2a4c6 drm-tip: 2025y-02m-26d-09h-59m-48s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/pfit: rename intel_panel_fitting() to intel_pfit_compute_config()
Applying: drm/i915/pfit: move ilk and i9xx pfit code to intel_pfit.[ch]
Applying: drm/i915/pfit: fix comment style for moved comments
Applying: drm/i915/pfit: convert moved code to struct intel_display
Applying: drm/i915/pfit: split out intel_pfit_regs.h


