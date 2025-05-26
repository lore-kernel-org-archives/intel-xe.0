Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB825C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 19:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD310E362;
	Mon, 26 May 2025 19:23:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960B510E3D0;
 Mon, 26 May 2025 19:23:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe/vf=3A_Post-mi?=
 =?utf-8?q?gration_recovery_of_GGTT_nodes_and_CTB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 19:23:49 -0000
Message-ID: <174828742960.21145.17314292433944341319@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509001506.257709-1-tomasz.lis@intel.com>
In-Reply-To: <20250509001506.257709-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB
URL   : https://patchwork.freedesktop.org/series/148780/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3e019cc3eaff drm-tip: 2025y-05m-26d-14h-49m-23s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_ggtt.c:429
error: drivers/gpu/drm/xe/xe_ggtt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_ggtt.h:15
error: drivers/gpu/drm/xe/xe_ggtt.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:560
error: drivers/gpu/drm/xe/xe_gt_sriov_vf.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_sriov_vf.h:18
error: drivers/gpu/drm/xe/xe_gt_sriov_vf.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe/vf: Divide GGTT ballooning into allocation and insertion
Patch failed at 0001 drm/xe/vf: Divide GGTT ballooning into allocation and insertion
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


