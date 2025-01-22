Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEF8C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 20:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FEE10E193;
	Wed, 22 Jan 2025 20:16:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A21910E193;
 Wed, 22 Jan 2025 20:16:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cmtg=3A_Disable_?=
 =?utf-8?q?the_CMTG_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 20:16:47 -0000
Message-ID: <173757700742.3171318.17801363546555184395@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122200355.89389-1-gustavo.sousa@intel.com>
In-Reply-To: <20250122200355.89389-1-gustavo.sousa@intel.com>
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

Series: drm/i915/cmtg: Disable the CMTG (rev7)
URL   : https://patchwork.freedesktop.org/series/142946/
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
commit f9f2a8650faac53bbd48a476f1d12f0fc55ccca1
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Jan 22 17:03:41 2025 -0300

    drm/i915/cmtg: Disable the CMTG
    
    The CMTG is a timing generator that runs in parallel with transcoders
    timing generators and can be used as a reference for synchronization.
    
    We have observed that we are inheriting from GOP a display configuration
    with the CMTG enabled. Because our driver doesn't currently implement
    any CMTG sequences, the CMTG ends up still enabled after our driver
    takes over.
    
    We need to make sure that the CMTG is not enabled if we are not going to
    use it. For that, let's add a partial implementation in our driver that
    only cares about disabling the CMTG if it was found enabled during
    initial hardware readout. In the future, we can also implement sequences
    for using the CMTG if that becomes a needed feature.
    
    For now, we only deal with cases when it is possible to disable the CMTG
    without requiring a modeset. For earlier display versions, we simply
    skip if we find the CMTG enabled and we can't disable it without a
    proper modeset. In the future, we need to properly handle that case.
    
    v2:
     - DG2 does not have the CMTG. Update HAS_CMTG() accordingly.
     - Update logic to force disabling of CMTG only for initial commit.
    v3:
     - Add missing changes for v2 that were staged but not committed.
    v4:
     - Avoid if/else duplication in intel_cmtg_dump_state() by using "n/a"
       for CMTG B enabled/disabled string for platforms without it. (Jani)
     - Prefer intel_cmtg_readout_hw_state() over intel_cmtg_readout_state().
       (Jani)
     - Use display struct instead of i915 as first parameter for
       TRANS_DDI_FUNC_CTL2(). (Jani)
     - Fewer continuation lines in variable declaration/initialization for
       better readability. (Jani)
     - Coding style improvements. (Jani)
     - Use drm_dbg_kms() instead of drm_info() for logging the disabling
       of the CMTG.
     - Make struct intel_cmtg_state entirely private to intel_cmtg.c.
    v5:
     - Do the disable sequence as part of the sanitization step after
       hardware readout instead of initial modeset commit. (Jani)
     - Adapt to commit 15133582465f ("drm/i915/display: convert global state
       to struct intel_display") by using a display struct instead of i915
       as argument for intel_atomic_global_obj_init().
    v6:
     - Do not track CMTG state as a global state. (Ville)
     - Simplify the driver logic by only disabling the CMTG only on cases
       when a modeset is not required. (Ville)
    v7:
     - Remove the call to drm_WARN_ON() when checking
       intel_cmtg_disable_requires_modeset() and use a FIXME in the comment
       instead.
     - Remove the !HAS_CMTG() guard from intel_cmtg_get_config(), which is
       static and its caller is already protected by that same condition.
     - Also take the opportunity to put some Bspec references in the commit
       trailers section.
    
    Bspec: 68915, 49262
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch d577d9e67e5ac149fcd4442327210b831cddb308 drm-intel
f9f2a8650faa drm/i915/cmtg: Disable the CMTG
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

-:165: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#165: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:78:
+		    intel_cmtg_has_cmtg_b(display) ? str_enabled_disabled(cmtg_config->cmtg_b_enable) : "n/a",

-:318: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#318: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:149:
+#define HAS_CMTG(__display)		(!(__display)->platform.dg2 && DISPLAY_VER(__display) >= 13)

total: 0 errors, 2 warnings, 1 checks, 253 lines checked


