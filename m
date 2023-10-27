Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C4C25B48
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868A910EA1C;
	Fri, 27 Oct 2023 22:32:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA2A210EA1C;
 Fri, 27 Oct 2023 22:32:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D80D8A0093;
 Fri, 27 Oct 2023 22:32:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Fri, 27 Oct 2023 22:32:57 -0000
Message-ID: <169844597788.19710.16664047200755648500@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GS?=
 =?utf-8?q?C_FW_loading?=
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

Series: GSC FW loading
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
commit bfb0ed12aee560b93dc3056de7832bcd95c6cb81
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Oct 27 15:29:26 2023 -0700

    drm/xe/gsc: Define GSC FW for MTL
    
    We track GSC FW based on its compatibility version, which is what
    determines the interface it supports.
    Also add a modparam override like the ones for GuC and HuC.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch f24c46200dc8fad700f51106e678d68d38496860 drm-intel
01e883a3a drm/xe: implement driver initiated function-reset
f88539d04 fixup! drm/xe/guc: Report submission version of GuC firmware
590a5b6a1 drm/xe/uc: Rework uC version tracking
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
+} while(0);

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
+} while(0);

-:206: WARNING:DO_WHILE_MACRO_WITH_TRAILING_SEMICOLON: do {} while (0) macros should not be semicolon terminated
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
+} while(0);

-:216: ERROR:SPACING: space required before the open parenthesis '('
#216: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:538:
+} while(0);

total: 1 errors, 1 warnings, 2 checks, 298 lines checked
790a1435c drm/xe/gsc: Introduce GSC FW
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
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:63: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'gt != tile->media_gt'
#63: FILE: drivers/gpu/drm/xe/xe_gsc.c:28:
+	if (tile->media_gt && (gt != tile->media_gt)) {

-:231: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#231: FILE: drivers/gpu/drm/xe/xe_uc_fw_types.h:61:
 };
+#define XE_UC_FW_NUM_TYPES 3

total: 0 errors, 1 warnings, 2 checks, 186 lines checked
7f147cee3 drm/xe/gsc: Parse GSC FW header
-:48: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#48: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:493:
+		struct xe_gsc * gsc = container_of(uc_fw, struct xe_gsc, fw);

total: 1 errors, 0 warnings, 0 checks, 235 lines checked
8220f5ca7 drm/xe/gsc: GSC FW load
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:360: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#360: FILE: drivers/gpu/drm/xe/xe_gsc.c:268:
+
+}

total: 0 errors, 1 warnings, 1 checks, 408 lines checked
65fcf37ec drm/xe/gsc: Implement WA 14015076503
-:96: WARNING:RETURN_VOID: void function return statements are not generally useful
#96: FILE: drivers/gpu/drm/xe/xe_gt.c:535:
+	return;
+}

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
b70e25c8d drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
4b7e69532 drm/xe/gsc: Add an interface for GSC packet submissions
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
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 261 lines checked
b0022f477 drm/xe/gsc: Query GSC compatibility version
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

-:89: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#89: FILE: drivers/gpu/drm/xe/xe_gsc.c:104:
+	query_msg_wr(xe, map, wr_offset, header.command, MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION);

-:97: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#97: FILE: drivers/gpu/drm/xe/xe_gsc.c:112:
+	struct xe_uc_fw_version *compatibility = &gsc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];

-:108: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#108: FILE: drivers/gpu/drm/xe/xe_gsc.c:123:
+	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
+			  ttm_bo_type_kernel,

-:110: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#110: FILE: drivers/gpu/drm/xe/xe_gsc.c:125:
+			  XE_BO_CREATE_GGTT_BIT);;

total: 0 errors, 4 warnings, 1 checks, 185 lines checked
55c932772 drm/xe/gsc: Define GSCCS for MTL
bfb0ed12a drm/xe/gsc: Define GSC FW for MTL


