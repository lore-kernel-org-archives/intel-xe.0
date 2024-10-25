Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C82D116E0
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 02:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9B810E9EB;
	Fri, 25 Oct 2024 02:49:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB34E10E9EA;
 Fri, 25 Oct 2024 02:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_use_x?=
 =?utf-8?q?100_version_for_full_version_and_release?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 02:49:00 -0000
Message-ID: <172982454070.1330038.9362174196372504921@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024171104.2427750-1-jani.nikula@intel.com>
In-Reply-To: <20241024171104.2427750-1-jani.nikula@intel.com>
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

Series: drm/i915/display: use x100 version for full version and release
URL   : https://patchwork.freedesktop.org/series/140455/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1d2bb539ab6debc09b70f0337291c0f81a9b73b9
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 24 20:11:04 2024 +0300

    drm/i915/display: use x100 version for full version and release
    
    Use x100, or ver * 100 + rel, versions for full IP version checks,
    similar to what xe driver does:
    
    - Replace IP_VER(14, 1) inline with 1401, etc.
    
    - Convert DISPLAY_VER_FULL() to DISPLAY_VERx100()
    
    - Convert IS_DISPLAY_VER_FULL() to IS_DISPLAY_VERx100()
    
    - Convert IS_DISPLAY_VER_STEP() to IS_DISPLAY_VERx100_STEP()
    
    This makes ver.rel versions easier to use, follows the xe driver
    pattern, and drops the dependency on the IP_VER() macro.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
1d2bb539ab6d drm/i915/display: use x100 version for full version and release
-:105: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#105: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:171:
+#define IS_DISPLAY_VERx100(__i915, from, until) ( \
+	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__i915) >= (from) && \
+	 DISPLAY_VERx100(__i915) <= (until)))

-:105: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#105: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:171:
+#define IS_DISPLAY_VERx100(__i915, from, until) ( \
+	BUILD_BUG_ON_ZERO((from) < 200) + \
+	(DISPLAY_VERx100(__i915) >= (from) && \
+	 DISPLAY_VERx100(__i915) <= (until)))

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#126: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:191:
+#define IS_DISPLAY_VERx100_STEP(__i915, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__i915), (ipver), (ipver)) && \
 	 IS_DISPLAY_STEP((__i915), (from), (until)))

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ipver' - possible side-effects?
#126: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:191:
+#define IS_DISPLAY_VERx100_STEP(__i915, ipver, from, until) \
+	(IS_DISPLAY_VERx100((__i915), (ipver), (ipver)) && \
 	 IS_DISPLAY_STEP((__i915), (from), (until)))

-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#136: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:199:
+#define DISPLAY_VERx100(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver * 100 + \
+				 DISPLAY_RUNTIME_INFO(i915)->ip.rel)

total: 0 errors, 0 warnings, 5 checks, 201 lines checked


