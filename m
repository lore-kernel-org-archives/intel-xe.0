Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522B8D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 13:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0E010E5C8;
	Tue,  9 Dec 2025 13:45:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CF710E5BC;
 Tue,  9 Dec 2025 13:45:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Detec?=
 =?utf-8?q?t_AuxCCS_support_via_display_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 13:45:16 -0000
Message-ID: <176528791666.68390.3551317242416336182@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209120034.9143-1-tursulin@igalia.com>
In-Reply-To: <20251209120034.9143-1-tursulin@igalia.com>
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

Series: drm/i915/display: Detect AuxCCS support via display parent interface
URL   : https://patchwork.freedesktop.org/series/158690/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f436006498bae66169a350afa6f0517e7a51a69e
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Dec 9 13:00:34 2025 +0100

    drm/i915/display: Detect AuxCCS support via display parent interface
    
    Whether AuxCCS can be properly supported depends on the support both from
    the display side and non-display side of the driver.
    
    Let us therefore allow for the non-display part to be queried via the
    display parent interface.
    
    The new interface replaces the HAS_AUX_CCS macro and we also remove the
    FIXME from skl_universal_plane_create since now the xe will not advertise
    the AuxCCS caps to start with so they do not need to be removed after
    enumeration.
    
    Also, by removing this build specific FIXME we come a step closer to fully
    de-coupling display and non-display.
    
    The existing HAS_AUX_CCS gets renamed to HAS_AUX_DIST since it is still
    required for determining the need for PLANE_AUX_DIST programming.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com> # v1
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch da4e081253240c7e98a0ba54d1a48be8c6ffad5a drm-intel
f436006498ba drm/i915/display: Detect AuxCCS support via display parent interface
-:48: WARNING:LONG_LINE: line length of 147 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_AUX_DIST(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)

-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#48: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_AUX_DIST(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)

total: 0 errors, 1 warnings, 1 checks, 95 lines checked


