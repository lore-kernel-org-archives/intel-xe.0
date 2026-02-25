Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE639EC113C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 19:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EC510E171;
	Wed, 25 Feb 2026 19:02:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E510E171;
 Wed, 25 Feb 2026 19:02:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_re?=
 =?utf-8?q?factor_register_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 19:02:02 -0000
Message-ID: <177204612265.286940.13043322879700153127@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772042022.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772042022.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: refactor register helpers
URL   : https://patchwork.freedesktop.org/series/162163/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26b374c51d1ed04384213b4e862b18f1fc778228
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 25 19:57:10 2026 +0200

    drm/i915/gt: prefer _PICK_EVEN() over _PICK()
    
    There's no need to use _PICK() here. Use the simpler one instead.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 940d2c5064ed09bca924fd8aa017be99cc745b31 drm-intel
72ce93d5668f drm/i915/reg: make masked field helpers constexpr
-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
#32: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:109:
+#define _MASKED_FIELD(mask, value) \
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
+	 __MASKED_FIELD(mask, value))

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#32: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:109:
+#define _MASKED_FIELD(mask, value) \
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
+	 __MASKED_FIELD(mask, value))

-:33: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:110:
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \

-:34: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:111:
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \

-:35: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:112:
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#38: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:115:
+#define _MASKED_BIT_ENABLE(a) \
+	(__builtin_choose_expr(__builtin_constant_p(a), _MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); _MASKED_FIELD(_a, _a); })))

-:39: WARNING:LONG_LINE: line length of 131 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:116:
+	(__builtin_choose_expr(__builtin_constant_p(a), _MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); _MASKED_FIELD(_a, _a); })))

total: 0 errors, 4 warnings, 3 checks, 28 lines checked
6ea5f612e6dd drm/i915/lrc: switch to _MASKED_BIT_ENABLE() and _MASKED_BIT_DISABLE()
169a1233ffee drm/{i915, xe}/reg: rename masked field helpers REG_MASKED_FIELD*()
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
sed -i 's/_MASKED_BIT_ENABLE/REG_MASKED_FIELD_ENABLE/g' $(git grep -wl _MASKED_BIT_ENABLE)

-:720: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
#720: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:108:
+#define REG_MASKED_FIELD(mask, value) \
 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
 	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
 	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
 	 ((mask) << 16 | (value)))

-:720: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#720: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:108:
+#define REG_MASKED_FIELD(mask, value) \
 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
 	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
 	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
 	 ((mask) << 16 | (value)))

-:728: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#728: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:114:
+#define REG_MASKED_FIELD_ENABLE(a) \
+	(__builtin_choose_expr(__builtin_constant_p(a), REG_MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); REG_MASKED_FIELD(_a, _a); })))

-:729: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#729: FILE: drivers/gpu/drm/i915/i915_reg_defs.h:115:
+	(__builtin_choose_expr(__builtin_constant_p(a), REG_MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); REG_MASKED_FIELD(_a, _a); })))

total: 0 errors, 2 warnings, 3 checks, 974 lines checked
e1e1e47e0322 drm/i915/perf: prefer REG_MASKED_FIELD_ENABLE() and REG_MASKED_FIELD_DISABLE()
41419f35d16d drm/xe/oa: prefer REG_MASKED_FIELD_ENABLE() and REG_MASKED_FIELD_DISABLE()
ebaf64b56930 drm/intel: add reg_bits.h for the various register content helpers
-:163: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#163: 
new file mode 100644

-:194: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__x' - possible side-effects?
#194: FILE: include/drm/intel/reg_bits.h:27:
+#define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))

-:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__mask' - possible side-effects?
#206: FILE: include/drm/intel/reg_bits.h:39:
+#define REG_FIELD_PREP8(__mask, __val)                                          \
+	((u8)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U8_MAX) +          \
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__val' - possible side-effects?
#206: FILE: include/drm/intel/reg_bits.h:39:
+#define REG_FIELD_PREP8(__mask, __val)                                          \
+	((u8)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U8_MAX) +          \
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:211: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#211: FILE: include/drm/intel/reg_bits.h:44:
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__mask' - possible side-effects?
#224: FILE: include/drm/intel/reg_bits.h:57:
+#define REG_FIELD_PREP16(__mask, __val)                                          \
+	((u16)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U16_MAX) +          \
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__val' - possible side-effects?
#224: FILE: include/drm/intel/reg_bits.h:57:
+#define REG_FIELD_PREP16(__mask, __val)                                          \
+	((u16)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U16_MAX) +          \
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:229: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#229: FILE: include/drm/intel/reg_bits.h:62:
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:241: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__mask' - possible side-effects?
#241: FILE: include/drm/intel/reg_bits.h:74:
+#define REG_FIELD_PREP(__mask, __val)						\
+	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:241: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__val' - possible side-effects?
#241: FILE: include/drm/intel/reg_bits.h:74:
+#define REG_FIELD_PREP(__mask, __val)						\
+	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
+	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
+	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
+	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:246: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#246: FILE: include/drm/intel/reg_bits.h:79:
+	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))

-:294: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
#294: FILE: include/drm/intel/reg_bits.h:127:
+#define REG_MASKED_FIELD(mask, value) \
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
+	 ((mask) << 16 | (value)))

-:294: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#294: FILE: include/drm/intel/reg_bits.h:127:
+#define REG_MASKED_FIELD(mask, value) \
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \
+	 ((mask) << 16 | (value)))

-:295: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#295: FILE: include/drm/intel/reg_bits.h:128:
+	(BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask), (mask) & 0xffff0000, 0)) + \

-:296: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#296: FILE: include/drm/intel/reg_bits.h:129:
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(value), (value) & 0xffff0000, 0)) + \

-:297: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#297: FILE: include/drm/intel/reg_bits.h:130:
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__builtin_constant_p(mask) && __builtin_constant_p(value), (value) & ~(mask), 0)) + \

-:300: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#300: FILE: include/drm/intel/reg_bits.h:133:
+#define REG_MASKED_FIELD_ENABLE(a) \
+	(__builtin_choose_expr(__builtin_constant_p(a), REG_MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); REG_MASKED_FIELD(_a, _a); })))

-:301: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#301: FILE: include/drm/intel/reg_bits.h:134:
+	(__builtin_choose_expr(__builtin_constant_p(a), REG_MASKED_FIELD((a), (a)), ({ typeof(a) _a = (a); REG_MASKED_FIELD(_a, _a); })))

total: 0 errors, 8 warnings, 10 checks, 284 lines checked
9a7a4d050343 drm/intel: add pick.h for the various "picker" helpers
-:105: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#105: 
new file mode 100644

-:122: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__a' - possible side-effects?
#122: FILE: include/drm/intel/pick.h:13:
+#define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))

-:148: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__index' - possible side-effects?
#148: FILE: include/drm/intel/pick.h:39:
+#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
+	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
+	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
+				   _PICK_EVEN((__index) - (__c_index), __c, __d)))

-:148: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__c_index' - possible side-effects?
#148: FILE: include/drm/intel/pick.h:39:
+#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
+	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
+	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
+				   _PICK_EVEN((__index) - (__c_index), __c, __d)))

total: 0 errors, 1 warnings, 3 checks, 126 lines checked
26b374c51d1e drm/i915/gt: prefer _PICK_EVEN() over _PICK()


