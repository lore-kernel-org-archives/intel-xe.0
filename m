Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E13C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 23:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382F510F17B;
	Fri,  2 Feb 2024 23:55:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0C310F17B;
 Fri,  2 Feb 2024 23:55:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/4=5D_drm/xe=3A_Add_uapi_for_dumpable_bos_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 23:55:21 -0000
Message-ID: <170691812170.953329.15993764217920341517@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [v3,1/4] drm/xe: Add uapi for dumpable bos (rev2)
URL   : https://patchwork.freedesktop.org/series/129496/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 680e657dd658120ae93e2f02cd949d44d1bfab22
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Feb 2 23:45:14 2024 +0100

    drm/xe: Implement VM snapshot support for BO's and userptr
    
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
    - Use ascii85_encode to capture BO contents and save some space.
    - Add length to coredump output for each captured area.
    Changes since v2:
    - Dump each mapping on their own line, to simplify tooling.
    - Fix null pointer deref in xe_vm_snapshot_free.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 40994da55437acf620a48af39b0d8545e1595c42 drm-intel
5d4eaf749 drm/xe: Add uapi for dumpable bos
d63ecc1d6 drm/xe: Annotate each dumpable vma as such
73dc06fb4 drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
680e657dd drm/xe: Implement VM snapshot support for BO's and userptr
-:158: WARNING:TYPO_SPELLING: 'deffered' may be misspelled - perhaps 'deferred'?
#158: FILE: drivers/gpu/drm/xe/xe_devcoredump_types.h:32:
+	/** @work: Workqueue for deffered capture outside of signaling context */
 	                         ^^^^^^^^

-:193: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#193: FILE: drivers/gpu/drm/xe/xe_vm.c:3288:
+		uint64_t ofs, bo_ofs;

-:238: WARNING:LINE_SPACING: Missing a blank line after declarations
#238: FILE: drivers/gpu/drm/xe/xe_vm.c:3333:
+			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+			if (mmget_not_zero(userptr->notifier.mm))

-:283: WARNING:LINE_SPACING: Missing a blank line after declarations
#283: FILE: drivers/gpu/drm/xe/xe_vm.c:3378:
+			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
+			kthread_use_mm(snap->snap[i].mm);

-:318: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#318: FILE: drivers/gpu/drm/xe/xe_vm.c:3413:
+			uint32_t *val = snap->snap[i].data + j;

total: 0 errors, 3 warnings, 2 checks, 305 lines checked


