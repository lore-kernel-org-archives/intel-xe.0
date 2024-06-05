Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EA6C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 06:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAD110E6A0;
	Wed,  5 Jun 2024 06:36:48 +0000 (UTC)
Received: from 34f955b5b2c0 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A0410E6A0;
 Wed,  5 Jun 2024 06:36:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_CPU_binds_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 06:36:47 -0000
Message-ID: <171756940703.11.14097786714996665876@34f955b5b2c0>
X-Patchwork-Hint: ignore
References: <20240605050635.2060576-1-matthew.brost@intel.com>
In-Reply-To: <20240605050635.2060576-1-matthew.brost@intel.com>
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

Series: drm/xe: CPU binds (rev2)
URL   : https://patchwork.freedesktop.org/series/134481/
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
commit c67afea727f38a12892e48a63cdbd5cf6b62746e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 4 22:06:35 2024 -0700

    drm/xe: CPU binds
    
    Debug for isse #799, do not review.
    
    v2:
     - Fix bug not setting up m->bind_q on non-usm platforms
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
c67afea727f3 drm/xe: CPU binds
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:450: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#450: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1:
+	// SPDX-License-Identifier: MIT

-:1622: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#1622: FILE: drivers/gpu/drm/xe/xe_pt.c:1218:
+	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
+               return 0;

-:1623: ERROR:CODE_INDENT: code indent should use tabs where possible
#1623: FILE: drivers/gpu/drm/xe/xe_pt.c:1219:
+               return 0;$

-:1623: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#1623: FILE: drivers/gpu/drm/xe/xe_pt.c:1219:
+               return 0;$

-:2412: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2412: FILE: drivers/gpu/drm/xe/xe_pt.c:1984:
+ * installing job fence in various places.
+  *

-:2413: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2413: FILE: drivers/gpu/drm/xe/xe_pt.c:1985:
+  *
+ * Return: fence on success, negative ERR_PTR on error.

-:2753: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#2753: 
new file mode 100644

total: 1 errors, 6 warnings, 0 checks, 4172 lines checked


