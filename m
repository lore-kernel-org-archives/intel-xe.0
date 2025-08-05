Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D9C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 10:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3210910E266;
	Tue,  5 Aug 2025 10:46:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106F310E266;
 Tue,  5 Aug 2025 10:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_vlv_clock_cle?=
 =?utf-8?q?anups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 10:46:16 -0000
Message-ID: <175439077604.213103.13567071513040614207@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1754385408.git.jani.nikula@intel.com>
In-Reply-To: <cover.1754385408.git.jani.nikula@intel.com>
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

Series: drm/i915: vlv clock cleanups
URL   : https://patchwork.freedesktop.org/series/152518/
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
commit fa2a4059d0eb740675444eb3a2e693d8d382e4f1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Aug 5 12:18:25 2025 +0300

    drm/i915: split out vlv_clock.[ch]
    
    Move the VLV clock related functions to their own file.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c79dfb5e415ae8c63601b02f7b3a2082d1a2345b drm-intel
9753fd957e10 drm/i915: add vlv_clock_get_gpll()
723f673d2a88 drm/i915: add vlv_clock_get_czclk()
11bbd33572eb drm/i915: add vlv_clock_get_hrawclk()
4888f07c09e8 drm/i915: make vlv_get_cck_clock_hpll() static
b7f1e8afdcc6 drm/i915: add vlv_clock_get_cdclk()
e66046c7ffea drm/i915: make vlv_get_cck_clock() static
dc3f1b2621c2 drm/i915: rename vlv_get_hpll_vco() to vlv_clock_get_hpll_vco()
6e4eb236103b drm/i915: cache the results in vlv_clock_get_hpll_vco() and use it more
e3b151f85ea2 drm/i915: remove intel_update_czclk() as unnecessary
190d20cc7d59 drm/i915: log HPLL frequency similar to CZCLK
c572899a6a0f drm/i915: move hpll and czclk caching under display
fa2a4059d0eb drm/i915: split out vlv_clock.[ch]
-:154: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#154: 
new file mode 100644

-:273: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#273: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:20:
+}
+static inline int vlv_clock_get_hrawclk(struct drm_device *drm)

-:277: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#277: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:24:
+}
+static inline int vlv_clock_get_czclk(struct drm_device *drm)

-:281: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#281: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:28:
+}
+static inline int vlv_clock_get_cdclk(struct drm_device *drm)

-:285: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#285: FILE: drivers/gpu/drm/i915/display/vlv_clock.h:32:
+}
+static inline int vlv_clock_get_gpll(struct drm_device *drm)

total: 0 errors, 1 warnings, 4 checks, 266 lines checked


