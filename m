Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19690C4345F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC55210E351;
	Sun, 28 Apr 2024 21:57:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4610E30B;
 Sun, 28 Apr 2024 21:57:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm/xe=3A_rename_gt_invalidation_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Apr 2024 21:57:48 -0000
Message-ID: <171434146880.1737410.1619634671337892972@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425093540.356478-1-fkassabri@habana.ai>
In-Reply-To: <20240425093540.356478-1-fkassabri@habana.ai>
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

Series: series starting with [1/2] drm/xe: rename gt invalidation functions
URL   : https://patchwork.freedesktop.org/series/133003/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 94a0eea182f0 drm-tip: 2024y-04m-27d-07h-26m-48s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_gt.c:659
error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:240
error: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h:18
error: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:1073
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: rename gt invalidation functions
Patch failed at 0001 drm/xe: rename gt invalidation functions
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


