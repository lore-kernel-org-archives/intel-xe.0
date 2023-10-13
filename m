Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A021CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 07:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1887610E5C4;
	Fri, 13 Oct 2023 07:24:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A210E5C7;
 Fri, 13 Oct 2023 07:24:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C456AADD7;
 Fri, 13 Oct 2023 07:24:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Date: Fri, 13 Oct 2023 07:24:18 -0000
Message-ID: <169718185830.31157.3701594816363723365@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_compatibility_issue_for_intel=5Fdmc_=28rev4=29?=
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

Series: Fix compatibility issue for intel_dmc (rev4)
URL   : https://patchwork.freedesktop.org/series/124969/
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
commit 71e86015127c17060601a1ff2c816c8edd9cadc6
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Fri Oct 13 12:23:23 2023 +0530

    fixup! drm/xe/display: Implement display support
    
    Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility
    with intel_dmc code.
    
    v2: Do not specify directory for firmware repository path
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
362d9079e Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a0cdbefc3aea03c1d3f30460c1d89678705d57bb', maybe rebased or not pulled?
#6: 
This reverts commit a0cdbefc3aea03c1d3f30460c1d89678705d57bb.

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
0e145cb09 drm/i915: Add wrapper for getting display step
aa1e6d5a4 fixup! drm/xe/display: Implement display support
2f8d0fc7e fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
a20a7ef45 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
71e860151 fixup! drm/xe/display: Implement display support
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


