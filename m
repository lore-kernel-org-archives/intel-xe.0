Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BB3CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 07:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFA110E03D;
	Fri, 22 Aug 2025 07:09:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE410E03D;
 Fri, 22 Aug 2025 07:09:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_User_readable_error_codes?=
 =?utf-8?q?_on_atomic=5Fioctl_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 07:09:04 -0000
Message-ID: <175584654467.260016.15695768515231107014@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
In-Reply-To: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
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

Series: User readable error codes on atomic_ioctl failure (rev2)
URL   : https://patchwork.freedesktop.org/series/152277/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6157cc6938bb30d35d77ddfe3e937d84b4fe6e2c
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Fri Aug 22 12:30:04 2025 +0530

    drm/i915/display: Error codes for async flip failures
    
    For failures in async flip atomic check/commit path return user readable
    error codes in struct drm_atomic_state.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch cca87ca63e2f5b8a785dc59c23e526987530b27f drm-intel
75f970864f7d drm: Define user readable error codes for atomic ioctl
-:39: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#39: FILE: include/uapi/drm/drm_mode.h:1161:
+#define DRM_MODE_ATOMIC_FAILURE_REASON \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")

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

-:42: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#42: FILE: include/uapi/drm/drm_mode.h:1164:
+	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \

-:43: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#43: FILE: include/uapi/drm/drm_mode.h:1165:
+	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \

-:45: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#45: FILE: include/uapi/drm/drm_mode.h:1167:
+	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \

-:46: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#46: FILE: include/uapi/drm/drm_mode.h:1168:
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \

-:47: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#47: FILE: include/uapi/drm/drm_mode.h:1169:
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \

-:48: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#48: FILE: include/uapi/drm/drm_mode.h:1170:
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")

-:50: WARNING:MACRO_ARG_UNUSED: Argument 'reason' is not used in function-like macro
#50: FILE: include/uapi/drm/drm_mode.h:1172:
+#define FAILURE_REASON(flag, reason) flag,

-:51: WARNING:NEW_TYPEDEFS: do not add new typedefs
#51: FILE: include/uapi/drm/drm_mode.h:1173:
+typedef enum {

-:56: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#56: FILE: include/uapi/drm/drm_mode.h:1178:
+#define FAILURE_REASON(flag, reason) #reason,

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

-:56: WARNING:MACRO_ARG_UNUSED: Argument 'flag' is not used in function-like macro
#56: FILE: include/uapi/drm/drm_mode.h:1178:
+#define FAILURE_REASON(flag, reason) #reason,

total: 2 errors, 9 warnings, 0 checks, 54 lines checked
2de9aaf954be drm/atomic: Add error_code element in atomic_state
8df799dcfa6e drm/atomic: Return user readable error in atomic_ioctl
-:64: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#64: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1388:
+#define FAILURE_REASON(flag, reason) #reason,

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

-:64: WARNING:MACRO_ARG_UNUSED: Argument 'flag' is not used in function-like macro
#64: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1388:
+#define FAILURE_REASON(flag, reason) #reason,

total: 1 errors, 1 warnings, 0 checks, 146 lines checked
6157cc6938bb drm/i915/display: Error codes for async flip failures


