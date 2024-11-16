Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D7BD68BD0
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AA410E056;
	Sat, 16 Nov 2024 02:17:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05710E056;
 Sat, 16 Nov 2024 02:17:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_GGTT_nodes_and_CTB_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 Nov 2024 02:17:43 -0000
Message-ID: <173172346372.380828.7668666725973676468@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
In-Reply-To: <20241116021238.2486287-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev2)
URL   : https://patchwork.freedesktop.org/series/141439/
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
commit 92e00ec09ea2e7026264fbd635da4c9bde405270
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Sat Nov 16 03:12:38 2024 +0100

    drm/xe/vf: Fixup CTB send buffer messages after migration
    
    During post-migration recovery of a VF, it in necessary to update
    GGTT references included in messages which are going to be sent
    to GuC. GuC will start consuming messages after VF KMD will inform
    it about fixups being done; before that, the VF KMD is expected
    to update any H2G messages which are already in send buffer but
    were not consumed by GuC.
    
    Only a small subset of messages allowed for VFs have GGTT references
    in them. This patch adds the functionality to parse the CTB send
    ring buffer and shift addresses contained within.
    
    While fixing the CTB content, ct->lock is not taken. This means
    the only barier taken remains GGTT address lock - which is ok,
    because only requests with GGTT addresses matter, but it also means
    tail changes can happen during the CTB fixups execution (which may
    be ignored as any new messages will not have anything to fix).
    
    The GGTT address locking will be introduced in a future series.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 9a7388467f79fb74c67a2444c5b1add91652f89e drm-intel
4d2ba25c1794 drm/drm_mm: Safe macro for iterating through nodes in range
-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'node__' - possible side-effects?
#32: FILE: include/drm/drm_mm.h:520:
+#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
+		next__ = list_next_entry(node__, node_list); \
+	     node__->start < (end__);					\
+	     node__ = next__, next__ = list_next_entry(next__, node_list))

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#32: FILE: include/drm/drm_mm.h:520:
+#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
+		next__ = list_next_entry(node__, node_list); \
+	     node__->start < (end__);					\
+	     node__ = next__, next__ = list_next_entry(next__, node_list))

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#32: FILE: include/drm/drm_mm.h:520:
+#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
+		next__ = list_next_entry(node__, node_list); \
+	     node__->start < (end__);					\
+	     node__ = next__, next__ = list_next_entry(next__, node_list))

-:33: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#33: FILE: include/drm/drm_mm.h:521:
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
 	                                                                ^

total: 0 errors, 0 warnings, 4 checks, 25 lines checked
7ad5c07295cc drm/xe/sriov: Shifting GGTT area post migration
-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:931:
+	xe_gt_sriov_info(gt, "GGTT base shifted from %#llx to %#llx\n",
+		  old_base, old_base + ggtt_shift);

-:51: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#51: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:937:
+static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
+				struct drm_mm_node *balloon_fin, s64 shift)

-:151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1037:
+static void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
+				struct xe_ggtt_node *balloon_fin, s64 shift)

-:156: CHECK:BRACES: braces {} should be used on all arms of this statement
#156: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1042:
+	if (balloon_beg && balloon_beg->ggtt)
[...]
+	else {
[...]

-:158: CHECK:BRACES: Unbalanced braces around else statement
#158: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1044:
+	else {

-:166: CHECK:BRACES: braces {} should be used on all arms of this statement
#166: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1052:
+	if (balloon_fin && balloon_fin->ggtt)
[...]
+	else {
[...]

-:168: CHECK:BRACES: Unbalanced braces around else statement
#168: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1054:
+	else {

total: 0 errors, 0 warnings, 7 checks, 221 lines checked
92e00ec09ea2 drm/xe/vf: Fixup CTB send buffer messages after migration
-:87: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#87: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1636:
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+					    struct iosys_map *cmds, u32 head,

-:95: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'p' may be better as '(p)' to avoid precedence issues
#95: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1644:
+#define read32(o, p)							\
+do {									\
+	xe_map_memcpy_from(xe, msg, cmds, (head + p) * sizeof(u32),	\
+			   1 * sizeof(u32));				\
+	o = msg[0];							\
+} while (0)

-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#101: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1650:
+#define fixup64(p)							\
+do {									\
+	xe_map_memcpy_from(xe, msg, cmds, (head + p) * sizeof(u32),	\
+			   2 * sizeof(u32));				\
+	offset = make_u64(msg[1], msg[0]);				\
+	offset += shift;						\
+	msg[0] = lower_32_bits(offset);					\
+	msg[1] = upper_32_bits(offset);					\
+	xe_map_memcpy_to(xe, cmds, (head + p) * sizeof(u32), msg, 2 * sizeof(u32)); \
+} while (0)

-:101: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'p' may be better as '(p)' to avoid precedence issues
#101: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1650:
+#define fixup64(p)							\
+do {									\
+	xe_map_memcpy_from(xe, msg, cmds, (head + p) * sizeof(u32),	\
+			   2 * sizeof(u32));				\
+	offset = make_u64(msg[1], msg[0]);				\
+	offset += shift;						\
+	msg[0] = lower_32_bits(offset);					\
+	msg[1] = upper_32_bits(offset);					\
+	xe_map_memcpy_to(xe, cmds, (head + p) * sizeof(u32), msg, 2 * sizeof(u32)); \
+} while (0)

-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1743:
+		xe_gt_err(gt, "H2G channel has Invalid tail offset (%u >= %u)\n",
+			 tail, size);

-:215: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#215: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1764:
+	xe_gt_err(gt, "Corrupted descriptor head=%u tail=%u\n",
+		 head, tail);

total: 0 errors, 0 warnings, 6 checks, 218 lines checked


