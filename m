Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F972C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 18:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4A10E0CA;
	Tue, 24 Jun 2025 18:36:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378710E0CA;
 Tue, 24 Jun 2025 18:36:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/flipq=3A_Rough_f?=
 =?utf-8?q?lip_queue_implementation_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 18:36:04 -0000
Message-ID: <175079016453.106099.17220297096199508420@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/flipq: Rough flip queue implementation (rev7)
URL   : https://patchwork.freedesktop.org/series/149109/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c35dd2339f2c84404622957ad91f27515e28913e
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Jun 24 20:00:49 2025 +0300

    drm/i915/flipq: Enable flipq by default for testing
    
    Flip on the enable_flipq modparam to see if CI blows up.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 0095a137b4944b43200228af265c708bdfcf262f drm-intel
902efdc21dc1 drm/i915: Set PKG_C_LATENCY.added_wake_time to 0
00d378f74ae0 drm/i915: Try to program PKG_C_LATENCY more correctly
847088ea22d7 drm/i915/dmc: Define flip queue related PIPEDMC registers
-:58: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:321:
+#define PIPEDMC_FQ_STATUS(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_FQ_STATUS_A, _PIPEDMC_FQ_STATUS_B)

-:65: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:328:
+#define PIPEDMC_FPQ_ATOMIC_TP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_FPQ_ATOMIC_TP_A, _PIPEDMC_FPQ_ATOMIC_TP_B)

-:79: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:342:
+#define PIPEDMC_FPQ_LINES_TO_W1		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W1_A, _PIPEDMC_FPQ_LINES_TO_W1_B)

-:83: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#83: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:346:
+#define PIPEDMC_FPQ_LINES_TO_W2		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W2_A, _PIPEDMC_FPQ_LINES_TO_W2_B)

-:87: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:350:
+#define PIPEDMC_SCANLINECMP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMP_A, _PIPEDMC_SCANLINECMP_B)

-:93: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:356:
+#define PIPEDMC_SCANLINECMPLOWER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPLOWER_A, _PIPEDMC_SCANLINECMPLOWER_B)

-:97: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#97: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:360:
+#define   PIPEDMC_SCANLINE_LOWER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_LOWER_MASK, (scanline))

-:101: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#101: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:364:
+#define PIPEDMC_SCANLINECMPUPPER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPUPPER_A, _PIPEDMC_SCANLINECMPUPPER_B)

-:103: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:366:
+#define   PIPEDMC_SCANLINE_UPPER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_UPPER_MASK, (scanline))

-:105: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#105: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:368:
+#define _MMIO_PIPEDMC_FPQ(pipe, fq_id, \
+			  reg_fpq1_a, reg_fpq2_a, reg_fpq3_a, reg_fpq4_a, \
+			  reg_fpq1_b, reg_fpq2_b, reg_fpq3_b, reg_fpq4_b) \
+	_MMIO(_PICK_EVEN_2RANGES((fq_id), INTEL_FLIPQ_PLANE_3, \
+				 _PIPE((pipe), (reg_fpq1_a), (reg_fpq1_b)), \
+				 _PIPE((pipe), (reg_fpq2_a), (reg_fpq2_b)), \
+				 _PIPE((pipe), (reg_fpq3_a), (reg_fpq3_b)), \
+				 _PIPE((pipe), (reg_fpq4_a), (reg_fpq4_b))))

-:157: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#157: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:420:
+							  _PIPEDMC_FPQ1_CHP_A, _PIPEDMC_FPQ2_CHP_A, \

-:158: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#158: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:421:
+							  _PIPEDMC_FPQ3_CHP_A, _PIPEDMC_FPQ4_CHP_A, \

-:159: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#159: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:422:
+							  _PIPEDMC_FPQ1_CHP_B, _PIPEDMC_FPQ2_CHP_B, \

-:168: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#168: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:431:
+#define PIPEDMC_SCANLINE_RO(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINE_RO_A, _PIPEDMC_SCANLINE_RO_B)

-:190: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#190: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:542:
+#define   PIPE_D_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_D_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:192: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#192: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:544:
+#define   PIPE_C_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_C_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:194: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:546:
+#define   PIPE_B_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_B_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:196: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:548:
+#define   PIPE_A_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_A_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

total: 0 errors, 17 warnings, 1 checks, 206 lines checked
fe7df24148f0 drm/i915/flipq: Provide the nuts and bolts code for flip queue
-:285: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#285: 
new file mode 100644

-:326: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'flipq_id' - possible side-effects?
#326: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:37:
+#define for_each_flipq(flipq_id) \
+	for ((flipq_id) = INTEL_FLIPQ_PLANE_1; (flipq_id) < MAX_INTEL_FLIPQ; (flipq_id)++)

-:393: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#393: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:104:
+		flipq->start_mmioaddr = intel_pipedmc_start_mmioaddr(crtc) + intel_flipq_offset(flipq_id);

-:588: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#588: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:299:
+					       intel_flipq_elem_size_dw(flipq->flipq_id) + i), data);

total: 0 errors, 3 warnings, 1 checks, 619 lines checked
a460db53a4f8 drm/i915/flipq: Implement flip queue based commit path
-:169: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#169: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:66:
+intel_display_param_named_unsafe(enable_flipq, bool, 0400,
+	"Enable DMC flip queue (default: false)");

total: 0 errors, 0 warnings, 1 checks, 239 lines checked
69553436e241 drm/i915/flipq: Implement Wa_18034343758
e8029d0b0af5 drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
59bdf66b729b drm/i915/flipq: Add intel_flipq_dump()
-:34: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#34: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:220:
+		printk(KERN_CONT " 0x%08x",

-:34: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#34: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:220:
+		printk(KERN_CONT " 0x%08x",

-:36: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:222:
+		if (i % intel_flipq_elem_size_dw(flipq_id) == intel_flipq_elem_size_dw(flipq_id) - 1)

-:37: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#37: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:223:
+			printk(KERN_CONT "\n");

-:37: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#37: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:223:
+			printk(KERN_CONT "\n");

total: 0 errors, 5 warnings, 0 checks, 59 lines checked
c35dd2339f2c drm/i915/flipq: Enable flipq by default for testing


