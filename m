Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09151C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 00:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78C10E05E;
	Wed, 15 May 2024 00:44:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6721B10E05E;
 Wed, 15 May 2024 00:44:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 00:44:48 -0000
Message-ID: <171573388842.2116540.6323460814636157713@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515004010.100091-1-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev2)
URL   : https://patchwork.freedesktop.org/series/133034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f7d9f9971bc4cb1b718d662cf0508f20bc14ddcc
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue May 14 17:40:10 2024 -0700

    drm/xe: Add VM bind IOCTL error injection
    
    Add VM bind IOCTL error injection which steals MSB of the bind flags
    field which if set injects errors at various points in the VM bind
    IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4cb2d17202b74ed81c0b6f22e540d811458869df drm-intel
3a56e48610f5 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
3240cf16b6e2 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
15c6214d947a drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:881: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#881: FILE: drivers/gpu/drm/xe/xe_pt.c:1162:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:882: ERROR:CODE_INDENT: code indent should use tabs where possible
#882: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+               return 0;$

-:882: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#882: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+               return 0;$

-:1663: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1663: FILE: drivers/gpu/drm/xe/xe_pt.c:1897:
+ * installing job fence in various places.
+  *

-:1664: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1664: FILE: drivers/gpu/drm/xe/xe_pt.c:1898:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1796: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1796: FILE: drivers/gpu/drm/xe/xe_pt.c:2030:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2524 lines checked
4c6cbd0fd7a9 drm/xe: Update VM trace events
2e82846680c6 drm/xe: Update PT layer with better error handling
f7d9f9971bc4 drm/xe: Add VM bind IOCTL error injection
-:99: ERROR:TRAILING_WHITESPACE: trailing whitespace
#99: FILE: drivers/gpu/drm/xe/xe_vm.c:2718:
+^I DRM_XE_VM_BIND_FLAG_DUMPABLE) $

total: 1 errors, 0 warnings, 0 checks, 121 lines checked


