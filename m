Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE5D2AB1C
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 10:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FBF10E61D;
	Tue, 29 Oct 2024 10:46:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9D510E61B;
 Tue, 29 Oct 2024 10:46:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/xe2=3A_Remove?=
 =?utf-8?q?_duplicate_XE2LPM=5F*_register_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 10:46:22 -0000
Message-ID: <173019878269.1358441.9584495863722012110@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029093033.600098-1-geert+renesas@glider.be>
In-Reply-To: <20241029093033.600098-1-geert+renesas@glider.be>
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

Series: drm/xe/xe2: Remove duplicate XE2LPM_* register definitions
URL   : https://patchwork.freedesktop.org/series/140641/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 738c18d8599d drm-tip: 2024y-10m-29d-10h-42m-40s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/regs/xe_gt_regs.h:410
error: drivers/gpu/drm/xe/regs/xe_gt_regs.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/xe2: Remove duplicate XE2LPM_* register definitions
Patch failed at 0001 drm/xe/xe2: Remove duplicate XE2LPM_* register definitions
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


