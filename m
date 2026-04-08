Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CE21073CBA
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E29610E658;
	Wed,  8 Apr 2026 13:23:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3022710E658;
 Wed,  8 Apr 2026 13:22:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_start?=
 =?utf-8?q?_switching_to_display_specific_reg_types?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 13:22:59 -0000
Message-ID: <177565457917.441898.11880193112996809666@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1775653994.git.jani.nikula@intel.com>
In-Reply-To: <cover.1775653994.git.jani.nikula@intel.com>
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

Series: drm/i915/display: start switching to display specific reg types
URL   : https://patchwork.freedesktop.org/series/164540/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 206eb51f33797bae4f7fb95eabada92ef721de88
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 8 16:15:51 2026 +0300

    drm/i915/display: define and use intel_reg_{offset, equal, valid}() helpers
    
    Add display specific helpers for getting the register offset, checking
    for equality and validity. Add them as static inlines for increased type
    safety.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 90b81c31521783f588ecc70b4cc869c347f7653c drm-intel
d80051f59317 drm/i915/display: add typedef for intel_reg_t and use it
-:809: WARNING:NEW_TYPEDEFS: do not add new typedefs
#809: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:11:
+typedef i915_reg_t intel_reg_t;

total: 0 errors, 1 warnings, 0 checks, 1982 lines checked
88f53202f3a8 drm/i915/display: add struct intel_irq_regs and use it
-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#92: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:1410:
+#define GEN8_DE_PIPE_IRQ_REGS(pipe)	INTEL_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
+						       GEN8_DE_PIPE_IER(pipe), \
+						       GEN8_DE_PIPE_IIR(pipe))

total: 0 errors, 0 warnings, 1 checks, 128 lines checked
25864bacbd36 drm/i915/display: add struct intel_error_regs and use it
206eb51f3379 drm/i915/display: define and use intel_reg_{offset, equal, valid}() helpers
-:160: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#160: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1153:
+			    i+1, intel_reg_offset(dmc_info->mmioaddr[i+1]),
 			     ^

-:160: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#160: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1153:
+			    i+1, intel_reg_offset(dmc_info->mmioaddr[i+1]),
 			                                              ^

total: 0 errors, 0 warnings, 2 checks, 246 lines checked


