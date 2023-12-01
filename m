Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49719C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8738F10E82B;
	Fri,  1 Dec 2023 09:29:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3118C10E82A;
 Fri,  1 Dec 2023 09:29:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 28812A0003;
 Fri,  1 Dec 2023 09:29:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Date: Fri, 01 Dec 2023 09:29:51 -0000
Message-ID: <170142299116.19690.14583493983332894710@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231201091405.658548-1-animesh.manna@intel.com>
In-Reply-To: <20231201091405.658548-1-animesh.manna@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DS?=
 =?utf-8?q?B_refactoring_=28rev3=29?=
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

Series: DSB refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/127049/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4457dd029b411ef2f0d8970a98a21d8d9f83459d
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Fri Dec 1 14:44:05 2023 +0530

    drm/xe/dsb: DSB implementation for xe
    
    Add xe specific DSB buffer handling methods.
    
    v1: Initial version.
    v2: Add null check after dynamic memory allocation of vma. [Uma]
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 450234a8c60f880247d4f3a3137058eec6f4e491 drm-intel
9fb4a1f9c Revert "FIXME: drm/i915/dsb: xe changes for dsb"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ae96663654bcc3bff12f5c497647df2818e0c1a8', maybe rebased or not pulled?
#6: 
This reverts commit ae96663654bcc3bff12f5c497647df2818e0c1a8.

total: 0 errors, 1 warnings, 0 checks, 243 lines checked
1d7a7de36 drm/i915/dsb: Allocate command buffer from local memory
4ea305bc3 drm/i915/dsb: Correct DSB command buffer cache coherency settings
2d8cf6936 drm/i915/dsb: Re-instate DSB for LUT updates
a943dcfa6 drm/i915/dsb: DSB code refactoring
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:295: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#295: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 356 lines checked
4457dd029 drm/xe/dsb: DSB implementation for xe
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 78 lines checked


