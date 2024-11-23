Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17339E6ADC9
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 04:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5210E08E;
	Sat, 23 Nov 2024 04:00:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFB610E08E;
 Sat, 23 Nov 2024 04:00:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_GGTT_nodes_and_CTB_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 Nov 2024 04:00:53 -0000
Message-ID: <173233445392.1952690.8295566776201757095@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
In-Reply-To: <20241123031333.3435414-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev3)
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
commit d01022b0d45c17ddc4468b221333d6816609b79a
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Sat Nov 23 04:13:32 2024 +0100

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
    the only barrier taken remains GGTT address lock - which is ok,
    because only requests with GGTT addresses matter, but it also means
    tail changes can happen during the CTB fixups execution (which may
    be ignored as any new messages will not have anything to fix).
    
    The GGTT address locking will be introduced in a future series.
    
    v2: removed storing shif as that's now done in VMA nodes patch;
      macros to inlines; warns to asserts; log messages fixes (Michal)
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch 5b1cbd59111b62a5e6cda4e2cc0ec835b9418cb1 drm-intel
2cd0987d2422 drm/drm_mm: Safe macro for iterating through nodes in range
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
79d0146d8012 drm/xe/sriov: Shifting GGTT area post migration
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/xe_ggtt.c:503:
+static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
+				struct drm_mm_node *balloon_fin, s64 shift)

-:149: CHECK:BRACES: braces {} should be used on all arms of this statement
#149: FILE: drivers/gpu/drm/xe/xe_ggtt.c:608:
+	if (balloon_beg && balloon_beg->ggtt)
[...]
+	else {
[...]

-:151: CHECK:BRACES: Unbalanced braces around else statement
#151: FILE: drivers/gpu/drm/xe/xe_ggtt.c:610:
+	else {

-:159: CHECK:BRACES: braces {} should be used on all arms of this statement
#159: FILE: drivers/gpu/drm/xe/xe_ggtt.c:618:
+	if (balloon_fin && balloon_fin->ggtt)
[...]
+	else {
[...]

-:161: CHECK:BRACES: Unbalanced braces around else statement
#161: FILE: drivers/gpu/drm/xe/xe_ggtt.c:620:
+	else {

total: 0 errors, 0 warnings, 5 checks, 252 lines checked
d01022b0d45c drm/xe/vf: Fixup CTB send buffer messages after migration
-:150: WARNING:TYPO_SPELLING: 'adresses' may be misspelled - perhaps 'addresses'?
#150: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1728:
+ * @ggtt_shift: shift to be added to all GGTT adresses within the CTB
                                               ^^^^^^^^

-:169: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#169: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1747:
+		xe_gt_err(gt, "H2G channel has invalid tail offset (%u >= %u)\n",
+			 tail, size);

-:188: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#188: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1766:
+	xe_gt_err(gt, "Corrupted descriptor head=%u tail=%u\n",
+		 head, tail);

total: 0 errors, 1 warnings, 2 checks, 202 lines checked


