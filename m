Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F82BC3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 01:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2510E2DF;
	Wed, 26 Jun 2024 01:21:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DDE10E2DF;
 Wed, 26 Jun 2024 01:21:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 01:21:39 -0000
Message-ID: <171936489981.158965.15674483789638475969@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626003920.4060633-1-matthew.brost@intel.com>
In-Reply-To: <20240626003920.4060633-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev5)
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
commit 1e5e69ddd7423e10d5fc4efb50e3ed731354f747
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 25 17:39:20 2024 -0700

    drm/xe: Add VM bind IOCTL error injection
    
    Add VM bind IOCTL error injection which steals MSB of the bind flags
    field which if set injects errors at various points in the VM bind
    IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
    
    v4:
     - Change define layout (Jonathan)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch edccdf441f1e061f81e0d1d172aa0f37511bbe4d drm-intel
46bae314e0c6 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
4e6efc993696 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
8889cb9da126 drm/xe: Add xe_exec_queue_last_fence_test_dep
54c54cb8a8a6 drm/xe: Convert multiple bind ops into single job
-:13: WARNING:TYPO_SPELLING: 'implemenation' may be misspelled - perhaps 'implementation'?
#13: 
The implemenation is roughly:
    ^^^^^^^^^^^^^

-:671: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#671: FILE: drivers/gpu/drm/xe/xe_pt.c:992:
+
+}

-:888: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#888: FILE: drivers/gpu/drm/xe/xe_pt.c:1156:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:889: ERROR:CODE_INDENT: code indent should use tabs where possible
#889: FILE: drivers/gpu/drm/xe/xe_pt.c:1157:
+               return 0;$

-:889: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#889: FILE: drivers/gpu/drm/xe/xe_pt.c:1157:
+               return 0;$

-:1342: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1342: FILE: drivers/gpu/drm/xe/xe_pt.c:1613:
+
+

-:1672: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1672: FILE: drivers/gpu/drm/xe/xe_pt.c:1895:
+ * installing job fence in various places.
+  *

-:1673: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1673: FILE: drivers/gpu/drm/xe/xe_pt.c:1896:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:1804: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1804: FILE: drivers/gpu/drm/xe/xe_pt.c:2027:
+ }$

total: 1 errors, 6 warnings, 2 checks, 2526 lines checked
f607e08e843d drm/xe: Update VM trace events
d002f88d7ead drm/xe: Update PT layer with better error handling
1e5e69ddd742 drm/xe: Add VM bind IOCTL error injection


