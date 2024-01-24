Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CF4C47E49
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 17:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8202610F00F;
	Wed, 24 Jan 2024 17:07:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71210E87B;
 Wed, 24 Jan 2024 17:07:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe=3A_Add_uapi_for_dumpable_bos=2C_v2=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Wed, 24 Jan 2024 17:07:36 -0000
Message-ID: <170611605612.685200.12250256026744717616@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124165245.2660-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240124165245.2660-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/4] drm/xe: Add uapi for dumpable bos, v2.
URL   : https://patchwork.freedesktop.org/series/129136/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f63e7815ec8b53be5e36fbf120bc7c76fe5b39e
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Jan 24 17:52:45 2024 +0100

    drm/xe: Implement VM snapshot support for BO's and userptr, v2.
    
    Since we cannot immediately capture the BO's and userptr, perform it in
    2 stages. The immediate stage takes a reference to each BO and userptr,
    while a delayed worker captures the contents and then frees the
    reference.
    
    This is required because in signaling context, no locks can be taken, no
    memory can be allocated, and no waits on userspace can be performed.
    
    With the delayed worker, all of this can be performed very easily,
    without having to resort to hacks.
    
    Changes since v1:
    - Fix crash on NULL captured vm.
    - Use ascii85_encode to capture BO contents and save some space. (Jose
      Souza)
    - Add length to coredump output for each captured area.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 96b582d5ddfc0770491b81522c6c9bba7d0aef86 drm-intel
343e6dc3c drm/xe: Add uapi for dumpable bos, v2.
01e238a4b drm/xe: Annotate each dumpable vma as such
74f6d3d73 drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
0f63e7815 drm/xe: Implement VM snapshot support for BO's and userptr, v2.
-:154: WARNING:TYPO_SPELLING: 'deffered' may be misspelled - perhaps 'deferred'?
#154: FILE: drivers/gpu/drm/xe/xe_devcoredump_types.h:32:
+	/** @work: Workqueue for deffered capture outside of signaling context */
 	                         ^^^^^^^^

-:189: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#189: FILE: drivers/gpu/drm/xe/xe_vm.c:3245:
+		uint64_t ofs, bo_ofs;

-:281: WARNING:LINE_SPACING: Missing a blank line after declarations
#281: FILE: drivers/gpu/drm/xe/xe_vm.c:3337:
+			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
+			kthread_use_mm(snap->snap[i].mm);

-:314: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#314: FILE: drivers/gpu/drm/xe/xe_vm.c:3370:
+			uint32_t *val = snap->snap[i].data + j;

-:317: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#317: FILE: drivers/gpu/drm/xe/xe_vm.c:3373:
+			uint32_t k;

-:323: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#323: FILE: drivers/gpu/drm/xe/xe_vm.c:3379:
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],

total: 0 errors, 3 warnings, 3 checks, 307 lines checked


