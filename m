Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF4CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2B10E779;
	Wed, 15 Oct 2025 09:47:50 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1130910E76E;
 Wed, 15 Oct 2025 09:47:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Make_all_xe=5Fg?=
 =?utf-8?q?gtt_structs_private=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 09:47:49 -0000
Message-ID: <176052166906.15142.6744351609124070686@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015074708.1654014-14-dev@lankhorst.se>
In-Reply-To: <20251015074708.1654014-14-dev@lankhorst.se>
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

Series: drm/xe: Make all xe_ggtt structs private. (rev2)
URL   : https://patchwork.freedesktop.org/series/155941/
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
commit bf945dfb55549bc0586aa960fe978a4744284ec6
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Oct 15 09:47:21 2025 +0200

    drm/xe: Remove xe_ggtt_node_allocated
    
    With the intermediate state gone, no longer useful. Just check against
    NULL.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 6a9cafb6723c47062cc4d593804d5bb69155d81a drm-intel
e2ac055293d1 drm/xe: Start using ggtt->start in preparation of balloon removal
-:102: CHECK:SPACING: No space is necessary after a cast
#102: FILE: drivers/gpu/drm/xe/xe_ggtt.c:320:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 179 lines checked
4986a82bc462 drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:195: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#195: FILE: drivers/gpu/drm/xe/xe_ggtt.c:627:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

-:208: WARNING:LONG_LINE_COMMENT: line length of 120 exceeds 100 columns
#208: FILE: drivers/gpu/drm/xe/xe_ggtt.c:668:
+ * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved

total: 0 errors, 1 warnings, 1 checks, 317 lines checked
3eafecb516ab drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
f5f1fbaf3211 drm/xe/display: Avoid dereferencing xe_ggtt_node
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
8f7880b96411 drm/xe: Do not dereference ggtt_node in xe_bo.c
724d34bf8f3f drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
54851a9de3ad drm/xe: Privatize xe_ggtt_node
d0b26246ff1b drm/xe: Make xe_ggtt_node offset relative to starting offset
-:53: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#53: FILE: drivers/gpu/drm/xe/xe_ggtt.c:570:
+			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
1c469275aace drm/xe: Rewrite GGTT VF initialisation
-:18: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#18: 
Co-developed-by: Matthew Brost <matthew.brost@intel.com>


-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/xe/xe_ggtt.c:346:
+			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

total: 0 errors, 1 warnings, 1 checks, 548 lines checked
4e630b89fe28 drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/xe/xe_ggtt.c:109:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 136 lines checked
67fb8f8d62a9 drm/xe: Make xe_ggtt_node_insert return a node
bf945dfb5554 drm/xe: Remove xe_ggtt_node_allocated


