Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E42C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 20:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928610E530;
	Thu,  4 Jan 2024 20:22:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47010E52E;
 Thu,  4 Jan 2024 20:22:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/i915=3A_Disable_DSB_in_Xe_KMD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 04 Jan 2024 20:22:16 -0000
Message-ID: <170439973684.22406.12792692905830504992@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240104160557.48496-1-jose.souza@intel.com>
In-Reply-To: <20240104160557.48496-1-jose.souza@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v3,1/2] drm/i915: Disable DSB in Xe KMD
URL   : https://patchwork.freedesktop.org/series/128213/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ddb64b419f708190d847465a4fdc545aad6f3e7d
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Jan 4 08:05:57 2024 -0800

    drm/xe: Fix definition of intel_wakeref_t
    
    i915 defines it as unsigned long so Xe should do the same.
    It did not break anything because the bool was being promoted to int
    by compiler.
    This was caught because it causing compilation warnings:
    
      CC [M]  drivers/gpu/drm/i915/i915_gem.o
      CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
    In file included from ./include/drm/drm_mm.h:51,
                     from drivers/gpu/drm/xe/xe_bo_types.h:11,
                     from drivers/gpu/drm/xe/xe_bo.h:11,
                     from ./drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11,
                     from ./drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                     from drivers/gpu/drm/i915/display/intel_display_power.c:8:
    drivers/gpu/drm/i915/display/intel_display_power.c: In function ‘print_async_put_domains_state’:
    drivers/gpu/drm/i915/display/intel_display_power.c:408:29: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘int’ [-Wformat=]
      408 |         drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
          |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
      409 |                 power_domains->async_put_wakeref);
          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          |                              |
          |                              int
    ./include/drm/drm_print.h:410:39: note: in definition of macro ‘drm_dev_dbg’
      410 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
          |                                       ^~~
    ./include/drm/drm_print.h:510:33: note: in expansion of macro ‘drm_dbg_driver’
      510 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
          |                                 ^~~~~~~~~~~~~~
    drivers/gpu/drm/i915/display/intel_display_power.c:408:9: note: in expansion of macro ‘drm_dbg’
      408 |         drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
          |         ^~~~~~~
    drivers/gpu/drm/i915/display/intel_display_power.c:408:50: note: format string is defined here
      408 |         drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
          |                                                ~~^
          |                                                  |
          |                                                  long unsigned int
          |                                                %u
      CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
      CC [M]  drivers/gpu/drm/i915/i915_gem_gtt.o
      CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
      CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
      CC [M]  drivers/gpu/drm/i915/i915_query.o
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
36386a61d drm/i915: Disable DSB in Xe KMD
-:38: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#38: FILE: drivers/gpu/drm/i915/display/intel_dsb.c:457:
+	if (!IS_ENABLED(I915))

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
ddb64b419 drm/xe: Fix definition of intel_wakeref_t
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
                 from ./drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11,

-:51: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44e694958b95', maybe rebased or not pulled?
#51: 
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

-:64: WARNING:NEW_TYPEDEFS: do not add new typedefs
#64: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:8:
+typedef unsigned long intel_wakeref_t;

total: 0 errors, 3 warnings, 0 checks, 5 lines checked


