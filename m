Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE9C6FD1F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 16:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D97110E5A2;
	Mon, 13 Mar 2023 16:05:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9610E5A2;
 Mon, 13 Mar 2023 16:05:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 460A7AADD5;
 Mon, 13 Mar 2023 16:05:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 13 Mar 2023 16:05:04 -0000
Message-ID: <167872350425.1034.13006255632545026104@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230308123012.247091-1-matthew.auld@intel.com>
In-Reply-To: <20230308123012.247091-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Some_small-bar_prep_patches_=28rev3=29?=
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

Series: Some small-bar prep patches (rev3)
URL   : https://patchwork.freedesktop.org/series/114521/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 91440895e3fe91928c6e8a682e87d2b8ca677d82
Author:     Lucas De Marchi <lucas.demarchi@intel.com>
AuthorDate: Wed Mar 1 01:31:12 2023 -0800
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 10 13:52:30 2023 -0800

    drm/xe/pvc: Remove A* steppings
    
    The PVC pre-production A* steppings are not going to be supported in xe
    driver - the steppings are important for the WAs and since we are not
    adding the pre-productions ones, there is no need to add the stepping.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/Kconfig.debug:41
error: drivers/gpu/drm/xe/Kconfig.debug: patch does not apply
error: patch failed: drivers/gpu/drm/xe/tests/xe_migrate.c:129
error: drivers/gpu/drm/xe/tests/xe_migrate.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:1290
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_bo.h:196
error: drivers/gpu/drm/xe/xe_bo.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_ggtt.c:28
error: drivers/gpu/drm/xe/xe_ggtt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_migrate.c:222
error: drivers/gpu/drm/xe/xe_migrate.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_mmio.c:68
error: drivers/gpu/drm/xe/xe_mmio.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_module.c:22
error: drivers/gpu/drm/xe/xe_module.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_module.h:8
error: drivers/gpu/drm/xe/xe_module.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:62
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:3355
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: add xe_ttm_stolen_cpu_access_needs_ggtt()
Applying: drm/xe: s/lmem/vram/
Patch failed at 0002 drm/xe: s/lmem/vram/
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


