Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA6C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ABB10E740;
	Thu, 31 Jul 2025 09:24:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80210E72E;
 Thu, 31 Jul 2025 09:24:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_globa?=
 =?utf-8?q?l_state_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 09:24:26 -0000
Message-ID: <175395386675.201478.5280202568158495326@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1753953530.git.jani.nikula@intel.com>
In-Reply-To: <cover.1753953530.git.jani.nikula@intel.com>
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

Series: drm/i915/display: global state cleanups
URL   : https://patchwork.freedesktop.org/series/152335/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a6ab9afd5f8159ca814df4ea6e402bd425e98751
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jul 31 12:19:22 2025 +0300

    drm/i915/display: keep forward declarations together
    
    Adhere to prevalent style.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7f74ca5c75dd28bc57d5ea1be165919bc70609d8 drm-intel
b35a2eec4415 drm/i915/display: hide global state iterators, remove unused
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:16:
+#define for_each_new_global_obj_in_state(__state, obj, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:16:
+#define for_each_new_global_obj_in_state(__state, obj, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#20: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:16:
+#define for_each_new_global_obj_in_state(__state, obj, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:24:
+#define for_each_old_global_obj_in_state(__state, obj, old_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:24:
+#define for_each_old_global_obj_in_state(__state, obj, old_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:24:
+#define for_each_old_global_obj_in_state(__state, obj, old_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:32:
+#define for_each_oldnew_global_obj_in_state(__state, obj, old_obj_state, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:32:
+#define for_each_oldnew_global_obj_in_state(__state, obj, old_obj_state, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

-:36: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#36: FILE: drivers/gpu/drm/i915/display/intel_global_state.c:32:
+#define for_each_oldnew_global_obj_in_state(__state, obj, old_obj_state, new_obj_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_global_objs && \
+		     ((obj) = (__state)->global_objs[__i].ptr, \
+		      (old_obj_state) = (__state)->global_objs[__i].old_state, \
+		      (new_obj_state) = (__state)->global_objs[__i].new_state, 1); \
+	     (__i)++) \
+		for_each_if(obj)

total: 0 errors, 0 warnings, 9 checks, 65 lines checked
7a64eac78bfb drm/i915/display: make struct __intel_global_objs_state opaque
a6ab9afd5f81 drm/i915/display: keep forward declarations together


