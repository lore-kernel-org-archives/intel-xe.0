Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A625C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 13:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028DF10E00D;
	Fri, 12 Jan 2024 13:23:05 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C5810EAF1;
 Fri, 12 Jan 2024 13:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe=3A_Add_uapi_for_dumpable_bos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Fri, 12 Jan 2024 13:23:04 -0000
Message-ID: <170506578427.332901.1040901507966489365@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/4] drm/xe: Add uapi for dumpable bos
URL   : https://patchwork.freedesktop.org/series/128717/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78b7a59ac3a58ddea1ebb8cc14a6982b263aa9df
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Jan 12 13:41:48 2024 +0100

    drm/xe: Implement VM snapshot support for BO's and userptr
    
    Since we cannot immediately capture the BO's and userptr, perform it in
    2 stages. The immediate stage takes a reference to each BO and userptr,
    while a delayed worker captures the contents and then frees the
    reference.
    
    This is required because in signaling context, no locks can be taken, no
    memory can be allocated, and no waits on userspace can be performed.
    
    With the delayed worker, all of this can be performed very easily,
    without having to resort to hacks.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 7a20187068bed91b523795a18219e570f1e84eb1 drm-intel
bb584db28 drm/xe: Add uapi for dumpable bos
c6bcab073 drm/xe: Annotate each dumpable vma as such
6b0d6095d drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
78b7a59ac drm/xe: Implement VM snapshot support for BO's and userptr
-:149: WARNING:TYPO_SPELLING: 'deffered' may be misspelled - perhaps 'deferred'?
#149: FILE: drivers/gpu/drm/xe/xe_devcoredump_types.h:32:
+	/** @work: Workqueue for deffered capture outside of signaling context */
 	                         ^^^^^^^^

-:176: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#176: FILE: drivers/gpu/drm/xe/xe_vm.c:3236:
+		uint64_t ofs, bo_ofs;

-:262: WARNING:LINE_SPACING: Missing a blank line after declarations
#262: FILE: drivers/gpu/drm/xe/xe_vm.c:3322:
+			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
+			kthread_use_mm(snap->snap[i].mm);

-:293: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#293: FILE: drivers/gpu/drm/xe/xe_vm.c:3353:
+			uint32_t *x = snap->snap[i].data + j;

-:296: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#296: FILE: drivers/gpu/drm/xe/xe_vm.c:3356:
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],

total: 0 errors, 3 warnings, 2 checks, 285 lines checked


