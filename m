Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9969AC47422
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 06:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A29D10E859;
	Wed, 24 Jan 2024 06:16:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3726410E859;
 Wed, 24 Jan 2024 06:16:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixed-type_GENMASK/BIT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 24 Jan 2024 06:16:32 -0000
Message-ID: <170607699222.685200.8044766065888749758@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
In-Reply-To: <20240124050205.3646390-1-lucas.demarchi@intel.com>
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

Series: Fixed-type GENMASK/BIT
URL   : https://patchwork.freedesktop.org/series/129115/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 90e9441b124221d045a177b34ab31ea8e6c3792a
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jan 23 21:02:05 2024 -0800

    drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*
    
    Now that include/linux/bits.h implements fixed-width GENMASK_*, use them
    to implement the i915/xe specific macros. Converting each driver to use
    the generic macros are left for later, when/if other driver-specific
    macros are also generalized.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 0496fe20d8ed5e73ed186d293ef67e7bae4658eb drm-intel
c832e0ef9 bits: introduce fixed-type genmasks
-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#48: FILE: include/linux/bits.h:35:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'h' - possible side-effects?
#48: FILE: include/linux/bits.h:35:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#48: FILE: include/linux/bits.h:35:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

total: 0 errors, 0 warnings, 3 checks, 41 lines checked
a3907862a bits: Introduce fixed-type BIT
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#19: FILE: include/linux/bits.h:27:
+#define BIT_INPUT_CHECK(type, b) \
+	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
+		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#36: FILE: include/linux/bits.h:51:
+#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))

-:37: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#37: FILE: include/linux/bits.h:52:
+#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#38: FILE: include/linux/bits.h:53:
+#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#39: FILE: include/linux/bits.h:54:
+#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))

total: 0 errors, 0 warnings, 5 checks, 25 lines checked
90e9441b1 drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*


