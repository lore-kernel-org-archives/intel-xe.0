Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591B3C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225E10E9F1;
	Thu, 21 Mar 2024 13:44:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F5110E9F1;
 Thu, 21 Mar 2024 13:44:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/xe=3A_Rework_reb?=
 =?utf-8?q?inding_and_allow_same-vm_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 13:44:01 -0000
Message-ID: <171102864166.940727.13796606357518147224@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Rework rebinding and allow same-vm eviction
URL   : https://patchwork.freedesktop.org/series/131421/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9ae91289c9ed drm-tip: 2024y-03m-21d-13h-03m-03s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_exec.c:96
error: drivers/gpu/drm/xe/xe_exec.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_gt_pagefault.c:100
error: drivers/gpu/drm/xe/xe_gt_pagefault.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:1235
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:485
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.h:242
error: drivers/gpu/drm/xe/xe_vm.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Use ring ops TLB invalidation for rebinds
Applying: drm/xe: Rework rebinding
Applying: drm/xe: Reserve fences where needed
Applying: drm/xe: Reserve fences where needed
Patch failed at 0004 drm/xe: Reserve fences where needed
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


