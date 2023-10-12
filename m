Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA7DCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 05:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218C10E40E;
	Thu, 12 Oct 2023 05:14:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F27510E40D;
 Thu, 12 Oct 2023 05:14:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D1F1A47E9;
 Thu, 12 Oct 2023 05:14:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Thu, 12 Oct 2023 05:14:38 -0000
Message-ID: <169708767811.25007.11265207987642788848@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_compatibility_issue_for_intel=5Fdmc_=28rev2=29?=
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

Series: Fix compatibility issue for intel_dmc (rev2)
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
commit bace5c2bfdcd22707a1fee7578b56736bed6aa77
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Thu Oct 12 10:36:45 2023 +0530

    drm/xe: Add intel_uc_fw.h compatibility header
    
    Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility
    with intel_dmc code.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
36eeff4a2 Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a0cdbefc3aea03c1d3f30460c1d89678705d57bb', maybe rebased or not pulled?
#6: 
This reverts commit a0cdbefc3aea03c1d3f30460c1d89678705d57bb.

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
3b845d5ea drm/i915: Add wrapper for getting display step
2127b8ea3 fixup! drm/xe/display: Implement display support
4f2829863 drm/xe: Add intel_step.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
b6ac91f66 drm/xe: Add i915_gpu_error.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
bace5c2bf drm/xe: Add intel_uc_fw.h compatibility header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


