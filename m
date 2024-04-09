Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CBEC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDEE10E196;
	Tue,  9 Apr 2024 20:52:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2AE10E196;
 Tue,  9 Apr 2024 20:52:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Basic_system_allocat?=
 =?utf-8?q?or_support_in_xe_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 20:52:44 -0000
Message-ID: <171269596495.1300821.4247995239922955840@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409201742.3042626-1-oak.zeng@intel.com>
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Series: Basic system allocator support in xe driver
URL   : https://patchwork.freedesktop.org/series/132229/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7be27f645de2 drm-tip: 2024y-04m-09d-17h-53m-12s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo.h:10
error: drivers/gpu/drm/xe/xe_bo.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_device.c:226
error: drivers/gpu/drm/xe/xe_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec.c:135
error: drivers/gpu/drm/xe/xe_exec.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_exec_queue_types.h:78
error: drivers/gpu/drm/xe/xe_exec_queue_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pci.c:375
error: drivers/gpu/drm/xe/xe_pci.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_pt.c:1161
error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_sched_job_types.h:39
error: drivers/gpu/drm/xe/xe_sched_job_types.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_trace.h:264
error: drivers/gpu/drm/xe/xe_trace.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_uc_fw.c:105
error: drivers/gpu/drm/xe/xe_uc_fw.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:515
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm.h:207
error: drivers/gpu/drm/xe/xe_vm.h: patch does not apply
error: patch failed: drivers/gpu/drm/xe/xe_vm_types.h:180
error: drivers/gpu/drm/xe/xe_vm_types.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/xe: Refactor vm_bind
Patch failed at 0001 drm/xe: Refactor vm_bind
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


