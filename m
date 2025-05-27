Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97496C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 18:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F610E4F9;
	Tue, 27 May 2025 18:50:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87210E4F9;
 Tue, 27 May 2025 18:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/sbi=3A_move?=
 =?utf-8?q?_under_display=2C_cleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 18:50:55 -0000
Message-ID: <174837185538.25517.15280776043520896448@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748343520.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748343520.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/148960/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b9431c1a990f drm-tip: 2025y-05m-27d-17h-00m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/sbi: move intel_sbi.[ch] under display/
Applying: drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
Applying: drm/i915/sbi: move sbi_lock under struct intel_display
Applying: drm/i915/de: rename timeout parameters timeout_ms to highlight unit
Applying: drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_wait_fw()
Applying: drm/i915/sbi: convert to intel_de_*()
Applying: drm/i915/sbi: split out intel_sbi_regs.h
Applying: drm/i915/sbi: clean up SBI register macro definitions and usage


