Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD6CD37B7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4C710E669;
	Wed,  4 Sep 2024 00:28:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6E210E669;
 Wed,  4 Sep 2024 00:28:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Stop_using_xe=5Fgt_as_a_r?=
 =?utf-8?q?egister_MMIO_target?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 00:28:11 -0000
Message-ID: <172540969129.931529.8652668018524643813@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Series: Stop using xe_gt as a register MMIO target
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
commit 492c5f13284f9fcdc36c9c4e159073361acbcded
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Sep 3 17:21:44 2024 -0700

    drm/xe/mmio: Drop compatibility macros
    
    Now that all parts of the driver have switched over to using xe_mmio for
    direct register access, we can drop the compatibility macros that allow
    continued xe_gt usage.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e159ed9ab3ec08042286fb8af2560dbc540beccb drm-intel
8627e92d2c1c drm/xe: Move forcewake to 'gt.pm' substructure
442d147e844c drm/xe: Create dedicated xe_mmio structure
e64813ee31a6 drm/xe: Clarify size of MMIO region
0f942bbdb24d drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
419f0c3ddc23 drm/xe: Populate GT's mmio iomap from tile during init
859285ca5d2f drm/xe: Switch mmio_ext to use 'struct xe_mmio'
c0ffdc89c0b8 drm/xe: Add xe_device backpointer to xe_mmio
bf86bb4847eb drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
c33e5bbaf3ac drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
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

total: 4 errors, 1 warnings, 7 checks, 373 lines checked
a21345676f58 drm/xe/irq: Convert register access to use xe_mmio
33b49f8f7757 drm/xe/pcode: Convert register access to use xe_mmio
5775934bc55b drm/xe/hwmon: Convert register access to use xe_mmio
562e6ff791e7 drm/xe/vram: Convert register access to use xe_mmio
82f8cfe26925 drm/xe/compat-i915: Convert register access to use xe_mmio
b8779748c540 drm/xe/lmtt: Convert register access to use xe_mmio
65eb2b9a60b4 drm/xe/stolen: Convert register access to use xe_mmio
94db26427be0 drm/xe/device: Convert register access to use xe_mmio
1e0f34a70595 drm/xe/pci: Convert register access to use xe_mmio
2d1303b193e5 drm/xe/wa: Convert register access to use xe_mmio
1b5d856d9a21 drm/xe/uc: Convert register access to use xe_mmio
4cd9695dcd18 drm/xe/guc: Convert register access to use xe_mmio
c7590b637cc6 drm/xe/huc: Convert register access to use xe_mmio
82ac4c570bc3 drm/xe/gsc: Convert register access to use xe_mmio
d2c00b675e28 drm/xe/query: Convert register access to use xe_mmio
77c8accd33c0 drm/xe/mcr: Convert register access to use xe_mmio
2c14112427b4 drm/xe/mocs: Convert register access to use xe_mmio
c4e631b13627 drm/xe/hw_engine: Convert register access to use xe_mmio
8a93334e5920 drm/xe/gt_throttle: Convert register access to use xe_mmio
608442937445 drm/xe/pat: Convert register access to use xe_mmio
220163e5436d drm/xe/wopcm: Convert register access to use xe_mmio
5be933f9bbdc drm/xe/oa: Convert register access to use xe_mmio
07ecae9238ef drm/xe/topology: Convert register access to use xe_mmio
d90c45b66b8d drm/xe/execlist: Convert register access to use xe_mmio
31d2aeee2d1e drm/xe/gt_clock: Convert register access to use xe_mmio
f2960578d876 drm/xe/reg_sr: Convert register access to use xe_mmio
e9a4882e2cf5 drm/xe/gt: Convert register access to use xe_mmio
2f02929baa0d drm/xe/sriov: Convert register access to use xe_mmio
f7a90baf85eb drm/xe/tlb: Convert register access to use xe_mmio
215082be65eb drm/xe/gt_idle: Convert register access to use xe_mmio
2cface6d615a drm/xe/forcewake: Convert register access to use xe_mmio
66f74c6bdde5 drm/xe/ggtt: Convert register access to use xe_mmio
2a7014723ac6 drm/xe/ccs_mode: Convert register access to use xe_mmio
492c5f13284f drm/xe/mmio: Drop compatibility macros
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


