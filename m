Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A7C54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B110E0FE;
	Thu, 22 May 2025 20:23:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9740810E0FE;
 Thu, 22 May 2025 20:23:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C01/13=5D_drm/i915/dsb=3A_Extract_intel=5Fdsb=5Fins=5Falign=28?=
 =?utf-8?q?=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 20:23:38 -0000
Message-ID: <174794541861.15775.13528298213653812765@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521181645.32737-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250521181645.32737-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [v2,01/13] drm/i915/dsb: Extract intel_dsb_ins_align() (rev3)
URL   : https://patchwork.freedesktop.org/series/149343/
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
commit 5ed3efad9d1508d9bea1ec42d8d53d686909dd79
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed May 21 21:16:45 2025 +0300

    drm/i915/flipq: Enable flipq by default for testing
    
    Flip on the enable_flipq modparam to see if CI blows up.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 08cbef6f5828542709e4eb2c6c74835f272a5733 drm-intel
0718fcd932fa drm/i915/dsb: Extract intel_dsb_ins_align()
8f2eb100b3f5 drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
c303de5c65b6 drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
122237e5fa66 drm/i915/dsb: Extract intel_dsb_{head,tail}()
14976a753564 drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
877c0eec6abc drm/i915/dsb: Introduce intel_dsb_exec_time_us()
3555676dc5bc drm/i915/dmc: Define flip queue related PIPEDMC registers
-:64: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:322:
+#define PIPEDMC_FQ_STATUS(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_FQ_STATUS_A, _PIPEDMC_FQ_STATUS_B)

-:71: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:329:
+#define PIPEDMC_FPQ_ATOMIC_TP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_FPQ_ATOMIC_TP_A, _PIPEDMC_FPQ_ATOMIC_TP_B)

-:85: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#85: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:343:
+#define PIPEDMC_FPQ_LINES_TO_W1		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W1_A, _PIPEDMC_FPQ_LINES_TO_W1_B)

-:89: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#89: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:347:
+#define PIPEDMC_FPQ_LINES_TO_W2		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W2_A, _PIPEDMC_FPQ_LINES_TO_W2_B)

-:93: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:351:
+#define PIPEDMC_SCANLINECMP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMP_A, _PIPEDMC_SCANLINECMP_B)

-:99: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#99: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:357:
+#define PIPEDMC_SCANLINECMPLOWER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPLOWER_A, _PIPEDMC_SCANLINECMPLOWER_B)

-:103: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:361:
+#define   PIPEDMC_SCANLINE_LOWER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_LOWER_MASK, (scanline))

-:107: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:365:
+#define PIPEDMC_SCANLINECMPUPPER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPUPPER_A, _PIPEDMC_SCANLINECMPUPPER_B)

-:109: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#109: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:367:
+#define   PIPEDMC_SCANLINE_UPPER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_UPPER_MASK, (scanline))

-:111: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#111: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:369:
+#define _MMIO_PIPEDMC_FPQ(pipe, fq_id, \
+			  reg_fpq1_a, reg_fpq2_a, reg_fpq3_a, reg_fpq4_a, \
+			  reg_fpq1_b, reg_fpq2_b, reg_fpq3_b, reg_fpq4_b) \
+	_MMIO(_PICK_EVEN_2RANGES((fq_id), INTEL_FLIPQ_PLANE_3, \
+				 _PIPE((pipe), (reg_fpq1_a), (reg_fpq1_b)), \
+				 _PIPE((pipe), (reg_fpq2_a), (reg_fpq2_b)), \
+				 _PIPE((pipe), (reg_fpq3_a), (reg_fpq3_b)), \
+				 _PIPE((pipe), (reg_fpq4_a), (reg_fpq4_b))))

-:163: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#163: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:421:
+							  _PIPEDMC_FPQ1_CHP_A, _PIPEDMC_FPQ2_CHP_A, \

-:164: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#164: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:422:
+							  _PIPEDMC_FPQ3_CHP_A, _PIPEDMC_FPQ4_CHP_A, \

-:165: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#165: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:423:
+							  _PIPEDMC_FPQ1_CHP_B, _PIPEDMC_FPQ2_CHP_B, \

-:174: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#174: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:432:
+#define PIPEDMC_SCANLINE_RO(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINE_RO_A, _PIPEDMC_SCANLINE_RO_B)

-:196: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:543:
+#define   PIPE_D_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_D_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:198: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#198: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:545:
+#define   PIPE_C_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_C_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:200: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:547:
+#define   PIPE_B_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_B_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:202: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#202: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:549:
+#define   PIPE_A_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_A_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

total: 0 errors, 17 warnings, 1 checks, 215 lines checked
c83176133353 drm/i915/flipq: Provide the nuts and bolts code for flip queue
-:271: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#271: 
new file mode 100644

-:298: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'flipq_id' - possible side-effects?
#298: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:23:
+#define for_each_flipq(flipq_id) \
+	for ((flipq_id) = INTEL_FLIPQ_PLANE_1; (flipq_id) < MAX_INTEL_FLIPQ; (flipq_id)++)

-:365: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#365: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:90:
+		flipq->start_mmioaddr = intel_pipedmc_start_mmioaddr(crtc) + intel_flipq_offset(flipq_id);

-:556: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#556: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:281:
+					       intel_flipq_elem_size_dw(flipq->flipq_id) + i), data);

total: 0 errors, 3 warnings, 1 checks, 600 lines checked
8b33f0b16965 drm/i915/flipq: Implement flip queue based commit path
-:192: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#192: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:66:
+intel_display_param_named_unsafe(enable_flipq, bool, 0400,
+	"Enable DMC flip queue (default: false)");

total: 0 errors, 0 warnings, 1 checks, 215 lines checked
f0c33c946020 drm/i915/flipq: Implement Wa_18034343758
5d75d5fe9bc3 drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
000bfe763abe drm/i915/flipq: Add intel_flipq_dump()
-:33: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:178:
+		printk(KERN_CONT " 0x%08x",

-:33: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:178:
+		printk(KERN_CONT " 0x%08x",

-:35: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:180:
+		if (i % intel_flipq_elem_size_dw(flipq_id) == intel_flipq_elem_size_dw(flipq_id) - 1)

-:36: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:181:
+			printk(KERN_CONT "\n");

-:36: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:181:
+			printk(KERN_CONT "\n");

total: 0 errors, 5 warnings, 0 checks, 59 lines checked
5ed3efad9d15 drm/i915/flipq: Enable flipq by default for testing


