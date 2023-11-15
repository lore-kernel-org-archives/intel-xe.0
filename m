Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93B1C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB610E23C;
	Wed, 15 Nov 2023 00:49:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC23310E23C;
 Wed, 15 Nov 2023 00:49:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D87C7AADF5;
 Wed, 15 Nov 2023 00:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 15 Nov 2023 00:49:47 -0000
Message-ID: <170000938788.645.13996375000755785027@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GS?=
 =?utf-8?q?C_FW_loading_=28rev2=29?=
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

Series: GSC FW loading (rev2)
URL   : https://patchwork.freedesktop.org/series/125717/
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
commit ece468c77bccc952813bcc3b83669e39b7a50302
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Nov 14 16:46:14 2023 -0800

    drm/xe/gsc: Define GSC FW for MTL
    
    We track GSC FW based on its compatibility version, which is what
    determines the interface it supports.
    Also add a modparam override like the ones for GuC and HuC.
    
    v2: fix module param description (John)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 2fe82053d916d09ffcc92bc27294c9eed4e4804b drm-intel
cd8503741 fixup! drm/xe/guc: Report submission version of GuC firmware
7fe6aa44a drm/xe/uc: Rework uC version tracking
-:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p_' - possible side-effects?
#206: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:528:
+#define print_uc_fw_version(p_, version_, prefix_, ...) \
+do { \
+	struct xe_uc_fw_version *ver_ = (version_); \
+	if (ver_->build) \
+		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
+			   ver_->major, ver_->minor, \
+			   ver_->patch, ver_->build); \
+	else \
+		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
+			  ver_->major, ver_->minor, ver_->patch); \
+} while (0)

-:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#206: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:528:
+#define print_uc_fw_version(p_, version_, prefix_, ...) \
+do { \
+	struct xe_uc_fw_version *ver_ = (version_); \
+	if (ver_->build) \
+		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
+			   ver_->major, ver_->minor, \
+			   ver_->patch, ver_->build); \
+	else \
+		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
+			  ver_->major, ver_->minor, ver_->patch); \
+} while (0)

total: 0 errors, 0 warnings, 2 checks, 298 lines checked
9002444b3 drm/xe/gsc: Introduce GSC FW
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
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:65: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'gt != tile->media_gt'
#65: FILE: drivers/gpu/drm/xe/xe_gsc.c:28:
+	if (tile->media_gt && (gt != tile->media_gt)) {

total: 0 errors, 1 warnings, 1 checks, 193 lines checked
520065416 drm/xe/gsc: Parse GSC FW header
a564cf109 drm/xe/gsc: GSC FW load
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 418 lines checked
cba67de99 drm/xe/gsc: Implement WA 14015076503
943e088cb drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
ae90c4c6c drm/xe/gsc: Add an interface for GSC packet submissions
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
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 275 lines checked
283cc31c6 drm/xe/gsc: Query GSC compatibility version
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 187 lines checked
4cc218572 drm/xe/gsc: Define GSCCS for MTL
ece468c77 drm/xe/gsc: Define GSC FW for MTL


