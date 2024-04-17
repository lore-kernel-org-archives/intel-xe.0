Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2219AC001CC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 13:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9315113518;
	Wed, 17 Apr 2024 13:26:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21B113519;
 Wed, 17 Apr 2024 13:26:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_better_high_l?=
 =?utf-8?q?evel_abstraction_for_display_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 13:26:38 -0000
Message-ID: <171336039850.1465187.15451913194913414047@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713358679.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713358679.git.jani.nikula@intel.com>
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

Series: drm/i915: better high level abstraction for display (rev3)
URL   : https://patchwork.freedesktop.org/series/130804/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b4a9e17a60ab04c9e1fcc6f636e85fb9e1b96c0e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 17 16:02:47 2024 +0300

    drm/i915/dmc: use struct intel_display more
    
    Now that the intel_de_ functions and DISPLAY_VER() accept struct
    intel_display *, use it more.
    
    Cc: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 17eca6d8a1f3fad302769048f4be721e72146109 drm-intel
94db8feedd70 drm/i915/display: add intel_display -> drm_device backpointer
e196ce9664d9 drm/i915/display: add generic to_intel_display() macro
-:54: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#54: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2223:
+	struct type: __##type##_to_intel_display((struct type *)(p))
 	           ^

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#57: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2226:
+#define to_intel_display(p)				\
+	_Generic(*p,					\
+		 __assoc(drm_device, p),		\
+		 __assoc(intel_connector, p),		\
+		 __assoc(intel_crtc, p),		\
+		 __assoc(intel_crtc_state, p),		\
+		 __assoc(intel_digital_port, p),	\
+		 __assoc(intel_dp, p),			\
+		 __assoc(intel_encoder, p),		\
+		 __assoc(intel_hdmi, p))

-:57: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'p' may be better as '(p)' to avoid precedence issues
#57: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2226:
+#define to_intel_display(p)				\
+	_Generic(*p,					\
+		 __assoc(drm_device, p),		\
+		 __assoc(intel_connector, p),		\
+		 __assoc(intel_crtc, p),		\
+		 __assoc(intel_crtc_state, p),		\
+		 __assoc(intel_digital_port, p),	\
+		 __assoc(intel_dp, p),			\
+		 __assoc(intel_encoder, p),		\
+		 __assoc(intel_hdmi, p))

-:58: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#58: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2227:
+	_Generic(*p,					\

total: 1 errors, 0 warnings, 3 checks, 41 lines checked
d64a5ffb3d98 drm/i915: add generic __to_intel_display()
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#39: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:15:
+#define __to_intel_display(p)						\
+	_Generic(p,							\
+		 const struct drm_i915_private *: (&((const struct drm_i915_private *)(p))->display), \
+		 struct drm_i915_private *: (&((struct drm_i915_private *)(p))->display), \
+		 const struct intel_display *: (p),			\
+		 struct intel_display *: (p))

-:40: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#40: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:16:
+	_Generic(p,							\

-:41: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:17:
+		 const struct drm_i915_private *: (&((const struct drm_i915_private *)(p))->display), \

-:41: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#41: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:17:
+		 const struct drm_i915_private *: (&((const struct drm_i915_private *)(p))->display), \
 		                               ^

-:41: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#41: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:17:
+		 const struct drm_i915_private *: (&((const struct drm_i915_private *)(p))->display), \
 		                                ^

-:42: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#42: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:18:
+		 struct drm_i915_private *: (&((struct drm_i915_private *)(p))->display), \
 		                         ^

-:42: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#42: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:18:
+		 struct drm_i915_private *: (&((struct drm_i915_private *)(p))->display), \
 		                          ^

-:43: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#43: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:19:
+		 const struct intel_display *: (p),			\
 		                            ^

-:43: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#43: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:19:
+		 const struct intel_display *: (p),			\
 		                             ^

-:44: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#44: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:20:
+		 struct intel_display *: (p))
 		                      ^

-:44: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#44: FILE: drivers/gpu/drm/i915/display/intel_display_conversion.h:20:
+		 struct intel_display *: (p))
 		                       ^

total: 4 errors, 2 warnings, 6 checks, 22 lines checked
33daff0619fb drm/i915/display: accept either i915 or display for feature tests
5958a9d49215 drm/i915/quirks: convert struct drm_i915_private to struct intel_display
43b49d884ded drm/i915/display: rename __intel_wait_for_register_nowl() to indicate intel_de_
8441cf584e35 drm/i915/dmc: convert dmc wakelock interface to struct intel_display
ecf324d9b1e6 drm/i915/de: allow intel_display and drm_i915_private for de functions
-:47: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#47: FILE: drivers/gpu/drm/i915/display/intel_de.h:31:
 }
