Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447F8C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 00:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BF210E7F6;
	Thu,  2 Nov 2023 00:23:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A4A310E7F6;
 Thu,  2 Nov 2023 00:23:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 276AFA7DFB;
 Thu,  2 Nov 2023 00:23:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 02 Nov 2023 00:23:49 -0000
Message-ID: <169888462915.28156.13984925341477633861@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pvc=3A_Enable_fixed_CCS_mode_=28rev2=29?=
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

Series: drm/xe/pvc: Enable fixed CCS mode (rev2)
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
commit 9c6d43b58b9ce9a15b7404b4f4ff653927e60c7f
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed Nov 1 16:57:49 2023 -0700

    drm/xe: Prevent exec_queues creation on diabled CCS engines
    
    Ensure no exec_queues are opened when changing CCS mode.
    Allow exec_queue creation only with enabled CCS engines.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch ff616f1d0e92e64af239b351437421eb78922b8c drm-intel
1004e6569 drm/xe: Enable Fixed CCS mode setting
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:48: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'cslice' may be better as '(cslice)' to avoid precedence issues
#48: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:404:
+#define   CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))

-:48: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ccs' may be better as '(ccs)' to avoid precedence issues
#48: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:404:
+#define   CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))

-:155: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'gt' may be better as '(gt)' to avoid precedence issues
#155: FILE: drivers/gpu/drm/xe/xe_gt.h:20:
+#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)

-:161: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#161: 
new file mode 100644

total: 0 errors, 1 warnings, 3 checks, 363 lines checked
9c6d43b58 drm/xe: Prevent exec_queues creation on diabled CCS engines
-:4: WARNING:TYPO_SPELLING: 'diabled' may be misspelled - perhaps 'disabled'?
#4: 
Subject: [PATCH] drm/xe: Prevent exec_queues creation on diabled CCS engines
                                                         ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 117 lines checked


