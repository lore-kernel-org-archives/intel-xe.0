Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EB4FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D610EA16;
	Tue,  5 May 2026 09:36:11 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA5510EA16;
 Tue,  5 May 2026 09:36:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_start?=
 =?utf-8?q?_switching_to_display_specific_reg_types_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 09:36:10 -0000
Message-ID: <177797377010.38316.2615901012648694488@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1777972548.git.jani.nikula@intel.com>
In-Reply-To: <cover.1777972548.git.jani.nikula@intel.com>
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

Series: drm/i915/display: start switching to display specific reg types (rev2)
URL   : https://patchwork.freedesktop.org/series/164540/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42c553cadf4ecc1107e6b9e2b12063d0b811b139
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 5 12:16:48 2026 +0300

    drm/i915/display: define and use intel_reg_{offset, equal, valid}() helpers
    
    Add display specific helpers for getting the register offset, checking
    for equality and validity. Add them as static inlines for increased type
    safety.
    
    Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch fa7a3955d5aca4e8e7299ee765637de39009850e drm-intel
a21795ae8e8b drm/i915/display: add typedef for intel_reg_t and use it
-:813: WARNING:NEW_TYPEDEFS: do not add new typedefs
#813: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:11:
+typedef i915_reg_t intel_reg_t;

total: 0 errors, 1 warnings, 0 checks, 1982 lines checked
5274071c22cf drm/i915/display: add struct intel_irq_regs and use it
-:96: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#96: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1410:
+#define GEN8_DE_PIPE_IRQ_REGS(pipe)	INTEL_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
+						       GEN8_DE_PIPE_IER(pipe), \
+						       GEN8_DE_PIPE_IIR(pipe))

total: 0 errors, 0 warnings, 1 checks, 128 lines checked
b5e25ef972c4 drm/i915/display: add struct intel_error_regs and use it
42c553cadf4e drm/i915/display: define and use intel_reg_{offset, equal, valid}() helpers
-:164: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#164: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1153:
+			    i+1, intel_reg_offset(dmc_info->mmioaddr[i+1]),
 			     ^

-:164: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#164: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1153:
+			    i+1, intel_reg_offset(dmc_info->mmioaddr[i+1]),
 			                                              ^

total: 0 errors, 0 warnings, 2 checks, 246 lines checked


