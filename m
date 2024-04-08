Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B927C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 19:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC211255C;
	Mon,  8 Apr 2024 19:17:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDDC11255C;
 Mon,  8 Apr 2024 19:17:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_drm=5Fi9?=
 =?utf-8?q?15=5Fprivate_and_xe=5Fdevice_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 19:17:33 -0000
Message-ID: <171260385351.1286971.9708007124809497930@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712599670.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712599670.git.jani.nikula@intel.com>
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

Series: drm/i915: drm_i915_private and xe_device cleanups
URL   : https://patchwork.freedesktop.org/series/132174/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0c3980f55f03 drm-tip: 2024y-04m-08d-19h-03m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/gt: drop display clock info from gt debugfs
Applying: drm/i915: move skl_preferred_vco_freq to display substruct
Applying: drm/i915: move max_dotclk_freq to display substruct
Applying: drm/i915: move vblank_enabled to display substruct
Applying: drm/i915: move display_irqs_enabled to display substruct
Applying: drm/i915: move de_irq_mask to display substruct
Applying: drm/i915: move pipestat_irq_mask to display substruct
Applying: drm/xe/display: remove unused xe->enabled_irq_mask


