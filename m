Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC42C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F9410EA74;
	Fri, 28 Mar 2025 17:33:04 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514A910EA66;
 Fri, 28 Mar 2025 17:33:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_AuxCCS_handling_and_?=
 =?utf-8?q?render_compression_modifiers_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 17:33:03 -0000
Message-ID: <174318318332.16576.5075782617098521211@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev4)
URL   : https://patchwork.freedesktop.org/series/144186/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7109b62b7533 drm-tip: 2025y-03m-28d-17h-10m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xelpg: Move Wa_14016712196 to the invalidate path
Applying: drm/xe: Add ring buffer handling for AuxCCS
Applying: drm/xe: Use fb cached min alignment
Applying: drm/xe: Reduce DPT table alignment as in i915
Applying: drm/xe: Flush GGTT writes after populating DPT
Applying: drm/xe: Handle DPT in system memory
Applying: drm/xe: Force flush system memory AuxCCS framebuffers before scan out
Applying: drm/xe/display: Add support for AuxCCS
Applying: drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe


