Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA7FC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736410E72B;
	Tue, 18 Jun 2024 17:19:32 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22CC10E72B;
 Tue, 18 Jun 2024 17:19:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 17:19:31 -0000
Message-ID: <171873117199.104452.11401914821869587483@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618171509.3336601-1-matthew.brost@intel.com>
In-Reply-To: <20240618171509.3336601-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev4)
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
commit bd4d7d4d0a250cd8303200f9a25b417ab19862dd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 18 10:15:09 2024 -0700

    drm/xe: Add VM bind IOCTL error injection
    
    Add VM bind IOCTL error injection which steals MSB of the bind flags
    field which if set injects errors at various points in the VM bind
    IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
    
    v4:
     - Change define layout (Jonathan)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch fd8ad6cbb953a61cdbb7d7a10a13a2b5c8752c4c drm-intel
0b921daa3de4 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
a2dc71ee40c4 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
95c4c26fc6db drm/xe: Add xe_exec_queue_last_fence_test_dep
3c7f57ad2c9b drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:878: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#878: FILE: drivers/gpu/drm/xe/xe_pt.c:1163:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:879: ERROR:CODE_INDENT: code indent should use tabs where possible
#879: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:879: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#879: FILE: drivers/gpu/drm/xe/xe_pt.c:1164:
+               return 0;$

-:1332: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1332: FILE: drivers/gpu/drm/xe/xe_pt.c:1620:
+
+

-:1662: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1662: FILE: drivers/gpu/drm/xe/xe_pt.c:1902:
+ * installing job fence in various places.
+  *

-:1663: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1663: FILE: drivers/gpu/drm/xe/xe_pt.c:1903:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1795: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1795: FILE: drivers/gpu/drm/xe/xe_pt.c:2035:
+ }$

total: 1 errors, 6 warnings, 1 checks, 2525 lines checked
12dbb169266f drm/xe: Update VM trace events
1537c7985bfa drm/xe: Update PT layer with better error handling
bd4d7d4d0a25 drm/xe: Add VM bind IOCTL error injection


