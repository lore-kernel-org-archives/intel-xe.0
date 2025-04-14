Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F3C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 12:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D970910E125;
	Mon, 14 Apr 2025 12:18:00 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CC610E587;
 Mon, 14 Apr 2025 12:17:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_error_ca?=
 =?utf-8?q?pture_cleanups_and_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 12:17:59 -0000
Message-ID: <174463307992.1385.11807052078837447885@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744630147.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744630147.git.jani.nikula@intel.com>
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

Series: drm/i915: error capture cleanups and refactor
URL   : https://patchwork.freedesktop.org/series/147673/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7fabc0c4629f drm-tip: 2025y-04m-14d-10h-52m-16s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: use 32-bit access for gen2 irq registers
Applying: drm/i915: record GEN2_IER in gtier[0] for pre-ilk error capture
Applying: drm/i915: stop recording IER in error capture
Applying: drm/i915: use display snapshot mechanism for display irq regs
Applying: drm/i915: don't capture DERRMR for VLV/CHV
Applying: drm/i915: use graphics version instead of PCH split in error capture


