Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C1C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 19:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE3510E43C;
	Mon,  9 Jun 2025 19:23:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0995610E438;
 Mon,  9 Jun 2025 19:23:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/flipq=3A_Rough_f?=
 =?utf-8?q?lip_queue_implementation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 19:23:10 -0000
Message-ID: <174949699003.61787.12545813743130173965@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/flipq: Rough flip queue implementation (rev6)
URL   : https://patchwork.freedesktop.org/series/149109/
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
commit ca9ae9875bb3c753ca2e3a81501c7636980c8466
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Jun 9 17:10:46 2025 +0300

    drm/i915/flipq: Disable PSR for extra flip queue coverage
    
    Disable PSR to get more coverage for the flip queue in the CI.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
83a3b9cd77f6 drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
8d1923700c4e drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
2210c757edc9 drm/i915/dsb: Introduce intel_dsb_exec_time_us()
5da92baeb3b4 drm/i915/dsb: Garbage collect the MMIO DEwake stuff
ee25765225eb drm/i915/dsb: Move the DSB_PMCTRL* reset out of intel_dsb_finish()
60dac975913f drm/i915/dsb: Disable the GOSUB interrupt
2d5f012ecbfb drm/i915/dmc: Limit PIPEDMC clock gating w/a to just ADL/DG2/MTL
240fb423726d drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
fe940c5fcb93 drm/i915: Set PKG_C_LATENCY.added_wake_time to 0
b195357c1878 drm/i915: Try to program PKG_C_LATENCY more correctly
f3148a8fbd9f drm/i915/dmc: Shuffle code around
-:111: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:590:
+		intel_de_write(display, PIPEDMC_INTERRUPT_MASK(pipe), ~pipedmc_interrupt_mask(display));

total: 0 errors, 1 warnings, 0 checks, 162 lines checked
269583216f2b drm/i915/dmc: Reload PIPEDMC MMIO registers for pipe C/D on PTL+
c6fef2190842 drm/i915/dmc: Assert DMC is loaded harder
67ac4a489541 drm/i915/dmc: Define flip queue related PIPEDMC registers
-:66: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:321:
+#define PIPEDMC_FQ_STATUS(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_FQ_STATUS_A, _PIPEDMC_FQ_STATUS_B)

-:73: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#73: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:328:
+#define PIPEDMC_FPQ_ATOMIC_TP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_FPQ_ATOMIC_TP_A, _PIPEDMC_FPQ_ATOMIC_TP_B)

-:87: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:342:
+#define PIPEDMC_FPQ_LINES_TO_W1		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W1_A, _PIPEDMC_FPQ_LINES_TO_W1_B)

-:91: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:346:
+#define PIPEDMC_FPQ_LINES_TO_W2		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W2_A, _PIPEDMC_FPQ_LINES_TO_W2_B)

-:95: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:350:
+#define PIPEDMC_SCANLINECMP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMP_A, _PIPEDMC_SCANLINECMP_B)

-:101: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#101: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:356:
+#define PIPEDMC_SCANLINECMPLOWER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPLOWER_A, _PIPEDMC_SCANLINECMPLOWER_B)

-:105: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#105: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:360:
+#define   PIPEDMC_SCANLINE_LOWER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_LOWER_MASK, (scanline))

-:109: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:364:
+#define PIPEDMC_SCANLINECMPUPPER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPUPPER_A, _PIPEDMC_SCANLINECMPUPPER_B)

-:111: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#111: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:366:
+#define   PIPEDMC_SCANLINE_UPPER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_UPPER_MASK, (scanline))

-:113: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#113: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:368:
+#define _MMIO_PIPEDMC_FPQ(pipe, fq_id, \
+			  reg_fpq1_a, reg_fpq2_a, reg_fpq3_a, reg_fpq4_a, \
+			  reg_fpq1_b, reg_fpq2_b, reg_fpq3_b, reg_fpq4_b) \
+	_MMIO(_PICK_EVEN_2RANGES((fq_id), INTEL_FLIPQ_PLANE_3, \
+				 _PIPE((pipe), (reg_fpq1_a), (reg_fpq1_b)), \
+				 _PIPE((pipe), (reg_fpq2_a), (reg_fpq2_b)), \
+				 _PIPE((pipe), (reg_fpq3_a), (reg_fpq3_b)), \
+				 _PIPE((pipe), (reg_fpq4_a), (reg_fpq4_b))))

-:165: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#165: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:420:
+							  _PIPEDMC_FPQ1_CHP_A, _PIPEDMC_FPQ2_CHP_A, \

-:166: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#166: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:421:
+							  _PIPEDMC_FPQ3_CHP_A, _PIPEDMC_FPQ4_CHP_A, \

-:167: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#167: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:422:
+							  _PIPEDMC_FPQ1_CHP_B, _PIPEDMC_FPQ2_CHP_B, \

-:176: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#176: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:431:
+#define PIPEDMC_SCANLINE_RO(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINE_RO_A, _PIPEDMC_SCANLINE_RO_B)

-:198: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#198: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:542:
+#define   PIPE_D_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_D_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:200: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:544:
+#define   PIPE_C_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_C_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:202: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#202: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:546:
+#define   PIPE_B_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_B_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:204: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#204: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:548:
+#define   PIPE_A_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_A_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

total: 0 errors, 17 warnings, 1 checks, 214 lines checked
a2b772f2cf99 drm/i915/flipq: Provide the nuts and bolts code for flip queue
-:273: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#273: 
new file mode 100644

-:300: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'flipq_id' - possible side-effects?
#300: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:23:
+#define for_each_flipq(flipq_id) \
+	for ((flipq_id) = INTEL_FLIPQ_PLANE_1; (flipq_id) < MAX_INTEL_FLIPQ; (flipq_id)++)

-:367: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#367: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:90:
+		flipq->start_mmioaddr = intel_pipedmc_start_mmioaddr(crtc) + intel_flipq_offset(flipq_id);

-:562: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#562: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:285:
+					       intel_flipq_elem_size_dw(flipq->flipq_id) + i), data);

total: 0 errors, 3 warnings, 1 checks, 599 lines checked
eeb936ca03c0 drm/i915/flipq: Implement flip queue based commit path
-:164: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#164: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:66:
+intel_display_param_named_unsafe(enable_flipq, bool, 0400,
+	"Enable DMC flip queue (default: false)");

total: 0 errors, 0 warnings, 1 checks, 266 lines checked
78de93a655b6 drm/i915/flipq: Implement Wa_18034343758
6ad7756ccb40 drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
4fbeb51c396b drm/i915/flipq: Add intel_flipq_dump()
-:33: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:206:
+		printk(KERN_CONT " 0x%08x",

-:33: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:206:
+		printk(KERN_CONT " 0x%08x",

-:35: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:208:
+		if (i % intel_flipq_elem_size_dw(flipq_id) == intel_flipq_elem_size_dw(flipq_id) - 1)

-:36: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:209:
+			printk(KERN_CONT "\n");

-:36: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:209:
+			printk(KERN_CONT "\n");

total: 0 errors, 5 warnings, 0 checks, 59 lines checked
241b30f558f3 drm/i915/flipq: Enable flipq by default for testing
ca9ae9875bb3 drm/i915/flipq: Disable PSR for extra flip queue coverage


