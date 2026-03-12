Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27371FED2F0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 09:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BBA10E1E4;
	Thu, 12 Mar 2026 09:00:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DCF10E1E4;
 Thu, 12 Mar 2026 09:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_fail_?=
 =?utf-8?q?compilation_on_intel=5Fdisplay=5Fwa=28=29_with_invalid_enums?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Mar 2026 09:00:29 -0000
Message-ID: <177330602966.349923.9726496145635489078@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312081647.1083777-1-luciano.coelho@intel.com>
In-Reply-To: <20260312081647.1083777-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: fail compilation on intel_display_wa() with invalid enums
URL   : https://patchwork.freedesktop.org/series/163094/
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
commit e495a3e85c22f55b9251af74bca38ebcbbf7f09e
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Mar 12 10:16:46 2026 +0200

    drm/i915/display: fail compilation on intel_display_wa() with invalid enums
    
    In a previous commit, the intel_display_wa() was changed so it
    wouldn't receive an integer as the workaround number, but the enum
    value itself.  This caused compilation not to fail anymore when the
    enum passed didn't exist.
    
    Bring this back by using BUILD_BUG_ON() to check that the enum passed
    sits within the range of defined enums.
    
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 169ea69ad8f2fb0a126608399386e4580bb2d0b0 drm-intel
e495a3e85c22 drm/i915/display: fail compilation on intel_display_wa() with invalid enums
-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__wa' - possible side-effects?
#35: FILE: drivers/gpu/drm/i915/display/intel_display_wa.h:69:
+#define intel_display_wa(__display, __wa) ({				  \
+		BUILD_BUG_ON(__wa >= INTEL_DISPLAY_WA_COUNT);		  \
+		__intel_display_wa((__display), __wa, __stringify(__wa)); \
+	})

-:35: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__wa' may be better as '(__wa)' to avoid precedence issues
#35: FILE: drivers/gpu/drm/i915/display/intel_display_wa.h:69:
+#define intel_display_wa(__display, __wa) ({				  \
+		BUILD_BUG_ON(__wa >= INTEL_DISPLAY_WA_COUNT);		  \
+		__intel_display_wa((__display), __wa, __stringify(__wa)); \
+	})

total: 0 errors, 0 warnings, 2 checks, 17 lines checked


