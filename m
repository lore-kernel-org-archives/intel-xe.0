Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A9CCF9F1
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F422D10E194;
	Mon, 27 Oct 2025 21:57:15 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8810E194;
 Mon, 27 Oct 2025 21:57:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Exten?=
 =?utf-8?q?d_i915=5Fdisplay=5Finfo_with_Type-C_port_details_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 21:57:15 -0000
Message-ID: <176160223536.60401.10682693364666316678@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027200256.3058319-1-khaled.almahallawy@intel.com>
In-Reply-To: <20251027200256.3058319-1-khaled.almahallawy@intel.com>
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

Series: drm/i915/display: Extend i915_display_info with Type-C port details (rev5)
URL   : https://patchwork.freedesktop.org/series/155066/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec04362581d400e6087779b8efa6266dcf891974
Author: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date:   Mon Oct 27 13:56:28 2025 -0700

    drm/i915/display: Extend i915_display_info with Type-C port details
    
    Expose key Type-C port data in i915_display_info to make it easier to
    understand the port configuration and active mode, especially whether
    the link is in DP-Alt or TBT-Alt, without having to scan kernel logs.
    
    Tested in DP-Alt, TBT-Alt, SST, and MST.
    
    Expected output:
    
    [CONNECTOR:290:DP-2]: status: connected
            TC Port: E/TC#2 mode: tbt-alt pin assignment: - max lanes: 4
            physical dimensions: 600x340mm
    ...
    [CONNECTOR:263:DP-5]: status: connected
            TC Port: G/TC#4 mode: dp-alt pin assignment: C max lanes: 4
            physical dimensions: 610x350mm
    
    v2: Use drm_printer (Ville)
        Lock/Unlock around the printf (Imre)
    v3: Forward Declaration drm_printer struct (Jani)
    v4: Handle MST connector with no active encoder (Imre)
        Add a delimiter between fields and ":" after the port name (Imre)
    v5: Init dig_port and use it in intel_encorder_is_tc and tc_info (Imre)
        Move tc->port_name to a newline (Imre)
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
+ /mt/dim checkpatch de43fe70c436c359e7478a5532d873f87357cb4e drm-intel
ec04362581d4 drm/i915/display: Extend i915_display_info with Type-C port details
-:74: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "dig_port"
#74: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:284:
+	if (dig_port != NULL && intel_encoder_is_tc(&dig_port->base))

total: 0 errors, 0 warnings, 1 checks, 66 lines checked


