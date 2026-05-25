Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E2CCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 15:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E6B10E19C;
	Mon, 25 May 2026 15:16:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E8910E19C;
 Mon, 25 May 2026 15:16:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Unify_fault_inj?=
 =?utf-8?q?ection_hooks_for_CSC=2C_GT_reset_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 15:16:06 -0000
Message-ID: <177972216672.5829.11177512247513894939@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
In-Reply-To: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
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

Series: drm/xe: Unify fault injection hooks for CSC, GT reset (rev9)
URL   : https://patchwork.freedesktop.org/series/164761/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e108a97adbb50ce12851acb4d439c19d8f78d761
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Fri May 22 17:36:29 2026 +0530

    drm/xe: Unify fault injection hooks for CSC, GT reset
    
    The fault injection code was scattered: the GT reset
    hook lived in xe_gt.h as an inline function with its own global
    variable, the CSC hook had a separate global in xe_hw_error.c with
    an extern declaration, and each was individually registered in
    xe_debugfs.c. Adding a new error type meant editing many files and
    copy-pasting the same boilerplate.
    
    Create a single, centralized fault injection module
    (xe_fault_inject.c/h) that manages all fault types through
    one table. Each type is just an entry in an enum and a one-line
    row in a descriptor array -- no more scattered globals,
    externs, or per-type inline helpers.
    
    Debugfs interface (under /sys/kernel/debug/dri/0/):
     - fail_gt_reset         - GT reset failure
     - inject_csc_hw_error   - CSC firmware error
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 04d475020800d0a1033ca89a0d6d5fc638ddc65b drm-intel
e108a97adbb5 drm/xe: Unify fault injection hooks for CSC, GT reset
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked


