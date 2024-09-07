Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE80CE7B04
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 03:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514610E1DA;
	Sat,  7 Sep 2024 03:11:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E510E1DA;
 Sat,  7 Sep 2024 03:11:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Stop_using_xe=5Fgt_as_a_r?=
 =?utf-8?q?egister_MMIO_target_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 03:11:23 -0000
Message-ID: <172567868305.955480.102165143007740235@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Series: Stop using xe_gt as a register MMIO target (rev2)
URL   : https://patchwork.freedesktop.org/series/138168/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dc6f3ec49aa87a3dcd1243a98ae162ab6e44bd1f
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Sep 6 17:08:32 2024 -0700

    drm/xe/mmio: Drop compatibility macros
    
    Now that all parts of the driver have switched over to using xe_mmio for
    direct register access, we can drop the compatibility macros that allow
    continued xe_gt usage.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a drm-intel
f5943b2e1ec6 drm/xe: Move forcewake to 'gt.pm' substructure
b4acc7906286 drm/xe: Create dedicated xe_mmio structure
f4911fd6b14e drm/xe: Clarify size of MMIO region
e6536b27f2f4 drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
0ebcf99c15e1 drm/xe: Populate GT's mmio iomap from tile during init
4003e81bb59e drm/xe: Switch mmio_ext to use 'struct xe_mmio'
aedb4330605a drm/xe: Add xe_tile backpointer to xe_mmio
8c18ef6f292e drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
7cd043adb66e drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
-:242: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#242: FILE: drivers/gpu/drm/xe/xe_mmio.c:342:
+static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,

-:335: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ptr' - possible side-effects?
#335: FILE: drivers/gpu/drm/xe/xe_mmio.h:23:
+#define __to_xe_mmio(ptr) \
+	_Generic(ptr, \
+		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
+		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
+		 const struct xe_mmio *: (ptr), \
+		 struct xe_mmio *: (ptr))

-:336: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#336: FILE: drivers/gpu/drm/xe/xe_mmio.h:24:
+	_Generic(ptr, \

-:337: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#337: FILE: drivers/gpu/drm/xe/xe_mmio.h:25:
+		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
 		                    ^

-:337: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#337: FILE: drivers/gpu/drm/xe/xe_mmio.h:25:
+		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
 		                     ^

-:338: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#338: FILE: drivers/gpu/drm/xe/xe_mmio.h:26:
+		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
 		              ^

-:338: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#338: FILE: drivers/gpu/drm/xe/xe_mmio.h:26:
+		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
 		               ^

-:339: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#339: FILE: drivers/gpu/drm/xe/xe_mmio.h:27:
+		 const struct xe_mmio *: (ptr), \
 		                      ^

-:339: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#339: FILE: drivers/gpu/drm/xe/xe_mmio.h:27:
+		 const struct xe_mmio *: (ptr), \
 		                       ^

-:340: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#340: FILE: drivers/gpu/drm/xe/xe_mmio.h:28:
+		 struct xe_mmio *: (ptr))
 		                ^

-:340: ERROR:SPACING: spaces required around that ':' (ctx:OxW)
#340: FILE: drivers/gpu/drm/xe/xe_mmio.h:28:
+		 struct xe_mmio *: (ptr))
 		                 ^

-:387: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#387: FILE: drivers/gpu/drm/xe/xe_mmio.h:73:
 }
+#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)

total: 4 errors, 1 warnings, 7 checks, 380 lines checked
eb51ba76caa3 drm/xe/irq: Convert register access to use xe_mmio
700294e56143 drm/xe/pcode: Convert register access to use xe_mmio
e41d3621357f drm/xe/hwmon: Convert register access to use xe_mmio
26f3b723eaa9 drm/xe/vram: Convert register access to use xe_mmio
d5dcc2998be4 drm/xe/compat-i915: Convert register access to use xe_mmio
3d043c7eb7d6 drm/xe/lmtt: Convert register access to use xe_mmio
b9c788acc546 drm/xe/stolen: Convert register access to use xe_mmio
520c1ec26549 drm/xe/device: Convert register access to use xe_mmio
f8f1011cb479 drm/xe/pci: Convert register access to use xe_mmio
64d82a48e5e7 drm/xe/wa: Convert register access to use xe_mmio
ec9a95cd3975 drm/xe/uc: Convert register access to use xe_mmio
abca56bfd30f drm/xe/guc: Convert register access to use xe_mmio
93bda7241eab drm/xe/huc: Convert register access to use xe_mmio
7018a2a6491b drm/xe/gsc: Convert register access to use xe_mmio
e02a50152648 drm/xe/query: Convert register access to use xe_mmio
cf644728a467 drm/xe/mcr: Convert register access to use xe_mmio
1bbb6193d53f drm/xe/mocs: Convert register access to use xe_mmio
32ed396db578 drm/xe/hw_engine: Convert register access to use xe_mmio
0b543d36ed30 drm/xe/gt_throttle: Convert register access to use xe_mmio
cf3c1e738fd9 drm/xe/pat: Convert register access to use xe_mmio
7a562cfc9579 drm/xe/wopcm: Convert register access to use xe_mmio
625fa127d310 drm/xe/oa: Convert register access to use xe_mmio
e81581bbf2df drm/xe/topology: Convert register access to use xe_mmio
03b6fee2be5e drm/xe/execlist: Convert register access to use xe_mmio
53552030ed7a drm/xe/gt_clock: Convert register access to use xe_mmio
40612a14647e drm/xe/reg_sr: Convert register access to use xe_mmio
bba564c07335 drm/xe/gt: Convert register access to use xe_mmio
4de0b4a652ce drm/xe/sriov: Convert register access to use xe_mmio
2bbe34d9df64 drm/xe/tlb: Convert register access to use xe_mmio
436e8eba7a2f drm/xe/gt_idle: Convert register access to use xe_mmio
bf0b68b9d2c2 drm/xe/forcewake: Convert register access to use xe_mmio
2437ed061c01 drm/xe/ggtt: Convert register access to use xe_mmio
4919f3e65796 drm/xe/ccs_mode: Convert register access to use xe_mmio
dc6f3ec49aa8 drm/xe/mmio: Drop compatibility macros
-:82: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#82: FILE: drivers/gpu/drm/xe/xe_mmio.c:342:
+static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,

-:161: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#161: FILE: drivers/gpu/drm/xe/xe_mmio.h:22:
+int xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg, u32 val, u32 mask, u32 eval);

-:162: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#162: FILE: drivers/gpu/drm/xe/xe_mmio.h:23:
+bool xe_mmio_in_range(const struct xe_mmio *mmio, const struct xe_mmio_range *range, struct xe_reg reg);

total: 0 errors, 3 warnings, 0 checks, 151 lines checked


