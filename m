Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E63CF31B1
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 10:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F710E12B;
	Wed,  2 Oct 2024 10:35:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCED10E700;
 Wed,  2 Oct 2024 10:35:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/i915/irq=3A_add_struct_i915=5Firq=5Fregs_triplet?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 10:35:12 -0000
Message-ID: <172786531206.1162324.14284305535496650184@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002102645.136155-1-jani.nikula@intel.com>
In-Reply-To: <20241002102645.136155-1-jani.nikula@intel.com>
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

Series: series starting with [CI,1/3] drm/i915/irq: add struct i915_irq_regs triplet
URL   : https://patchwork.freedesktop.org/series/139413/
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
commit c17f78592e8a125208775d958ce5136847b5b26b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 2 13:26:45 2024 +0300

    drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros
    
    Define register offset triplets for all registers used with
    GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros, and call the
    underlying gen3_irq_reset() and gen3_irq_init() functions
    directly. Remove the macros, along with the macro name concatenation
    hackery.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ccd6d671492e28746e9ed8e88bd6d25b6f3295dd drm-intel
d7162b51206f drm/i915/irq: add struct i915_irq_regs triplet
fc2c5ea66807 drm/i915/irq: remove GEN3_IRQ_RESET() and GEN3_IRQ_INIT() macros
c17f78592e8a drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() macros
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


