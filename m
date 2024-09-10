Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A789EE01F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ECF10E0D2;
	Tue, 10 Sep 2024 23:56:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E910E0D2;
 Tue, 10 Sep 2024 23:56:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Stop_using_xe=5Fgt_as_a_r?=
 =?utf-8?q?egister_MMIO_target_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 23:56:20 -0000
Message-ID: <172601258045.982706.6867328831450032156@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Series: Stop using xe_gt as a register MMIO target (rev3)
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
commit 1cb298a8e892f0053a0081822e81a7e826d61a47
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Sep 10 16:48:03 2024 -0700

    drm/xe/mmio: Drop compatibility macros
    
    Now that all parts of the driver have switched over to using xe_mmio for
    direct register access, we can drop the compatibility macros that allow
    continued xe_gt usage.
    
    v2:
     - Move removal of 8/16-bit read and xe_mmio_wait32_not() wrappers to
       this patch rather than removing them in earlier patches when last
       caller was removed.  (Rodrigo)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch f3eded4f8a05d73a0b94f27e05737ea3427450b3 drm-intel
b1188510f617 drm/xe: Move forcewake to 'gt.pm' substructure
e65f73434806 drm/xe: Create dedicated xe_mmio structure
e816310369eb drm/xe: Clarify size of MMIO region
036693e1fb2a drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
df844bf78123 drm/xe: Populate GT's mmio iomap from tile during init
0142c25caebb drm/xe: Switch mmio_ext to use 'struct xe_mmio'
f431d8f070ce drm/xe: Add xe_tile backpointer to xe_mmio
d4afd81eb032 drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
0fb888b777a1 drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
-:242: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#242: FILE: drivers/gpu/drm/xe/xe_mmio.c:341:
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
6995be560771 drm/xe/irq: Convert register access to use xe_mmio
5d01ee6191ad drm/xe/pcode: Convert register access to use xe_mmio
1eb9e02b5116 drm/xe/hwmon: Convert register access to use xe_mmio
042dfbeffa75 drm/xe/vram: Convert register access to use xe_mmio
f5074d5f05fd drm/xe/compat-i915: Convert register access to use xe_mmio
4f3a93aa6185 drm/xe/lmtt: Convert register access to use xe_mmio
167c4d8e0145 drm/xe/stolen: Convert register access to use xe_mmio
f8f9ec395020 drm/xe/device: Convert register access to use xe_mmio
a00bd4ef7eaa drm/xe/pci: Convert register access to use xe_mmio
8e8d4baa1662 drm/xe/wa: Convert register access to use xe_mmio
ab09120a3389 drm/xe/uc: Convert register access to use xe_mmio
3fdbcd7364d0 drm/xe/guc: Convert register access to use xe_mmio
115d1bc9689a drm/xe/huc: Convert register access to use xe_mmio
69a0c6f84c6f drm/xe/gsc: Convert register access to use xe_mmio
f4763be8bc24 drm/xe/query: Convert register access to use xe_mmio
966bc3303d8d drm/xe/mcr: Convert register access to use xe_mmio
96e2b72378a6 drm/xe/mocs: Convert register access to use xe_mmio
420108d5956d drm/xe/hw_engine: Convert register access to use xe_mmio
404da05f2d4e drm/xe/gt_throttle: Convert register access to use xe_mmio
548a4f480997 drm/xe/pat: Convert register access to use xe_mmio
ebcd9660d4a6 drm/xe/wopcm: Convert register access to use xe_mmio
a611190fa1b6 drm/xe/oa: Convert register access to use xe_mmio
79c3d84939af drm/xe/topology: Convert register access to use xe_mmio
b71286a83d43 drm/xe/execlist: Convert register access to use xe_mmio
5ce36b236c4f drm/xe/gt_clock: Convert register access to use xe_mmio
b8dfcafa4903 drm/xe/reg_sr: Convert register access to use xe_mmio
a9811f71d4b0 drm/xe/gt: Convert register access to use xe_mmio
0a9263274917 drm/xe/sriov: Convert register access to use xe_mmio
f6b2eaf340d7 drm/xe/tlb: Convert register access to use xe_mmio
3c91bb49b9c3 drm/xe/gt_idle: Convert register access to use xe_mmio
f1c8a80a0811 drm/xe/forcewake: Convert register access to use xe_mmio
40243bdd80b0 drm/xe/ggtt: Convert register access to use xe_mmio
6c9e47b5ea98 drm/xe/ccs_mode: Convert register access to use xe_mmio
1cb298a8e892 drm/xe/mmio: Drop compatibility macros
-:106: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#106: FILE: drivers/gpu/drm/xe/xe_mmio.c:341:
+static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,

-:201: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#201: FILE: drivers/gpu/drm/xe/xe_mmio.h:22:
+int xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg, u32 val, u32 mask, u32 eval);

-:202: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#202: FILE: drivers/gpu/drm/xe/xe_mmio.h:23:
+bool xe_mmio_in_range(const struct xe_mmio *mmio, const struct xe_mmio_range *range, struct xe_reg reg);

total: 0 errors, 3 warnings, 0 checks, 182 lines checked


