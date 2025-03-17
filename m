Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52BAC282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 15:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884AD10E18C;
	Mon, 17 Mar 2025 15:19:24 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426410E18C;
 Mon, 17 Mar 2025 15:19:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_xe-only_pa?=
 =?utf-8?q?tches_from_the_multi-device_GPUSVM_series?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Mar 2025 15:19:23 -0000
Message-ID: <174222476386.43645.12457196299053726236@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series
URL   : https://patchwork.freedesktop.org/series/146383/
State : failure

== Summary ==

=== Applying kernel patches on branch 'master' with base: ===
Base commit: 695caca9345a Merge tag 'leds-fixes-6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/Kconfig:39
error: drivers/gpu/drm/xe/Kconfig: patch does not apply
error: patch failed: drivers/gpu/drm/xe/Makefile:125
error: drivers/gpu/drm/xe/Makefile: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device_types.h:107
error: drivers/gpu/drm/xe/xe_device_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_migrate.c:1544
error: drivers/gpu/drm/xe/xe_migrate.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:1420
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_query.c:340
error: drivers/gpu/drm/xe/xe_query.c: patch does not apply
error: drivers/gpu/drm/xe/xe_svm.c: does not exist in index
error: drivers/gpu/drm/xe/xe_svm.h: does not exist in index
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:3112
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Patch failed at 0001 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


