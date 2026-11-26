Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EE606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D3310E9D8;
	Thu, 26 Nov 2026 14:08:08 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699610E9AE;
 Thu, 26 Nov 2026 14:08:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ddi=5Fmgr=3A_Add?=
 =?utf-8?q?_support_for_dynamic_DDI_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 14:08:07 -0000
Message-ID: <179570208767.93576.8369627672914617202@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126100755.1252635-1-imre.deak@intel.com>
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/ddi_mgr: Add support for dynamic DDI allocation
URL   : https://patchwork.freedesktop.org/series/179738/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe4ed4a5d9206747219118303838c1f3600bfa3d
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Nov 26 12:07:53 2026 +0200

    drm/i915/ddi_mgr: Enable dynamic DDI allocation at load
    
    Initialize and enable the DDI manager before GMBUS and output setup so
    legacy DDI allocations and HPD source mappings are ready when adapters
    and encoders are created. Reconfigure the DDI assignments and encoder
    mappings during system resume.
    
    For now, this enables only static legacy DDI allocation. Legacy DDIs are
    inherited from BIOS or allocated only during driver loading and system
    resume, and these assignments remain unchanged during runtime. Runtime
    reallocation support will be added in a follow-up series.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 6dfee524c812864b095a18926620cfff58bd6e6f drm-intel
e71ca84c00f1 drm/i915/dp: Allow rebuilding the source rate list
1eee975839b6 drm/i915/hotplug: Set detector enable bits without a clear mask
281d4ca38637 drm/i915/nvl+: Add support for remapping logical HPD pins to HW pins
-:58: CHECK:BRACES: braces {} should be used on all arms of this statement
#58: FILE: drivers/gpu/drm/i915/display/intel_hotplug_irq.c:157:
+	if (DISPLAY_VER(display) >= 35) {
[...]
+	} else if (DISPLAY_VER(display) >= 14)
[...]
 	else if (DISPLAY_VER(display) >= 11)
[...]

-:74: CHECK:BRACES: braces {} should be used on all arms of this statement
#74: FILE: drivers/gpu/drm/i915/display/intel_hotplug_irq.c:183:
+	if (DISPLAY_VER(display) >= 35) {
[...]
+	} else if (INTEL_PCH_TYPE(display) >= PCH_MTL)
[...]
 	else if (INTEL_PCH_TYPE(display) >= PCH_DG1)
[...]

-:113: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/i915/display/intel_hotplug_irq.c:230:
+	if (drm_WARN_ON(display->drm, pch_hw_pin != HPD_NONE &&
+				      (pch_hw_pin < HPD_PORT_TC1 || pch_hw_pin > HPD_PORT_TC4)))

-:129: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#129: FILE: drivers/gpu/drm/i915/display/intel_hotplug_irq.c:610:
+static void xe3plpd_tc_hpd_pins(struct intel_display *display,
+			      u32 *pin_mask, u32 *long_mask,

-:163: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#163: FILE: drivers/gpu/drm/i915/display/intel_hotplug_irq.c:658:
+			xe3plpd_tc_hpd_pins(display, &pin_mask, &long_mask,
+					   tc_hotplug_trigger, dig_hotplug_reg);

total: 0 errors, 0 warnings, 5 checks, 201 lines checked
ffebfbb5fa4e drm/xe/display: Distinguish failed system suspend recovery
e898bd015a8b drm/i915/gmbus: Extract a helper for Type-C DDC pin mapping
3ca1cfc34a3b drm/i915/ddi_mgr: Add support for dynamic DDI allocation
-:78: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#78: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 895 lines checked
b4232a4a251f drm/i915/gmbus: Extract adapter creation and destruction
53fab5d23e66 drm/i915/gmbus: Add stable DDC adapters for the DDI pool
9e73c2d7cbc2 drm/i915/ddi_mgr: Register encoders with dynamic DDI support
6559d1a5b27f drm/i915/ddi_mgr: Keep AUX access consistent with DDI pool routes
5ad9baee5fe7 drm/i915/ddi_mgr: Verify and restore DDI allocations after runtime resume
0776c075f2fb drm/i915/ddi_mgr: Handle DDI pool system suspend and resume
-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/i915/display/intel_ddi_mgr.c:866:
+	intel_tc_port_set_legacy(dig_port, mgr->enabled &&
+				route->mode == INTEL_DDI_ROUTE_LEGACY);

total: 0 errors, 0 warnings, 1 checks, 177 lines checked
fe4ed4a5d920 drm/i915/ddi_mgr: Enable dynamic DDI allocation at load


