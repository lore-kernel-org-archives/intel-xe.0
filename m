Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E44EC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 23:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FD10E3B8;
	Mon, 26 May 2025 23:33:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360C510E3CA;
 Mon, 26 May 2025 23:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/sbi=3A_move?=
 =?utf-8?q?_under_display=2C_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 23:33:13 -0000
Message-ID: <174830239321.21264.6015393547603447112@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1747138550.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747138550.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup
URL   : https://patchwork.freedesktop.org/series/148960/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3e019cc3eaff drm-tip: 2025y-05m-26d-14h-49m-23s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/sbi: move intel_sbi.[ch] under display/
Applying: drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
Applying: drm/i915/sbi: move sbi_lock under struct intel_display
Applying: drm/i915/de: rename timeout parameters timeout_ms to highlight unit
Applying: drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_wait_fw()
Applying: drm/i915/sbi: convert to intel_de_*()
Applying: drm/i915/sbi: split out intel_sbi_regs.h
Applying: drm/i915/sbi: clean up SBI register macro definitions and usage


