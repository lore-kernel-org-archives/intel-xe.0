Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3DACDB465
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 00:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48810E2E4;
	Thu, 12 Oct 2023 00:05:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 178B110E2E4;
 Thu, 12 Oct 2023 00:05:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 15F3EAA916;
 Thu, 12 Oct 2023 00:05:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommithi Sakeena" <bommithi.sakeena@intel.com>
Date: Thu, 12 Oct 2023 00:05:37 -0000
Message-ID: <169706913708.25007.11988585775985390269@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011174252.10427-1-bommithi.sakeena@intel.com>
In-Reply-To: <20231011174252.10427-1-bommithi.sakeena@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Encapsulate_all_the_module_parameters?=
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

Series: drm/xe: Encapsulate all the module parameters
URL   : https://patchwork.freedesktop.org/series/124995/
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
commit 618a4457bfc5e8cd0f88808b9be36ab40fe45e91
Author: Bommithi Sakeena <bommithi.sakeena@intel.com>
Date:   Wed Oct 11 17:42:52 2023 +0000

    drm/xe: Encapsulate all the module parameters
    
    Encapsulate all the module paramters in one single global struct
    variable inside the new xe_modparam.h.
    
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
+ /mt/dim checkpatch fe4d6ceb20b5ebad356c722396c2c06d4485c359 drm-intel
618a4457b drm/xe: Encapsulate all the module parameters
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:6: WARNING:TYPO_SPELLING: 'paramters' may be misspelled - perhaps 'parameters'?
#6: 
Encapsulate all the module paramters in one single global struct
                           ^^^^^^^^^

-:110: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#110: 
new file mode 100644

-:135: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#135: FILE: drivers/gpu/drm/xe/xe_modparam.h:21:
+};
+extern struct xe_module_parameters xe_mod_param;

total: 0 errors, 2 warnings, 1 checks, 208 lines checked


