Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B899C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF87F10E558;
	Wed, 10 Jan 2024 01:49:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D3710E558;
 Wed, 10 Jan 2024 01:49:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_CLOS_Based_Cach?=
 =?utf-8?q?e_Reservation_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Date: Wed, 10 Jan 2024 01:49:32 -0000
Message-ID: <170485137240.216241.16546026857379321607@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
In-Reply-To: <20240109235758.1432987-1-pallavi.mishra@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: CLOS Based Cache Reservation support
URL   : https://patchwork.freedesktop.org/series/128399/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4274cb913bcf69ed4543cfd6af2a6e5673fccde8
Author: Pallavi Mishra <pallavi.mishra@intel.com>
Date:   Wed Jan 10 05:27:58 2024 +0530

    drm/xe: Add CLOS specific initializations
    
    Handle CLOS specific initializations and PAT
    CLOS compatibility check.
    
    Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
2688e2293 drm/xe/uapi: CLOS uapi support
-:31: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#31: FILE: include/uapi/drm/xe_drm.h:120:
+#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)

-:32: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#32: FILE: include/uapi/drm/xe_drm.h:121:
+#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)

-:33: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#33: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_CLOS_SET_WAYS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_SET_WAYS, struct drm_xe_clos_set_ways)

-:104: CHECK:LINE_SPACING: Please don't use multiple blank lines
#104: FILE: include/uapi/drm/xe_drm.h:1412:
+
+

total: 0 errors, 3 warnings, 1 checks, 89 lines checked
45776cbfe drm/xe: Introduce xe_clos.c
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

