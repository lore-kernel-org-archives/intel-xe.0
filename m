Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC5FCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550A210EC84;
	Fri, 12 Sep 2025 14:56:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B010EC84;
 Fri, 12 Sep 2025 14:56:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_vlv_clock_cle?=
 =?utf-8?q?anups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 14:56:14 -0000
Message-ID: <175768897494.330879.6823544401174775917@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1757688216.git.jani.nikula@intel.com>
In-Reply-To: <cover.1757688216.git.jani.nikula@intel.com>
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

Series: drm/i915: vlv clock cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/152518/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bbd90001a24a0b085ed8b5c2e37ace4d54dcfce3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 12 17:48:54 2025 +0300

    drm/i915: split out vlv_clock.[ch]
    
    Move the VLV clock related functions to their own file.
    
    v2: Rebase
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch fa7b08b40160b4ddf338b5f8ee87296f3536c909 drm-intel
3bb2aed97d89 drm/i915: do cck get/put inside vlv_get_hpll_vco()
852a32f5a84e drm/i915: do cck get/put inside vlv_get_cck_clock()
9d2aaf936129 drm/i915: add vlv_clock_get_gpll()
6e18fd8bc8bb drm/i915: add vlv_clock_get_czclk()
de7308f26f37 drm/i915: add vlv_clock_get_hrawclk()
386ce9c3b2b6 drm/i915: make vlv_get_cck_clock_hpll() static
b3245a22a293 drm/i915: add vlv_clock_get_cdclk()
6de03cb93949 drm/i915: make vlv_get_cck_clock() static
4984b5f96cfc drm/i915: rename vlv_get_hpll_vco() to vlv_clock_get_hpll_vco()
135f028c00d0 drm/i915: cache the results in vlv_clock_get_hpll_vco() and use it more
b4b32d354c43 drm/i915: remove vlv_get_cck_clock_hpll()
3def468c9d30 drm/i915: remove intel_update_czclk() as unnecessary
f64abc892794 drm/i915: log HPLL frequency similar to CZCLK
4bfd8fc69498 drm/i915: move hpll and czclk caching under display
-:57: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_display.c:196:
+		display->vlv_clock.czclk_freq = vlv_get_cck_clock(drm, "czclk", CCK_CZ_CLOCK_CONTROL,

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
bbd90001a24a drm/i915: split out vlv_clock.[ch]
-:148: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#148: 
new file mode 100644

-:215: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#215: FILE: drivers/gpu/drm/i915/display/vlv_clock.c:63:
+		display->vlv_clock.czclk_freq = vlv_get_cck_clock(drm, "czclk", CCK_CZ_CLOCK_CONTROL,

-:259: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#259: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:20:
+}
+static inline int vlv_clock_get_hrawclk(struct drm_device *drm)

-:263: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#263: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:24:
+}
+static inline int vlv_clock_get_czclk(struct drm_device *drm)

-:267: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#267: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:28:
+}
+static inline int vlv_clock_get_cdclk(struct drm_device *drm)

-:271: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#271: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:32:
+}
+static inline int vlv_clock_get_gpll(struct drm_device *drm)

total: 0 errors, 2 warnings, 4 checks, 250 lines checked


