Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0DEC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 17:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1DA10E3BC;
	Mon, 27 Nov 2023 17:43:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9883E10E3BB;
 Mon, 27 Nov 2023 17:43:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 91C5DAADD2;
 Mon, 27 Nov 2023 17:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Mon, 27 Nov 2023 17:43:32 -0000
Message-ID: <170110701257.3004.14965417965629081637@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231022155727.717251-1-kelbaz@habana.ai>
In-Reply-To: <20231022155727.717251-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_series_starting_with_=5Bv2=2C1/2=5D_drm/xe=3A_add_skip=5Fpco?=
 =?utf-8?q?de_flag_=28rev5=29?=
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

Series: series starting with [v2,1/2] drm/xe: add skip_pcode flag (rev5)
URL   : https://patchwork.freedesktop.org/series/125426/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7c4b213b5 drm/xe: Internally change the compute_mode and no_dma_fence mode naming
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_pci.c:61
error: drivers/gpu/drm/xe/xe_pci.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: add skip_pcode flag
Patch failed at 0001 drm/xe: add skip_pcode flag
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


