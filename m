Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F17BCDB47E
	for <intel-xe@archiver.kernel.org>; Sun, 15 Oct 2023 05:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EF010E082;
	Sun, 15 Oct 2023 05:34:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3095D10E082;
 Sun, 15 Oct 2023 05:34:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2AE5BAADF1;
 Sun, 15 Oct 2023 05:34:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Sun, 15 Oct 2023 05:34:49 -0000
Message-ID: <169734808917.21828.13838804764392344491@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231015053119.6271-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231015053119.6271-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Enable_fixed_CCS_mode?=
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

Series: drm/xe/pvc: Enable fixed CCS mode
URL   : https://patchwork.freedesktop.org/series/125148/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7855df5fdd4d972e54aef0134bb93069885257a2
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Sat Oct 14 22:31:19 2023 -0700

    drm/xe/pvc: Enable fixed CCS mode
    
    Allow static assignment of compute slices to a user selected
    number of compute engines. Add a per-tile 'ccs_mode' sysfs
    interface for user selection. By default assign all compute
    resources to the first available compute engine. User must
    ensure the tile is idle while changing the ccs mode as this
    causes a tile reset.
    
    Support this mode for PVC which can be extended to other
    platforms in future.
    
    IGT: https://patchwork.freedesktop.org/series/125147/
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 7a2215ad9efde6949c4f3e75ca0776e075eabc47 drm-intel
7855df5fd drm/xe/pvc: Enable fixed CCS mode
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'IGT:', use 'Link:' or 'Closes:' instead
#16: 
IGT: https://patchwork.freedesktop.org/series/125147/

-:53: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'cslice' may be better as '(cslice)' to avoid precedence issues
#53: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:375:
+#define   CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))

-:53: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ccs' may be better as '(ccs)' to avoid precedence issues
#53: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:375:
+#define   CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))

-:160: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'gt' may be better as '(gt)' to avoid precedence issues
#160: FILE: drivers/gpu/drm/xe/xe_gt.h:20:
+#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)

-:166: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#166: 
new file mode 100644

total: 0 errors, 2 warnings, 3 checks, 386 lines checked


