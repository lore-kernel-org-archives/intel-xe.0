Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD765C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 19:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721F611A274;
	Wed, 29 May 2024 19:26:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92E211A274;
 Wed, 29 May 2024 19:26:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 19:26:43 -0000
Message-ID: <171701080375.2234143.16173147092515165088@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529183148.1713695-1-matthew.brost@intel.com>
In-Reply-To: <20240529183148.1713695-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev3)
URL   : https://patchwork.freedesktop.org/series/133034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d6cd9643373ccaa0ce77f96d89dc0e15849260f4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed May 29 11:31:48 2024 -0700

    drm/xe: Update PT layer with better error handling
    
    Update PT layer so if a memory allocation for a PTE fails the error can
    be propagated to the user without requiring to be killed.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
1e56f3b729a5 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
0ad22da15204 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
1667d1a4058d drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:875: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#875: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:876: ERROR:CODE_INDENT: code indent should use tabs where possible
#876: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:876: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#876: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:1657: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1657: FILE: drivers/gpu/drm/xe/xe_pt.c:1898:
+ * installing job fence in various places.
+  *

-:1658: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1658: FILE: drivers/gpu/drm/xe/xe_pt.c:1899:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1790: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1790: FILE: drivers/gpu/drm/xe/xe_pt.c:2031:
+ }$

total: 1 errors, 6 warnings, 0 checks, 2522 lines checked
5750d688b828 drm/xe: Update VM trace events
d6cd9643373c drm/xe: Update PT layer with better error handling


