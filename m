Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F8C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 12:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9147510EAA2;
	Fri, 16 May 2025 12:22:25 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EDD10EAA2;
 Fri, 16 May 2025 12:22:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/flipq=3A_Rough_f?=
 =?utf-8?q?lip_queue_implementation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 12:22:24 -0000
Message-ID: <174739814426.88034.15421488133302129210@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516113408.11689-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250516113408.11689-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/flipq: Rough flip queue implementation
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
commit 7788f96a47d4baf887ff7196913a5ae4b607ff5b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri May 16 14:34:08 2025 +0300

    drm/i915/flipq: Enable flipq by default for testing
    
    Flip on the enable_flipq modparam to see if CI blows up.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 drm-intel
260da89bad8f drm/i915/dsb: Extract intel_dsb_ins_align()
c73e0d33e754 drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
0e909049ad1a drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
8b468a6a1f42 drm/i915/dsb: Extract intel_dsb_{head,tail}()
fc3c1d693939 drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
862f1a052855 drm/i915/dmc: Define flip queue related PIPEDMC registers
-:59: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:322:
+#define PIPEDMC_FQ_STATUS(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_FQ_STATUS_A, _PIPEDMC_FQ_STATUS_B)

-:66: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:329:
+#define PIPEDMC_FPQ_ATOMIC_TP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_FPQ_ATOMIC_TP_A, _PIPEDMC_FPQ_ATOMIC_TP_B)

-:80: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#80: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:343:
+#define PIPEDMC_FPQ_LINES_TO_W1		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W1_A, _PIPEDMC_FPQ_LINES_TO_W1_B)

-:84: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:347:
+#define PIPEDMC_FPQ_LINES_TO_W2		_MMIO_PIPE((pipe), _PIPEDMC_FPQ_LINES_TO_W2_A, _PIPEDMC_FPQ_LINES_TO_W2_B)

-:88: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#88: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:351:
+#define PIPEDMC_SCANLINECMP(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMP_A, _PIPEDMC_SCANLINECMP_B)

-:94: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:357:
+#define PIPEDMC_SCANLINECMPLOWER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPLOWER_A, _PIPEDMC_SCANLINECMPLOWER_B)

-:98: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:361:
+#define   PIPEDMC_SCANLINE_LOWER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_LOWER_MASK, (scanline))

-:102: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#102: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:365:
+#define PIPEDMC_SCANLINECMPUPPER(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINECMPUPPER_A, _PIPEDMC_SCANLINECMPUPPER_B)

-:104: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:367:
+#define   PIPEDMC_SCANLINE_UPPER(scanline)	REG_FIELD_PREP(PIPEDMC_SCANLINE_UPPER_MASK, (scanline))

-:106: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#106: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:369:
+#define _MMIO_PIPEDMC_FPQ(pipe, fq_id, \
+			  reg_fpq1_a, reg_fpq2_a, reg_fpq3_a, reg_fpq4_a, \
+			  reg_fpq1_b, reg_fpq2_b, reg_fpq3_b, reg_fpq4_b) \
+	_MMIO(_PICK_EVEN_2RANGES((fq_id), INTEL_FLIPQ_PLANE_3, \
+				 _PIPE((pipe), (reg_fpq1_a), (reg_fpq1_b)), \
+				 _PIPE((pipe), (reg_fpq2_a), (reg_fpq2_b)), \
+				 _PIPE((pipe), (reg_fpq3_a), (reg_fpq3_b)), \
+				 _PIPE((pipe), (reg_fpq4_a), (reg_fpq4_b))))

-:158: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#158: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:421:
+							  _PIPEDMC_FPQ1_CHP_A, _PIPEDMC_FPQ2_CHP_A, \

-:159: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#159: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:422:
+							  _PIPEDMC_FPQ3_CHP_A, _PIPEDMC_FPQ4_CHP_A, \

-:160: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#160: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:423:
+							  _PIPEDMC_FPQ1_CHP_B, _PIPEDMC_FPQ2_CHP_B, \

-:169: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#169: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:432:
+#define PIPEDMC_SCANLINE_RO(pipe)	_MMIO_PIPE((pipe), _PIPEDMC_SCANLINE_RO_A, _PIPEDMC_SCANLINE_RO_B)

-:191: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#191: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:543:
+#define   PIPE_D_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_D_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:193: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#193: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:545:
+#define   PIPE_C_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_C_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:195: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:547:
+#define   PIPE_B_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_B_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

-:197: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_dmc_regs.h:549:
+#define   PIPE_A_DMC_W2_PTS_CONFIG_SELECT(pipe)	REG_FIELD_PREP(PIPE_A_DMC_W2_PTS_CONFIG_SELECT_MASK, (pipe))

total: 0 errors, 17 warnings, 1 checks, 194 lines checked
2ec43ad94aff drm/i915/flipq: Provide the nuts and bolts code for flip queue
-:37: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#37: 
      need to think what to about the cdclk dependency on the execution time

-:261: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#261: 
new file mode 100644

-:287: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'flipq_id' - possible side-effects?
#287: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:22:
+#define for_each_flipq(flipq_id) \
+	for ((flipq_id) = INTEL_FLIPQ_PLANE_1; (flipq_id) < MAX_INTEL_FLIPQ; (flipq_id)++)

-:354: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#354: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:89:
+		flipq->start_mmioaddr = intel_pipedmc_start_mmioaddr(crtc) + intel_flipq_offset(flipq_id);

-:519: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#519: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:254:
+					       intel_flipq_elem_size_dw(flipq->flipq_id) + i), data);

total: 0 errors, 4 warnings, 1 checks, 525 lines checked
ac4caef6f64f drm/i915/flipq: Implement flipq queue based commit path
-:190: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#190: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:66:
+intel_display_param_named_unsafe(enable_flipq, bool, 0400,
+	"Enable DMC flip queue (default: false)");

total: 0 errors, 0 warnings, 1 checks, 207 lines checked
d84f79d5f76f drm/i915/flipq: Implement Wa_18034343758
263a16d3f1d3 drm/i915/flipq: Implement Wa_16018781658 for LNL-A0
6b7cf9755884 drm/i915/flipq: Add intel_flipq_dump()
-:33: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:162:
+		printk(KERN_CONT " 0x%08x",

-:33: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#33: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:162:
+		printk(KERN_CONT " 0x%08x",

-:35: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:164:
+		if (i % intel_flipq_elem_size_dw(flipq_id) == intel_flipq_elem_size_dw(flipq_id) - 1)

-:36: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_cont([subsystem]dev, ... then dev_cont(dev, ... then pr_cont(...  to printk(KERN_CONT ...
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:165:
+			printk(KERN_CONT "\n");

-:36: WARNING:LOGGING_CONTINUATION: Avoid logging continuation uses where feasible
#36: FILE: drivers/gpu/drm/i915/display/intel_flipq.c:165:
+			printk(KERN_CONT "\n");

total: 0 errors, 5 warnings, 0 checks, 60 lines checked
7788f96a47d4 drm/i915/flipq: Enable flipq by default for testing