-:44: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#44: FILE: drivers/gpu/drm/xe/xe_clos.c:17:
+{
+

-:62: WARNING:LINE_SPACING: Missing a blank line after declarations
#62: FILE: drivers/gpu/drm/xe/xe_clos.c:35:
+			u8 ways = xe->cache_resv.ways[i];
+			mask = GENMASK(start_bits + ways - 1, start_bits);

-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/xe/xe_clos.c:38:
+			drm_dbg(&xe->drm, "start_bits = %d ways = %d mask= 0x%x\n",
+				  start_bits, ways, mask);

-:113: ERROR:CODE_INDENT: code indent should use tabs where possible
#113: FILE: drivers/gpu/drm/xe/xe_clos.c:86:
+        return file->clos_resv.clos_mask & (1 << clos_index);$

-:113: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#113: FILE: drivers/gpu/drm/xe/xe_clos.c:86:
+        return file->clos_resv.clos_mask & (1 << clos_index);$

-:119: ERROR:CODE_INDENT: code indent should use tabs where possible
#119: FILE: drivers/gpu/drm/xe/xe_clos.c:92:
+        struct xe_device *xe = file->xe;$

-:119: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#119: FILE: drivers/gpu/drm/xe/xe_clos.c:92:
+        struct xe_device *xe = file->xe;$

-:121: ERROR:CODE_INDENT: code indent should use tabs where possible
#121: FILE: drivers/gpu/drm/xe/xe_clos.c:94:
+        if (xe->cache_resv.ways[clos_index]) {$

-:121: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#121: FILE: drivers/gpu/drm/xe/xe_clos.c:94:
+        if (xe->cache_resv.ways[clos_index]) {$

-:122: ERROR:CODE_INDENT: code indent should use tabs where possible
#122: FILE: drivers/gpu/drm/xe/xe_clos.c:95:
+                u8 num_ways = xe->cache_resv.ways[clos_index];$

-:122: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#122: FILE: drivers/gpu/drm/xe/xe_clos.c:95:
+                u8 num_ways = xe->cache_resv.ways[clos_index];$

-:124: ERROR:CODE_INDENT: code indent should use tabs where possible
#124: FILE: drivers/gpu/drm/xe/xe_clos.c:97:
+                file->clos_resv.l3_rsvd_ways -= num_ways;$

-:124: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#124: FILE: drivers/gpu/drm/xe/xe_clos.c:97:
+                file->clos_resv.l3_rsvd_ways -= num_ways;$

-:126: ERROR:CODE_INDENT: code indent should use tabs where possible
#126: FILE: drivers/gpu/drm/xe/xe_clos.c:99:
+                xe->cache_resv.ways[0] += num_ways;$

-:126: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#126: FILE: drivers/gpu/drm/xe/xe_clos.c:99:
+                xe->cache_resv.ways[0] += num_ways;$

-:127: ERROR:CODE_INDENT: code indent should use tabs where possible
#127: FILE: drivers/gpu/drm/xe/xe_clos.c:100:
+                xe->cache_resv.ways[clos_index] -= num_ways;$

-:127: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#127: FILE: drivers/gpu/drm/xe/xe_clos.c:100:
+                xe->cache_resv.ways[clos_index] -= num_ways;$

-:129: ERROR:CODE_INDENT: code indent should use tabs where possible
#129: FILE: drivers/gpu/drm/xe/xe_clos.c:102:
+                update_l3cache_masks(xe);$

-:129: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#129: FILE: drivers/gpu/drm/xe/xe_clos.c:102:
+                update_l3cache_masks(xe);$

-:130: ERROR:CODE_INDENT: code indent should use tabs where possible
#130: FILE: drivers/gpu/drm/xe/xe_clos.c:103:
+        }$

-:130: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#130: FILE: drivers/gpu/drm/xe/xe_clos.c:103:
+        }$

-:132: ERROR:CODE_INDENT: code indent should use tabs where possible
#132: FILE: drivers/gpu/drm/xe/xe_clos.c:105:
+        return 0;$

-:132: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#132: FILE: drivers/gpu/drm/xe/xe_clos.c:105:
+        return 0;$

-:137: ERROR:CODE_INDENT: code indent should use tabs where possible
#137: FILE: drivers/gpu/drm/xe/xe_clos.c:110:
+        struct xe_device *xe = file->xe;$

-:137: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#137: FILE: drivers/gpu/drm/xe/xe_clos.c:110:
+        struct xe_device *xe = file->xe;$

-:139: ERROR:CODE_INDENT: code indent should use tabs where possible
#139: FILE: drivers/gpu/drm/xe/xe_clos.c:112:
+        mutex_lock(&xe->cache_resv.clos_mutex);$

-:139: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#139: FILE: drivers/gpu/drm/xe/xe_clos.c:112:
+        mutex_lock(&xe->cache_resv.clos_mutex);$

-:141: ERROR:CODE_INDENT: code indent should use tabs where possible
#141: FILE: drivers/gpu/drm/xe/xe_clos.c:114:
+        if (clos_is_reserved(file, clos_index)) {$

-:141: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#141: FILE: drivers/gpu/drm/xe/xe_clos.c:114:
+        if (clos_is_reserved(file, clos_index)) {$

-:142: ERROR:CODE_INDENT: code indent should use tabs where possible
#142: FILE: drivers/gpu/drm/xe/xe_clos.c:115:
+                struct xe_device *xe = file->xe;$

-:142: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#142: FILE: drivers/gpu/drm/xe/xe_clos.c:115:
+                struct xe_device *xe = file->xe;$

-:144: ERROR:CODE_INDENT: code indent should use tabs where possible
#144: FILE: drivers/gpu/drm/xe/xe_clos.c:117:
+                free_l3cache_ways(file, clos_index);$

-:144: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#144: FILE: drivers/gpu/drm/xe/xe_clos.c:117:
+                free_l3cache_ways(file, clos_index);$

-:146: ERROR:CODE_INDENT: code indent should use tabs where possible
#146: FILE: drivers/gpu/drm/xe/xe_clos.c:119:
+                file->clos_resv.clos_mask &= ~(1 << clos_index);$

-:146: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#146: FILE: drivers/gpu/drm/xe/xe_clos.c:119:
+                file->clos_resv.clos_mask &= ~(1 << clos_index);$

-:147: ERROR:CODE_INDENT: code indent should use tabs where possible
#147: FILE: drivers/gpu/drm/xe/xe_clos.c:120:
+                xe->cache_resv.free_clos_mask |= (1 << clos_index);$

-:147: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#147: FILE: drivers/gpu/drm/xe/xe_clos.c:120:
+                xe->cache_resv.free_clos_mask |= (1 << clos_index);$

-:149: ERROR:CODE_INDENT: code indent should use tabs where possible
#149: FILE: drivers/gpu/drm/xe/xe_clos.c:122:
+                mutex_unlock(&xe->cache_resv.clos_mutex);$

-:149: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#149: FILE: drivers/gpu/drm/xe/xe_clos.c:122:
+                mutex_unlock(&xe->cache_resv.clos_mutex);$

-:151: ERROR:CODE_INDENT: code indent should use tabs where possible
#151: FILE: drivers/gpu/drm/xe/xe_clos.c:124:
+                return 0;$

-:151: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#151: FILE: drivers/gpu/drm/xe/xe_clos.c:124:
+                return 0;$

-:152: ERROR:CODE_INDENT: code indent should use tabs where possible
#152: FILE: drivers/gpu/drm/xe/xe_clos.c:125:
+        }$

-:152: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#152: FILE: drivers/gpu/drm/xe/xe_clos.c:125:
+        }$

-:154: ERROR:CODE_INDENT: code indent should use tabs where possible
#154: FILE: drivers/gpu/drm/xe/xe_clos.c:127:
+        mutex_unlock(&xe->cache_resv.clos_mutex);$

-:154: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#154: FILE: drivers/gpu/drm/xe/xe_clos.c:127:
+        mutex_unlock(&xe->cache_resv.clos_mutex);$

-:155: ERROR:CODE_INDENT: code indent should use tabs where possible
#155: FILE: drivers/gpu/drm/xe/xe_clos.c:128:
+        return -EPERM;$

-:155: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#155: FILE: drivers/gpu/drm/xe/xe_clos.c:128:
+        return -EPERM;$

-:162: WARNING:LINE_SPACING: Missing a blank line after declarations
#162: FILE: drivers/gpu/drm/xe/xe_clos.c:135:
+	struct xe_device *xe = file->xe;
+	if (!(file->xe->info.has_clos))

-:166: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#166: FILE: drivers/gpu/drm/xe/xe_clos.c:139:
+	for_each_set_bit(clos_index, &file->clos_resv.clos_mask, NUM_CLOS) {
+

-:167: ERROR:PRINTF_0XDECIMAL: Prefixing 0x with decimal output is defective
#167: FILE: drivers/gpu/drm/xe/xe_clos.c:140:
+		drm_dbg(&xe->drm, "uninit release mask = 0x%lu clos= %d\n",

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/xe/xe_clos.c:141:
+		drm_dbg(&xe->drm, "uninit release mask = 0x%lu clos= %d\n",
+			  file->clos_resv.clos_mask, clos_index);

-:204: ERROR:TRAILING_WHITESPACE: trailing whitespace
#204: FILE: drivers/gpu/drm/xe/xe_clos.c:177:
+static int $

-:206: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#206: FILE: drivers/gpu/drm/xe/xe_clos.c:179:
+reserve_cache_ways(struct xe_file *file, u16 cache_level,
+		       u16 clos_index, u16 *num_ways)

-:214: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'clos_index >= NUM_CLOS'
#214: FILE: drivers/gpu/drm/xe/xe_clos.c:187:
+	if ((clos_index >= NUM_CLOS) || !clos_is_reserved(file, clos_index))

-:258: ERROR:TRAILING_WHITESPACE: trailing whitespace
#258: FILE: drivers/gpu/drm/xe/xe_clos.c:231:
+^Iif (!(xe->info.has_clos))^I^I$

-:271: ERROR:TRAILING_WHITESPACE: trailing whitespace
#271: FILE: drivers/gpu/drm/xe/xe_clos.c:244:
+^Iif (!(xe->info.has_clos))^I$

-:284: ERROR:TRAILING_WHITESPACE: trailing whitespace
#284: FILE: drivers/gpu/drm/xe/xe_clos.c:257:
+^Iif (!(xe->info.has_clos))^I^I$

total: 27 errors, 25 warnings, 6 checks, 370 lines checked
4274cb913 drm/xe: Add CLOS specific initializations
-:80: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#80: FILE: drivers/gpu/drm/xe/xe_pat.c:48:
+#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
                                                          ^

-:80: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#80: FILE: drivers/gpu/drm/xe/xe_pat.c:48:
+#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
                                                                    ^

-:80: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#80: FILE: drivers/gpu/drm/xe/xe_pat.c:48:
+#define XE2_PAT_CLOS1                          ((1 << 20)|(1 << 21)|(1 << 22)|(1 << 23))
                                                                              ^

-:81: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#81: FILE: drivers/gpu/drm/xe/xe_pat.c:49:
+#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
                                                          ^

-:81: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#81: FILE: drivers/gpu/drm/xe/xe_pat.c:49:
+#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
                                                                    ^

-:81: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#81: FILE: drivers/gpu/drm/xe/xe_pat.c:49:
+#define XE2_PAT_CLOS2                          ((1 << 24)|(1 << 25)|(1 << 26)|(1 << 27))
                                                                              ^

-:82: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#82: FILE: drivers/gpu/drm/xe/xe_pat.c:50:
+#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
                                                          ^

-:82: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#82: FILE: drivers/gpu/drm/xe/xe_pat.c:50:
+#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
                                                                    ^

-:82: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#82: FILE: drivers/gpu/drm/xe/xe_pat.c:50:
+#define XE2_PAT_CLOS3                          ((1 << 28)|(1 << 29)|(1 << 30)|(1 << 31))
                                                                              ^

-:84: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#84: FILE: drivers/gpu/drm/xe/xe_pat.c:52:
+#define XEPVC_PAT_CLOS1                                ((1 << 4)|(1 << 5))
                                                                 ^

-:85: CHECK:SPACING: spaces preferred around that '|' (ctx:VxV)
#85: FILE: drivers/gpu/drm/xe/xe_pat.c:53:
+#define XEPVC_PAT_CLOS2                                ((1 << 6)|(1 << 7))
                                                                 ^

-:87: CHECK:LINE_SPACING: Please don't use multiple blank lines
#87: FILE: drivers/gpu/drm/xe/xe_pat.c:55:
+
+

-:104: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#104: FILE: drivers/gpu/drm/xe/xe_pat.c:168:
+		if (!(((1 << pat_index) & XE2_PAT_CLOS1)
+			|| (1 << pat_index & XEPVC_PAT_CLOS1)))

-:109: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#109: FILE: drivers/gpu/drm/xe/xe_pat.c:173:
+		if (!(((1 << pat_index) & XE2_PAT_CLOS2)
+			|| (1 << pat_index & XEPVC_PAT_CLOS2)))

-:154: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#154: FILE: drivers/gpu/drm/xe/xe_vm.c:2807:
+		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {

-:154: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'pat_index > 19'
#154: FILE: drivers/gpu/drm/xe/xe_vm.c:2807:
+		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {

-:154: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'pat_index > 3'
#154: FILE: drivers/gpu/drm/xe/xe_vm.c:2807:
+		if ((GRAPHICS_VER(xe) >= 20 && (pat_index > 19)) || (xe->info.platform == XE_PVC && (pat_index > 3))) {

total: 0 errors, 1 warnings, 16 checks, 130 lines checked


