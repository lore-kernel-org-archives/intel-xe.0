Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0E9EB64DD
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 13:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023610E52E;
	Wed, 12 Jul 2023 13:40:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2784010E52E;
 Wed, 12 Jul 2023 13:40:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 17BD7AADEA;
 Wed, 12 Jul 2023 13:40:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Date: Wed, 12 Jul 2023 13:40:56 -0000
Message-ID: <168916925609.17979.17770267780801272098@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/ppgtt=3A_Add_support_for_correct_PAT_encoding_in_Page_Tabl?=
 =?utf-8?q?e_Entry_=28PTE=29_format?=
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

Series: drm/xe/ppgtt: Add support for correct PAT encoding in Page Table Entry (PTE) format
URL   : https://patchwork.freedesktop.org/series/120614/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 465a154857a7af47fa4b32131811801f2bccb99f
Author: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date:   Wed Jul 12 18:26:40 2023 +0530

    drm/xe/ppgtt: Add support for correct PAT encoding in Page Table Entry (PTE) format
    
    Different platforms has different PAT encoding in PTE format, add
    correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
    
    Bspec: 45101, 71582
    Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
465a15485 drm/xe/ppgtt: Add support for correct PAT encoding in Page Table Entry (PTE) format
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:156: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#156: 
new file mode 100644

-:169: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#169: FILE: drivers/gpu/drm/xe/xe_pte.h:9:
+#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3)

total: 1 errors, 1 warnings, 0 checks, 172 lines checked


