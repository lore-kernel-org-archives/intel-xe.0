Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC763E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 23:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C4C10E00C;
	Fri, 20 Dec 2024 23:41:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BCE10E00C;
 Fri, 20 Dec 2024 23:41:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_GGTT_nodes_and_CTB_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 23:41:38 -0000
Message-ID: <173473809834.953311.16452701646382771347@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220233409.2956004-1-tomasz.lis@intel.com>
In-Reply-To: <20241220233409.2956004-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev4)
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
commit 9e8348b39ea9a079e34d44d175d38f03e4c4bc4a
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Sat Dec 21 00:34:09 2024 +0100

    drm/xe/vf: Fixup CTB send buffer messages after migration
    
    During post-migration recovery of a VF, it is necessary to update
    GGTT references included in messages which are going to be sent
    to GuC. GuC will start consuming messages after VF KMD will inform
    it about fixups being done; before that, the VF KMD is expected
    to update any H2G messages which are already in send buffer but
    were not consumed by GuC.
    
    Only a small subset of messages allowed for VFs have GGTT references
    in them. This patch adds the functionality to parse the CTB send
    ring buffer and shift addresses contained within.
    
    While fixing the CTB content, ct->lock is not taken. This means
    the only barrier taken remains GGTT address lock - which is ok,
    because only requests with GGTT addresses matter, but it also means
    tail changes can happen during the CTB fixups execution (which may
    be ignored as any new messages will not have anything to fix).
    
    The GGTT address locking will be introduced in a future series.
    
    v2: removed storing shift as that's now done in VMA nodes patch;
      macros to inlines; warns to asserts; log messages fixes (Michal)
    v3: Removed inline keywords, enums for offsets in CTB messages,
     less error messages, if return unused then made functs void (Michal)
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 0eede13975362b755a208b2e2ba322940013f183 drm-intel
ea017f1605d3 drm/drm_mm: Safe macro for iterating through nodes in range
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
c2d5a31ffa03 drm/xe/sriov: Shifting GGTT area post migration
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/xe/xe_ggtt.c:498:
+static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
+				struct drm_mm_node *balloon_fin, s64 shift)

-:153: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#153: FILE: drivers/gpu/drm/xe/xe_ggtt.c:610:
+	if (!*balloon_beg)
+	{

-:166: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#166: FILE: drivers/gpu/drm/xe/xe_ggtt.c:623:
+	if (!*balloon_fin)
+	{

-:184: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#184: FILE: drivers/gpu/drm/xe/xe_ggtt.c:641:
+	if (*balloon_beg && !xe_ggtt_node_allocated(*balloon_beg))
+	{

-:190: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#190: FILE: drivers/gpu/drm/xe/xe_ggtt.c:647:
+	if (*balloon_fin && !xe_ggtt_node_allocated(*balloon_fin))
+	{

total: 4 errors, 0 warnings, 1 checks, 270 lines checked
9e8348b39ea9 drm/xe/vf: Fixup CTB send buffer messages after migration
-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1628:
+static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
+			     u32 head, u32 pos)

-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1638:
+static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
+			       u32 head, u32 pos, s64 shift)

-:122: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#122: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1682:
+			n = ctb_read32(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);

-:125: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#125: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1685:
+				ctb_fixup64(xe, cmds, head, XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);

-:205: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#205: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1765:
+	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u\n",
+		 head, tail, size);

total: 0 errors, 2 warnings, 3 checks, 229 lines checked


