Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F49C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 13:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE02910E740;
	Wed, 21 Feb 2024 13:38:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084F510E743;
 Wed, 21 Feb 2024 13:38:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/9=5D_drm/xe/snapshot=3A_Remove_drm=5Ferr_on_guc_alloc_failu?=
 =?utf-8?q?res?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 13:38:19 -0000
Message-ID: <170852269903.178729.1034555890649815000@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [v5,1/9] drm/xe/snapshot: Remove drm_err on guc alloc failures
URL   : https://patchwork.freedesktop.org/series/130203/
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
commit b9ae8ed4ea0a6174e9ffcea0e75ac2ff142a5273
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Feb 21 14:30:24 2024 +0100

    drm/xe: Implement capture of HWSP and HWCTX
    
    Capture both the HWSP and the HW ctx page to allow easier replaying of
    error dumps for debugging.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch e520d7c9e8738c2d1f6602cf43d6e761e5a93668 drm-intel
b2112704cc80 drm/xe/snapshot: Remove drm_err on guc alloc failures
ccdf7a9286a7 drm/xe: Clear all snapshot members after deleting coredump
07612cf1df0a drm/xe: Add uapi for dumpable bos
006d8b38e2d2 drm/xe: Annotate each dumpable vma as such
98d04bd955fe drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
5ad876f63acf drm/xe: Implement VM snapshot support for BO's and userptr
-:313: WARNING:LINE_SPACING: Missing a blank line after declarations
#313: FILE: drivers/gpu/drm/xe/xe_vm.c:3370:
+			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
+			kthread_use_mm(snap->snap[i].mm);

total: 0 errors, 1 warnings, 0 checks, 323 lines checked
ab01dce7661a drm/xe: Move lrc snapshot capturing to xe_lrc.c
c1d33790d5e5 drm/xe: Add infrastructure for delayed LRC capture
-:45: CHECK:LINE_SPACING: Please don't use multiple blank lines
#45: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1862:
 
+

total: 0 errors, 0 warnings, 1 checks, 82 lines checked
b9ae8ed4ea0a drm/xe: Implement capture of HWSP and HWCTX