+#define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)

-:47: ERROR:SPACING: space required after that ',' (ctx:VxV)
#47: FILE: drivers/gpu/drm/i915/display/intel_de.h:31:
+#define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
                        ^

-:66: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#66: FILE: drivers/gpu/drm/i915/display/intel_de.h:46:
 }
+#define intel_de_read8(p,...) __intel_de_read8(__to_intel_display(p), __VA_ARGS__)

-:66: ERROR:SPACING: space required after that ',' (ctx:VxV)
#66: FILE: drivers/gpu/drm/i915/display/intel_de.h:46:
+#define intel_de_read8(p,...) __intel_de_read8(__to_intel_display(p), __VA_ARGS__)
                         ^

-:92: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#92: FILE: drivers/gpu/drm/i915/display/intel_de.h:65:
 }
+#define intel_de_read64_2x32(p,...) __intel_de_read64_2x32(__to_intel_display(p), __VA_ARGS__)

-:92: ERROR:SPACING: space required after that ',' (ctx:VxV)
#92: FILE: drivers/gpu/drm/i915/display/intel_de.h:65:
+#define intel_de_read64_2x32(p,...) __intel_de_read64_2x32(__to_intel_display(p), __VA_ARGS__)
                               ^

-:107: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#107: FILE: drivers/gpu/drm/i915/display/intel_de.h:76:
 }
+#define intel_de_posting_read(p,...) __intel_de_posting_read(__to_intel_display(p), __VA_ARGS__)

-:107: ERROR:SPACING: space required after that ',' (ctx:VxV)
#107: FILE: drivers/gpu/drm/i915/display/intel_de.h:76:
+#define intel_de_posting_read(p,...) __intel_de_posting_read(__to_intel_display(p), __VA_ARGS__)
                                ^

-:122: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#122: FILE: drivers/gpu/drm/i915/display/intel_de.h:87:
 }
+#define intel_de_write(p,...) __intel_de_write(__to_intel_display(p), __VA_ARGS__)

-:122: ERROR:SPACING: space required after that ',' (ctx:VxV)
#122: FILE: drivers/gpu/drm/i915/display/intel_de.h:87:
+#define intel_de_write(p,...) __intel_de_write(__to_intel_display(p), __VA_ARGS__)
                         ^

-:133: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#133: FILE: drivers/gpu/drm/i915/display/intel_de.h:95:
 }
+#define __intel_de_rmw_nowl(p,...) ____intel_de_rmw_nowl(__to_intel_display(p), __VA_ARGS__)

-:133: ERROR:SPACING: space required after that ',' (ctx:VxV)
#133: FILE: drivers/gpu/drm/i915/display/intel_de.h:95:
+#define __intel_de_rmw_nowl(p,...) ____intel_de_rmw_nowl(__to_intel_display(p), __VA_ARGS__)
                              ^

-:153: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#153: FILE: drivers/gpu/drm/i915/display/intel_de.h:111:
 }
+#define intel_de_rmw(p,...) __intel_de_rmw(__to_intel_display(p), __VA_ARGS__)

-:153: ERROR:SPACING: space required after that ',' (ctx:VxV)
#153: FILE: drivers/gpu/drm/i915/display/intel_de.h:111:
+#define intel_de_rmw(p,...) __intel_de_rmw(__to_intel_display(p), __VA_ARGS__)
                       ^

-:166: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#166: FILE: drivers/gpu/drm/i915/display/intel_de.h:121:
+#define __intel_de_wait_for_register_nowl(p,...) ____intel_de_wait_for_register_nowl(__to_intel_display(p), __VA_ARGS__)

-:166: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#166: FILE: drivers/gpu/drm/i915/display/intel_de.h:121:
 }
+#define __intel_de_wait_for_register_nowl(p,...) ____intel_de_wait_for_register_nowl(__to_intel_display(p), __VA_ARGS__)

-:166: ERROR:SPACING: space required after that ',' (ctx:VxV)
#166: FILE: drivers/gpu/drm/i915/display/intel_de.h:121:
+#define __intel_de_wait_for_register_nowl(p,...) ____intel_de_wait_for_register_nowl(__to_intel_display(p), __VA_ARGS__)
                                            ^

-:188: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#188: FILE: drivers/gpu/drm/i915/display/intel_de.h:138:
 }
+#define intel_de_wait(p,...) __intel_de_wait(__to_intel_display(p), __VA_ARGS__)

