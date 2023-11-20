Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56410C54E76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 08:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235A010E326;
	Mon, 20 Nov 2023 08:45:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A844A10E326;
 Mon, 20 Nov 2023 08:45:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A62F1A47DF;
 Mon, 20 Nov 2023 08:45:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruthuvikas Ravikumar" <ruthuvikas.ravikumar@intel.com>
Date: Mon, 20 Nov 2023 08:45:38 -0000
Message-ID: <170046993867.29476.9605109749155652088@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116215152.2248859-1-ruthuvikas.ravikumar@intel.com>
In-Reply-To: <20231116215152.2248859-1-ruthuvikas.ravikumar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_mocs_kunit_=28rev16=29?=
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

Series: drm/xe: Add mocs kunit (rev16)
URL   : https://patchwork.freedesktop.org/series/124926/
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
commit 2018ac87786f243bf8146e04679975954131bbe9
Author: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Date:   Fri Nov 17 03:21:52 2023 +0530

    drm/xe: Add mocs kunit
    
    This kunit verifies the hardware values of mocs and
    l3cc registers with the KMD programmed values.
    
    v14: Fix CHECK.
    
    v13: Remove ret after forcewake.
    
    v11: Add KUNIT_ASSERT_EQ_MSG for Forcewake.
    
    v9/v10: Add Forcewake Fail.
    
    v8: Remove xe_bo.h and xe_pm.h
        Remove mocs and l3cc from live_mocs.
        Pull debug and err msg for mocs/l3cc out of if else block.
        Add HAS_LNCF_MOCS.
    
    v7: correct checkpath
    
    v6: Change ssize_t type.
        Change forcewake domain to XE_FW_GT.
        Update change of MOCS registers are multicast on Xe_HP and beyond
        patch.
    
    v5: Release forcewake.
        Remove single statement braces.
        Fix debug statements.
    
    v4: Drop stratch and vaddr.
        Fix debug statements.
        Fix indentation.
    
    v3: Fix checkpath.
    
    v2: Fix checkpath.
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mathew D Roper <matthew.d.roper@intel.com>
    Reviewed-by: Mathew D Roper <matthew.d.roper@intel.com>
    Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
+ /mt/dim checkpatch b25aa17bffa88c86fec716e40bdb3848eea17b23 drm-intel
2018ac877 drm/xe: Add mocs kunit
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 181 lines checked


