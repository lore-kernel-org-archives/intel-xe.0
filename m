Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F398F47CB9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 19:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351BF10E128;
	Thu,  5 Mar 2026 19:23:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A2710E128;
 Thu,  5 Mar 2026 19:23:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_so?=
 =?utf-8?q?rt_out_step_enums_between_the_drivers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 19:23:39 -0000
Message-ID: <177273861919.320894.18156732338581842997@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772635152.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772635152.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: sort out step enums between the drivers
URL   : https://patchwork.freedesktop.org/series/162594/
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
commit a2d5cea0d7772df2eba1a3672413a70260751555
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 4 16:40:53 2026 +0200

    drm/i915/display: switch to including common step file directly
    
    Instead of using the proxy intel_step.h in display, just include the
    common step file directly where needed. This allows us to remove the
    compat intel_step.h header.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ce63d46cc8fc3bb754efb93026b55acaa616cfa2 drm-intel
da088e028f72 drm/i915/dmc: simplify stepping info initialization
2ff0eb57f975 drm/i915/display: add step name in display runtime info
-:23: ERROR:BRACKET_SPACE: space prohibited before open square bracket '['
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1656:
+#define __STEP_NAME(name) [STEP_##name] = #name,

total: 1 errors, 0 warnings, 0 checks, 59 lines checked
5397ff2c8c77 drm/i915/dmc: use step name from runtime info
a73fe4cd2e84 drm/xe/compat: remove intel_step_name macro
3a9c4e4e86ab drm/intel: add shared step.h and switch i915 to use it
-:88: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#88: 
new file mode 100644

-:101: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#101: FILE: include/drm/intel/step.h:9:
+#define STEP_NAME_LIST(func)		\
+	func(A0)			\
+	func(A1)			\
+	func(A2)			\
+	func(A3)			\
+	func(B0)			\
+	func(B1)			\
+	func(B2)			\
+	func(B3)			\
+	func(C0)			\
+	func(C1)			\
+	func(C2)			\
+	func(C3)			\
+	func(D0)			\
+	func(D1)			\
+	func(D2)			\
+	func(D3)			\
+	func(E0)			\
+	func(E1)			\
+	func(E2)			\
+	func(E3)			\
+	func(F0)			\
+	func(F1)			\
+	func(F2)			\
+	func(F3)			\
+	func(G0)			\
+	func(G1)			\
+	func(G2)			\
+	func(G3)			\
+	func(H0)			\
+	func(H1)			\
+	func(H2)			\
+	func(H3)			\
+	func(I0)			\
+	func(I1)			\
+	func(I2)			\
+	func(I3)			\
+	func(J0)			\
+	func(J1)			\
+	func(J2)			\
+	func(J3)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#101: FILE: include/drm/intel/step.h:9:
+#define STEP_NAME_LIST(func)		\
+	func(A0)			\
+	func(A1)			\
+	func(A2)			\
+	func(A3)			\
+	func(B0)			\
+	func(B1)			\
+	func(B2)			\
+	func(B3)			\
+	func(C0)			\
+	func(C1)			\
+	func(C2)			\
+	func(C3)			\
+	func(D0)			\
+	func(D1)			\
+	func(D2)			\
+	func(D3)			\
+	func(E0)			\
+	func(E1)			\
+	func(E2)			\
+	func(E3)			\
+	func(F0)			\
+	func(F1)			\
+	func(F2)			\
+	func(F3)			\
+	func(G0)			\
+	func(G1)			\
+	func(G2)			\
+	func(G3)			\
+	func(H0)			\
+	func(H1)			\
+	func(H2)			\
+	func(H3)			\
+	func(I0)			\
+	func(I1)			\
+	func(I2)			\
+	func(I3)			\
+	func(J0)			\
+	func(J1)			\
+	func(J2)			\
+	func(J3)

total: 1 errors, 1 warnings, 1 checks, 131 lines checked
9ec471d1c16b drm/xe/step: switch to the shared step definitions with i915
2de46132e604 drm/xe/step: switch from enum xe_step to intel_step naming
a2d5cea0d777 drm/i915/display: switch to including common step file directly
-:254: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#254: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 168 lines checked


