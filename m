Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB1C3ABDA
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 00:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99B510E093;
	Thu, 15 May 2025 00:30:01 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1910E0B6;
 Thu, 15 May 2025 00:30:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_PIPEDMC_s?=
 =?utf-8?q?tuff_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 00:30:01 -0000
Message-ID: <174726900120.82427.2831363244402545984@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dmc: PIPEDMC stuff (rev3)
URL   : https://patchwork.freedesktop.org/series/148873/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f50275196419454a3d71921f4c80b0a051cb5e7
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon May 12 13:33:58 2025 +0300

    drm/i915/dmc: Introduce dmc_configure_event()
    
    Instead of hardcoding the event handler indices (for runtime
    event handler enable/disable) we can simply look for the handler
    with the appropriate event type. This isolates us from the firmware
    details a bit better.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 3d6670fab64cb00b5e6ed80d2517147db533faf1 drm-intel
1901df20fdab drm/i915: Drop PIPEDMC faults from the fault mask on LNL+
fd07d2e0d922 drm/i915: Hook up PIPEDMC interrupts
-:131: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#131: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:515:
+		intel_de_write(display, PIPEDMC_INTERRUPT_MASK(pipe), ~pipedmc_interrupt_mask(display));

-:206: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#206: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:38:
+#define   PIPEDMC_INT_VECTOR_FLIPQ_PROG_DONE		REG_FIELD_PREP(PIPEDMC_INT_VECTOR_MASK, 0xff) /* Wa_16018781658:lnl[a0] */

-:211: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#211: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:43:
+#define PIPEDMC_INTERRUPT(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_INTERRUPT_A, _PIPEDMC_INTERRUPT_B)

-:214: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#214: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:46:
+#define PIPEDMC_INTERRUPT_MASK(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_INTERRUPT_MASK_A, _PIPEDMC_INTERRUPT_MASK_B)

total: 0 errors, 4 warnings, 0 checks, 160 lines checked
25c34574bdaf drm/i915/dmc: Define all DMC event IDs
69fefb1a80b4 drm/i915/dmc: Extract dmc_evt_ctl_disable()
a4e1aa4da7bd drm/o915/dmc: Relocate is_dmc_evt_{ctl,htp}_reg()
d61139d0c01e drm/i915/dmc: Extract is_event_handler()
7f5027519641 drm/i915/dmc: Introduce dmc_configure_event()


