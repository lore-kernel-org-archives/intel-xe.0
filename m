Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F399C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553CA10E275;
	Fri, 21 Feb 2025 10:25:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0786610E257;
 Fri, 21 Feb 2025 10:25:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_AuxCCS_handling_and_?=
 =?utf-8?q?render_compression_modifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 10:25:17 -0000
Message-ID: <174013351702.420663.3909432198730797017@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/144186/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a22ac320a083 drm-tip: 2025y-02m-21d-09h-57m-32s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix MOCS debugfs LNCF readout
Applying: drm/xe: Fix ring flush invalidation
Applying: drm/xe: Pass flags directly to emit_flush_imm_ggtt
Applying: drm/xe: Add ring buffer handling for AuxCCS
Applying: drm/xe: Use correct type width for alignment in fb pinning code
Applying: drm/xe: Use fb cached min alignment
Applying: drm/xe: Reduce DPT table alignment as in i915
Applying: drm/xe: Flush GGTT writes after populating DPT
Applying: drm/xe: Handle DPT in system memory
Applying: drm/xe: Force flush system memory AuxCCS framebuffers before scan out
Applying: drm/xe/display: Add support for AuxCCS
Applying: drm/xe/display: Expose AuxCCS frame buffer modifiers


