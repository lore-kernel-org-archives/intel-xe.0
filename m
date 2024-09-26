Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8AACDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 19:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB74C10EBD0;
	Thu, 26 Sep 2024 19:53:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83C110E08A;
 Thu, 26 Sep 2024 19:53:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/irq=3A_clean_up_?=
 =?utf-8?q?irq_reset/init_macro_hacks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 19:53:57 -0000
Message-ID: <172738043768.1108589.15690963686170775128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1727369787.git.jani.nikula@intel.com>
In-Reply-To: <cover.1727369787.git.jani.nikula@intel.com>
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

Series: drm/i915/irq: clean up irq reset/init macro hacks
URL   : https://patchwork.freedesktop.org/series/139167/
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
commit 6248a1037149257685e145b3f46416533b1406b3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Sep 26 19:57:48 2024 +0300

    drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros
    
    Define register offset triplets for all registers used with
    GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros, and call the
    underlying gen3_irq_reset() and gen3_irq_init() functions
    directly. Remove the macros, along with the macro name concatenation
    hackery.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 9b28db71fdf6180b7f7f5f02a42372afa1815830 drm-intel
b82c01a322c4 drm/i915/irq: add struct i915_irq_regs triplet
2c092deda34f drm/i915/irq: remove GEN3_IRQ_RESET() and GEN3_IRQ_INIT() macros
6248a1037149 drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros
-:145: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'which' - possible side-effects?
#145: FILE: drivers/gpu/drm/i915/i915_reg.h:2494:
+#define GEN8_GT_IRQ_REGS(which)		I915_IRQ_REGS(GEN8_GT_IMR(which), \
+						      GEN8_GT_IER(which), \
+						      GEN8_GT_IIR(which))

-:156: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#156: FILE: drivers/gpu/drm/i915/i915_reg.h:2549:
+#define GEN8_DE_PIPE_IRQ_REGS(pipe)	I915_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe), \
+						      GEN8_DE_PIPE_IER(pipe), \
+						      GEN8_DE_PIPE_IIR(pipe))

total: 0 errors, 0 warnings, 2 checks, 121 lines checked


