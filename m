Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AAAEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD010E029;
	Thu, 20 Jul 2023 04:28:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45B9710E029;
 Thu, 20 Jul 2023 04:28:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 44EF1AADDD;
 Thu, 20 Jul 2023 04:28:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 20 Jul 2023 04:28:04 -0000
Message-ID: <168982728427.20751.16925901283545004627@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720042115.119494-1-matthew.brost@intel.com>
In-Reply-To: <20230720042115.119494-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Mo?=
 =?utf-8?q?re_VM_cleanups_=28rev3=29?=
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

Series: More VM cleanups (rev3)
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
commit d8c945b4c07776c90a9abca948138c03ad36d13e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 19 21:21:15 2023 -0700

    drm/xe: Only alloc userptr part of xe_vma for userptrs
    
    Only alloc userptr part of xe_vma for userptrs, this will save on space
    in the common BO case.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f5459dca41d325590391d4512e937d8ffc2ce126 drm-intel
ba2e61af1 drm/xe: Remove xe_vma_op_unmap
b7e1da37b drm/xe: Avoid doing rebinds
e0fcddf19 drm/xe: Reduce the number list links in xe_vma
-:149: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#149: FILE: drivers/gpu/drm/xe/xe_vm.c:1062:
+	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));

total: 0 errors, 1 warnings, 0 checks, 194 lines checked
e1cf3deee drm/xe: Replace list_del_init with list_del for userptr.invalidate_link cleanup
7abe62a3c drm/xe: Change tile masks from u64 to u8
0da72c5d4 drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
d8c945b4c drm/xe: Only alloc userptr part of xe_vma for userptrs


