Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964CFCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 18:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678E910E396;
	Mon,  2 Sep 2024 18:06:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4810E396;
 Mon,  2 Sep 2024 18:06:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915_=26_drm/xe=3A_sh?=
 =?utf-8?q?ared_PCI_ID_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 18:06:08 -0000
Message-ID: <172530036874.908012.13072907590707446665@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725297097.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725297097.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: shared PCI ID macros
URL   : https://patchwork.freedesktop.org/series/138109/
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
commit 91e90f299d16f6a1be8fef42f3d9598bea0bf2d1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Sep 2 20:14:07 2024 +0300

    drm/xe: switch to common PCI ID macros
    
    Switch to the shared PCI ID macros in drm/intel/pciids.h. Remove
    xe_pciids.h.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e drm-intel
2a79329d0cf8 drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()
81c626e5f4ad drm/i915/pciids: separate ARL and MTL PCI IDs
51180c0999c1 drm/xe/pciids: add some missing ADL-N PCI IDs
774fd36a11e5 drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
ad9787b4ac25 drm/xe/pciids: separate ARL and MTL PCI IDs
-:34: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#34: FILE: include/drm/intel/xe_pciids.h:180:
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__)

-:34: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#34: FILE: include/drm/intel/xe_pciids.h:180:
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 31 lines checked
bafa3d232a51 drm/i915/pciids: add PVC PCI ID macros
-:22: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#22: FILE: include/drm/intel/i915_pciids.h:783:
+#define INTEL_PVC_IDS(MACRO__, ...) \
+	MACRO__(0x0B69, ## __VA_ARGS__), \
+	MACRO__(0x0B6E, ## __VA_ARGS__), \
+	MACRO__(0x0BD4, ## __VA_ARGS__), \
+	MACRO__(0x0BD5, ## __VA_ARGS__), \
+	MACRO__(0x0BD6, ## __VA_ARGS__), \
+	MACRO__(0x0BD7, ## __VA_ARGS__), \
+	MACRO__(0x0BD8, ## __VA_ARGS__), \
+	MACRO__(0x0BD9, ## __VA_ARGS__), \
+	MACRO__(0x0BDA, ## __VA_ARGS__), \
+	MACRO__(0x0BDB, ## __VA_ARGS__), \
+	MACRO__(0x0BE0, ## __VA_ARGS__), \
+	MACRO__(0x0BE1, ## __VA_ARGS__), \
+	MACRO__(0x0BE5, ## __VA_ARGS__)

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#22: FILE: include/drm/intel/i915_pciids.h:783:
+#define INTEL_PVC_IDS(MACRO__, ...) \
+	MACRO__(0x0B69, ## __VA_ARGS__), \
+	MACRO__(0x0B6E, ## __VA_ARGS__), \
+	MACRO__(0x0BD4, ## __VA_ARGS__), \
+	MACRO__(0x0BD5, ## __VA_ARGS__), \
+	MACRO__(0x0BD6, ## __VA_ARGS__), \
+	MACRO__(0x0BD7, ## __VA_ARGS__), \
+	MACRO__(0x0BD8, ## __VA_ARGS__), \
+	MACRO__(0x0BD9, ## __VA_ARGS__), \
+	MACRO__(0x0BDA, ## __VA_ARGS__), \
+	MACRO__(0x0BDB, ## __VA_ARGS__), \
+	MACRO__(0x0BE0, ## __VA_ARGS__), \
+	MACRO__(0x0BE1, ## __VA_ARGS__), \
+	MACRO__(0x0BE5, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 22 lines checked
b6efd4f6c383 drm/intel/pciids: rename i915_pciids.h to just pciids.h
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
rename from include/drm/intel/i915_pciids.h

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
91e90f299d16 drm/xe: switch to common PCI ID macros
-:113: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#113: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 91 lines checked


