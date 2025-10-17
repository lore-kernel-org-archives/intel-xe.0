Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07421CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A78C10EAE3;
	Fri, 17 Oct 2025 02:35:40 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1E10E2FB;
 Fri, 17 Oct 2025 02:35:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_Xe3p_suppor?=
 =?utf-8?q?t_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 02:35:40 -0000
Message-ID: <176066854015.24656.15286829009770669704@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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

Series: drm/xe: Add Xe3p support (rev3)
URL   : https://patchwork.freedesktop.org/series/155866/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1a80fa10ae2bf2125632f4336b8fb939b51fb07
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Thu Oct 16 19:26:43 2025 -0700

    drm/xe/xe3p: Add xe3p EU stall data format
    
    Starting with Xe3p, IP address in EU stall data increases to 61 bits.
    While at it, re-order the if-else ladder so the officially supported
    platforms come before PVC.
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b4f191dddaee9ae1871344e3dabcc40f2f14d2cb drm-intel
736395592c93 drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05
-:46: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#46: FILE: drivers/gpu/drm/xe/xe_wa.c:698:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_first_render_or_compute)),

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
07053f5d333d drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Xe3p_LPM/Xe3p_HPM are very similar to Xe3_LPM on the kmd interface, so it can use

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
b21feb2bdfcb drm/xe: Drop CTC_MODE register read
58549871124d drm/xe: Add GT_VER() to check version specific to gt type
be927915701b drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
2e528beab1b7 drm/xe/xe3p_lpm: Handle MCR steering
c03378c50cf3 drm/xe/xe3p: Stop programming RCU_MODE's fixed slice mode setting
e16717c916f2 drm/xe/xe3p: Determine service copy availability from fuse
0c6c87e70b45 drm/xe: Dump CURRENT_LRCA register
2f087f3536f8 drm/xe/xe3p: Dump CSMQDEBUG register
9d2d4262261d drm/xe/nvl: Define NVL-S platform
-:63: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#63: FILE: include/drm/intel/pciids.h:891:
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#63: FILE: include/drm/intel/pciids.h:891:
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 44 lines checked
7dc3e9ccff16 drm/xe/nvls: Define GuC firmware for NVL-S
9d3ec48a50ff drm/xe/nvls: Attach MOCS table for NVL-S
7d25e77357b9 drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
2887a725ff61 drm/xe/xe3p_xpc: Add L3 bank mask
003f6cafac76 drm/xe/xe3p_xpc: Add MCR steering
2514dfb8c450 drm/xe/irq: Rename fuse mask variables
-:59: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#59: FILE: drivers/gpu/drm/xe/xe_irq.c:179:
+		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
 		                           ^

-:62: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#62: FILE: drivers/gpu/drm/xe/xe_irq.c:181:
+		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
 		                           ^

-:65: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#65: FILE: drivers/gpu/drm/xe/xe_irq.c:183:
+		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
 		                           ^

-:68: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#68: FILE: drivers/gpu/drm/xe/xe_irq.c:185:
+		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
 		                           ^

-:71: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#71: FILE: drivers/gpu/drm/xe/xe_irq.c:187:
+		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
 		                           ^

-:74: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#74: FILE: drivers/gpu/drm/xe/xe_irq.c:189:
+		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
 		                           ^

total: 0 errors, 0 warnings, 6 checks, 68 lines checked
25ab6c9292c8 drm/xe/irq: Split irq mask per engine class
5d4ce85c32c7 drm/xe/irq: Rename bits used with all engines
36d49abe0386 drm/xe/irq: Check fuse mask for media engines
bc0099ddda99 drm/xe/xe3p_xpc: Add support for compute walker for non-MSIx
91e540f76b8a drm/xe/xe3p_xpc: Skip compression tuning on platforms without flatccs
00a3dcec2d2d drm/xe/xe3p_xpc: Setup PAT table
-:31: ERROR:SPACING: space prohibited after that open parenthesis '('
#31: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );

-:31: ERROR:SPACING: space prohibited before that close parenthesis ')'
#31: FILE: drivers/gpu/drm/xe/xe_pat.c:165:
+static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );

-:32: ERROR:SPACING: space prohibited after that open parenthesis '('
#32: FILE: drivers/gpu/drm/xe/xe_pat.c:166:
+static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );

-:32: ERROR:SPACING: space prohibited before that close parenthesis ')'
#32: FILE: drivers/gpu/drm/xe/xe_pat.c:166:
+static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );

-:35: ERROR:SPACING: space prohibited after that open square bracket '['
#35: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),

-:35: ERROR:SPACING: space prohibited after that open parenthesis '('
#35: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),

-:35: ERROR:SPACING: space prohibited before that close parenthesis ')'
#35: FILE: drivers/gpu/drm/xe/xe_pat.c:169:
+	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),

-:36: ERROR:SPACING: space prohibited after that open square bracket '['
#36: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),

-:36: ERROR:SPACING: space prohibited after that open parenthesis '('
#36: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),

-:36: ERROR:SPACING: space prohibited before that close parenthesis ')'
#36: FILE: drivers/gpu/drm/xe/xe_pat.c:170:
+	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),

-:37: ERROR:SPACING: space prohibited after that open square bracket '['
#37: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),

-:37: ERROR:SPACING: space prohibited after that open parenthesis '('
#37: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),

-:37: ERROR:SPACING: space prohibited before that close parenthesis ')'
#37: FILE: drivers/gpu/drm/xe/xe_pat.c:171:
+	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),

