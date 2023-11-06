Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94613C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 12:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C910E06F;
	Mon,  6 Nov 2023 12:12:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C7DA010E06F;
 Mon,  6 Nov 2023 12:12:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C1092AADD6;
 Mon,  6 Nov 2023 12:12:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 06 Nov 2023 12:12:24 -0000
Message-ID: <169927274475.20425.17560528314839130326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/gpuvm=3A_Fix_deprecated_license_identifier?=
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

Series: drm/gpuvm: Fix deprecated license identifier
URL   : https://patchwork.freedesktop.org/series/126021/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc457bcc1 Revert "FIXME: drm/i915/crtc: use irqsave for locking event_lock"
=== git am output follows ===
error: patch failed: drivers/gpu/drm/drm_gpuvm.c:1
error: drivers/gpu/drm/drm_gpuvm.c: patch does not apply
error: patch failed: include/drm/drm_gpuvm.h:1
error: include/drm/drm_gpuvm.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/gpuvm: Fix deprecated license identifier
Patch failed at 0001 drm/gpuvm: Fix deprecated license identifier
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


