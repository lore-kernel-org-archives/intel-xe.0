Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69D7CE835D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 17:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DD910E56D;
	Mon, 30 Sep 2024 17:32:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C610E56D;
 Mon, 30 Sep 2024 17:32:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/i915=3A_remove_IS=5FLP=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 17:32:55 -0000
Message-ID: <172771757520.1138088.14139659511661287308@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930124056.3541988-1-jani.nikula@intel.com>
In-Reply-To: <20240930124056.3541988-1-jani.nikula@intel.com>
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

Series: series starting with [CI,1/2] drm/i915: remove IS_LP()
URL   : https://patchwork.freedesktop.org/series/139305/
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
commit 4b82b149fa848b66fb3fa5a57dd764a346db9251
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Sep 30 15:40:56 2024 +0300

    drm/i915/soc: stop using IS_GEN9_LP() and IS_GEN9_BC()
    
    Replace IS_GEN9_LP() and IS_GEN9_BC() with direct platform checks. This
    lets us remove their compat counterparts, as neither soc/ nor /display
    now no longer needs them.
    
    v2: Use !A && !B instead of !(A || B) (Ville)
    
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v1
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
ecc1d900089b drm/i915: remove IS_LP()
-:30: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:153:
+#define HAS_SAGV(i915)			(DISPLAY_VER(i915) >= 9 && !IS_BROXTON(i915) && !IS_GEMINILAKE(i915))

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:153:
+#define HAS_SAGV(i915)			(DISPLAY_VER(i915) >= 9 && !IS_BROXTON(i915) && !IS_GEMINILAKE(i915))

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#79: FILE: drivers/gpu/drm/i915/i915_drv.h:615:
+#define IS_GEN9_LP(i915)	(IS_BROXTON(i915) || IS_GEMINILAKE(i915))

-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/i915_drv.h:616:
+#define IS_GEN9_BC(i915)	(GRAPHICS_VER(i915) == 9 && !IS_GEN9_LP(i915))

total: 0 errors, 1 warnings, 3 checks, 78 lines checked
4b82b149fa84 drm/i915/soc: stop using IS_GEN9_LP() and IS_GEN9_BC()


