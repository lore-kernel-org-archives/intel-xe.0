Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF788C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904A410E821;
	Mon, 29 Apr 2024 16:53:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E510E821;
 Mon, 29 Apr 2024 16:53:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 16:53:18 -0000
Message-ID: <171440959870.1756580.15488650119538935886@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429164713.2249950-1-matthew.brost@intel.com>
In-Reply-To: <20240429164713.2249950-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job
URL   : https://patchwork.freedesktop.org/series/133034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 20a4e151b919c37f9d45e82108101adee605704e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Apr 29 09:47:13 2024 -0700

    drm/xe: Update PT layer with better error handling
    
    Update PT layer so if a memory allocation for a PTE fails the error can
    be propagated to the user without requiring to be killed.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch acf512bb5ff4d2e8ed5ef67444b6c1f92a222d77 drm-intel
d7f72028c671 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
f04b0237f65d drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
ed98bce36b51 drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:878: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#878: FILE: drivers/gpu/drm/xe/xe_pt.c:1131:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:879: ERROR:CODE_INDENT: code indent should use tabs where possible
#879: FILE: drivers/gpu/drm/xe/xe_pt.c:1132:
+               return 0;$

-:879: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#879: FILE: drivers/gpu/drm/xe/xe_pt.c:1132:
+               return 0;$

-:1541: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1541: FILE: drivers/gpu/drm/xe/xe_pt.c:1841:
+ * installing job fence in various places.
+  *

-:1542: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1542: FILE: drivers/gpu/drm/xe/xe_pt.c:1842:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1768: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1768: FILE: drivers/gpu/drm/xe/xe_pt.c:1974:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2499 lines checked
fa08171fd5c3 drm/xe: Update VM trace events
20a4e151b919 drm/xe: Update PT layer with better error handling


