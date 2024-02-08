Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A005EC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 17:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C9010E052;
	Thu,  8 Feb 2024 17:05:39 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1033A10E052;
 Thu,  8 Feb 2024 17:05:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixed-type_GENMASK/BIT_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 17:05:38 -0000
Message-ID: <170741193807.1109599.14281223929081127186@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
In-Reply-To: <20240208074521.577076-1-lucas.demarchi@intel.com>
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

Series: Fixed-type GENMASK/BIT (rev3)
URL   : https://patchwork.freedesktop.org/series/129115/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36e5b56ef1ea7182c7d3c50a14e15290539ac740
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Feb 7 23:45:21 2024 -0800

    drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*
    
    Now that include/linux/bits.h implements fixed-width GENMASK_*, use them
    to implement the i915/xe specific macros. Converting each driver to use
    the generic macros are left for later, when/if other driver-specific
    macros are also generalized.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 22d626404cb81d7818ab55e5b14885e31a998dfd drm-intel
bc106b7e0 bits: introduce fixed-type genmasks
-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 't' - possible side-effects?
#72: FILE: include/linux/bits.h:45:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'h' - possible side-effects?
#72: FILE: include/linux/bits.h:45:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'l' - possible side-effects?
#72: FILE: include/linux/bits.h:45:
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

total: 0 errors, 0 warnings, 3 checks, 51 lines checked
28789da69 bits: Introduce fixed-type BIT
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#20: FILE: include/linux/bits.h:27:
+#define BIT_INPUT_CHECK(type, b) \
+	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
+		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))

-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#45: FILE: include/linux/bits.h:69:
+#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))

-:46: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#46: FILE: include/linux/bits.h:70:
+#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#47: FILE: include/linux/bits.h:71:
+#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))

-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'b' - possible side-effects?
#48: FILE: include/linux/bits.h:72:
+#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))

total: 0 errors, 0 warnings, 5 checks, 33 lines checked
36e5b56ef drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*