-:188: ERROR:SPACING: space required after that ',' (ctx:VxV)
#188: FILE: drivers/gpu/drm/i915/display/intel_de.h:138:
+#define intel_de_wait(p,...) __intel_de_wait(__to_intel_display(p), __VA_ARGS__)
                        ^

-:210: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#210: FILE: drivers/gpu/drm/i915/display/intel_de.h:155:
 }
+#define intel_de_wait_fw(p,...) __intel_de_wait_fw(__to_intel_display(p), __VA_ARGS__)

-:210: ERROR:SPACING: space required after that ',' (ctx:VxV)
#210: FILE: drivers/gpu/drm/i915/display/intel_de.h:155:
+#define intel_de_wait_fw(p,...) __intel_de_wait_fw(__to_intel_display(p), __VA_ARGS__)
                           ^

-:237: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#237: FILE: drivers/gpu/drm/i915/display/intel_de.h:175:
 }
+#define intel_de_wait_custom(p,...) __intel_de_wait_custom(__to_intel_display(p), __VA_ARGS__)

-:237: ERROR:SPACING: space required after that ',' (ctx:VxV)
#237: FILE: drivers/gpu/drm/i915/display/intel_de.h:175:
+#define intel_de_wait_custom(p,...) __intel_de_wait_custom(__to_intel_display(p), __VA_ARGS__)
                               ^

-:248: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#248: FILE: drivers/gpu/drm/i915/display/intel_de.h:183:
 }
+#define intel_de_wait_for_set(p,...) __intel_de_wait_for_set(__to_intel_display(p), __VA_ARGS__)

-:248: ERROR:SPACING: space required after that ',' (ctx:VxV)
#248: FILE: drivers/gpu/drm/i915/display/intel_de.h:183:
+#define intel_de_wait_for_set(p,...) __intel_de_wait_for_set(__to_intel_display(p), __VA_ARGS__)
                                ^

-:259: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#259: FILE: drivers/gpu/drm/i915/display/intel_de.h:191:
 }
+#define intel_de_wait_for_clear(p,...) __intel_de_wait_for_clear(__to_intel_display(p), __VA_ARGS__)

-:259: ERROR:SPACING: space required after that ',' (ctx:VxV)
#259: FILE: drivers/gpu/drm/i915/display/intel_de.h:191:
+#define intel_de_wait_for_clear(p,...) __intel_de_wait_for_clear(__to_intel_display(p), __VA_ARGS__)
                                  ^

-:278: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#278: FILE: drivers/gpu/drm/i915/display/intel_de.h:211:
 }
+#define intel_de_read_fw(p,...) __intel_de_read_fw(__to_intel_display(p), __VA_ARGS__)

-:278: ERROR:SPACING: space required after that ',' (ctx:VxV)
#278: FILE: drivers/gpu/drm/i915/display/intel_de.h:211:
+#define intel_de_read_fw(p,...) __intel_de_read_fw(__to_intel_display(p), __VA_ARGS__)
                           ^

-:288: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#288: FILE: drivers/gpu/drm/i915/display/intel_de.h:219:
 }
+#define intel_de_write_fw(p,...) __intel_de_write_fw(__to_intel_display(p), __VA_ARGS__)

-:288: ERROR:SPACING: space required after that ',' (ctx:VxV)
#288: FILE: drivers/gpu/drm/i915/display/intel_de.h:219:
+#define intel_de_write_fw(p,...) __intel_de_write_fw(__to_intel_display(p), __VA_ARGS__)
                            ^

-:297: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#297: FILE: drivers/gpu/drm/i915/display/intel_de.h:226:
 }
+#define intel_de_read_notrace(p,...) __intel_de_read_notrace(__to_intel_display(p), __VA_ARGS__)

-:297: ERROR:SPACING: space required after that ',' (ctx:VxV)
#297: FILE: drivers/gpu/drm/i915/display/intel_de.h:226:
+#define intel_de_read_notrace(p,...) __intel_de_read_notrace(__to_intel_display(p), __VA_ARGS__)
                                ^

-:307: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#307: FILE: drivers/gpu/drm/i915/display/intel_de.h:234:
 }
+#define intel_de_write_notrace(p,...) __intel_de_write_notrace(__to_intel_display(p), __VA_ARGS__)

-:307: ERROR:SPACING: space required after that ',' (ctx:VxV)
#307: FILE: drivers/gpu/drm/i915/display/intel_de.h:234:
+#define intel_de_write_notrace(p,...) __intel_de_write_notrace(__to_intel_display(p), __VA_ARGS__)
                                 ^

total: 17 errors, 1 warnings, 17 checks, 287 lines checked
b4a9e17a60ab drm/i915/dmc: use struct intel_display more