-:38: ERROR:SPACING: space prohibited after that open square bracket '['
#38: FILE: drivers/gpu/drm/xe/xe_pat.c:172:
+	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),

-:38: ERROR:SPACING: space prohibited after that open parenthesis '('
#38: FILE: drivers/gpu/drm/xe/xe_pat.c:172:
+	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),

-:38: ERROR:SPACING: space prohibited before that close parenthesis ')'
#38: FILE: drivers/gpu/drm/xe/xe_pat.c:172:
+	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),

-:39: ERROR:SPACING: space prohibited after that open square bracket '['
#39: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),

-:39: ERROR:SPACING: space prohibited after that open parenthesis '('
#39: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),

-:39: ERROR:SPACING: space prohibited before that close parenthesis ')'
#39: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),

-:40: ERROR:SPACING: space prohibited after that open square bracket '['
#40: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),

-:40: ERROR:SPACING: space prohibited after that open parenthesis '('
#40: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),

-:40: ERROR:SPACING: space prohibited before that close parenthesis ')'
#40: FILE: drivers/gpu/drm/xe/xe_pat.c:174:
+	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),

-:41: ERROR:SPACING: space prohibited after that open square bracket '['
#41: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),

-:41: ERROR:SPACING: space prohibited after that open parenthesis '('
#41: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),

-:41: ERROR:SPACING: space prohibited before that close parenthesis ')'
#41: FILE: drivers/gpu/drm/xe/xe_pat.c:175:
+	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),

-:42: ERROR:SPACING: space prohibited after that open square bracket '['
#42: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),

-:42: ERROR:SPACING: space prohibited after that open parenthesis '('
#42: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),

-:42: ERROR:SPACING: space prohibited before that close parenthesis ')'
#42: FILE: drivers/gpu/drm/xe/xe_pat.c:176:
+	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),

-:43: ERROR:SPACING: space prohibited after that open square bracket '['
#43: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),

-:43: ERROR:SPACING: space prohibited after that open parenthesis '('
#43: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),

-:43: ERROR:SPACING: space prohibited before that close parenthesis ')'
#43: FILE: drivers/gpu/drm/xe/xe_pat.c:177:
+	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),

-:44: ERROR:SPACING: space prohibited after that open square bracket '['
#44: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),

-:44: ERROR:SPACING: space prohibited after that open parenthesis '('
#44: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),

-:44: ERROR:SPACING: space prohibited before that close parenthesis ')'
#44: FILE: drivers/gpu/drm/xe/xe_pat.c:178:
+	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),

-:45: ERROR:SPACING: space prohibited after that open parenthesis '('
#45: FILE: drivers/gpu/drm/xe/xe_pat.c:179:
+	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),

-:45: ERROR:SPACING: space prohibited before that close parenthesis ')'
#45: FILE: drivers/gpu/drm/xe/xe_pat.c:179:
+	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),

-:47: ERROR:SPACING: space prohibited after that open parenthesis '('
#47: FILE: drivers/gpu/drm/xe/xe_pat.c:181:
+	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),

-:47: ERROR:SPACING: space prohibited before that close parenthesis ')'
#47: FILE: drivers/gpu/drm/xe/xe_pat.c:181:
+	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),

-:48: ERROR:SPACING: space prohibited after that open parenthesis '('
#48: FILE: drivers/gpu/drm/xe/xe_pat.c:182:
+	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),

-:48: ERROR:SPACING: space prohibited before that close parenthesis ')'
#48: FILE: drivers/gpu/drm/xe/xe_pat.c:182:
+	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),

-:49: ERROR:SPACING: space prohibited after that open parenthesis '('
#49: FILE: drivers/gpu/drm/xe/xe_pat.c:183:
+	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),

-:49: ERROR:SPACING: space prohibited before that close parenthesis ')'
#49: FILE: drivers/gpu/drm/xe/xe_pat.c:183:
+	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),

-:50: ERROR:SPACING: space prohibited after that open parenthesis '('
#50: FILE: drivers/gpu/drm/xe/xe_pat.c:184:
+	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),

-:50: ERROR:SPACING: space prohibited before that close parenthesis ')'
#50: FILE: drivers/gpu/drm/xe/xe_pat.c:184:
+	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),

-:51: ERROR:SPACING: space prohibited after that open parenthesis '('
#51: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),

-:51: ERROR:SPACING: space prohibited before that close parenthesis ')'
#51: FILE: drivers/gpu/drm/xe/xe_pat.c:185:
+	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),

-:52: ERROR:SPACING: space prohibited after that open parenthesis '('
#52: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),

-:52: ERROR:SPACING: space prohibited before that close parenthesis ')'
#52: FILE: drivers/gpu/drm/xe/xe_pat.c:186:
+	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),

-:53: ERROR:SPACING: space prohibited after that open parenthesis '('
#53: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),

-:53: ERROR:SPACING: space prohibited before that close parenthesis ')'
#53: FILE: drivers/gpu/drm/xe/xe_pat.c:187:
+	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),

-:54: ERROR:SPACING: space prohibited after that open parenthesis '('
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),

-:54: ERROR:SPACING: space prohibited before that close parenthesis ')'
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:188:
+	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),

-:55: ERROR:SPACING: space prohibited after that open parenthesis '('
#55: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),

-:55: ERROR:SPACING: space prohibited before that close parenthesis ')'
#55: FILE: drivers/gpu/drm/xe/xe_pat.c:189:
+	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),

total: 54 errors, 0 warnings, 0 checks, 110 lines checked
e1a80fa10ae2 drm/xe/xe3p: Add xe3p EU stall data format


