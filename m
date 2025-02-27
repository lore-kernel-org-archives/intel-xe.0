Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD7C19F32
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 18:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4019010E137;
	Thu, 27 Feb 2025 18:00:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF810E234;
 Thu, 27 Feb 2025 18:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_enable_dri?=
 =?utf-8?q?ver_usage_on_non-4KiB_kernels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mingcong Bai via B4 Relay" <devnull+jeffbai.aosc.io@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 18:00:30 -0000
Message-ID: <174067923019.2795555.16785746692984152289@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
In-Reply-To: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
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

Series: drm/xe: enable driver usage on non-4KiB kernels
URL   : https://patchwork.freedesktop.org/series/145585/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c40c94f48913 drm-tip: 2025y-02m-27d-16h-03m-43s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/regs/xe_engine_regs.h:52
error: drivers/gpu/drm/xe/regs/xe_engine_regs.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/bo: fix alignment with non-4K kernel page sizes
Applying: drm/xe/guc: use SZ_4K for alignment
Applying: drm/xe/regs: fix RING_CTL_SIZE(size) calculation
Patch failed at 0003 drm/xe/regs: fix RING_CTL_SIZE(size) calculation
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


