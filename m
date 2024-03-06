Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD0C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 12:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2211312C;
	Wed,  6 Mar 2024 12:29:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7A11312A;
 Wed,  6 Mar 2024 12:29:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_better_high_l?=
 =?utf-8?q?evel_abstraction_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 12:29:53 -0000
Message-ID: <170972819389.561237.14738994869442340030@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709727127.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709727127.git.jani.nikula@intel.com>
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

Series: drm/i915: better high level abstraction for display
URL   : https://patchwork.freedesktop.org/series/130804/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb48ed55bdcaf2b994c5ede1fbb3d7d8ab71aa25
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 6 14:24:38 2024 +0200

    drm/i915/display: test various to_intel_display() scenarios
    
    Drafting and testing various cases for switching to struct intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6e50187af603728329f9d3c3a53ad162d7eda9a4 drm-intel
15612eb0da3b drm/i915/display: ideas for further separating display code from the rest
a9a3840959d0 drm/i915/display: add generic to_intel_display() macro
-:58: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#58: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2218:
+	struct type: __##type##_to_intel_display((struct type *)(p))
 	           ^

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#61: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2221:
+#define to_intel_display(p)				\
+	_Generic(*p,					\
+		 __assoc(intel_connector, p),		\
+		 __assoc(intel_crtc, p),		\
+		 __assoc(intel_crtc_state, p),		\
+		 __assoc(intel_digital_port, p),	\
+		 __assoc(intel_encoder, p),		\
+		 __assoc(intel_hdmi, p),		\
+		 __assoc(intel_dp, p),			\
+		 __assoc(drm_device, p))

-:61: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'p' may be better as '(p)' to avoid precedence issues
#61: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2221:
+#define to_intel_display(p)				\
+	_Generic(*p,					\
+		 __assoc(intel_connector, p),		\
+		 __assoc(intel_crtc, p),		\
+		 __assoc(intel_crtc_state, p),		\
+		 __assoc(intel_digital_port, p),	\
+		 __assoc(intel_encoder, p),		\
+		 __assoc(intel_hdmi, p),		\
+		 __assoc(intel_dp, p),			\
+		 __assoc(drm_device, p))

-:62: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#62: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:2222:
+	_Generic(*p,					\

total: 1 errors, 0 warnings, 3 checks, 50 lines checked
a7609006bcdd drm/i915/display: accept either i915 or display for feature tests
-:21: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915_or_display' - possible side-effects?
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:17:
+#define __display(i915_or_display)					\
+	_Generic(*i915_or_display,					\
+		 struct drm_i915_private: (((const struct drm_i915_private *)(i915_or_display))->__intel_display_private), \
+		 struct intel_display: (i915_or_display))

-:21: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915_or_display' may be better as '(i915_or_display)' to avoid precedence issues
#21: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:17:
+#define __display(i915_or_display)					\
+	_Generic(*i915_or_display,					\
+		 struct drm_i915_private: (((const struct drm_i915_private *)(i915_or_display))->__intel_display_private), \
+		 struct intel_display: (i915_or_display))

-:22: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:18:
+	_Generic(*i915_or_display,					\

-:23: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:19:
+		 struct drm_i915_private: (((const struct drm_i915_private *)(i915_or_display))->__intel_display_private), \

-:23: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:19:
+		 struct drm_i915_private: (((const struct drm_i915_private *)(i915_or_display))->__intel_display_private), \
 		                        ^

-:24: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#24: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:20:
+		 struct intel_display: (i915_or_display))
 		                     ^

total: 2 errors, 1 warnings, 3 checks, 22 lines checked
cb48ed55bdca drm/i915/display: test various to_intel_display() scenarios


