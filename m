Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD298EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9934210E5D1;
	Fri, 23 Jun 2023 04:16:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37F0110E5D1;
 Fri, 23 Jun 2023 04:16:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 34D4CAADD8;
 Fri, 23 Jun 2023 04:16:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Fri, 23 Jun 2023 04:16:05 -0000
Message-ID: <168749376521.31831.4696677663793596988@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230623041257.3550266-1-david.kershner@intel.com>
In-Reply-To: <20230623041257.3550266-1-david.kershner@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_Intel_Accelerated_Fabric_to_Xe_=28rev3=29?=
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

Series: Add Intel Accelerated Fabric to Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/119706/
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
commit 99a66a501d8a15097c2e4ff23fcb75509cb3efe5
Author: David Kershner <david.kershner@intel.com>
Date:   Fri Jun 23 00:12:57 2023 -0400

    drm/xe: Introduce Intel Accelerator fabric driver
    
    Add the Intel accelerated fabric driver infrastructure and driver
    framework.
    
    Signed-off-by: David Kershner <david.kershner@intel.com>
+ /mt/dim checkpatch 4287d7a61a8f6b40e4f99055870b1239d8439050 drm-intel
814824508 drm/xe: Introduce a module parameter to control IAF
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
c1b3f6d37 drm/xe: Introduce Intel Accelerated Fabric device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:701: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#701: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 899 lines checked
99a66a501 drm/xe: Introduce Intel Accelerator fabric driver
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
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

-:43: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#43: FILE: drivers/gpu/drm/xe/fabric/Kconfig:2:
+config DRM_XE_INTEL_FABRIC
+	tristate "Intel Fabric Connectivity driver support"
+	depends on 64BIT
+	depends on NET
+	select LIBCRC32C
+	default m
+	help
+	  This kernel driver provides support for the Intel glueless
+	  fabric adapter. The Intel fabric adapter allows GPUs to share
+	  device memory space in a device specific address space.
+

-:54: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#54: FILE: drivers/gpu/drm/xe/fabric/Kconfig:13:
+config IAF_DEBUG_ENABLE
+	bool "Enable Intel Accelerator Fabric debug configurations"
+	depends on DRM_XE_INTEL_FABRIC
+	default n
+	help
+	  Support Intel Accelerator Fabric debug Kconfig options

-:635: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sd' - possible side-effects?
#635: FILE: drivers/gpu/drm/xe/fabric/iaf_drv.h:53:
+#define IS_ANR_STEP(sd, since, until) (IS_ANR(sd) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) >= (since) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) <= (until))

total: 0 errors, 3 warnings, 1 checks, 1578 lines checked


