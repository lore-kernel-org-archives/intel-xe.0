Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3897FC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 06:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5510E327;
	Fri, 17 Mar 2023 06:24:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0386210E127;
 Fri, 17 Mar 2023 06:24:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0988AADED;
 Fri, 17 Mar 2023 06:24:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 17 Mar 2023 06:24:36 -0000
Message-ID: <167903427695.12997.1750434411380210799@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230317062213.225989-1-matthew.brost@intel.com>
In-Reply-To: <20230317062213.225989-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_Decrement_fault_mode_counts_in_xe=5Fvm=5Fclose=5Fa?=
 =?utf-8?q?nd=5Fput?=
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

Series: drm/xe: Decrement fault mode counts in xe_vm_close_and_put
URL   : https://patchwork.freedesktop.org/series/115303/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 68c0f7421b74cf51fe442bed6d4395d28ded5d7d
Author:     Thomas Hellström <thomas.hellstrom@linux.intel.com>
AuthorDate: Tue Mar 14 15:56:44 2023 +0100
Commit:     Thomas Hellström <thomas.hellstrom@linux.intel.com>
CommitDate: Thu Mar 16 15:16:00 2023 +0100

    drm/xe/vm: Defer vm rebind until next exec if nothing to execute
    
    If all compute engines of a vm in compute mode are idle,
    defer a rebind to the next exec to avoid the VM unnecessarily trying
    to make memory resident and compete with other VMs for available
    memory space.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_vm.c:1393
error: drivers/gpu/drm/xe/xe_vm.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/xe: Decrement fault mode counts in xe_vm_close_and_put
Patch failed at 0001 drm/xe: Decrement fault mode counts in xe_vm_close_and_put
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


