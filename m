Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D554FC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D2610E449;
	Tue, 16 Jan 2024 14:15:43 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5F210E449;
 Tue, 16 Jan 2024 14:15:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_drm_debug_and?=
 =?utf-8?q?_error_logging_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 16 Jan 2024 14:15:42 -0000
Message-ID: <170541454290.502239.2546645340196249123@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1705410327.git.jani.nikula@intel.com>
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: drm debug and error logging improvements
URL   : https://patchwork.freedesktop.org/series/128830/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3a1d727c0 drm/xe: Use kstrdup while creating snapshot
=== git am output follows ===
Applying: drm/print: make drm_err_printer() device specific by using drm_err()
Applying: drm/print: move enum drm_debug_category etc. earlier in drm_print.h
Applying: drm/print: add drm_dbg_printer() for drm device specific printer
Applying: drm/dp_mst: switch from drm_debug_printer() to device specific drm_dbg_printer()
Applying: drm/mode: switch from drm_debug_printer() to device specific drm_dbg_printer()
Applying: drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
Applying: drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()
Applying: drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
Applying: drm/xe: switch from drm_debug_printer() to device specific drm_dbg_printer()
Applying: drm: remove drm_debug_printer in favor of drm_dbg_printer


