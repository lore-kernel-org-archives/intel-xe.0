Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF53EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 16:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C6110E5E2;
	Thu, 20 Jul 2023 16:48:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BD7410E5E2;
 Thu, 20 Jul 2023 16:48:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 49DC6A0093;
 Thu, 20 Jul 2023 16:48:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 20 Jul 2023 16:48:09 -0000
Message-ID: <168987168929.20753.3402456162590457208@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720155546.199766-1-matthew.brost@intel.com>
In-Reply-To: <20230720155546.199766-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Mo?=
 =?utf-8?q?re_VM_cleanups_=28rev4=29?=
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

Series: More VM cleanups (rev4)
URL   : https://patchwork.freedesktop.org/series/120574/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2e9c83947ba0d6b9da66d708c5f1fb5fa0dddc8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 20 08:55:46 2023 -0700

    drm/xe: Only alloc userptr part of xe_vma for userptrs
    
    Only alloc userptr part of xe_vma for userptrs, this will save on space
    in the common BO case.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9cca38d116f01ccc2589c376d1b842e3240e7584 drm-intel
8709d805d drm/xe: Remove xe_vma_op_unmap
b767186d6 drm/xe: Avoid doing rebinds
84ca72dd3 drm/xe: Reduce the number list links in xe_vma
-:149: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#149: FILE: drivers/gpu/drm/xe/xe_vm.c:1062:
+	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));

total: 0 errors, 1 warnings, 0 checks, 194 lines checked
1e63947f6 drm/xe: Replace list_del_init with list_del for userptr.invalidate_link cleanup
a0acaf679 drm/xe: Change tile masks from u64 to u8
32fe35afb drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
b2e9c8394 drm/xe: Only alloc userptr part of xe_vma for userptrs


