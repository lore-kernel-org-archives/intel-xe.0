Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57A110E166;
	Tue, 28 Nov 2023 16:30:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B15A010E166;
 Tue, 28 Nov 2023 16:30:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE3A7A882E;
 Tue, 28 Nov 2023 16:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 28 Nov 2023 16:30:44 -0000
Message-ID: <170118904471.8219.9514628178933268784@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_In?=
 =?utf-8?q?troduce_Local_Memory_Translation_Table?=
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

Series: Introduce Local Memory Translation Table
URL   : https://patchwork.freedesktop.org/series/126993/
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
commit c96f8f84c807c0764c2575962f674c7fb01afc6f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Nov 28 16:15:07 2023 +0100

    drm/xe/kunit: Add test for LMTT operations
    
    The LMTT variants are abstracted with xe_lmtt_ops. Make sure that
    both 2L and ML ops implementations are correct.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch b06c9f366cd09b888be061d23eecffed7139c09b drm-intel
e825c177c drm/xe: Define DRM_XE_DEBUG_SRIOV config
-:20: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#20: FILE: drivers/gpu/drm/xe/Kconfig.debug:43:
+config DRM_XE_DEBUG_SRIOV
+	bool "Enable extra SR-IOV debugging"
+	default n
+	help
+	  Enable extra SR-IOV debugging info.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
956109d03 drm/xe: Introduce SR-IOV logging macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe' - possible side-effects?
#31: FILE: drivers/gpu/drm/xe/xe_sriov_printk.h:14:
+#define xe_sriov_printk_prefix(xe) \
+	((xe)->sriov.__mode == XE_SRIOV_MODE_PF ? "PF: " : \
+	 (xe)->sriov.__mode == XE_SRIOV_MODE_VF ? "VF: " : "")

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe' - possible side-effects?
#35: FILE: drivers/gpu/drm/xe/xe_sriov_printk.h:18:
+#define xe_sriov_printk(xe, _level, fmt, ...) \
+	drm_##_level(&(xe)->drm, "%s" fmt, xe_sriov_printk_prefix(xe), ##__VA_ARGS__)

total: 0 errors, 1 warnings, 2 checks, 46 lines checked
d6f0629bb drm/xe/pf: Introduce Local Memory Translation Table
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
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

-:537: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#537: FILE: drivers/gpu/drm/xe/xe_lmtt.c:401:
+		lmtt_write_pte(lmtt, pt, lmtt->ops->lmtt_pte_encode(addr, 0),
+					 lmtt->ops->lmtt_pte_index(start, 0));

total: 0 errors, 1 warnings, 1 checks, 991 lines checked
de48441d8 drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
c96f8f84c drm/xe/kunit: Add test for LMTT operations
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 80 lines checked


