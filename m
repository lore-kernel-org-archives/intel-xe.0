Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2803CC7114C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 22:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC59510E5FA;
	Wed, 28 Aug 2024 22:43:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212E10E5FB;
 Wed, 28 Aug 2024 22:43:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fixes_and_debug?=
 =?utf-8?q?_improvements_for_GSC_load_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 22:43:51 -0000
Message-ID: <172488503199.829446.8488497505012485190@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: fixes and debug improvements for GSC load (rev2)
URL   : https://patchwork.freedesktop.org/series/137270/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c714be7a70c3d454065535985163c15e7df98fe4
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Aug 28 14:51:57 2024 -0700

    drm/xe/gsc: Add debugfs to print GSC info
    
    This is useful for debug, in case something goes wrong with the GSC. The
    info includes the version information and the current value of the HECI1
    status registers.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 6b66ec881f7ae385f90fe6ad8c6ebef112873a17 drm-intel
056af5faf97c drm/xe/gsc: Do not attempt to load the GSC multiple times
2e1cea6508b3 drm/xe/gsc: Fix FW status if the firmware is already loaded
4d29c7445f6b drm/xe/gsc: Track the platform in the compatibility version
-:59: WARNING:MACRO_ARG_UNUSED: Argument 'a' is not used in function-like macro
#59: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:145:
+#define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))

-:59: WARNING:MACRO_ARG_UNUSED: Argument 'c' is not used in function-like macro
#59: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:145:
+#define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
+	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))

-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#68: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
+	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
+	  a, b, c }

-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#68: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
+	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
+	  a, b, c }

-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'c' - possible side-effects?
#68: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:157:
+#define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
+	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
+	  a, b, c }

total: 0 errors, 2 warnings, 3 checks, 57 lines checked
c714be7a70c3 drm/xe/gsc: Add debugfs to print GSC info
-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_gsc.c:614:
+	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),

-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
new file mode 100644

total: 0 errors, 1 warnings, 1 checks, 173 lines checked


