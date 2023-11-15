Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E1C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 20:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9626E10E1BA;
	Wed, 15 Nov 2023 20:12:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5878210E1B4;
 Wed, 15 Nov 2023 20:12:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 55441AADE8;
 Wed, 15 Nov 2023 20:12:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 15 Nov 2023 20:12:57 -0000
Message-ID: <170007917734.645.3850345396495744098@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115160600.123008-1-lucas.demarchi@intel.com>
In-Reply-To: <20231115160600.123008-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_io?=
 =?utf-8?q?sys-map=3A_Rename_locals_used_inside_macros?=
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

Series: iosys-map: Rename locals used inside macros
URL   : https://patchwork.freedesktop.org/series/126484/
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
commit f0e788e5c3507534afa730c0e724a383a7e1abb6
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 15 08:06:00 2023 -0800

    iosys-map: Rename locals used inside macros
    
    Widely used variable names can be used by macro users, potentially
    leading to name collisions.
    Suffix locals used inside the macros with an underscore, to reduce the
    collision potential.
    
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231024110710.3039807-1-michal.winiarski@intel.com
    (cherry picked from commit 2e122362d25e1b977aa5c5c88c03956be4228e02)
+ /mt/dim checkpatch eba8bfb1dc87535362e28de282addc8752204df4 drm-intel
f0e788e5c iosys-map: Rename locals used inside macros
-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'map__' - possible side-effects?
#50: FILE: include/linux/iosys-map.h:394:
+#define iosys_map_rd(map__, offset__, type__) ({					\
+	type__ val_;									\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
+	val_;										\
 })

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'offset__' - possible side-effects?
#50: FILE: include/linux/iosys-map.h:394:
+#define iosys_map_rd(map__, offset__, type__) ({					\
+	type__ val_;									\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
+	val_;										\
 })

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'type__' - possible side-effects?
#50: FILE: include/linux/iosys-map.h:394:
+#define iosys_map_rd(map__, offset__, type__) ({					\
+	type__ val_;									\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
+	val_;										\
 })

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'map__' - possible side-effects?
#72: FILE: include/linux/iosys-map.h:416:
+#define iosys_map_wr(map__, offset__, type__, val__) ({					\
+	type__ val_ = (val__);								\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
 })

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'offset__' - possible side-effects?
#72: FILE: include/linux/iosys-map.h:416:
+#define iosys_map_wr(map__, offset__, type__, val__) ({					\
+	type__ val_ = (val__);								\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
 })

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'type__' - possible side-effects?
#72: FILE: include/linux/iosys-map.h:416:
+#define iosys_map_wr(map__, offset__, type__, val__) ({					\
+	type__ val_ = (val__);								\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
 })

total: 0 errors, 0 warnings, 6 checks, 76 lines checked


